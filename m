Return-Path: <linux-arm-msm+bounces-90018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAKCA8PMcGkOaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:55:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7913A5725B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F2C69EAF26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C41E313277;
	Wed, 21 Jan 2026 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBYO9xAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnTrHv8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A9B219FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999661; cv=none; b=En6ieqKq1/OWWpZPQ1y5HBLlGdpnZtp1G8jT9qmmW8mDFpyjcmP2lU/I8rXJtQkn9SjLr87l1VNqvdBkhpfzAuP8N50OgFAD8BdhbLMwTFI4+Lw1U6jEA6Ntv5V4fpOgLVzx61C0icEh93MhKaLwiXF2IKQS9jKODJWUIpjASy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999661; c=relaxed/simple;
	bh=T0Kf71d6+PXT1GszsSM1KsnwWFGEsCTTiExUwxeNFlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewyz+0NSFZAH9P4DchoG0WmL3hyWoUVfFMM0lpWsl74Xc8NVRDQnFFJXanJv5l1/F4+WH0TNyBFmpMUQ5y8ZsNCx2Gp7GbKaIrNeqm4Qy2FgNPLFF37J715cDu/bJXtFLI5ZH/rGvWJ1f54X3wpYmFXmc274E8x29mkvowzWbTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBYO9xAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnTrHv8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LC4SeM2938579
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQFBthpU2DdCb+E8kQO+hSZGYuQxCuyHZ9MdH4Yo64U=; b=bBYO9xAGcN9W0iee
	XD+vJdjiMOC72g5CPNPk8aJgu3ATmJDNCiqIcBgZEb1Ke4I+rUUKT0lTpONQX532
	hBj7S8a+k7GDH1JNArlpqdP65evucOxrS8GpVE8Gx6DxBRj9aeqW91qJxSGXrAzM
	/k0lfz8Du2gna9IXQIvq/KJra+/9o+5hRoE0plMareuB+B0Am6wT/t+VrTaUwhIM
	6F4QjK8dxIwVg4qXLH1CB84syCycQVgC7tAQwOaSLTsqcTlkC74+lYVNJFNB53Iu
	VmhisefQy/ZOasQ7xon0Smm7ydBMcjCC8f37/Qj7qNw+KwDPsX3i4/fwODuEITqO
	eeVXhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu9g2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:47:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a76f2d7744so16064405ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 04:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768999658; x=1769604458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQFBthpU2DdCb+E8kQO+hSZGYuQxCuyHZ9MdH4Yo64U=;
        b=JnTrHv8hwQku2MkmFsuYWWcJnOF9vlXTmCxNGnayKVYsXd05cJgNuhO/9END08qaVk
         YBy0Dch+H/VinIa7xHG4LzOLAzCfra2KQXo1/zV3M1IWnq5rHdtmO/DPu4JoPmrtSmS3
         aSTQT0FjWAfPh4a4fHvoL1VYLqbGFUa1XZ4TiMEwE2ts7MlyG/gHXG8rCt2Irl1wDy/q
         BB4vmsYj2xXisv0M+2OAKk9Z6Ox4fmUT7VbtxnNjJTXk3tzob+mGILjQ00oUfiK/QsEr
         HEf6asWegxj5ZDjx0yNtz+lwenLBppmXuVEpG1XgUhPctyNvjkgoylziZO8/R+RR0sk6
         kv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999658; x=1769604458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQFBthpU2DdCb+E8kQO+hSZGYuQxCuyHZ9MdH4Yo64U=;
        b=R/vfSin3/sd/N5JTWgDVV4o0QBy1cFEKzpghWpM8/MsY/RC94HCveNOxws+ef/pf2r
         ZlfiY+fxn2Li1v6KRySZ/P0JD/cVgMCZ4hLy/5H4PIIzevIiC3/SWJ1AOmIaMe1vGLtJ
         s/nBeseV7z/lord0lwZMwyYGiLxnenIw4mLb3VgcVyaGbqiYPHxFCkHvj5HHwBwLUaNJ
         WamgKbSa01po+qtED+HvYtCWc+DTnUMuyG1rDBW3wGS/WZ+eSRktUHTpCbunfOG9kJu3
         GaWh4IrlY8I8OjcSNaUjo1n6q4ASWo2u+i6+XdjW8k+NIfmXVU0k7O/f5TKAD37kThL+
         abww==
