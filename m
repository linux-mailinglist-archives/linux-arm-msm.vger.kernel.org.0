Return-Path: <linux-arm-msm+bounces-63855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45448AFA5C1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 16:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C47E1189DC45
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 14:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC89286897;
	Sun,  6 Jul 2025 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZG1zwTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50AB23CB
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751811724; cv=none; b=JgEojT8PgwNS4ocGg7rW+Qm3veCxmDk4lZ5h26fOszInYlhJrT+B1RO2WP0ROwYT45WOQ4W5HLqLxtHWT+dzaBK3FSUVfSvBxpN+xNXSJc/ilOIFi2snYIwieAFIlPeH+DrSbN25FjPSn+yNGBJT+nwEVB5Q4skLCtdYPkUYCpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751811724; c=relaxed/simple;
	bh=hGj9ba+WBBvZ9zms61zCDePnwkxudsa8B9DOmH+mpyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCXCeUufq4z9jTpILJAIWNdWJSIq2Hop8FE7ekPK3eYdEcqehQTu/p9GIS7FtL1FVb+P+kKrIFw6/vCrjRh0IK3zM9+rpqAVY4PiXg1PTGZy4O7CmLCMRS8FDInk6TJNP4RPnY79Bew7GFqOmiWKw64vkuBwUMffUr4Ngx2fhZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZG1zwTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Ce146021783
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 14:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LR59wvaFC1B+jtg9kXlIKRe6vvfPELWKIv1ziuV/xg=; b=DZG1zwTRrWIo8NW0
	SH7dNDOOY81dG4Haah1W7G5s6GBOxUmt/s7GxQNYDfhqYyGqftftKCN5PYZVkBd5
	eW/2QXQhinMuQhSGlqvitrcR7+3/wr/H8NceFMJlQhSZsHGMs4T58P8Khl8cZ5YR
	JRRTaDYfv7Xjl9T9OUVMyHNoHS6Y38lRdZf9HatRxhAIzegnGiIbL5t/hb6IAmO+
	nt33oMNdKtP3rnCcGBG/q0YMWWlDmr01jTleGo5CDH+NkX9vdCAwiXhAg7BXJVDg
	ewsraXQEi7s6klzhN5KkVsiYrjtsvVjTAou7UNMP2VfxwHItNevWpjm/pwtIClth
	rVj0ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk4nej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 14:22:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31f112c90aso1398096a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 07:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751811720; x=1752416520;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LR59wvaFC1B+jtg9kXlIKRe6vvfPELWKIv1ziuV/xg=;
        b=i6+NUS7waEA83nWxSa0NhvIF5QiNA+NfNxCDSMxDRLSU4HbKo/OXz01YteFvHAdTBL
         82PlmeXgYsTdMF5AZCyM0AEBoTkQVR/RwtBQH/M3H/ko1ZtRdeD7HDzs9eNj09q4XAJ5
         i0WL8tv/4kvRXaViQWh36QT48D5ELYM4Dg56c7SoOHs7q6WyuTWrZvoOTH38P8Ulp7iB
         zAe2hm2HIzAVNfSw83d8CW8yNhVWiVsS/wTq3uCbSTRIQKE1EFW91kc99w/OULVb9Xf5
         ZpRB5p2/GWvd6G8BakFUqqmt7bI+NRILIRc3Il3l3ox9CgjXZp8zHogmUzQ9TcDL7TPD
         1ykg==
X-Forwarded-Encrypted: i=1; AJvYcCWQhUt1zpniSxR834qodHMPBZbFAigviILwiWajSwHDmTFVangoZkpeGEb1M3Zi0MhHarGM8TO4f/l2pL3k@vger.kernel.org
X-Gm-Message-State: AOJu0YwlEBYMcdWZaMRMnRgVQawEoGU+7/tc/8GOhyW1zDYNCUbrW3I8
	X6hn767H56j+7YncXRNPeXGlAXSLzSuy3kUG5nZQA4TK1JWIazn0eQn9QML8hqPtnljyWLzK2oW
	OEBCV73svOLOxa1wYCZ8LEjPHsZ1Bc94OyjB2rci9/DhDhrWHG1uNZ4hGlhVF2z3CRQjy
