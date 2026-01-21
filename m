Return-Path: <linux-arm-msm+bounces-90019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CV/D/nOcGkOaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:04:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B61C4574C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A0989EA9FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F57481AA3;
	Wed, 21 Jan 2026 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebvK0CBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgapmqDL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE71048A2A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999954; cv=none; b=AZOlJhsMsTVTvxdoadMy4cr38kCcWPSZaJMRvFTkPlpNd/+/MC8nN6JvEwLj7F/zNShw5QPE6jI33VFLRgKTbChE7D2bOzBZlY2Qpkf33yRp0vFxzLyw3oVCMxshF2EGTOsTDbyxMnOAJZEwDscukn66iTv5XEd+Nu+xLEVOjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999954; c=relaxed/simple;
	bh=rwSf8fNWqiNDBYgYMkPuKN7RGY1I7zi468jEYarcFXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caUDvguhAs3NEdrbrmWCauTtITlM3rZQE7HhrHw5okxL/u91NtSNHXqgUZONsVDaOjkjYCEzVJyIEs9wcheUyP+Nmt4/ffQIm1UwaBR6uMSYNF65lC5fpcIhGrvvPwN5WLoUbRqO2TxrRZkFHRnea0jhnLZ4of04rHNJUQrjUWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebvK0CBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgapmqDL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8YfZ62066250
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vm2c7TjrTcvjEHOS1OuxOVPHSsAoS1MO82JHEbyQX00=; b=ebvK0CBa7bhuGS5K
	L727dqEzVzP+f3RSR14AQImHB5doXAcZ0cxFc/c9LCobesB88dNQi+IXwPS6LRzG
	0KDwsoZfJ6/yHXebbz5+RCVoF3F3jrTiuPEeFKCCz2K50QEGvm4ita4TFG9EkBKS
	AKhGRBfqwDXsc5hTqDYS81T34vm9GgavzWkvi1esdrekdGiCfyHbLZr27p1seu9Z
	OBTaBsW9x07f4UzuPCql3D8DF7UFdq+bfnI5tUkTUQ4MOh0OhNZK27/rfgErGrqz
	aaAbriBDo/wwxvcRKx+eAf46+q6YVDArtoUXKN7IeAyvoRwhYp50OHBe6DS+hLML
	1L2jBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btudp11pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:52:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53892a195so160544585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768999950; x=1769604750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vm2c7TjrTcvjEHOS1OuxOVPHSsAoS1MO82JHEbyQX00=;
        b=VgapmqDL1WfqWsReskyK5QL7Bp420SeYyRtFLNpC45osi+8YcIfdQcWHwSSfobGc82
         fmshSmdyFvDSGh8J3bemxhkqXYVypJwbK7hOEPyiQBVSFtQHqPeuHC7VjnE6fdy5qFoi
         ukRLKhdhyOvxaA55nIO0ORvkJExBPQsvk3kUYQh1WrZAGrPM+ECnk3he2KUiP9TcenA8
         sPxe8x/Uht8hTCmRqkiyG0zQH131WqTiaGbpCk3KwWoWdisVPi6CN5NTNLWlHZAQqNN+
         T0ycPE5Ee/WoEbhJ6rtKM91hrb+BYq7qJg0uxR2O8blyW0J0vlT/1vELOCvuWwLdis4h
         jU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999950; x=1769604750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vm2c7TjrTcvjEHOS1OuxOVPHSsAoS1MO82JHEbyQX00=;
        b=ReNhvW4l0UEUcEwyKv5WpGBkbKVVSJHzrxi4srpL1O4FvCr+YuXBzyLVE4wKgdHt7+
         56H4aQBJH0mnG5wYpVNL6371+qzvDWtyyTzSDgAhy2tWmA/npu0FNduayUEu2TnZIP3K
         BNJjEWq/ufsLOCB+0lXV5oXvRJ6boSjxUEOhhpFGJmm6V3/tMZkjoBn/53f07PuL+mHB
         YpwtX+rFj4GKSp/k8TzxJGXDehvz922V0MG8zAmHHMe17h0S6TH6avpfsMuP/2+vWKYT
         DjdB4HKLGqDwdGbzI8Qs/XFu0BwHJUgNk5AeqCCs6lJhwGorRM/36Etcr+PuHV1pCdi6
         EWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgFHosLG0PjvN3Om9HO9I2tKmEA34ogu0cVHN2fgsQ78NiZ7P/cPCv8gpg0TMVlB+iAyrxMocQs7aQ/6jZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2pmWJ2qzLCz6Un/Xq3bX7LggH+YJbr4n65mxOcdXmbSXJ+f0R
	W8G0hSS6x5ynuhu7TsfULrJaOkB3+HZRCik9ICnnD8RuMMl0R7UxrLBup3OqxChec9DjBgp8zg1
	/6518DriSA76PfvplWx2O1broPdpuEpsxF7s1d8dxpG7SMuDHk01/7CT6mfkD/PGxuwAB
