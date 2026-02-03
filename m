Return-Path: <linux-arm-msm+bounces-91650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIjwHqjGgWk0JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:58:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF6ED732C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C7CD30E0ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD44039A7FA;
	Tue,  3 Feb 2026 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idUPcF9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4Dxc17/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BDF395D8C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112527; cv=none; b=iiRvM85psdigjlLiaE9YuHzyLmokkK1f4m1X9oKflgU5LzR0AJw2wGQF82DdaB2wH3QjxBUlRJaRogDnWlZCmM6hHd1nouus9YAR9hkuTmC8ZYCW7H+fIhCyT8msN/6XUsww43SarZ83g9p5wrpLiI9ZbJLNLrboVWsNiabyak0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112527; c=relaxed/simple;
	bh=ROYryKuNMnfB6aRUDt8sRIVxvEs936jHDxuq59NOga0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWYfpWfdEkd1YMMqaIWHdbfOO36cFbCyK0wBtRGszqcV+7PzBwqQ6mDqiRJTCdSw1db1n3AT8ucp4IxiU9v7V46SFp04NGuavai6YxMi3WTieSd3HUTdzvzw0fP8b9hhqqsTWGGcwNTHfgLmP5b7WIh56NsLnbjmTjXod/qBUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idUPcF9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4Dxc17/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137Tmms2356983
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRZiBkWOvp4q+JM+fpJuSm/nhmi1Nv8wYQT3DHaM6Uo=; b=idUPcF9iVsmkfLbx
	qkYFRVlgc6dkVpT3RR57dfYA2kiRP6YXjP9aLhpIVRLCR1fI5Wkkne0J0H48OsAU
	1OtBFhcn4ixqJMKko5uoQUIqUa3Lm4DG6Kw/AZab9+LMR/U2Sd1F6JPOONVMw8+l
	9xNSB9sPU8OurPS0LJ7CT4TkFD/b9R7AcbRlcbjlGNLzHwJzHDwpIqDwNDUCJMxn
	xSxlOXNbhMHAkD8ZKzkrICOh174R4f/hzrB95HT+vr1NjRGNg0j4FJFVgCqKr4YH
	yRzBpYIGH7FXwyUsIRbJYl04ZpD9gALVXELw+e4JsAnUoNFTe1aJXH4qWjQYM10j
	q/e2dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0mbjr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:55:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70c91c8b0so152649385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770112524; x=1770717324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRZiBkWOvp4q+JM+fpJuSm/nhmi1Nv8wYQT3DHaM6Uo=;
        b=Y4Dxc17/w+MzECTyNKqByX9VwfZYoYF9OILADIyloMoT2w4VPVXWXtnAobs1dmvUsi
         GPJRo8Uc2cZ+o8xgZYkvVu6CCHgpFWevBNB7zGD0G4EN4N9H7E1YrqvaD0jaCZ54RmoB
         nLkY5+mv2NDcWFD8fV0CYjuT48hBzFx4DGXEsBboDTBGdeenyHWLmpy6tvSQqMjAN+zj
         XKxGjPWAyaLlsTLCSYdtWID28tVuqw4SCK70xof4IA9+P7p3LDimo0ySaHgA21ySkyp+
         w1CiysaWLm/g3D2GduFitz4ve3OSyUww1A6rvtiHvwEeYRgOFRP+VW/TQZjf7GgwzEbt
         uYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112524; x=1770717324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRZiBkWOvp4q+JM+fpJuSm/nhmi1Nv8wYQT3DHaM6Uo=;
        b=cQr8Uqad14CMlwpe5jQwD/4qDQSAJykJULMB2HVsIql8ByNsPv7Gck7CkBdZO+cn79
         M0pZHN04Y90XafworDIu7IUDeCRZzhvV+a51DrK+nPayOsvQxCLlumZ/zhPfgu287nkE
         Eaqe+TWnZq0WhnN3OWBD9vYyfPebY0OLhzT8tU1PWVCBZOKpZGpyRMDR7ZyuS8C2KhWm
         E3/KULvCCBdYD5nJ522YG5mgpRW9y+d9tRRV6gtdKmQWiYMB5DfwAdSvdiZUXoVYfmkq
         PdqhHME4wDu40YN7Arxwu51+8DDPnFr9m7qVpmkB9SirnDXaevfkHtCydCzx8BgE++tR
         u1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXd6mF88p/qHxoteNBD1a75Jev3aHYoLrS3LFqdqRcV5OVpHXpZ87U0Wj5GPRRS+xP1T8hWiVhMM9XU496@vger.kernel.org
