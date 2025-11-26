Return-Path: <linux-arm-msm+bounces-83354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D32C87C04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE77E3A616C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA83306D58;
	Wed, 26 Nov 2025 01:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuZvMsBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oo2UOfFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A281A9B58
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764121899; cv=none; b=hbVZahAecZRfEM5vYug5OT2tZ0o3Xurhs/Me2NCxpOsTHfxIM6eDXt9fQp3gKOM/fnfPiIzdMUQHSdGquTr5MgGHHbeNb+L78Bmlc3doapE5rXTw/jcinW7nzSNU1xBAVs7SGXaDN30UOJ/nF/3rBCV9o9u2M89QcjWqz7ST8sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764121899; c=relaxed/simple;
	bh=Ta7zSAMa/dl8EzhPD1HdouMqho+ZR4XotmIXTbraDcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Km8KV3LQz8z3YivC8CEZU063zYB81Dsp8vl+8HR5arKi4daFZtws4vUd6NuoWrTDFNnQlr/C15zYJFo0BoeYv2ZR4RTInsMAQJ2j9Rnx3ODrpdmCPx43e/X4TaY643Z403C+1+x0nisYz3UDot7wxS/iHM6SWp1Lbvqk1T50M/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuZvMsBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oo2UOfFy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APH3Fms3738984
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L7i31meeSU9nTcwAbcrWqzAM
	NAAO5fXiHJNoyvPBSbA=; b=OuZvMsBaXcg8GaDj4MjoNPKg/4JJ5BnOEvHO+ufk
	iOO3zbjC2pQZv6HZYj1RCMgBWYWZM3viHu503S/M3afT+SSG3RK6U3xLXQTb8cbg
	Rq/A077E5YUZqWbg7NcLBXy3Y4pk4cmvjjlMhV66s1UdHcVvoOuJwFDdGOO/md6S
	J8GSr51/PPy/KXO3CdrRUiFheARE0cmXN3YJaWnXavc372gL3yDDwFy3QZD9d2bI
	lz7ZdWPJEALYbO5XVAmRMD+uke8T19HDaQRWBCbrWDBCndNKzKFbY3uECeENyI0g
	FaHwynFe0tFAHQ0Gtb6GmbNsFj1SLYYCFqcaJ2aBOknFsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyh5qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:51:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e19c8558so1407923985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764121896; x=1764726696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7i31meeSU9nTcwAbcrWqzAMNAAO5fXiHJNoyvPBSbA=;
        b=Oo2UOfFygEPlHY19bQrc/qZQx77IRjF6/iTEWAtlCXAw5Mjv278iMQzNZrrQUSCZUe
         ue4zehZjUOAPpGxatiKJzykdbRDguq9hK5imsQuCHqV/3qhXupscykF8B0afSHndsOu8
         UxOpMx42bye7KsxN4sXVoq3NfJEvJmk+6jtalujlxumyK7EFbI2AYQ6qCLib40M0HJwn
         usUOcVWlS/unxm52Y3/BQcd6MZ/CCmvBZmVtKXDNfOWUvXCmrJKhJTG75HOk8tZO4E4f
         Eztvroo+KwDuNxDUoroEZtUODPKIqTg4osjw5fvPokaCbMpAfrdbYXsC9pwXplUT2fkW
         XLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764121896; x=1764726696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7i31meeSU9nTcwAbcrWqzAMNAAO5fXiHJNoyvPBSbA=;
        b=IccUnAvWu11cPDb7FizHfEnnxXbtdh580eSmfnp6feDZ7umUM/vwRc+CMze+eCO4Ok
         FJOcZp4LK7ZGgNplyRxeEl7eMSzNVjKcnOe2B7zO5Ef0ensqipzhnWtjqJsCk6SWm/Pa
         KRHuRPMfSw3UzB17eaSZDz0lJn40F1e2hcXfcL/QxsjdEuVrsdjgfi6dX/r5+7pJDxOz
         7h7VB4zz2QyKt5gNAGR/wEhh5gKbK+8DN5I7XK6RZYp/TIx2fufgfYHybVpa5uXJaDT8
         64MFxHsnhVjT7Z3f9QBo5sPjtYyIUEeJGPlScdI1Kv9dkEvxDOhuPPQu5je16iDZQwo5
         YYVw==
X-Forwarded-Encrypted: i=1; AJvYcCWdXJwE/6YAFb7QUCWAr8uZDoH6e+ac0EiDpv6b3JJm/hYXAq7zMCGMqGYKhRHbFjYJyGeax14w02hBi6E3@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1pxhmrH0hLRJ+QUXlu5mFN4KhWmGdj3yL6s3B1uN60LuK8Qx
	H7i/JVGjnZ5Ayyau1jAm3TeQ0Zj2Nmr1uvAozq/yvhKmLWXrI2TkRE5nW0cdEvjuXMlXxhy2B79
	JuDpegNCvb/5qRITYaWxP6EMHF993AXvEVKN3HYTrmtpBzGrjYVlc6i4OI9pVJ+E+0qwo