X-Gm-Gg: AZuq6aIJwdiiTyn/9nf11zfPBzBaplhXpJQKEwp6J2iXjOpcP47vWiegI6nPPmFPFiB
	f7HBpoQuIKKAGPh54vQVQh0zv4mG6fShKET7hhIAyvYLrLDoMaQJs39O8MihAVWyNSoC7XDxfa/
	Cjk9NVDUpwKsRY9YLzaksOQ1TH1B0aSAFrO30C0tev8sCvbfokJkwr2gDfLUDJYXSoEXHgLfUYX
	cItihg2mKXtwmiNwfn6Ey0mY3vBroQ6y9uaQxw7EFZv7RPN7hMIXocvGq902vy3Ii7in0cUD/Rl
	oRi9CRbPM+KC8eUZMn5bde6GGFOIgI2OqoYjyvxz9Mj8mH1oUMMK1ojov4S/1475bOBfr0JulGo
	1fivKPU9X3hg6zFbvCVB+BJOxtTL7kmU8kXmAZrlc1Q6QFUGwkIRRA0GfSzuNfBBOsmM=
X-Received: by 2002:a05:620a:172a:b0:8b9:e0ea:af3b with SMTP id af79cd13be357-8c6ca3deb59mr626854885a.5.1768999950420;
        Wed, 21 Jan 2026 04:52:30 -0800 (PST)
X-Received: by 2002:a05:620a:172a:b0:8b9:e0ea:af3b with SMTP id af79cd13be357-8c6ca3deb59mr626852985a.5.1768999949974;
        Wed, 21 Jan 2026 04:52:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795169017sm1580399366b.18.2026.01.21.04.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 04:52:29 -0800 (PST)
Message-ID: <39e2bd90-8566-42d9-8ecd-6c5ba0f9747d@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 13:52:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
 <b98eae93-dae6-4036-90c4-8fc02a122e97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b98eae93-dae6-4036-90c4-8fc02a122e97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p4SRSkWD_tUP0d7UAArDHZl9cFBvyHcF
X-Authority-Analysis: v=2.4 cv=DJyCIiNb c=1 sm=1 tr=0 ts=6970cc0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t3_i3bCFRmu7eDRSzYAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwOCBTYWx0ZWRfXwLUmGrn7aiyM
 92s0zOjCaGsP1Au4fvlzYsVyC8wF2bUM/fihlmrsqDfhF9ky6axq6944AJGzCqfEgSnoMQxRURW
 +Y0S2l5qHLZ0aHO/j5IaQpjfCkG8JqhT4S+0kE4U3+zWhbjjs2cEFn6kzsmpUaTcPYdtHPqFfv3
 Jp6c3NkM3mY3f3J6Ijneq3MPo8UaNfJIQxKdG/U9yYF0q3CSUsuqqmzJsg8Yz2Xln26zZ2MrCaB
 q8lKecwXKi35xn/Nid3s3u8Un+D9+Z2FA9QRBhd0X0xDyqhAExqirFdZXA9bgEel6301qypw0QC
 fEekQKfAt4GLzBZor3fHr2PySSRr+9lXZiUF/R9DMmrngrsTFT7/BptrWO/IddyANJmUb3IbFbL
 N4kAfexaFnWgK9yrxTpEX6KGs/23XBBZjQEO3/RWat/NfIHb14Q4Uiyv3xL5lgxa00RG8B7ogUl
 TJYZ/9BjZFSYqtk6fTQ==