X-Gm-Message-State: AOJu0YwNKPmGd4XQPlmHlOw4P7iXfy8pK1E2nv+XWrQm86d7D3pXEiBf
	K2knLJXni/zS4qgfX2ycDnSj7HB7seW4bOP5Z0Y6Vk2Zyat1wRJNurnZpw5Xa+IPGJ3H6ghGYAm
	yVCe5alJq9Xf4yP0/Ho99XJwvZGoA81T864TtZg6oTvcQdcjxHQGDaDvMNWzbowAtcvs1
X-Gm-Gg: AZuq6aL+HeoAyjvg0lr3GWxkHlJpeiLpBpMspPPKAMm6zZEgZMQd4XjoSw3PSRJ5ZNw
	5m4iyCVhHwAy1pN47vT+EUGetuD0ERMZp41kJt5ttl0s9rcKYqy8G5Jq0PnEAF9Ahjt3r37hCTK
	loD8Y00PPkw01SGRGZct4db6X8Om27JDDfS0l8lyGG8+/JUcJG/+eZpCAx2trWyR86In4fWl10A
	q1nZyxIAmdk6jq5BqoEVv0/9gbtvbiVTPjYKV8zYWha6ndArKvO4IlMCYbmWaihXSVNbQ6O64YO
	Bm7HdXS3UvCY8/qxN2wD/q00Jff5MnvEBxRAkBlzG4IMb6jmGAr8+C/Mwo3VAUS3jLDXKUFTCD/
	fwj28yJkPC3He83iYqz6xDFIr3y0Zh18VAPtHAkoWFM4qzUlaRM/kW4ppVRXCDpYc7zk=
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr1404879985a.0.1770112524475;
        Tue, 03 Feb 2026 01:55:24 -0800 (PST)
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr1404879085a.0.1770112524075;
        Tue, 03 Feb 2026 01:55:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed584sm1018869666b.61.2026.02.03.01.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:55:23 -0800 (PST)
Message-ID: <776a83ea-5739-4ea9-962e-c14ed822cc6e@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:55:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
 <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
 <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6981c60d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WGD1OUi62yeOWj14Vj4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Of-OYIWfkCi3hZFIL1L7ESYRtYFXM_V9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3OCBTYWx0ZWRfXxbcAztYpa4MU
 xM1cW1zcPFG6RAcF7r0HN92y00pPoViZw3yGOfyr8ALrpINWwWnCCjPb0l1yzOLqyr6o82QLqXM
 eZwof5duQzjoVGQ24M7cCPsKLwH+RxtDvDX9ZVbIna9XkPfFcYvwz954EUvKvjd5BPXveqC7RN/
 YdKtKgCedUrI3kbmnAqbjafWQj78CQfIcDC4d0v8CS5W2RRSa9cAwVVeDl25Hj0SS5XzcQRcLlL
 MTUT7QL3rxGlczG1rqKkN4bxJFlUY7eh4gmdrJ4iUnuO7AhYw/6KYujxRorTjtC3Wqn1ZcQylEQ
 BPcwqCgj5cwyqGECj73Nn3yJOHU+KKPX9gRNl249UegtWjuKnofXyZ5ra9i75GMKksnTyjQ5luC
 7LeYChaHeE/JDB6brrR7E7VhJvDVa56mcV38/KouWwaNLgq7VdxGyLJbyD6R+dn9djJ8t3Ii4ee
 O5IyCKrAoaSRHrjcBQQ==
X-Proofpoint-ORIG-GUID: Of-OYIWfkCi3hZFIL1L7ESYRtYFXM_V9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91650-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.152.154.104:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFF6ED732C
X-Rspamd-Action: no action

On 2/3/26 10:50 AM, Jie Gan wrote:
> 
> 
> On 2/3/2026 5:44 PM, Konrad Dybcio wrote:
>> On 2/3/26 10:32 AM, Jie Gan wrote:
>>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>>> tracing data from source device.
>>>
>>> The CTCU serves as the control unit for the ETR device, managing its
>>> behavior to determine how trace data is collected.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index db65c392e618..88ec29446ba1 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -6771,6 +6771,35 @@ data-pins {
>>>               };
>>>           };
>>>   +        ctcu@10001000 {
>>> +            compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
>>
>> Sorry for not pointing that out explicitly the previous time around,
>> but 'hamoa' also falls under the "had numerical compatibles" category
> 
> I saw the dtsi is renamed to hamoa.dtsi but we still need to use qcom,x1e80100 for hamoa?

Preferably, yes, so that all compatibles for a given SoC are
""namespaced"" consistently

Konrad

