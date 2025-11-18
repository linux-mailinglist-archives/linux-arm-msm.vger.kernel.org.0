Return-Path: <linux-arm-msm+bounces-82379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EAC6B192
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 19:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 989D7367992
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F64279794;
	Tue, 18 Nov 2025 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQGtY1Wb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+VQoW4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7CC2DAFA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763489049; cv=none; b=OVHfG0dYeAhzy66rd9n5LHzKPnkUDt4c2nFazJXPOcXtYLFIANKHnEzsa9g219lEDdvA3LvniFxr0mhc+QzzxzwMKC2dkqsbp4c7eS+sisBKVJJasfOsRh4NVb6kUdoZFOPEiRF5w/mgHO0zVgv6WXlu3yiEboBRkL1EfDpVzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763489049; c=relaxed/simple;
	bh=S/reGcZiyMR29etlw+1fv5JzzcK4XVwPMIMb3fwLIeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoevZKF3+SGVUsvPLgF2aOSycL1xOIFuOMOYZ95hMpXXgwMnhBCOoIxyBY1SbG/E2GnOPjrmvXiE8oFHws0vos2NWnsk7fIQuB5YZn4w+fM71j/JQ8F/LOz/XK0EDnMAVFLfyvyrrFuYzrPv6tgCezieStc/xmf+8bCxtd9wMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQGtY1Wb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+VQoW4K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQoVl2926737
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DOgMsJh7yHgEVaismwLoID83
	bitySPIblPH+7pbri8A=; b=PQGtY1Wb+P0FVaPxyXoIobV9WdsgAYmPyiyCL949
	wKchojF5wjuTRnUHDFYRD/X7k7nMykgF9KCpRIUHnIPuIbl3TWPnBdp1Ca3imSpE
	W5wswq7ZoppUT1xmLB2KxhnPbIMFwn0gr/9PwjEroGIll8CtZmkaVUigyYiPmVbx
	kPt5tsAUP9hoGGtu/hlpmEUTMZGHlBLpYNWEnSXpG9oFS5NAUI2mML6MjT4Obusc
	wUqEW5q+l90190OUOR88j0Yb0/3XkzbJOuW5ejwVfioyoHoRRL+ADkJhuPRLah0o
	suBK6FqErepWiKCStCi56D4iF0LnV3gRtFZM0QggLjJLPw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq291aqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:04:05 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-63e0c5c5faeso8303618d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763489044; x=1764093844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DOgMsJh7yHgEVaismwLoID83bitySPIblPH+7pbri8A=;
        b=X+VQoW4KRdXANK0Gp2QtlGZGHKzj8RDO+KB5tmWvT+q89z5lYNNQnizajtQNcD1FoC
         Ofd2d4QL4QTyJB1DnZN42VuWEnHxP5u4GId+w9vJwBcOAX+rO/U+lGjHBU6wiesh6dyo
         CK4YYWAo2l2ctnyNHT2zJlQmVRI08zLNm3Qtsf1veOCowcXIyfFO2t40LK2Rc0CQYH8W
         WwdkY03L2Hr3dH9VSScX2d2d00HCqXnpClkajFunSJNyarrZfS1PyBMQ/IjKGNUNrVUW
         jpwbiRBD/WrM6pGFjnX4Xh7sNJoxahkCIasNwoGjojciYD/lL3SKWaS4rrz442T/kzC8
         BIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489044; x=1764093844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOgMsJh7yHgEVaismwLoID83bitySPIblPH+7pbri8A=;
        b=FhEkd9mMOVCihtU2suAP0ixWedIBwG+JbeSHTvmVp6Haa5a6kCMJXA0aC+aHdlB74B
         /VQEipAODBAAsNS0G7m3+X90Dz34+XKCe8m7xWuEM9lKl1zQuf7rK86d0gJuAYHlSjJj
         K1JILLHUhHplgvkA5AOl66m1Uccyoggd28RP7HcXBpraEyaKEfwwGZ5jSIMIxPbPioA1
         QEXmWFFkFBMp7VAzn2nGPEAPxsehxFUEd/QSQshroxznc7PYL8Ndzns4Rl32GYnkEGXj
         nxpdZDtnOc+dV7qRQnIynJwkGtzz5X+EbSR9WWMWtTFoi30lhC3MXzCrR5+TkeL6VED8
         yIag==
