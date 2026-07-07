Return-Path: <linux-arm-msm+bounces-117309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tnwZCor0TGogsgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:43:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A671B784
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:43:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hqMqG54h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pja59epV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117309-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117309-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D72AF310AC76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 12:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F161D40D57F;
	Tue,  7 Jul 2026 12:37:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5D140A945
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 12:37:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427859; cv=none; b=BcARaOWLVNbClqz1c/dWnFEkEV0IIn81gUcKAiN0TZnYy9zAVDsIruX7R13v/uXXOrEyItdlYp/Jnnkdc5MG8A0uu1X43n+OiKfxwG8vEdRgUsM1J/rKm+43AEIdRXwZnlqIs1KF6EumOtdc8ZTlZP5BqwjGkf5yzm9aVdl1uOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427859; c=relaxed/simple;
	bh=vhGncwJZ9wKzKg6h4u79wj/q2EUUFPEE7blDTnJndOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbEcEG1NcXmcv7gm4ny3ZkQbbclrpq/yVhAQLVHyjbLNDUDM0H0p45Bp/Zld3mMq5eVkHwvsMktQS3thxa80yWwKPqREWtGYB3olcTOem1kQZ7cl1ns2us/loUbGcE2sFb+HUUQ/Fh1+mwf0CIK9IQcFEHYb2MnDzuTZi3OdIuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqMqG54h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pja59epV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8sTq3768510
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 12:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=; b=hqMqG54h4QbHLTUR
	JtWmWqM6Hv3A88fG31J0Y/jNV34Az/XYukWTcC13ffIGypAt7KNDBRSv1vOi1Eo6
	vEbBerzrxKLD/h9Gxf35aPAAj4jvCv4luuQ9zyTSoiPlwbGol9xBUJS+vkJ7Yxst
	wvQqSJxNMnvV2COl0PtRMXSZ0vsrKgp20H5Q01lF0dRWDcA7g0j2ZEII1sc06Czy
	ZkPS4rbFVAZAlSMWg3ouagoAfa4//+6NUj27Yhv86gIjoOvTEWfsp18WwFo6VZLx
	diV/l0zJY6rmlz9GuAiAibKg39nZ37lhBSbX4ujVZ4DNLf/qqoFTPGuUbXjWBE0S
	Bli5FA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7ae3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:37:36 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb60cfd476so2618719a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427855; x=1784032655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=;
        b=Pja59epVDglW6sa9qOOllefe51YsG9SAR92eXU81TGHfZAR5/kIYoNzDPRqZ1VbApB
         13gTAylwnYKFAbsdhilmK/E+RI4adgnuIap6C9vGt84THQy/R4Y2s/62O6cn5Xp1lX2u
         gGJUwQ326sCUhe/P71jbv2hl+jU4W20gzZb8kJoLDbeD8S4I/nAhpxCj0ba3ci1aw8gd
         2LSSPKMjaBokK50kGthoPRFwuhk1q1MCPxF8onO8oWuYHGOCgfefVukH1g6eQ3JPhmVm
         R9P6LYGPizbwLUgSq0ZYJqDt/hvBOexnO91nDPGMP1de0HnHfzT+RxmwnItXv/zL7Uf7
         LVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427855; x=1784032655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=;
        b=KWBkf7t/pH3nOCNOFRNtvQ7BXXB9618qUF0OzQILQrSSXOTIIrRmWL/zScl2lony6E
         vYw6tbS6qFZ+VGT/xHll73MrmaYraX0zyTi6puUam60nZVtt7Uk5PiO9rbZofbKMX+1x
         fqcfFPQCdzP8kyz+1S+K3BTLUO8jVu9+QqTZ65vjnm539o2uaCwiG1N20WfHp86WyBBA
         FSz9yBBkGqPcxcP6GRthdG1LZwzAepJh6etkfhKTXFWoM+6Kq6vCQFFcqNvdu+pErUyf
         a2Hia8liKqq/bP3QbQWbFZ4ig2V9XWJTGiK2tV8fTCLpHZS1PZR1hQ0O+RxYkNsvR313
         CqUA==
X-Forwarded-Encrypted: i=1; AFNElJ/AFQVy0ItWgqis05Njw/Y7Ss5DuF906lTLSoWbim3MAruVMCVJqIGnpwEUoKkvg1+I/g1pp1u5tIky1w0r@vger.kernel.org
X-Gm-Message-State: AOJu0YyXLQ/AtlHCPVfKkwoJZb72NRn+rsvucRvwLKLOoRlFxkUR3Dz2
	HcLDH3T5SLrIA/9mv07UFpZVlO0ShLr8iR4lpPhBCPjPGlHC99IK6kyavNao3sZ2hvXh61CeRWT
	VbsMAO+aQBtbc+uMk+gG5wZbRLDfQsvR17Yq3FmqC+kTgVQCbb72jJbhsTx6Wf9twp0LQ
