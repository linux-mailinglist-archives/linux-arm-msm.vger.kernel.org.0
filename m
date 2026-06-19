Return-Path: <linux-arm-msm+bounces-113845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SPoVMSY+NWonpwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:03:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDB6A5EBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:03:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="n/qEWSCT";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aTqOHto0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113845-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113845-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C363300E254
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BD937FF50;
	Fri, 19 Jun 2026 13:03:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DE379C52
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:03:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874212; cv=none; b=iAdjM/bTbrfEAcv/h6A9pOFkCGVxmybce/LKxz1TjoMNxsiGDmADABtd6E7qQa6q0BfqgWIAuVWLrf6SltG3JtGXy/uCk33nhzcwd1fPvKN0uJvPYQlkv10vcMfeGPl4hx4WQkb4PZGxen711UxDytRk9Rt8BxzUsKjpnM3UKcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874212; c=relaxed/simple;
	bh=3mCTWcfWvUyyK0fH+VyZ3gkqM2ROnFmpTZn7EBA39dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UC1HioK8weG0wkKVVxaFcicfw7X1SRSWQQAQKDH1ruVaKP9PpJ9C81un/KhHrOFS0Zr4VFt7y2nnRxRSgha8umtyzN5dRsaTyaAFe2dSGoRHgT4nsawVcLuf9/pfGJJZbfTN1tpxDbnKSPv4w8okXlDrriK08xrY7VSbWXl6SIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/qEWSCT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTqOHto0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7QD324185200
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFCXHDvwe96hDuMd6utugZ6UnfSu1p+eODGwnzreykQ=; b=n/qEWSCTbN6v38co
	epWAJTEeor987ii8LyfuvtA/NDPH15XbGBz1eMfTT4z7RZmIq6sSjLFZaDZUyC+U
	dUgmkYWLg6u3aEGj4aBYoab9m3N1Gifity+rqrKeUuNgvC10hXxA1lypCo0bI0f1
	z3zlodAa9CdG3NWxCv7edEbigklslK2uAKM1fBO6muvAsQsRp4Zv9jBoRfNPdIld
	NpFjx3UlZP7e3neVV/4XBqdy2dXHmoOWjt2Son9riAOtx0+x2K0UY+jSOAOtqwf3
	YSXXsmHgY2u6q0gTSpHTJ72bcJwO85yjPGIIa0GHVMeBZ6dzZDOvmvvCMoVCKZfy
	easMWg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sbbsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:03:29 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5a8836bso824191a34.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781874209; x=1782479009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFCXHDvwe96hDuMd6utugZ6UnfSu1p+eODGwnzreykQ=;
        b=aTqOHto0P5k5aqoUfKxbKqcgiioTf/iJYhQdgYsbb4RmqVjtcAE+OAaiIlMhK19Fak
         Lrgl+Bok5V8qLFROf7zxSJw1BJE2FF3RUmaDJOGLq4FAUqHqTHA6JfkVm6GawvDWbmEj
         SOEmfI5Eq7/i/IM8TODJR7Cdd0Sb3l6/T+DgOoY63BfttAOlUZ8gjEt9CF/X4Dt++KAe
         zEDhEL93csWDAkUOUdh8EMe6IIsQu0NzHqsgwzpaMRbHn35o9qzJQw7b4yQjJ90m51JJ
         k5QHzrjSBRrBd1SB+sy22g6ZJfnapFi1biEGvXfAMuvSvdM4BZcnCZLrLS3EGUCqQOX4
         EhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874209; x=1782479009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFCXHDvwe96hDuMd6utugZ6UnfSu1p+eODGwnzreykQ=;
        b=mcFh2oBoKhzlZAkmydArF6GNl4Dh4ln/ypJRCc0buuj1HQXG/j4r4fIhm3LXCRFsA/
         LKSluR//mrvISDSSnD8Wb4x0L9XaJ6UzXKp0iHhJN+afwWUrB1i+FXcFQZStVJAqdw0+
         MXyCRVT7yT7riCirMwaM8mk0V2ddzcFRc2NMeAqjiwn5+ot2wry+cPhmnyCnVRyTAg7O
         DVNaoZ2f6bUGdbi8zNnxHSKecGkikxau6KuIk8hGq+BwI1/zXEpbWBcNkWHqoG2zoWi5
         V61k1uIWF+dUe6gnDMkt/02nh6qvppf3opktSQjY9x7kSsg1/gcf12UkII5JuIqMjivb
         R1pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oni8oqW/CCnOUn0IA2+UTRNVM2nf7Q5iTqI/50lb2kvLYW8l3HPOa4VW1H5g4k1QpRU6dCxJ6sqhbytmq@vger.kernel.org
X-Gm-Message-State: AOJu0YxHF8egv36fOeY4IhA1XrTtAB564Y6DQBHu7pulzBIrx42r/vST
	f5Ph5AI8vX/bDmAMii67WT3KF1dfVB3zQojt6D7t7mC8PF0ASs0WI9Gee7WkH+HE06ZzZmyrNTi
	LzWdDF502+OSkYGFVeQvnh53EN/JZBXhoXGUuHiYwxLfzkNtjpLu+qsaexEiZViyy5NYp
