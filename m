Return-Path: <linux-arm-msm+bounces-104117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK6jFxa/6GluPwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:29:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02285445E95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5411E3044E5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8222F3D47D0;
	Wed, 22 Apr 2026 12:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fekSiEjd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5ngrgBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395203D412F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860792; cv=none; b=lifMUBwgaG/mhd0U9Pc47i81D0mXdcjXZKa8RDrXH3tAItC9f8KRQ9htJlRZLMb/E3+lqOMUjFn3vDZeAsIhJfpFRdXYUnMIV1gSxDS+cwiMThAvq9g2tpqdLT5u7fi8tkxJOo8a4+4dx+BpQTe6Ywn3f/unYhEbPZdDj3Ubqxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860792; c=relaxed/simple;
	bh=V27alqKNbHbQGFNKtKckSv2uL0QrcIKQxe8K/Ir0h7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Us9f2uaWuHSxTkTBQk2NaD9bK2bgTGEQj2G8kD+qexutBpoHKVDgt2DNsDVyL40CuTvl4ADN/d+EDYs1XFQD5pwD9JSjI4IbpnXBAhANj8eqQ/oCTA+LS/kNynnzLIgFA9aJKg+XPCN+ejGf4HeqO8PsRq2bM9QqzdO4nWjLBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fekSiEjd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5ngrgBP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MBH13h2209902
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIsoQnVXMnLOvbncyck/9zSJa+oCDzxGM2a/zvT0E+c=; b=fekSiEjd8SwNK6RH
	N/ZPV23PDUJPNrz9LdDyrD0FoTC7fjWIlMK94I3qKfV6Yyx465xX13/zLlnarNAG
	DqVqy9/TAEHcoMEBT8U0hAa397M5OMtbe6f2yVyA0v3XE1u9dM5UkWyWaOE4diJw
	BrefUg7V4+F8ign/83Rm+C1/EOVyEEfivKx0KXW3vS+TqmzgvB75ofVDdm8qfZPQ
	a16bUgmvRCd96K/d+2WRyJFy2qp6vM/Npcbpd9Ra/zf7kmXk8GMNLNMb1G6Gz6Cg
	FbuKrJ5jYR31ggwz4StgP3hXENRJ9JIKJfzvnD4eenBnHVfLFGt3zQHV+kZO35/+
	81l8kg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengba2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:26:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so5911631cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860789; x=1777465589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIsoQnVXMnLOvbncyck/9zSJa+oCDzxGM2a/zvT0E+c=;
        b=a5ngrgBPLNEhNNmV0HujAz1J/y922hyvBzEZ7BLswP4L5s2VHRBM2AyzyBJOCojbYR
         CodFMmQgUG9NPhekrA5WkpYhETxiVKmHX1r1uoxIpQL2KgMGjiYQEOPa2CobHjfbGOSb
         3VyJudDLHg3j0YDEwPp4vmjCeCCxZFw5iLRwk143JyLnU6z0dVgZVqppRC4PxAOF43HE
         NdFxRTFl5dacLmykz5ZWSn6XFot+uOQNLzhbg3SVXPma8E19sm8OKSJ0tDEPSn5zy5q9
         QP81HHNOmIyosy7hO5ew3bIbdJhRRv0qPGaFVbqfc4kaMX0BYZ80PmhqMxaWhHtmJAQE
         mfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860789; x=1777465589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIsoQnVXMnLOvbncyck/9zSJa+oCDzxGM2a/zvT0E+c=;
        b=j4hquxJxfF0R78vO2RVhijJn4/OHxcDdV3zkJadmt7V8XtGmMwrZNxM0EW510jtmaY
         kN6/hcEIJlT6fZAjzJupJfU55T+sHfQ+feVOGcNQTZ/9z+LRSHCNe5TaV7TLYiAAvv5v
         +BaWdU2sn9QMoGLeTsuDtG2aeOIl/JJpj6cRpdZoYkDKMI0KLrsOzbECPej9rJDvzOhL
         NmwzyvXWDD8sD86jlQeR+TTBST7toWYwxrF8+OjQHT9+NxxGdixtuBKI63fKKaDcfp47
         LJIAwQiaNVm4pYbcO87R4UPDu5hQMj9Byanc7DcRu3Rsd2QDIhiOfk18aKgYyKYGHraT
         VXQA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZYaK659cDr9IfYB44Zt39g4mVKJNQHol+nqeF5xZVRFWy4JWtorbxIhvNvFCEWXzGzntiowgYh6amHJ4l@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj6FoqpeoIESz0e0skdtebXO46N6dpSSa3jK2huq2A/w+qNjQ9
	RZ/ReYxrcviv8sJ/gaqLGeHNqcJrtK0At6HsyjRnJw5s3tSfowkgSron/Z3mYvzdAZI0wpGsneJ
	cSxuXBfwgpQz3NM2vUc2nlFsT13m+wjjpYXJRZ1MBRHrMoF4Cqfdi3X8BxuNvmhPc+qbn