X-Gm-Gg: ASbGncvTGX51bQ/SnXVtdU5U+rw7RI/Z3zPEB66+DMda536ydejLm2NSK0A2HEaPXmD
	a6pmVSc2TVhfnklDxzIkWDAdX45C/M3dYSGjDGesLSC+XW5wNYmQ7XnU2c6LZDGzeLIji5lwdWm
	SSsWvfvsQWMr3+UrZUKr1aNhxzp97guvVf2VhErPpLw/ISlZFeJ/UoN+U0vQI8YqjLeKlO5E1B4
	8UtvOs+8BSk4ZdxPWoz6LpjZOoxKycw2o5mBuUjxBIRrZkkbYVa30JYXbCa8023PSSVX72kkzBq
	d4UVauZUbk8iq24V/CbCsl4+q+umPt/LN3hZsDj8XQMjgQfttHfJYikZMKdfUrPBuo9jT50/nSD
	kPN5VPVxzgT8v5i8owbGGVXprPLDYYkUJ94crmG7eFVZNs59dWur1lXsUIPz+tTeDOu60DJfj1l
	VWld59+pA4tgxD8ZQqxh3Hg7w=
X-Received: by 2002:a05:620a:4415:b0:8b2:ddeb:99c with SMTP id af79cd13be357-8b33d469d4fmr2401588685a.63.1764121895567;
        Tue, 25 Nov 2025 17:51:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBiysWZ2d8lUT2YSXb0WOudkrGcNWv5wfEnUYYkztgCXli6WXKinB964WNQbdbINNXXNoV0A==
X-Received: by 2002:a05:620a:4415:b0:8b2:ddeb:99c with SMTP id af79cd13be357-8b33d469d4fmr2401587185a.63.1764121895056;
        Tue, 25 Nov 2025 17:51:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db747bcsm5609868e87.11.2025.11.25.17.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:51:34 -0800 (PST)
Date: Wed, 26 Nov 2025 03:51:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
Message-ID: <6zyysrrq6mt447s6rg5sk5vy5w7ulzub4u5m24xw3xo7edguwu@73vtynhdp7nx>
References: <20251124171030.323989-1-charan.kalla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124171030.323989-1-charan.kalla@oss.qualcomm.com>
X-Proofpoint-GUID: DozNhMxnnAL_0et2nUeo9G-7LWraqnip
X-Proofpoint-ORIG-GUID: DozNhMxnnAL_0et2nUeo9G-7LWraqnip
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=69265d28 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1k3nfMqBUa8zcchP1JgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAxMyBTYWx0ZWRfX+toGNIO34WHf
 SJBlgY6QFe+EL2fDBUcv7v3I24IHZktWdHuLZuYILrhIYcstOAa+23wOKx71jcsyxSupUF6pBC+
 xExeC4Z+5DEhVLWVhxN0j0CiCG1OvhgzAEUpWJrKJEh7kYy/KJRmeyyRgLdMswgpDt5T+FPmF81
 tac6Cr6zH5m69JM4AU3W7x9YEu3Rqs0NjRDysHrvaseoVp99tlkfAauk+Mtc5+563celNDHh3bW
 bIpmoDc0QxqS48QiLb0RPIrOXYhEfo54qXomYa/eZropxL8jqzRKrLqKEOX6asGXSq/sM7zn+ut
 M6rBIhQui0nnCYHKA+9qPlYZmhAyuBPby7dnLq6QMlHLlY9c/uDfahpIDDf0xGp8BKWeESlOR4T
 BmJfqD72tEd4AXoahym7t4Gxs/HOAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260013

On Mon, Nov 24, 2025 at 10:40:30PM +0530, Charan Teja Kalla wrote:
> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> Changes from V2:
>  1) Add actlr settings for all the mdss devices on Qualcomm platforms.
>  2) Improved the commit message that explain why different ACTLR
>     settings
> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
> 
> Changes from V1:
>   1) Added actlr setting only for MDSS and dropped for fastrpc. --
> konrad
>   2) ACTLR table is updated per alphanumeric order -- konrad 
>   https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> 
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c21a401c71eb..ead1a59d40ae 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,12 +41,34 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,fastrpc",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,qcm2290-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sc7280-mdss",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sc7280-venus",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc8180x-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },

sc8280xp? sm6115?  sdm845? sdm660, msm8998?

> +	{ .compatible = "qcom,sm6125-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6350-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8150-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8250-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8350-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8450-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ .compatible = "qcom,sm8550-mdss",
>  			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8650-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8750-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,x1e80100-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ }
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

