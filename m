Return-Path: <linux-arm-msm+bounces-81558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C34C5682E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29441347335
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123DD3321BE;
	Thu, 13 Nov 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGYsqAmV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2YTs9BP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9110F331A68
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763024341; cv=none; b=W2kzas5chiwhRW8o8tTm/ErxDC0PSWhmaVa0+dXUQRc2KB55VtMiHDqU/fZyzG4BnAhllMPugdpJCV83bK+KdhAlwCP3Cc5EFiMu4uS7ZWoWZunRDgmJonGEd+9Fd+ieF77NRchj6WICoFGCuKduj1j+3dQrYpDSpk29Nien6tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763024341; c=relaxed/simple;
	bh=xeygKzfNcFQdWUmw0ipAs/cIwF7l2/4A6HjIVo7GqkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLhgurN5I6YZ/zQnmA/tHrvzXkEnS8k254z6Y5k60Kq7vddTb/oOE5nVoCfiZmYISCaHMgtz4zuDBmeWSc3N6jbFa2LEhSYNO6QLWZARjN1FPhIajG+lUllxUFsjqKGVdeMz+nF4pAGrhiLzY8ewXfhFHnBwXFtEpvCq5jbpGrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGYsqAmV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2YTs9BP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8bI0A2962376
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sROjm0GfKSzH5SLU/NEBWTltDSLd9LFgr/GT0GVKZ6c=; b=FGYsqAmVJ91Sm7TH
	DutOPdwu+77i+E/LtYnIJJzBPx486I817RtREncP/Qr1BM6eD1LfnOIXMaiMXeIX
	G+qwtR5Mmy9oOohqtrSkydhHo1eEUovPv870xZGRj63f3lkXbom4NFXnnYXbBoaL
	fCYi645gOYSLwCkEjGiekb1i7a4IMWlmaNtS+Ue1wZn10BX2lFTg4gtOXK5XDW0g
	osnFt4QMdiEq8yc2s4wI99ERamW8FLWzhszDgUEl5DiZ2U5OwPfE5WFWLYWygMbO
	3O03qXhAcL1ebRgYAf/5b+/tY6jzMumlyC5K8wm167zrLkCs1aima/cbLrWATLOA
	o4YuOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwbptvn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:58:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so1311603a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 00:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763024336; x=1763629136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sROjm0GfKSzH5SLU/NEBWTltDSLd9LFgr/GT0GVKZ6c=;
        b=M2YTs9BP5etJCe7Jkjo71XZJ2mTtJAuUlUAOmtpm7pKuZod8ZmHvFuFGlbvunSbyhX
         /spjShQV/Kb4ZF3qrR7+tV098Mx+8Oi6Kh1uEIG020NHjdRGo1rM1E8coj7j4Tz5YyCZ
         Rsob4K7Fd7ftI7MtvtMRT8/g7RYF9YEpo/WbIdSGGd7vQ2IQe71haztJ0Q77kbo1pXcb
         Bec2IOGpG3zGUunETg3ZSaJad0cMt1nLa+vB4KbhWjl2TC3OOqizblKuj0Uh+VNTWfcB
         3UGgNf6QOvT6oK5bJhuTm1qBQ3uP9yOy2XX5PSpInHKg9D7WJlusCnhg+ZJYfi27BQJ2
         3aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763024336; x=1763629136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sROjm0GfKSzH5SLU/NEBWTltDSLd9LFgr/GT0GVKZ6c=;
        b=mEfzt7n0dPU6ygujKRaz0Z0Nl+sgsT/gIbtK70Jikj46HOHBRrpt2djxlZckgac8AR
         BefRl1QQdXNGdfof/hL+S3DFIgNZd7750zmEZ9cWBXICexZJbTTB0NaeQ0eRWvYgqCHL
         2ROvSqC45cKZwjoWFYI1cgsToJDypbqMmfY4vIG/rm8eYeHDGapK/DdiJzIbdptyO77i
         xH5R7ltGTFQU+2q5gFeArdHuwSI8s4yWpJ+oh1bQErNihlpdHH+/GkdpR1D1a8wgUROv
         KzyO7ecn1ld+ms5amPlhwEqOVsFqizqOLd+GpLaLGlFCyUYRCpC3TqjkpmEC5dAYeTjm
         XKsA==
X-Forwarded-Encrypted: i=1; AJvYcCVYl8ddn2yY3WFmOZ/5uoMfTg0VEmTM7//UIJTYCJvvfzM6ZFbmYhPI0I4GxnQhTWQbMHYzeE7cAT2ryTvQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30IzAHGjwttD2GMwWCL8yXUuwM/Tn4lyz0H/Rif9rBZbC/pag
	zZ/vO2LpigyyhAylPDCcIoJrMqeV1IpasZRCt+NmHNXqmPnyHXNzKnIA8wg8G/mPjZGgopK9ZVR
	MhIEUkLPi3D8rnBOHLpAB3oYV2YSjRcck56Ixzetv6zVl0/If3MPS8dtKZvSu/RhOHdl/
