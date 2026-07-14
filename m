Return-Path: <linux-arm-msm+bounces-118975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f0XDLKHjVWo0uwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:22:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CA0751CC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:22:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V6SyD9Lr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f2fZrIcL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118975-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118975-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2990F3015A43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789693EDAAE;
	Tue, 14 Jul 2026 07:22:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FA3EC2F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:22:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013725; cv=none; b=hBevuvRzqxUYvMpxVKITvGq1SE1K8SM8clSYqBKPTGqrfkVahjnwXvm4495GLNg7dWQlqqanRab8gkGUqufyP0nT8JZiXkxjv+YtNd7ErPH4nkXL7KNJqaBdvn+3BMHrVseEp9ZbMpICrIImasF2jBfcZdgTgN9YbfqH/BlzlG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013725; c=relaxed/simple;
	bh=oKTCy22CxgnC324cb3PyZrbujxVbPFBxc2/hevIt46E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gzkr4UPZx3g3QLaw5Iwx9fi/GQJcAlLE422nFMIZEPZAUH0XZ0CcXlweU7O7uoQFVnnY5DBRi+N3AxTUdlFTlzTc3nAUZ+nitPKFkD3OpSUHBcp+yNNwM0rAHLlasA7+zITWJ+cYk0sN4zU4xeqDQ1NBkl3cpd9kQ0bvZoaBCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6SyD9Lr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2fZrIcL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SLDH3912628
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	As88+E6oeC/hkzQqTfAlXei3eLyRxyuFIWEFsQIurtI=; b=V6SyD9Lr0vGeekpP
	i6uqYnqlC53+7yumD981XSFa2b08UJRLHBIEYSzPWTlLYuHxBc80uQDEpy6s4RTf
	qy6nhnfzrXTwDYxpw+gfCjXBQ9loNaf/YVNesIOK0OKaBTW5VvZSclGNrRu0IWQ3
	XXVkoFwvWPRZAihcsMP4UIkztCcz3Ei4+oq+RN/begQM0B1RTIlfxJigfx5DNzLI
	/3QvhBBc/wiZiRlc9PzZV/RAd/DnNFyhFoSYE3+XeY7VKG2ELQiFZ3RM9eoucRSX
	ep9O/fq2unCsK0kLV27d864oV01D90H192+aCnOKBkdCyjPzuNOQnSn3Ml2fRC+I
	8P1ieQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4ggav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:22:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so82708705ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013723; x=1784618523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=As88+E6oeC/hkzQqTfAlXei3eLyRxyuFIWEFsQIurtI=;
        b=f2fZrIcLnHJcyCo5l+lY1Uco+8rAxe5fWXK/C+O0SiFF0eQLNLVt7vFKkiCnjGv7oy
         GPqVarSlaStXNp1vHYIqfM/Agt0TzywKdmkSslVf9FAOLrkoBqBbpRAgIqCjkmoJtuH0
         sgY6PCkgQfknikYczMiuqx/0rFZ+olJyF08rUEcD6PsyF72b3CjMUxowOmg0QZpR+hzL
         7WA4suFw1uYVGvReZryhUNCaM9luIasV+cTXBsYz2F4ZfWI6bRMuA3bYHDElLoe0tgLq
         jJBP+GFSu4Hh9Dq1ybdSNqrnjMJ9J4pShNqwEd3+5G7vV13xqOg6ccYmzU5RvvYpbfCH
         0ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013723; x=1784618523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=As88+E6oeC/hkzQqTfAlXei3eLyRxyuFIWEFsQIurtI=;
        b=TgdUdK/CdI7yTR1yBqlWo1LpORSUSMOZ9nSzFWQepbDmy00TSKW1RJWuGLUmPoD2eI
         ey5wzPxwdtsIxqsEBRbGxqMW6jL4Kns/HEiKEHycY0y4DvcwipitSZQe1qKYpR2EHd6I
         5ORNREahLc5k2parvcuBGxF2yHU2E4It8s4OSS/1yK4panWIK9qBSYHEDUsJklIpYNes
         vZxPbOup1Bygo5bdoHXWiBVfqdIW4vbzVS896RDHmL/txHJVeTzGbCXDkXZ3bRvVVMA+
         gbXYwOZNAwVuOHcO/Zbsu5HJEXE3HHZ+kYL652deeHhkVFDsRfDvcfIJZ3FqoLzAgGne
         pPkQ==
X-Forwarded-Encrypted: i=1; AHgh+Roiz535qRglkUSwlbEe4FNZxswGDw12g9W6xDbJ2c/XOSwreo8270MokZf0jLU7VgdWGg7TSJ8kIqbsgHr5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ziIJzpbKQwDZMLWR4rWqWpwMgaq8nBn2fjhwB2oh+JgOc534
	RmMg7cIMmjCiFNgLi3QGs8bKjLffsv/04uRpBEQ6dRU5BpjOp1nIwK6saCn55nutPXYjQUuTtir
	3HM+wKY0LAv05NLugGNnFRwsa9wkrOi8ACzP9HdGPa4mY9AbH7MBKURhsPIVQLilOB7eS
