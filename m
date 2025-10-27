Return-Path: <linux-arm-msm+bounces-78864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6466C0CCEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44D7D4F3EE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D0E2F5A1F;
	Mon, 27 Oct 2025 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mw0v9ebq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E82F49E4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761558989; cv=none; b=XbUhIBofbGASeHj/v51w1vzTUlvazXX4w18PmPDlhIpsWqY80nz4JO+sJ5z4wY6An99W3VIKepoAfv314K2DqocOgy9ciM9vjsaN30uZGr/V4d+d8lX1EEQ2XTHdOQydTFauS5K94NewYwEmzrumOj5jrtAG7as6DN5pyQnhlsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761558989; c=relaxed/simple;
	bh=49KuHWgqbBEZ9CZ0U7HnAnmXXyvBTiks+mvSIgLBnBg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dPdbjAFswkgZVgPjKSCM2j9Hj8Afh7rsl9DOxqKnglegQWVPP2tw/y15FheJed9m1fc/OLqSfLTRXrqyeZZE9CamBeofA/xNVX/v/7gylhDc62ojFUwtEgFY07c+n590Y4Pzv1fDVV4FBcfRnEkhru+GxzOKAj4X/pGBDMWPX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mw0v9ebq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8UBUw1108656
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZLcxjOuhFLSx2lSfPF5+N4YDSy2K6KZJ1QpLWOVRo0=; b=mw0v9ebqeY5/u/c6
	RG+OB7d7GO1dIAfYQUkzi7EJY8Ijy8dPe+Gq7jbAK34W7xBPYnLYs353pAKTVkfz
	rRz3m8siaNAwDU+i6NhATtZMrqjQphaR0uJn9s4LIZDzXi+CkLNRHK+kyCaJ0mFN
	EnVhphL4eEkzfUwrScoBVkFVSlkQDEH82hOa+ns/MvWSjTK7/qN9Jv6Hb67aCr6G
	zVcCHJ0ynjIjeK3tJ5YhozyYU9ea+GB92V9MM2kWX4dWs7tvD73OnSJVvs57izx3
	PMzywn1yjSTu07cfQ+UMU8VMkLcI8tZTu68HWLBVv8bWoylpBfhJSAvmaPM7FV3i
	TGVz7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p2q43mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:56:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-286a252bfbfso106938085ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 02:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558986; x=1762163786;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZLcxjOuhFLSx2lSfPF5+N4YDSy2K6KZJ1QpLWOVRo0=;
        b=gChxQesI2P5cxiSLJog2XnbJRQzlShrdgGFRNNoov1HPLc3OhmQMODLXn91gwEIXGF
         LOKy9G99znkxWyJJQTR+dlc+eDzFNL64WzSeF51o9cHxdMmX0CnLSyShCIbeUPPehEV8
         NXg57kn05PZ7noVhsQ0kFYcESQqFXYgLIfX+uAauCLRFcEPHEFMJ1t/rmVx32q/YeAVf
         rR+xxuxDGHWPQ9byqDWzkthvauEVgfL9nO2jDTiqAdkI/fQn7iiX+olA1oh2kl9/ADko
         K6jJjK2ZVxXdu4Mg8CzSNtyqQfsKf0E04PdrqB0usGvjaSx13vdH2hVtsLs1fHPiEtWH
         tf4w==
X-Gm-Message-State: AOJu0YzEE51TwgESMzH32XyX015O3rNjPYbUo+H7Dlm4pCFjnnPO4GFP
	D1vX1mpvYnCYo0karNg0xDAZ6u1uGhbWd6ogyf+CvaCOxuanJsOlDzlS2QFg7dDkAJUS80diF8V
	EGMtxdeJamuXxxOogi9vwO5hyAWr1c53alliNAXq12cXMeASWmxOsbwuQhHNfD7sRLYtA