X-Gm-Gg: ASbGncuftj0ZVM/nQ1Eb+gWOhzH0wM+sjnxiohit3K+t3okL9ZfU78Niup2S0q9xxOR
	KmW3uAMx/kD13NL7KJDXc8ZD7+X2qIOGqjU8SqKuejK/ebeYwUeuJp327R7duEt1wSl7ETf+V4Z
	e4VZ1EXqTEGrCEAbiyqx6iH6+r8RswDqiLbUmWlJ4HQf0Rzu5NLt21LamG8kj2p94QnuGVIdTqq
	akLp6hMZLKlhz7ee+DPuzBZvU3pW+RazVY6r3kfOV9vLT4XpwvsjSSzMAg3OTIV7GmnDrNeaot1
	TOnxS/12wEWkqD3f8URWQiM7HgUbJWD7EVGtOPBT8luNFPptdq/rtd3FistG2sAtMorClzOa+mI
	jMkLNYU8W2cmzVEaD6CzuwzGdmTzWcLn/yFyJfVw7c8BtFNV0BaeNTLF3eyUCKSeIaDQIChQs
X-Received: by 2002:a17:902:e5d1:b0:296:ec5:ab3d with SMTP id d9443c01a7336-2984ee3523dmr75868775ad.61.1763024336337;
        Thu, 13 Nov 2025 00:58:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzgUlzNtw8/rYEnIQrkWBFku2DIdKphkHqn6UbV00gDuOF+BZfctiwr/Qw6rkA2ESsI4XQ0g==
X-Received: by 2002:a17:902:e5d1:b0:296:ec5:ab3d with SMTP id d9443c01a7336-2984ee3523dmr75868465ad.61.1763024335662;
        Thu, 13 Nov 2025 00:58:55 -0800 (PST)
Received: from [10.133.33.34] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccc03sm17458615ad.109.2025.11.13.00.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 00:58:55 -0800 (PST)
Message-ID: <4d4fad1f-aa89-4aae-a856-b032ebc4ea9d@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:58:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] coresight-tnoc: Add support for Interconnect TNOC
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Leo Yan <leo.yan@arm.com>
References: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvjcssdJ c=1 sm=1 tr=0 ts=69159dd1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Wn57KMgoQ4YZn1JjiAUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: F8SwYtK5YGWnoCdm_EN_ZCyclUrdNIeG
X-Proofpoint-ORIG-GUID: F8SwYtK5YGWnoCdm_EN_ZCyclUrdNIeG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2NCBTYWx0ZWRfX8Hfr+DCx2lFC
 Gm3uGjHXfYNrHNfeRL3Hwbcu11rjWeVWIaAWdXMcVad66yGjEDYIBv6O/eA78gsPf2gETOiEv47
 8z4saNrQs1gItIm9czj7OlYV6Jfz74+d6ZxlrM/VJCrnznv2mRWQ3GkMp82FgYx0LmbYnSLdb3m
 t9FvT5GeHwjMz2NGaIkPXhIwgF6+bZPAvOElmNThh/veY9fNAYNcTUBj8DCk5efuz8Cm/N9st9G
 D4myLXEzt7LAqAF/EZQNfnvH5qC4DdfdSSgYi4D/OUiLSkug4/TxPzSMxYk3s5L/JhK+5s1h50l
 0Jk8HckZyM7STH2wVHZ1xis4N/uaRqiRdot3wuLT23ilOLkjbNWHa+30S2g5VUAuE8sSCu9uggp
 vjAIZWk8+MJ9NNUzjvaIvHFVqANR6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130064



On 10/16/2025 1:49 PM, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> Changes in v5:
> - Add the missing review-by tag for patch 3.
> - Link to v4: https://lore.kernel.org/r/20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com
> 
> Changes in v4:
> - Fix unintended blank line removals in trace_noc_enable_hw.
> - Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com
> 
> Changes in v3:
> - Add detail for changes in V2.
> - Remove '#address-cells' and '#size-cells' properties from in-ports field.
> - Fix comment indentation for packet description.
> - Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com
> 
> Changes in v2:
> - Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
> - Dropped the 'select' section from the YAML file.
> - Updated node name to use a more generic naming convention.
> - Removed the 'items' property from the compatible field.
> - Deleted the description for the reg property.
> - Dropped clock-names and adjusted the order of clock-names and clocks.
> - Moved additionalProperties to follow the $ref of out-ports.
> - Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
> - Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com
> 
> ---
> Yuanfang Zhang (3):
>       dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
>       coresight-tnoc: add platform driver to support Interconnect TNOC
>       coresight-tnoc: Add runtime PM support for Interconnect TNOC
> 
>  .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
>  2 files changed, 215 insertions(+), 11 deletions(-)
> ---
> base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
> change-id: 20250815-itnoc-460273d1b80c
> 
> Best regards,

Gentle reminder. 

thanks,
Yuanfang.