X-Gm-Gg: AfdE7cmqQKFtseI7jj7WKKb2gZRMVnTnECJt4ls0hjEZz3Tr4elSvA8P7IjGI+zhr6/
	wGoyJhf9z+TNXnIjzQg25nJj+p/WD+eWB2dk6qEHAmHFcBh7K+6MZNVJw4o8SRqqIW5YW65q5yi
	4Fr2mLLmHsvlPfCD5/76Brj+TdlJMqPAswatzWEjRic9mFLbPTCjkgQysm1gAc8XXfLFDUHG9uw
	OY6En3DCB/+XdguH6k1Ne0WPPxdaYvLvG1npNwpzG4OxjE8xrMIbO3pjoVF8Mva0ob28KmDa1Mq
	IBl9I5NRP/cvRKWLSQQavm/Au+KGa9YJA8mo2dqd6z+KujInnGuZSHNLTP2z20fteRuilHc8HXn
	FwhFbj8HoG+Cwz2Ey42YBd9fe3SAlUME7cE9mO47Y
X-Received: by 2002:a17:903:2d1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ce9eabdb67mr106950685ad.12.1784013722829;
        Tue, 14 Jul 2026 00:22:02 -0700 (PDT)
X-Received: by 2002:a17:903:2d1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ce9eabdb67mr106950425ad.12.1784013722261;
        Tue, 14 Jul 2026 00:22:02 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cef8852e68sm235525ad.37.2026.07.14.00.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:22:01 -0700 (PDT)
Message-ID: <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:51:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LTXHORGFtc5hwM0mqlBszsiXMtZhlgyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX2Ieg1f8aCCPr
 KFxNGLevr8ICcD0SC2aF6H9NfBwbhZNiShk/FdkIicjEkBTb2CvIByspPQsIByXeuuIyfjwOnqT
 H8R0XxA9nCIfQ2Fv8ph26wbpsnBM0a6wrYbCCQtgM54tZeRhjkShSsWtdm0w2nBBhPdS9/SXor3
 W5gD80/U7ci01beZ22JAggjS4UJYVvf/wNmP/fMmh5KecMj31o2Mg7ee3oevB3M2awkcUoIn8FS
 QldRn0WV2TXaf5HWE3fu6cMifU8cdJpMKtcra/e4nfjNmPZka1DH72L0s75S0d8FqgEmKSfGqZo
 4FNKk1s2UDTRcQWINyaNcLdnV5l6vBRyf1FEuVx63QbTQcAjh5TCgg6emdtLq+oTQVSG6fOybdf
 sseU6YlRqonH/RqZG37/OsFNDS9pU+NEyDTaFmb9eflnsI3A/XTcQBUVgXw9T/4DJaSUsTOVh4O
 wLUL81hBCWeQdmhh5Pw==
X-Proofpoint-GUID: LTXHORGFtc5hwM0mqlBszsiXMtZhlgyM
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a55e39b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UrGkU9YJQ5gMatbWagUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfXxLxEkeLy8H9i
 KTXChPJofJZNJMRU31IfXaLzwdPkGWVnH/ExfDAHAiW6YKXc6rEHw/XgqZzv0t32+TDZU7bw8qn
 JaFXLy+o8wLHKe2WnPgvuzVjsWeGhec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118975-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25CA0751CC5

Hi Dmitry,Konrad

On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
>> Hi Konrad,
>>
>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>>> Hi Konrad,
>>>
>>> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
>>>> On 7/6/26 8:04 AM, Nabige Aala wrote:
>>>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>>>
>>>>> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
>>>>> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
>>>>> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
>>>>>
>>>>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>>>>> ---
>>>> [...]
>>>>
>>>>> +    panel_bl_en: panel-bl-en-state {
>>>>> +        pins = "gpio91";
>>>>> +        function = "gpio";
>>>>> +        drive-strength = <2>;
>>>>> +        bias-disable;
>>>>> +        output-high;
>>>>> +    };
>>>>> +
>>>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
>>>>> +        pins = "gpio91";
>>>>> +        function = "gpio";
>>>>> +        drive-strength = <2>;
>>>>> +        bias-pull-down;
>>>>> +        output-low;
>>>>> +    };
>>>> output-foo isn't necessary, the panel driver will assert it as
>>>> necessary
>>>>
>>>> Konrad
>>>
>>> Ack, thanks for pointing out.
>>>
>>> Arpit
>>>
>> I just checked,
>>
>> Normally the backlight EN pin is controlled by a backlight driver.
>>
>> However, this panel uses MIPI DCS based backlight control with no
>>
>> separate backlight driver. Since there is no driver to assert gpio91,
>>
>> we control it via the panel's pinctrl default state..
>>
>> So this is platform specific pin , we need this to enable/disable
>>
>> the backlight.
> 
> Handle it from the panel driver. Also please fix your editor to prevent
> it from inserting extra empty lines.
> 

Earlier I handled it through panel driver, but this GPIO is specific to our
Qualcomm Daughter Card, it is not going to the panel connector.

In earlier panel driver version v1, I got comments on dt bindings for that,
so I modeled it like this.

as Dmitry suggested here [1], to not include backlight-en-gpios in dt bindings as it
is not panel specific.

are you suggesting any other way to do so, Please let me know.

[1] https://lore.kernel.org/all/81724048-0cb1-4305-b613-374c14df87d5@oss.qualcomm.com/