X-Forwarded-Encrypted: i=1; AJvYcCX39yIV1kSemUdi9c+1ETb0cJqsZi6C/6CIRIsXfnBXa9vS/nV5+OFtThTvAPnyw5dvHJHR1rv7JEyNK2NV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8MOBeXJl4vjKNnHeWNi+NwcY0nhlR6Mr1hYOdqUzQTIgbfx5l
	qwEwmzR5Ziraq7N25PulVwnI2P9zX0cqQ+g7qsAzdGifdQxIyOjd/d81Xv6BgcenrSx+M28p5bE
	Yzj6mcLyFGI9MIKgpWn/6Vbf8IPpHA/hSHWY0da4O+R5H9HgUSz0qoQjjvup37KzNo3cW
X-Gm-Gg: AZuq6aLWR2JzeSRSJOYkOdZKrQh3/XsE5JW2sdekS/1u21i6fQXvzZceMin00v6+R41
	uRdTtWRyJjc7BvZJicyOaRYWhqVsCAdac7s82nXTDBYTzVQ5v/DLe86VIbKdhUb17lHJAZH+vZo
	INsHZ8ZD2ibbao4Vjj2Oe636moJKDx+Y/XnkHRxsP6cm3KRcnBKsd6m7oDO297MZzQRCPlSmLL2
	c3GGDnwntMWdEQKzoSPIVXAVUEahTcZ+7NFNf6Qi/7SZ8ZQXa+q5DXJBQ38c2kDM9vgQ2w6oaXl
	0u9PuzSFf7nJu3tNDq18bPc7rSzvUoOQDGGev3UwcfBP0soMM5EB8X2IEu9w2yIcy3NI5F1I85D
	rxL3P6DNXAsUKMdo/aY716CLN/tT+7RzS
X-Received: by 2002:a17:902:f548:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a76b2697demr49338475ad.55.1768999657695;
        Wed, 21 Jan 2026 04:47:37 -0800 (PST)
X-Received: by 2002:a17:902:f548:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a76b2697demr49338235ad.55.1768999657155;
        Wed, 21 Jan 2026 04:47:37 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm37773775ad.18.2026.01.21.04.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 04:47:36 -0800 (PST)
Message-ID: <b98eae93-dae6-4036-90c4-8fc02a122e97@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:17:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
 <d8c24f26-3ee7-4966-a11b-1e2afcad93cd@oss.qualcomm.com>
 <908b64f1-f6ac-4c5e-9c72-1174cba62017@oss.qualcomm.com>
 <f10ade51-b29f-45cc-9895-d66a319ab26c@oss.qualcomm.com>
 <99796cc0-f29b-40d0-b8bb-ebcbcc950b23@oss.qualcomm.com>
 <996f47de-5900-4a3a-9372-e5ea3ae31c8b@oss.qualcomm.com>
 <417f77ba-a0b0-4ba5-824d-8814b776c557@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <417f77ba-a0b0-4ba5-824d-8814b776c557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=6970caea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hfhOgts8FtG9wfp3ybAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9rgW1BYqQTDbpEdy-Xj27uwthBN4qt13
