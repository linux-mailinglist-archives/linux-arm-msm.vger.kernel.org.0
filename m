Return-Path: <linux-arm-msm+bounces-88687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13CD17343
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3F693015178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E5B36E461;
	Tue, 13 Jan 2026 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JC0ApuKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfGGJf0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EA0374197
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291463; cv=none; b=IgTzoDqc+wrgheFQ8cqxb5iH8HAaoNADdhB+33jtGR4UqwPyXi9W4nsD092l7JxhZs6nfJ3jdWRLcHqdidqFgXV4MtaRK4TO9r40C+OEW9bOh9HESEU9shw5Z6yCnKrnvBjNVhdxrEUEVFDe7po4oscMlymDYb448k8MjqH8cTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291463; c=relaxed/simple;
	bh=oZAKuLeRvKI+5fBlOz1mL1kAMbIjZvN2upOTGBhkTUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEQ2RZEqzRu9vnjPY79xpIfclUTmMAbXKQClYsr0VgXl/avHlke2JRntA/zynn213FsKJJfzwwKMs+fdatBS/u63bmBeQOAmQ0Z0pk9siC5hiEUh44G/hUvelkMrdj+msakbrsxUwW1WIjq9auWKQKm6z/zTf+fe3QmQJS44mGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JC0ApuKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfGGJf0L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7NMwb2513612
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PXnbde2QVYAvo1lc9F4COy4p
	jbix8X4rjsdQ1/Co9n8=; b=JC0ApuKg5PKcLR9ANox5pxo02Lbt8OPKzn2DsNh4
	9PW4eEjA7zLln0PyUjryvw9tiqzVcstUQP4Az8abRtu5DiNSEyzqec3FBPi+024E
	1cv+WZnvrSdLssKk3OZhTrhuFsNvPG5rQtkEHiptyGUYiLKDPtPqQU+8bTTvZepy
	qEDcTs9VCKge1erBzBYuY3vvVhL+ku+PCBClc/79v3QPjy+dyn5FxRXOz+Gsa1Ep
	cJLujQs6UeEnJco2mzUJ8JxbiKJck2ZsxYZ0rlYptBLKPC/x1Yes5PcQ69smhLbh
	8NY642exsplvNxGqx044kurYgrvtsg6BLzA2Q51lee3vXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6y8swsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:04:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1450189eso54260335ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291452; x=1768896252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PXnbde2QVYAvo1lc9F4COy4pjbix8X4rjsdQ1/Co9n8=;
        b=XfGGJf0LTrQisOVISShlLHGocF/AjQE6Q9JaeZlSfmbDpR1opSTKWMGGTYsiIu7swR
         qsiuPPCBwqPsy4Pcwf+emsn9qwVzHUB3F9qzPTiDOxe9MRTHqz3ue6khJE73c49u0akD
         lXHBSx3v2F1659yKUed+9OSdJD8oxmaBNXIdu69rCvasv9s4VOR076RPoTPnsHgdf8jl
         jxzd3J2yS6COzEjnj+yn54/Q4Z63lI01MTSdgTUgAGvk9hqzCn2BHT+U4sbqhuAfX4G2
         24Fq8m0VouppBQbsviOxevhDT6GhPARUdd66bjROklt3VOkDSPltpEvVg0TYiK1as/Iv
         7CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291452; x=1768896252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXnbde2QVYAvo1lc9F4COy4pjbix8X4rjsdQ1/Co9n8=;
        b=figpFSAre7XxXH4hfIJt5dlPxSYonj7+2soVNG2m+hff00ixwOoB8IvbcDQtOx8HNR
         KQe9WrzgdkBbl1s3msL/LXWxJQYpekpXV3z0ZK7/Wv+bQ4WeWOzpMay1rMPqVroMw9FN
         quex/TXhEGrVe+VdnqfWucS2Bj6EhSFQA30dkfO2AZrlSkWio6+6zRUEi+Q/d/1ZDX0S
         vHL03JH6UZXQMe0fF16XDrg7BOJ8qePP5xUzO4zyVQcR/hPy4MyH/TaFCuEkqaos7n2B
         +YtJ7pK6iE9T8oS6EpFVRe0VNccCz6U74qUkCltLQXYbxT51eNIlhbr+WR0Z5qZqeYGk
         Kqfg==