X-Gm-Gg: AfdE7cnNxx5pKZhBDF5z1DhGsQfhL30tWoe4dX0mC4oHr7A6u9EonYGUxrGgqjO1eYq
	CSWsJiRGZ43dZXFN4+FP0l2zuqA8O9oN3WMH4EYaTAgMte1aF15YnqYPkg7hiyw8MaWrAnD1HPM
	nMH60ijMUxlyWxbTeZCp8+VRbA/tR1s9MxynF62mO73EE9om5oG5wC35iNaTA8C8gMj26qUxmL3
	s/UzvrXQjkykXwON8etLKUU4LrPxv6CY36cjkZ0dNcvMNb5U592nWEbyYibR/vTh8j4+KIqPDeV
	84in+csOXZHs0N8zL4h+UFOf+bF/0kIwhhG6W2KHaDLOsu6HIr+QhG2ZnUefChx9KlUw+302Zsb
	MwCVH05hRDJQIV/1DwkfKh96gtvGEu3zekRg=
X-Received: by 2002:a05:6830:838b:b0:7db:c389:648d with SMTP id 46e09a7af769-7e92d47d882mr1423050a34.0.1781874209159;
        Fri, 19 Jun 2026 06:03:29 -0700 (PDT)
X-Received: by 2002:a05:6830:838b:b0:7db:c389:648d with SMTP id 46e09a7af769-7e92d47d882mr1422886a34.0.1781874205309;
        Fri, 19 Jun 2026 06:03:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a84b0a00csm88117566b.25.2026.06.19.06.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:03:24 -0700 (PDT)
Message-ID: <162da512-1142-48fa-bf7d-0b2393467a75@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:03:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
 <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
 <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
 <12a89ab8-dc43-4b55-9c95-36d44c75dcab@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <12a89ab8-dc43-4b55-9c95-36d44c75dcab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SE1olmcOQ99ElPVcIlqX-UPX3yQE4-YT
X-Proofpoint-ORIG-GUID: SE1olmcOQ99ElPVcIlqX-UPX3yQE4-YT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEyMiBTYWx0ZWRfX/eKP4vb37Q5n
 I+ON5tZqOZXJE5TLsSzpiu9J9LEy6nQWyQ+7GcZjDOw91jUw+lharA8bQltl8YmzobOqZPlKuwi
 LDKdhOI6im4ShV/xKdfq1F2Le6NIpC/RL8wcpz7eyGZCPXpIcslf0zf0aFqfcqzaqcJs3Sv6Yo+
 5DXiEy8MdUFFopDAkW9uPTP3wGVPX/6LfOZhoN6uxLta0IXFDb2GgP4+XuwGxYhQNlICv5e0g7F
 WepyMyBAfkOIUi8KAKNMJhOUmYNeXeIt7oa1nvtYnJM0iN1od3gD5Rcba7ul/9TQ02Fwq/SHR8/
 YQwrHjdIKql2ewd9k0ZBhT0Ln4bCb5SG105BYsLrvbpZNAsS+5Tjat1EFnoyoSgqTz6iRt1RefL
 oDiOJ0tjdoopf4yiDRy5FrHsSLmQCQB04wyat9unK9ouWQChl/nlc7WrNhdmEVbw5bG/i06Bnyh
 RIWaTqhvsAf3eFSzFRQ==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a353e21 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=JHF-0WCA65l3F0HK4SEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEyMiBTYWx0ZWRfX2aU/xnuuEvYX
 v+tSV1VILLph/YIscQXRZVg99cqqLHBi0vJgE6707HvCnJuVYzwC0Ll2J/RGOFv40/fJ4OClA/g
 Q2yYwHKFu39MPaG5oAMjLe1S6hF934o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113845-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CDDB6A5EBC

On 6/19/26 2:59 PM, Vladimir Zapolskiy wrote:
> On 6/19/26 15:35, Konrad Dybcio wrote:
>> On 6/11/26 7:29 AM, Pengyu Luo wrote:
>>> On Tue, Jun 9, 2026 at 8:17 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 6/7/26 6:04 PM, Pengyu Luo wrote:
>>>>> Define pinctrl definitions to enable camera master clocks on sc8280xp.
>>>>>
>>>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>>>>>   1 file changed, 56 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>> index a2bd6b10e475..0dbcd3069a3b 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>>>>>                        gpio-ranges = <&tlmm 0 0 230>;
>>>>>                        wakeup-parent = <&pdc>;
>>>>>
>>>>> +                     cam_mclk0_default: cam-mclk0-default-state {
>>>>> +                             pins = "gpio119";
>>>>> +                             function = "cam_mclk";
>>>>> +                             drive-strength = <6>;
>>>>
>>>> Other platforms set this to 2 by default.
>>>>
>>>> What's the value set on Windows when the camera is in use?
>>>>
>>>
>>> It is 6mA.
>>>
>>> Let us get ctl_reg first on Windows
>>>
>>> lkd> !dd f111000 L8
>>> # f111000 00000284 00000002 000000e2 00000000
>>> # f111010 00000001 00000801 00000000 00000000
>>>
>>> ctl_reg => 0x284
>>>
>>> in msm_gpio_dbg_show_one()
>>> ...
>>> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
>>> ...
>>> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
>>> ...
>>>
>>> x13s should be the same as gaokun3 in this part.
>>
>> I confirmed as much and I'm willing to believe this is a default for
>> all 8280 devices
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> for the second patch, please mention in the commit message that the value
>> will now match windows and please add a fixes tag
>>
> 
> I believe the second change cannot be tagged as Fixes in sense that it
> strictly depends on a not going to be backported non-fix commit, and thus
> backporting of just 2/2 change as is will break the matter. Reordering of
> the commits placing the fix commit as the first one should be fine though.

The Fixes tag makes the patch eligible for backporting through AUTOSEL
but is itself not the same as "please backport"

Konrad