X-Forwarded-Encrypted: i=1; AJvYcCWQ55MGqnCJIrJ2eevGztS4520lfBut/YkGC0DG/8+8roTCIZta0aJnhuE2u37FqljhnJgo5YvG0MSxXi4z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2SiHOCCtBTUcibT4Aprfd7Y//1db6xj2Taq9LyLNcOkGMpP8
	KrjyYJN7ZxDvy4O4sAbtNB+5KfIGQPI7U0bZ0RACr+EIbYRVDzogIQd/LbtMaOow/c6lOoMWHtk
	2fWSgY6a8vLTDp3N5NUOEOrXk/wJfeviHFo786z0l06HrPDS2dHeTJZN0EN0+eyBaZWYqN2kZHa
	nX
X-Gm-Gg: ASbGncv64ElsgSHOkl8Tgd1RbXD4DWERQPOBXu7njcFN3pNmfeQLHySJa0asYHo4WZK
	MvqSTJ48fFp6K9Nhnd+IJHVAXvV8lQMbKIooIbtaN8M74ceSQlEK7Ej0+oyJKq0XuKE4yJv5o+X
	0qlgtsnsLLxf5v22rMpAUvyaHmFxjo2Kj5M38837VQsCg2bBuUMVJsG74qsnDthKd2f+PF1Hccg
	faMeJV1UuoH0oEjaXEwv+f8fDsoDinkfbm0ZRglI09Xijm3W9ydxrtbqGWWNOpxb/MRos08Kffp
	Is+PA8WxlaX/i49RxivfEdKu2GtQHAXAzHLRupYFQlhx998Ut3wJE+k2q1MUhMdqGJqbt2BNSSG
	uu6hNTNxn2+PbXXJTp7/N7BQulVCEig7ltYlPLYzEICQSkepNNvDmlT6TDLpCel2A/vJAiUpZvR
	AGrZBI78phPN32nWD2CFQJGDg=
X-Received: by 2002:a05:690e:d8a:b0:629:acb6:d8a with SMTP id 956f58d0204a3-641e7562fd0mr13908333d50.26.1763489044219;
        Tue, 18 Nov 2025 10:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJDCFxdIFQSE4sT2yUN8Na+Q7D5n9DbKi4ZwR4v2kZ0CHmdW00x3h9MQOY0N0AD3dsBBTO5Q==
X-Received: by 2002:a05:690e:d8a:b0:629:acb6:d8a with SMTP id 956f58d0204a3-641e7562fd0mr13908289d50.26.1763489043667;
        Tue, 18 Nov 2025 10:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5959d9c52e0sm62169e87.11.2025.11.18.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:04:01 -0800 (PST)
Date: Tue, 18 Nov 2025 20:03:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on
 sa8775p platform
Message-ID: <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
References: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691cb515 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mjdW_OwqRCTym2VxSEUA:9 a=CjuIK1q_8ugA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: mZRq6yvlPnwp0LAf1yIZje5iT-W61da1
X-Proofpoint-GUID: mZRq6yvlPnwp0LAf1yIZje5iT-W61da1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX23PhIaVDHQKD
 HB/HUEmbaGegUKw3U//XzB97KD3HE21IXromyTrd0L4VM8zXMZHG2Bv8+FH4jKkaG0r3X/aSzoQ
 fY/r9OCenUM8oJpxfLHxpZPTQZJZQeqB121CsDlPKfs+5NR0pcPQ8JGYTx8aU/2oPmrJaqSLsH9
 JEjVJ+i19ETcy46K/7RpWXUSZJGYKIhdEOYVv43U+dazglJ6I+pTSr9w5ji6MCHxutId8vEvwyw
 S3XnUifkVdzhNzGs9T9hYj93eGIN4WATEHPsZR7maHmzusv3ApNAyK9S0pNaCo8RaZUW5Em/Ylc
 LMCPP5pQFoH7ge8Q3KwwhmvZJod0LPKCi0qjC3UmYprYMffEsyHV4tQnBOSLUntwRhMGuolGocs
 1Yrwq+1WOpJZmztOc/gNAq7/1y7A6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180145

On Tue, Nov 18, 2025 at 10:48:22PM +0530, Charan Teja Kalla wrote:
> Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
> This is achieved by adding compatibility string for mdss in the actlr
> client of match table.
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> 
> Changed from V1:
>   1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
>   2) ACTLR table is updated per alphanumeric order -- konrad 
>   https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f645..0b400e22cb00 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,fastrpc",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sa8775p-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },

What's the difference from SC7280? Why don't we need to set CPRE?

>  	{ .compatible = "qcom,sc7280-mdss",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sc7280-venus",
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