X-Gm-Gg: ASbGncsJ/+cS2Q45st5PvanNcEG8H0pQO9VOrnvKfhQF/tP3lvmheJXKb4UqhDG46TN
	luukGwdx7P/AIy9LJd6geXs1NfWIhq9Ud5lWTVXOpsm2bfhlXSPCEqpSPKlmib3yYWZp9+RLA+w
	ooRnF0cF+8nfcpUyRhQCVstS6p4WBaMZU9TWjMG0eOJWuzz/pKf+gsVhMm1RY4kMMBBzX17l3P/
	cCnc/u5FnvDR/UzEIHA/f1OnxXFoNSxeoF0Kafo5aPch7sZRdMo7Hhrye1/YPqH2S3fD++9Vowk
	8wr0NzQ897JX/4+dqOci90H677rp1M05cFQgJvQNgQ==
X-Received: by 2002:a17:902:c943:b0:221:751f:cfbe with SMTP id d9443c01a7336-23c8595204cmr167337155ad.19.1751811720120;
        Sun, 06 Jul 2025 07:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO93oCbUuKR455AbSvqBvRYCReXzTUnYblW52a/kTh3+cnV2a1b0uxIXTMZ96Ppo2+XoCvjw==
X-Received: by 2002:a17:902:c943:b0:221:751f:cfbe with SMTP id d9443c01a7336-23c8595204cmr167336735ad.19.1751811719650;
        Sun, 06 Jul 2025 07:21:59 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.234.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4c6sm63428015ad.46.2025.07.06.07.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 07:21:59 -0700 (PDT)
Message-ID: <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 19:51:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X-o8fJRFtQ0iJuhSjZh9iztdtpyMdmcL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5MSBTYWx0ZWRfX4NijcEzl2UD/
 zHwvdaGoGaxKwz+qoABQK0dhiH/YnVmbAzXzWQay3uAry/XYF0nYz7LrmbgPN4gdoxGHkMny02K
 BaN7qOrhWrlui1S6biKT24mvztXWk8WOU/WRrJwEany6KIX7WYE1Ff42FCUARanKSdgy0vfgwHU
 EtP3WvPmhteF2kQ57iKbCfHWmtd6n+Dmmw9w1neShPZshu/m2biOv7qsMqYNnR1yyjnGfUog8HR
 Z3X+eDRqMbkJ2nkzrqJcKxzLylmhtraiWu2dFONcQC3S/WlfNYdt93RM24XAG9t/g3XROy+p1o8
 otWRwyndc0vkSZ06fsAiuZaR2q7cTYWieIExUP/8G0Skwu8+xEyFUQV10o7vRJRuJZ/j59D0mmF
 wTMJjyi5BcvNlYw/C/DzfF/f+NzDSOCZ9XzpgsqeXE+WBteNlCkJFBBpHbUHrlfdOdKu3OYe
X-Proofpoint-GUID: X-o8fJRFtQ0iJuhSjZh9iztdtpyMdmcL
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686a8689 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=D9rl3thw99EfY5kE3N+1UQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=idnX5w4AHIxaUxQtNqEA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060091

On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> because of the hyp limitations. Disable PRR support on that platform.
> 
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Unfortunately, there is no way to detect firmware support for PRR safely
from KMD.

-Akhil.

> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.
> ---
> Changes in v2:
> - Simplify the workaround as the issue seems to be limited to SM8250
>   only (Rob)
> - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c3ee3d084c215362 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->set_prr_addr = NULL;
>  
>  	if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -			of_device_is_compatible(np, "qcom,adreno-smmu")) {
> +	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> +	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
>  		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
>  		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
>  	}
> 
> ---
> base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> change-id: 20250705-iommu-fix-prr-600451b1d304
> 
> Best regards,