X-Forwarded-Encrypted: i=1; AJvYcCWmvZWtpQlDJARHDDG8+7CcpHxBclYbZiNncyasjltEHUGdRKlD0k35YPncloeO3nHWW1Dn2Pbn+I7L1fZz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0cdfx4q58u+GUoMnocZS3ImmkEZ6M+25BO2RF7IAV55v/gx14
	Vk1jbZ57PQ8l7jXnunF5ZQbY5EeM3xJAnOieJQMkbw/S4vIu1T3oJxB3lxDyPTT6WGOVxH+F6Oa
	Xs+21L8TCMIZ/eyGiaCnnjmXrOkBS0ysiA2Nim4VLGfuKXmxpg3xVeX0JfOa6/Iznh3yj
X-Gm-Gg: AY/fxX7Fy5Ls4AhGuwj+lKzMPVJgG5njFvqEqy4MBEVbrLJuBjTGqTuRvVx2HZ2Hw93
	bugo5YS/aratgtiGHAyPcd7PowtoULELLWaXBiVgOpgCaREhjaENCeziAjkWSXPdtiay3xi68HS
	vJYFZ0tB/RrNFNsE/2IWM18Gic607JjL4POyHRwnX21FLXFyfxH6pXyr9HeoRClF3uJ8y285t3n
	HCqK1fmiRh+rzXHrzTA5H3FOzb/2ZTeicrQBYVCN23BTFghAeaglDbqCZXPoKuG5/yIK8U3zM38
	/2pIxBBTkEGlIg6S+sKDIeHr85lBXvGj7wBxnpiHLwXe7NB35+Q1CIcfSbf+922bGQzq2Ly+Dee
	uNekKCBDGhSl5wT+/6RzPAAcE59pa1lz6j336
X-Received: by 2002:a17:903:17c5:b0:299:bda7:ae45 with SMTP id d9443c01a7336-2a58b53655emr16927785ad.25.1768291451940;
        Tue, 13 Jan 2026 00:04:11 -0800 (PST)
X-Received: by 2002:a17:903:17c5:b0:299:bda7:ae45 with SMTP id d9443c01a7336-2a58b53655emr16927285ad.25.1768291451333;
        Tue, 13 Jan 2026 00:04:11 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2954sm28707715ad.86.2026.01.13.00.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:04:10 -0800 (PST)
Date: Tue, 13 Jan 2026 13:34:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <20260113080405.jr7ky4ypnewojiij@hu-mojha-hyd.qualcomm.com>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
X-Proofpoint-GUID: 41dMt6ZgEpQH8ixaA0DEaKVcVWz0Fhay
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6965fc7c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=p9y6D01phdXxCRIveNUA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 41dMt6ZgEpQH8ixaA0DEaKVcVWz0Fhay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX0eBdemfL3U8w
 k0Q2F79hUFsRvbEAh2wpWAhsBJBzyJ1Iu8ni/yuFQrES0f5HqCd3IViz3IiGxGpmfd5yQD65Uun
 3PFs5iDoARkwOXGnCEazr8Pj6Y/Ew2kO2QM8Z1j8BMsCfrf597XHC+mxZUbpZhGRr0sexnv7iRZ
 RgOF2hhmOpOlekuLbPFcDwoTXMDq+BRYeYHDZugCwfE7U7UsLQJuFHcUAg5U0Dxe7wXkiyPvE7b
 ALjshQRrdA1twiVXV4B7FNITY0t6MKFFNrwPIE+moRxQuAZXtetoMVTNj4+FM7x9FbeCFR+/wNQ
 8Q7g3Q5KVkOa+bbAnI+bDjj8EJtvr38raG4rpzledCSiES6rY1ls43VcoEGkK0TJSjvzbaO7Vvn
 sY0Fuwh1OEFU+jVtH7RmCo93LVeX4m5OnW3bgGAbBY+3xLnPSKncaM8HfnBwEF6lXGX7NKaRQDf
 oYoa0ZX5xvNfzXiYFvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130066

On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.
> 
> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> prefer SMCCC over a vendor driver can explicitly enable it.
> 
> This avoids unexpected format changes and keeps the generic SoC sysfs
> stable on systems that rely on vendor-specific identification.
> 
> [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>

Fixes tag ??

> ---
>  drivers/firmware/smccc/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..f830d11ebdca 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
>  config ARM_SMCCC_SOC_ID
>  	bool "SoC bus device for the ARM SMCCC SOC_ID"
>  	depends on HAVE_ARM_SMCCC_DISCOVERY
> -	default y
> +	default n
>  	select SOC_BUS
>  	help
>  	  Include support for the SoC bus on the ARM SMCCC firmware based
>  	  platforms providing some sysfs information about the SoC variant.
> +	  Note: Several vendor platforms provide their own SoC information
> +	  drivers under drivers/soc/*. To avoid conflicting sysfs attribute
> +	  formats in /sys/devices/socX/*, this driver defaults to disabled.
> 
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f
> 
> Best regards,
> -- 
> Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha

