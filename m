Return-Path: <linux-arm-msm+bounces-91182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD8MAnVje2l2EQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:41:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE624B07BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9CB9630072BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FF930FC05;
	Thu, 29 Jan 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGnLjHQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bw6Ib9Sh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D221C27FD4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694060; cv=none; b=DWqL0idfTo084M1NcszYSzHxXl9Jiz9C6MeV73p+/1NLkdYPpPHFq1PNAq2W7G9/5GlQi1vGBDfGYgUTJdqXLvO2rjSyhGZ4CMOeVn/MWhAwn0l/xbYykQIJLc2fqF6gy0/bta2Y8qwLTFHm7cF8fyKjOLn+jwt4P/MbpsiDqn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694060; c=relaxed/simple;
	bh=vWejJ6RINCFssuqUgSCvnocLdwpH/AOaM6RJ6UgJySw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F05DWPkc+06U7/g2WpEGGI9sQqgy+7yWyX1ZCGxjdKAeKO/M5nDXbnckEDFGHFqGzgZj6FAsRkmprPqFtcFl7EKI/cACde6va373xahy9DBbhhmH4JRt1/l9EQoWPU8zyjb36ddLeOG5t01PVfcKD8mV2TQ7kNkjfxpSFoa+O7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGnLjHQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bw6Ib9Sh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAlolB2953448
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SptoXrg8ov3mPkWXiaAkMD6y48psr6SnVN8ENdgkWXU=; b=MGnLjHQjCetdxPXy
	Syh6kFA/gjeF3dLsKEpVORRcCe0+DtwazUvZ3GIJOSESyvZxRk5mV48MKnOpgapj
	DUOFWml8+LTjsbmVw90jzTiR9+5FpF9+w/+XE6m5k9+88+tgjGj0yTQo5F0iJqe9
	mQusoB+ZEq060YVX/uwU6worJQtAOUBp2tdxFJqcafcUezIqh2J2a2jAOZjEXEmd
	sbAQkAyIdOSqoD02Rm8Fs3kFZOw1Qe6O8BH1YAVk+ZQvrydvVv+B6RqMAKxgA97I
	oFf5QRohywAJTSoc6uSu7hoHPd55Nn3mnZH5+D2lhIbWkix8AA1gdRpBw1M1tiul
	zxxI/A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c06420ev4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:40:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82317005ee6so556192b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769694057; x=1770298857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SptoXrg8ov3mPkWXiaAkMD6y48psr6SnVN8ENdgkWXU=;
        b=bw6Ib9ShVQPc/LYaxN1369a3n3dhvt2MflBgjxWfnSBsCsDfZmKlPp769sJomFUT1B
         auN8zwmaZyPvFSoqWcIa2VLbcTOzDKCJzqRdZqK7iMi3NgYAivTmDSWsEQDc5ogJ1DZe
         n/ydtqGTMe1Nc98Af8/3VfM5LNHmL+Kopo5xZGZ/xv2ohRD5MsXrZX5ZbAueY4Jp/e0h
         TO/BhjLTbgGYu4dd0O3opoSOWFhppyBm7KgjDTmyHqDBXCIeOhwf7TZmghmymj30KShi
         Tb7U/AbPMdO0kzC0CEp8NZhF5M6+VYyG/BhBQw5bMbHt2zy8/dKTsLvZAn1Gkn6vekso
         YgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769694057; x=1770298857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SptoXrg8ov3mPkWXiaAkMD6y48psr6SnVN8ENdgkWXU=;
        b=pL61dmxlAxHs1A7ckUNWVCUEE/NCZGWGIU4+3xj1VsRNgVJT/HheBuhYBGDrWtn9Tw
         MwN9TDYVxqYe4tVyNuWtdI8kwGLiZ3R8icEjpOsbI4w/XaGDwN5a9Hpk9Nzw7SQAFDV4
         4OIH2MwlyrdIFgRU7EqTip/U85pwhvxZ/RQ9Mh68ENfG8Qow8XtRWf/xwyu/Tp0SWvWl
         rCKm+srObBg91iYUM+kR6Z8TCuMkd3nBJEPD4P+bvyO+fK7k688TZHsXkAb9szc+XYMk
         Orci4qft8cYMpwXPTsSPDTr842JaAsMejYBmqw92wYPAAerinke2usCQtBwSHMLY0wq1
         MkCw==
X-Forwarded-Encrypted: i=1; AJvYcCXiCa6ecBorVlUOAnZ/wyEv0KVibIWSKTq6Z7MZBuz9tA0UgljSztchCs7UhAYYmzHGQfAiTeBAS4Tpcime@vger.kernel.org
X-Gm-Message-State: AOJu0Yz97WaaRU+1t7u3tN7mutV00Szi+JTpUMPWYkC1Sg+qqvSivShg
	sS/t2tS5FqBcchF9fZkp36EVROXM4enrcsZoH9KqY5EYHfA1X2XgVCGCofPfAamuSpM3nlSefTE
	vncGX6jXn9r0RimOySuY/VPeOWaGrjQXcw7em43Jfr34wxEjRWO9mXodxUo5tl75pHk3t