X-Gm-Gg: AeBDievQBxoIZIBAo9/1NN+OwJe1ngD7fFNMPejoI6xNsFSnYKnULVHWqGb1kr0n6tC
	14LpoTtkKolR6dFHbVC2KsrKDDmJjqrOpnLkaefl1uwJQCoIV+U0NJ3VbUHskYKW5ahXVMgz1GT
	UpV/r9p0WW/2dXBMZYZVgx68GZd1tbU5XBYiiNGFqFhpabueuGH9K6BBHbgp6kBhZkQAfjrc6Sk
	BG/w8R6PHrQUapSw+H2KZS0kmOLu4gNlyhtBuIL/sPeP/MWp08LnSyigVVU/WlYg929iI4C6Agx
	mSTgM5xxFljf99nLmpqXZRhZdGPvVSvRjYAW3VYrHCJcqqhjYV/b7hO5BN2P6xX49CnXytdtcFN
	DyIsUOzk04VdvQDeLHWfS+f1WGrG+1peHY5/V7bPlurURQeHJHJNbSrA6hT8fSFDgvTuq2fV5BY
	7Dageq/ZDq9qtDJA==
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr130379801cf.7.1776860789171;
        Wed, 22 Apr 2026 05:26:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr130379451cf.7.1776860788699;
        Wed, 22 Apr 2026 05:26:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553e9e4sm546474966b.60.2026.04.22.05.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:26:27 -0700 (PDT)
Message-ID: <d06a4b8e-6b29-450b-9e7a-270fcd0c3e2f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:26:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMCBTYWx0ZWRfX4J7Oc/e9tZYx
 r6+NwdFvz2CNIQ24nXQx9p/3z7s4uXYUX+63rro00h8ADeE+ynV8RGcCevD+ZSQMr2ZHX9EFO98
 jmUcP5844KP4EvTlTj4RdXeOZ412LqP37H1S1U3+NNU81gv1vpUm85oYNBJ0RoN6Ir1VPHHukCf
 iQxWkhA2CjR38qKXbdDLBccLd9OPhvwLaiuxJRRMVxUZulup0rJ7s5jjJfXi/ly2aBiJspn7yRV
 hFYX2t6omsBH4R04gkrI0lj53CdaBKNDOOlhNyyTrLTPR87p5sIQrtwJGrIctu/Fgb1lunxZdF/
 1XrsO7nBKnG/h31U8cDH+ILuuTo7PMVUdGNMft2MF6kPS21GCOKrDOaYAqiZXl72o8w/ddGy2ow
 o+mzxXfcKLHZqAB1schSHXvq7lYw99ue5CLirLLdNwIuZyz+6th+gJ1YNLtSQxOWyN5jiNMQADy
 P34pDhQMTuEyrwUm02A==
X-Proofpoint-ORIG-GUID: MpPCqt3hdqXeBftY2O_eTsExIs_NKLAt
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8be75 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=C_VYEJWI21jkAhOvB2sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MpPCqt3hdqXeBftY2O_eTsExIs_NKLAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104117-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02285445E95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> iris_destroy_internal_buffer() is guaranteed to succeed and never
> reports an error. Returning an int is misleading and forces callers to
> handle a meaningless status value. Convert it to return void to match
> its behavior and simplify callers.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