X-Proofpoint-GUID: p4SRSkWD_tUP0d7UAArDHZl9cFBvyHcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210108
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90019-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B61C4574C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 1:47 PM, Akhil P Oommen wrote:
> On 1/21/2026 5:06 PM, Konrad Dybcio wrote:
>> On 1/20/26 9:54 PM, Akhil P Oommen wrote:
>>> On 1/20/2026 8:13 PM, Konrad Dybcio wrote:
>>>> On 1/20/26 12:25 PM, Akhil P Oommen wrote:
>>>>> On 1/20/2026 3:44 PM, Konrad Dybcio wrote:
>>>>>> On 1/19/26 8:00 PM, Akhil P Oommen wrote:
>>>>>>> On 12/11/2025 12:32 AM, Jagadeesh Kona wrote:
>>>>>>>> Add the cpucp mailbox, sram and SCMI nodes required to enable
>>>>>>>> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
>>>>>>>>
>>>>>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>>>>>
>>>>>>> Just curious, does this patch enable thermal mitigation for CPU clusters
>>>>>>> too?
>>>>>>
>>>>>> If nothing changed, we have lets-not-explode type mitigations via LMH,
>>>>>> but lets-not-burn-the-user would require a skin temp sensor to be
>>>>>> wired up, which then could be used to enable some cooling action
>>>>>
>>>>> In some chipsets, I have noticed that the gpu cooling device throttles
>>>>> GPU to the lowest OPP even with not-so-heavy GPU workloads, making it
>>>>> unusable-ly slow. My hypothesis was that it was due to unmitigated CPU
>>>>> temperature tripping up GPU Tsens.
>>>>>
>>>>> So, I am wondering if there are any additional CPU cooling related
>>>>> changes required to get a reasonable overall performance under thermal
>>>>> constraints.
>>>>
>>>> Yes, something like the aforementioned skin-temp sensor at least..
>>>
>>> I suppose this sensor is off-chip and slow to react.
>>
>> Yes, this would be placed somewhere on the chassis of the device to
>> reflect the actual temperature that the user could experience (since
>> there are regulations about maximum values of that)
>>
>>>> Today Linux will not throttle the CPUs at all (they're not even declared
>>>> as cooling devices) and we sorta agreed that in general it's a good thing
>>>> (tm), because otherwise we'd be coding in a cooling profile into the SoC
>>>> DTSI without taking into account the cooling capabilities of a given end
>>>> device (i.e. in an extreme case, a PC with SM8650 with a cooler that's
>>>> 3kg of aluminium vs a Steam Frame headset where the SoC is centimeters
>>>> away from your face)
>>>>
>>>> Currently, we have cooling policies for devices with fans and the only
>>>> other action is based on a skin temperature sensor (sc8280xp + x13s).
>>>> Everything else is left up to the LMH defaults. AFAIK work is ongoing to
>>>> create a more informed solution, that would have to (quite obviously)
>>>> live in userland.
>>>
>>> I can understand that the skin-temp based mitigation is influenced by
>>> various design decision outside of the SoC die. But I think there should
>>> an on-chip sensor based mitigation which is fast and usually for a short
>>> duration which helps to avoid extreme temperature or violating the
>>> maximum operating point of the chipset. I guess it should depend only on
>>> the SoC characteristics as it is a last resort. It may be implemented in
>>> SW (like cooling device for Adreno GPU) or in HW. Probably the LMH
>>> hardware you mentioned offers this functionality for CPU clusters. I
>>> have no clue. :(
>>
>> Yes, the CPUs are covered.
> 
> Does this LMH based thermal migitation require any initialization from
> Linux? If yes, could you please share a link to a patch which enables it
> for any recent chipset for my reference?

It used to, see drivers/thermal/qcom/lmh.c

I believe it went away roughly with 8250 where the firmware now takes
care of all that.

FYI I think it first appeared with 8994

Konrad