X-Gm-Gg: AZuq6aJ/nzCF6csXQ56ZTYOQm0X4oNeooZ4vEYNNqKGKX0eQAcesQwyMgvwSpqFr2Qc
	NKEjBuncu11/vj8NTrcftwUa6i2c+yuOZqB21i1Qy3wFUTZ+UFrcCGae41woXZ6sIedTmyDk1S7
	oCLWn4mX5LjaM2DhAPVLftt5y6pS1f3yVGktWTfFeaRZaj33S/V4ZaOa383mBLsrI0QvOf9WbVo
	DrYntueMzJTRCp0ngvpqDfEobpSORF0IfaV5ca1YG/cj1VgDXZwiR1h2cwgxlvmb/vyOCM7AYyU
	XDIhWNJjsDqjcgIOv2MqnhZEmw4pmQFFhtr/s7LLnWOAObTiuQlWHdbQmTdMA9y9pI3hphjwrog
	KlvcnFSXk2dJrnwO/pOU9CL+SK7hD+nhME20srnA=
X-Received: by 2002:aa7:9066:0:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-823692b2103mr9847379b3a.37.1769694057316;
        Thu, 29 Jan 2026 05:40:57 -0800 (PST)
X-Received: by 2002:aa7:9066:0:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-823692b2103mr9847356b3a.37.1769694056847;
        Thu, 29 Jan 2026 05:40:56 -0800 (PST)
Received: from [192.168.1.6] ([106.222.229.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfcaadsm6048711b3a.37.2026.01.29.05.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 05:40:56 -0800 (PST)
Message-ID: <62666d7e-7b8a-417e-8224-4cc69b3e7c29@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 19:10:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: lemans: Enable CDSP cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-6-gaurav.kohli@oss.qualcomm.com>
 <o3gdovqbkmclpmrhjtg3lknhqcecwfrp73bpbv6nsspzvkjfm7@qqkrzte3cdy5>
 <3a1b3a2b-d73a-4dae-b866-14abec2ff18d@oss.qualcomm.com>
 <stmlthovu36kyhhnn7s7rpn5l53chnvmn3lmyepzpg33o7hpo4@cnoknywqgry2>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <stmlthovu36kyhhnn7s7rpn5l53chnvmn3lmyepzpg33o7hpo4@cnoknywqgry2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA5MyBTYWx0ZWRfX2dCD3Pexyw8H
 eO6T4YYd6oiiakMDYjDDx/jGnxWULwOA+djGi5WqVR4YcoBBQZslj8FI0HNVTcqvTUwUPD4k9IX
 a2dEZRnmr6WJYx6bDGKCJIMRhhpUXBwEx2ji7hZgHnjqhizKJIc3tngqv4w92VlsbOs3zejUTXt
 ThAOvBfSmoZKVs8JFMHCKZJYIcRUc8a8cMiagZxb4AqADLcJPGvERT6WVmbZJYRo4RpSemzUWFH
 f6tUfm6bEIyl4qAecI9f2TaHYXbJp+NF+/GOzTjpg93LhnWiJplqLJvHuiuX+Z3Sn19JY7ZqtMj
 4IEgMQX8bNdo3y3LC/zOwwnlASqlL2tOubzgcWlbmX+emvZRqIUV0sUgN5NXKTfmKSZ6nDuc85r
 XABUVgtMip8GjCu0glxII56/5LsH2CYlPH3eCEen+G/u+OY7DzfP/OOnOVxpCuSIjZm//PV0gOz
 vF20Z+kcNuWdmcXBSqQ==
X-Proofpoint-GUID: rG6VwBteXIc5-xsj2r7BOf1jIk_LwGek
X-Proofpoint-ORIG-GUID: rG6VwBteXIc5-xsj2r7BOf1jIk_LwGek
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697b636a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=EBd7WcfsMYPMwvoCMWz0vA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Zput9ccCDsYeypLpkN8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91182-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,2a0c0000:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.11:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE624B07BA
X-Rspamd-Action: no action


On 1/29/2026 5:59 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 29, 2026 at 05:40:56PM +0530, Gaurav Kohli wrote:
>> On 1/29/2026 6:13 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 27, 2026 at 09:27:19PM +0530, Gaurav Kohli wrote:
>>>> Unlike the CPU, the CDSP does not throttle its speed automatically
>>>> when it reaches high temperatures in Lemans.
>>>>
>>>> Set up CDSP cooling by throttling the cdsp when it reaches 105°C.
>>>>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/lemans.dtsi | 138 ++++++++++++++++++++++++---
>>>>    1 file changed, 126 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>> index 808827b83553..c747dd534caa 100644
>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>> @@ -7281,6 +7281,15 @@ compute-cb@11 {
>>>>    					};
>>>>    				};
>>>>    			};
>>>> +
>>>> +			cooling {
>>>> +				compatible = "qcom,qmi-cooling-cdsp";
>>>> +
>>>> +				cdsp_tmd0: cdsp-tmd0 {
>>> This question was already raised. Are there more than one cooling device
>>> for the DSP? If not, drop the subnodes.
>>
>> Thanks Dmitry for review.
>>
>> Yes, Each subsystem may support multiple thermal mitigation devices through
>> remote TMD service.
> May or does?


It does support. that's why need child node to trigger different mitigation.


>
>> So, need to define subnodes.
>>
>>
>>>> +					label = "cdsp_sw";
>>>> +					#cooling-cells = <2>;
>>>> +				};
>>>> +			};
>>>>    		};
>>>>    		nspb_noc: interconnect@2a0c0000 {