X-Gm-Gg: ASbGncvA4MjYAtsG0qSSUdDn5ePr3Bwv5qlYgyR95ZYs9rXPc9bOU7NF0S7ti6nsS4s
	L+Xfr3VI9Vvb6wxWVUfNERYBadhxPOzN76hNOhGeG5h+qLfGXYivCCJbmWpFlAKLy7i6nsyfzKF
	qRAZXA9+wbUnYHGwbi0VlLwTqX5DOvNUyBQu0yO9K7IGdRzOrmc+0kpRzCAnoqgLmVjTicVTDEY
	mC7I+tJnuczzHoUvP9MBesKSNKkNyfwffVWUhlgu8zR+ayNzoaml8tiyPO/kflbw1FJno+t265a
	HCNvXqSkfxIIkmosopIrbh884kYcxiU+y+rYSQqtbEJ5O+22Nz0Lgf08uHgKri1RIDwkCAw23Wu
	cOgBOSeMQmyrPafzkhTRnvK0XrZnf
X-Received: by 2002:a17:902:ce81:b0:294:918e:d230 with SMTP id d9443c01a7336-294918ed5edmr125766485ad.56.1761558986334;
        Mon, 27 Oct 2025 02:56:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpsl+w4c265sP2x7UG/jdmhdNem1Mf2ozhJLDuiYIxf3ORTGvq7Xs5oMEtez0jUwb1ebPw9A==
X-Received: by 2002:a17:902:ce81:b0:294:918e:d230 with SMTP id d9443c01a7336-294918ed5edmr125766185ad.56.1761558985868;
        Mon, 27 Oct 2025 02:56:25 -0700 (PDT)
Received: from [10.217.223.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42de5sm76992315ad.76.2025.10.27.02.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:56:25 -0700 (PDT)
Subject: Re: [PATCH] soc: qcom: Add HWKM v1 support for wrapped keys
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251026164708.2771213-1-neeraj.soni@oss.qualcomm.com>
 <bef7c78c-2257-47ff-bccc-a9422afb1c42@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <5dfd5c3b-08eb-e17a-69c2-68b5c1b6a4ed@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 15:26:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <bef7c78c-2257-47ff-bccc-a9422afb1c42@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QvpTHFyd c=1 sm=1 tr=0 ts=68ff41ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=U52zUqlz1-iEZOZ6paEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA5MiBTYWx0ZWRfX9/3596OxXSjk
 ggCKvYxE9t0DEwg+d5kDAdmHJFzByV2wKuTaEvVZe+2FOKNjjgE+KNCDqMj1abl/PVStzZ2hUIj
 i4oGih/EFpHOz13i+jB4Kt3RwnDsyaEZtZ7v6gqx0S7T5zDFxVrfvR75Nd+mJInaze9tMrVroUh
 wH78nKbRFw4NFkAZDUXckMkaWW8QwzdfkMO3OBf1ZNSS5/grh+HViCGYKk7ncG45sUfaZHCAa3O
 JeXQy9Gunjl/T5GFvhWbEIjcizJ0qGlNRqa8/4+HvA4ewksLSjgfjJaQNrqIKxrfElnJ2eVMXmx
 M1hV9ob54xcjnKLnAqvXK196Fehv+fhDtfNVIx7zKW03wZyyQsvUJ7Rds9oupaNMk+PbReZYQ3L
 DKTJ1VJ9pUc4MMLbh/tedaMUw9kAcg==
X-Proofpoint-GUID: EbI152LqMWdx9xgIW72EdcwFqhWgLaTV
X-Proofpoint-ORIG-GUID: EbI152LqMWdx9xgIW72EdcwFqhWgLaTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270092

Hi Konrad,

On 10/27/2025 2:24 PM, Konrad Dybcio wrote:
> On 10/26/25 5:47 PM, Neeraj Soni wrote:
>> HWKM v1 and v2 differ slightly in wrapped key size and the bit fields for
>> certain status registers and operating mode (legacy or standard).
>>
>> Add support to select HWKM version based on the major and minor revisions.
>> Use this HWKM version to select wrapped key size and to configure the bit
>> fields in registers for operating modes and hardware status.
>>
>> Support for SCM calls for wrapped keys is being added in the TrustZone for
>> few SoCs with HWKM v1. Existing check of qcom_scm_has_wrapped_key_support()
>> API ensures that HWKM is used only if these SCM calls are supported in
>> TrustZone for that SoC.
>>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> ---
> 
> The subject must say "ice:"
Ok
> 
> [...]
> 
>>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
>> @@ -114,9 +126,26 @@ static bool qcom_ice_check_supported(struct qcom_ice *ice)
>>  		return false;
>>  	}
>>  
>> +	/* HWKM version v2 is present from ICE 3.2.1 onwards while version v1
>> +	 * is present only in ICE 3.2.0.
> 
> What about before v3.2.0?
Earlier ICE versions do not have HWKM. Will add this description in next revision.
> 
>> +	 */
>> +	if (major == 4 ||
>> +	   (major == 3 && (minor >= 3 || (minor == 2 && step >= 1))))
>> +		ice->hwkm_version = QCOM_ICE_HWKM_V2;
>> +	else if ((major == 3) && (minor == 2))
>> +		ice->hwkm_version = QCOM_ICE_HWKM_V1;
>> +	else
>> +		ice->hwkm_version = 0;
> 
> "if major > 3" is more future-proof than "== 4", unless you know for
> a fact major == 5 etc. will have an incompatible software interface
Thanks. Yes the software interfaces are compatible with versions having 
"major > 3". I will fix it in next revision.
> 
>>  	dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d\n",
>>  		 major, minor, step);
>>  
>> +	if (!ice->hwkm_version)
>> +		dev_info(dev, "QC Hard Ware Key Manager (HWKM) not supported\n");
> 
> "Hard Ware" looks *really* poor
I apologies to miss this. Will fix it in next revision.
> 
> [...]
> 
>> -	BUILD_BUG_ON(QCOM_ICE_HWKM_WRAPPED_KEY_SIZE >
>> +	BUILD_BUG_ON(QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version) >
>>  		     BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE);
> 
> This is not going to work how you want it to..
Thanks for pointing out. To fix it, i will define a maximum HWKM wrapped Key size.
Currently HWKM v1 supports wrapped key size of 100 bytes which is max. If this
changes in future HWKM versions then the size will be updated here.