X-Proofpoint-ORIG-GUID: 9rgW1BYqQTDbpEdy-Xj27uwthBN4qt13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNyBTYWx0ZWRfX8cEdLfSVoz77
 9fT3Cp/a60/iHruzKe+y9fk/Dgd4f0j6WrOEHeXxMHhIoLQgVeIQS5CywrngcCmRSLeGReUrm6W
 QavrwyqdHNkw67zYGFz13kG71ftzIfh+OM9ZGi9vbG26/Ez/TFIsfGk2/taM+igLCcPvgAHkW1V
 RO7Ox1GpQDHcyCbhnKV2c7catQtSfr0UcO5jFhXSL7gvL+quPGUSxMMxDR99c2OGE6asgtbsS84
 y238BSR1660Syw4jBYVhovKGxJkZJPavmoqPO3b1WseNYB+IpZemJgMfXihauRaHZhf9E47kfBu
 iJq+W4fEvw9NQNLfsqpieBaodf6vXj4DHeN8mf/lZIGPheJV34/kwC8pVLjaEqvgoOwkw46LvLM
 8SM02Qciw1Ki9Br5rEi2Dx0/Mxtfr0lXvoTcEFrLhosZI+C7YwezVNM0x0Wldw0ZarRwUHfpu5d
 sr1sbQIijE+Y4LWHKHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210107
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90018-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7913A5725B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/2026 5:06 PM, Konrad Dybcio wrote:
> On 1/20/26 9:54 PM, Akhil P Oommen wrote:
>> On 1/20/2026 8:13 PM, Konrad Dybcio wrote:
>>> On 1/20/26 12:25 PM, Akhil P Oommen wrote:
>>>> On 1/20/2026 3:44 PM, Konrad Dybcio wrote:
>>>>> On 1/19/26 8:00 PM, Akhil P Oommen wrote:
>>>>>> On 12/11/2025 12:32 AM, Jagadeesh Kona wrote:
>>>>>>> Add the cpucp mailbox, sram and SCMI nodes required to enable
>>>>>>> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
>>>>>>>
>>>>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>>>>
>>>>>> Just curious, does this patch enable thermal mitigation for CPU clusters
>>>>>> too?
>>>>>
>>>>> If nothing changed, we have lets-not-explode type mitigations via LMH,
>>>>> but lets-not-burn-the-user would require a skin temp sensor to be
>>>>> wired up, which then could be used to enable some cooling action
>>>>
>>>> In some chipsets, I have noticed that the gpu cooling device throttles
>>>> GPU to the lowest OPP even with not-so-heavy GPU workloads, making it
>>>> unusable-ly slow. My hypothesis was that it was due to unmitigated CPU
>>>> temperature tripping up GPU Tsens.
>>>>
>>>> So, I am wondering if there are any additional CPU cooling related
>>>> changes required to get a reasonable overall performance under thermal
>>>> constraints.
>>>
>>> Yes, something like the aforementioned skin-temp sensor at least..
>>
>> I suppose this sensor is off-chip and slow to react.
> 
> Yes, this would be placed somewhere on the chassis of the device to
> reflect the actual temperature that the user could experience (since
> there are regulations about maximum values of that)
> 
>>> Today Linux will not throttle the CPUs at all (they're not even declared
>>> as cooling devices) and we sorta agreed that in general it's a good thing
>>> (tm), because otherwise we'd be coding in a cooling profile into the SoC
>>> DTSI without taking into account the cooling capabilities of a given end
>>> device (i.e. in an extreme case, a PC with SM8650 with a cooler that's
>>> 3kg of aluminium vs a Steam Frame headset where the SoC is centimeters
>>> away from your face)
>>>
>>> Currently, we have cooling policies for devices with fans and the only
>>> other action is based on a skin temperature sensor (sc8280xp + x13s).
>>> Everything else is left up to the LMH defaults. AFAIK work is ongoing to
>>> create a more informed solution, that would have to (quite obviously)
>>> live in userland.
>>
>> I can understand that the skin-temp based mitigation is influenced by
>> various design decision outside of the SoC die. But I think there should
>> an on-chip sensor based mitigation which is fast and usually for a short
>> duration which helps to avoid extreme temperature or violating the
>> maximum operating point of the chipset. I guess it should depend only on
>> the SoC characteristics as it is a last resort. It may be implemented in
>> SW (like cooling device for Adreno GPU) or in HW. Probably the LMH
>> hardware you mentioned offers this functionality for CPU clusters. I
>> have no clue. :(
> 
> Yes, the CPUs are covered.

Does this LMH based thermal migitation require any initialization from
Linux? If yes, could you please share a link to a patch which enables it
for any recent chipset for my reference?

-Akhil.

> 
>> I am hoping that if this on-chip mitigation is enabled and wired up
>> correctly for CPU clusters (probably DDR too), it would reduce the
>> unnecessary thermal trips on GPU Tsens and help to reach a performance
>> equilibrium which is reasonably good.
> 
> Today, the OS is unaware that it can throttle anything else than the
> GPU, so in its view that's the reasonable step to take. Further, any
> device it knows how to throttle, it'll do so in a very jittery fashion
> where it crosses the threshold, gets slowed down, cools a bit, gets
> unthrottled, heats back up, rinse and repeat (because the cooling
> solution of almost any form-factor is not capable of sustaining a
> 100%usage workload for long)
> 
> Konrad