X-Gm-Gg: AfdE7cnTXSsQuFK4fGPKlhFpyD1R8LY/J7zR1KPN8u2+Pao3qS0wJaYkUPKRGrgqNGn
	kndqY88CvNC3P/aRq06c1s+aqn/R+L9mMDhyYeXi8Xqz3umAFVBrKrv3glSM4jVAOIuW0/mrIFt
	KMR+XjIYeigFwhGjr2Mmvoyrem9wdaD9l3kHlYOAgULWj/+gdGlhJKo5Op/kzd8Ka8WJ3xh6uNR
	VsgEHNiR1byRLwlfXzdDB//dKes9vjZu55nXGUTNYbtyUwFAkU9tigEyBLjJhdIFGMhHvVaZPiN
	03ar8l0N/8Hpx3VpvBNJiC8CZXsTJeSxfus7TozU8Ecr9qURzytJ64hr3knZTJErMFrkFzgSKxO
	qs4cCqPSDsK01ShedYvasHGX0wQkZK7OFghSSpyM=
X-Received: by 2002:a05:6830:67da:b0:7e7:76f:3ec0 with SMTP id 46e09a7af769-7ebb233a1c7mr3266289a34.15.1783427855366;
        Tue, 07 Jul 2026 05:37:35 -0700 (PDT)
X-Received: by 2002:a05:6830:67da:b0:7e7:76f:3ec0 with SMTP id 46e09a7af769-7ebb233a1c7mr3266269a34.15.1783427854922;
        Tue, 07 Jul 2026 05:37:34 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542ebf72sm15010628a34.9.2026.07.07.05.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:37:34 -0700 (PDT)
Message-ID: <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:06:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PBHBgnBbL6YWNeb0yrMWg0s_Bq2cQEl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMiBTYWx0ZWRfX6D7rxCL91u8p
 xKRyDGQNPBimPieYYakMeYPLmLJWWSklkX15T/gyoWdyUrtnwvMsj3thBD4cUAcnroF27hxeAs2
 N/Ho4cPvvsaGNYfNtUGFgvEVquv+zvO3gDhRMpyzWzfzWo2WznTFGp5L3P47M3qQHqCmpiUTXl9
 AiH/lbwD/Ixs4g2tlgPtSPSnu++ApiCg1lXiBmEs6Vg4Ctuf5zwLBJ9FcBhp8GtQY6nBYgjjjYo
 pl/F5zknFxQhVKCTTdAlmCByWw0DIHDBeq0Ox5PlLjyS962VhBsTxiSKLXyh8uMvcYuh0ybt6Ak
 C8h/PohJCqNsGFEE4hzq5lUcmnTV9DJ5P09sZNpY1CL5gdmdIsHA8V0lRDmtMFXl51+aFAs/NZ/
 wIqY/ol3EtWCO7EQegapERnHu8aJ8FlF9ej7GXoExuPhmgKtxjVjScLu+zEQkHc9WXIsE4Seymq
 i84EBfX4RrEliVS3j6w==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cf310 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1xpCzd4iWPYukUP1q-QA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMiBTYWx0ZWRfXy6LBnNFMmDR5
 vIL7A0Xn4bwYhW8AWEk7DRNfZHEzvqRDwaovUahsIanCFytk4iaE82mztHb54eN57lC9YP6Rkl3
 7o6fbklhQJL+eUQ82HzU3f/yTpJd4Fc=
X-Proofpoint-GUID: PBHBgnBbL6YWNeb0yrMWg0s_Bq2cQEl7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117309-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 736A671B784



On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
>> path before the SMMU register space is accessible. Add the optional
> 
> Why is it limited only to those SoCs? Is it also applicable to other
> Qualcomm SoCs?
> 

I was hoping to keep this series focused on the core infrastructure
changes: the bindings, base ICC bandwidth-voting support, and DT
interconnect properties for the platforms currently supported on
Qualcomm Linux and have been validated so far.

The additional targets have not been tested yet, so I'd prefer
to add their support in a separate follow-up series once validation
is complete, rather than growing this series further. WDYT?

>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index a701dec2fa0a..fab8944d7b63 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -246,6 +246,13 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +    description:
>> +      Interconnect path to the SMMU register space. Required on SoCs
>> +      where the SMMU registers are only accessible after a bandwidth
>> +      vote has been placed on the interconnect fabric.
>> +
>>     nvidia,memory-controller:
>>       description: |
>>         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>> @@ -644,6 +651,26 @@ allOf:
>>           clock-names: false
>>           clocks: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - enum:
>> +                - qcom,qcs615-smmu-500
>> +                - qcom,qcs8300-smmu-500
>> +                - qcom,sa8775p-smmu-500
>> +                - qcom,sc7280-smmu-500
>> +            - const: qcom,adreno-smmu
>> +            - const: qcom,smmu-500
>> +            - const: arm,mmu-500
> 
> Can we be more idiomatic here?
> Something like:
> 
> if:
>    allOf:
>      - properties:
>          compatible:
>            contains:
>              enum:
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
>                - qcom,sa8775p-smmu-500
>                - qcom,sc7280-smmu-500
>      - properties:
>          compatible:
>            contains:
>              const: qcom,adreno-smmu
> 
> In the end, we don't need to list the full list of compats. We need to
> specify that it's Adreno SMMU on one of the listed platforms.
> 

Agreed.
We need the interconnect property for any of the listed platform using
the adreno-smmu only.

Additionally in following e.g.

compatible = "qcom,adreno-smmu",
              "qcom,sc7280-smmu-500",
              "qcom,smmu-500",
              "arm,mmu-500",
              "qcom,new-string";

The current schema could miss enforcing the interconnect property
when new compatible strings are introduced, whereas the approach you
suggested continues to handle such cases correctly.

I'll update the binding accordingly in the next revision.

Thanks & regards,
Bibek


> 