#define	QCOM_ICE_HWKM_MAX_WRAPPED_KEY_SIZE 	100

> 
>>  	/*
>>  	 * When ICE is in HWKM mode, it only supports wrapped keys.
>> @@ -238,9 +266,18 @@ static void qcom_ice_hwkm_init(struct qcom_ice *ice)
>>  	 *
>>  	 * Put ICE in HWKM mode.  ICE defaults to legacy mode.
>>  	 */
>> -	regval = qcom_ice_readl(ice, QCOM_ICE_REG_CONTROL);
>> -	regval &= ~QCOM_ICE_LEGACY_MODE_ENABLED;
>> -	qcom_ice_writel(ice, regval, QCOM_ICE_REG_CONTROL);
>> +	if (ice->hwkm_version == QCOM_ICE_HWKM_V2) {
>> +		regval = qcom_ice_readl(ice, QCOM_ICE_REG_CONTROL);
>> +		regval &= ~QCOM_ICE_LEGACY_MODE_ENABLED;
>> +		qcom_ice_writel(ice, regval, QCOM_ICE_REG_CONTROL);
>> +	} else if (ice->hwkm_version == QCOM_ICE_HWKM_V1) {
>> +		regval = qcom_ice_readl(ice, QCOM_ICE_REG_HWKM_TZ_KM_CTL);
>> +		regval &= ~QCOM_ICE_HWKM_ICE_LEGACY_MODE_ENABLED;
>> +		qcom_ice_writel(ice, regval, QCOM_ICE_REG_HWKM_TZ_KM_CTL);
>> +	} else {
>> +		dev_err(ice->dev, "Invalid HWKM version\n");
>> +		return;
>> +	}
> 
> The else path is impossible to reach
. I will remove it in next revision.
> 
>>  
>>  	/* Disable CRC checks.  This HWKM feature is not used. */
>>  	qcom_ice_writel(ice, QCOM_ICE_HWKM_DISABLE_CRC_CHECKS_VAL,
>> @@ -298,7 +335,8 @@ EXPORT_SYMBOL_GPL(qcom_ice_suspend);
>>  
>>  static unsigned int translate_hwkm_slot(struct qcom_ice *ice, unsigned int slot)
>>  {
>> -	return slot * 2;
>> +	/* The slot offset depends upon HWKM version */
>> +	return (ice->hwkm_version == QCOM_ICE_HWKM_V1) ? (slot) : (slot * 2);
> 
> The parentheses are unnecessary
Ok. Will remove in next revision.
> 
> Konrad
> 
Thanks,
Neeraj

