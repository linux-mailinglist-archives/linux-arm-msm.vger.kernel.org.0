Return-Path: <linux-arm-msm+bounces-83163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB36C8381B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3A35F34C896
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28463299923;
	Tue, 25 Nov 2025 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2LAAdXj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OELXKoqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A075298987
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052732; cv=none; b=rSt4TuPluGKa6wZAYUjfqUGBEswkqAmQwav6FW1eeC4DbGK3o7CY05brJEeFwQZbelDxYeXbawNjfBWkZonbmU/raqmERd56M59hEU4MRtMyqdP9Sy6T4jEj3FMLfz4YPsd2SGYW83PurV8VBCwmrwJvbNOqZQE5uuH3j786LuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052732; c=relaxed/simple;
	bh=I3CKx5wt8HmNLb3WFfEF754rgZIy1PsLsWtu+48c8zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+X6NgsUrPkDRDMz1fLKGFRsWFH/wcb2y2sJdL+lkVeAUkTvn9npS1Yy+YUIXD4WvRq50fqV2S84df7S2TRCA5ft5D8B2ouEBaKCfS9buQCsQGxZqX+ShF62AKK3LR7U//1O5ryQKrXCyKy5UqzqGkld0LnTlwZeeyd4sJtP/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2LAAdXj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OELXKoqU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gqDD1699873
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8uixkdHz2W1OxAeTB8kIWarN
	mV6OuPh2tjNQ9I3Rfaw=; b=M2LAAdXjA9J/2UQPl+M/vs/YCxsmtIMSJbDeA/GI
	3TO5arObXNaIavAgkou2PEmNSPJ/Ds/+gF+DQsSXGy/Yj08TXIHC5/xms7QGATiG
	rnJhqUSUm4BHdQPj1rDoNh2vm765GQVcwCaopIwRuiYRq3dOq0lRd65p3y01Msi0
	MfGbgp/eKP7hxG6XiXoun+9ntRwoDPjrEgaVk0H6f7LOy634T9itY4bvd//GGqTX
	1qgAmbdD4cPmjCh+7arjKWHXJQ8+gKYSBnFzWhXLnn+dbsoQV1hjqsmJ/fYyeRlO
	EaL9EhLqndecsdz/DYyMSTTBWWW6aPgmalHxq+7j/NUS2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp56b0b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:38:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956a694b47so76856965ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764052729; x=1764657529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8uixkdHz2W1OxAeTB8kIWarNmV6OuPh2tjNQ9I3Rfaw=;
        b=OELXKoqUO+xy/os5UOLreSWKoUvuQc5MdHbB82qj+Zh5Q4/QMAS2iWDI0TBpC9jagP
         /cvU8HbLRYUHsXALUnSXQLYT6Qk+SxMCAVkiMZyvo7fFBr3oRMz0KEZ8nX04Ql89Q8uY
         3t2swgLrf/vWiJLxSOl0BnD7mj4IzHFU1zhKfU1PJK0j6BGW5A74GODhFdbK7FsxAhHG
         HHttOrA78h5219i+C2g9lmPU3Z6kJfVt/7KR1ES4PD5HrO0/MmSM1kzw2j4ftzdPZBMU
         u8zN+3xkPJJx0yGS0zBRjnQD0WDWlxa8M4OwS4kURv3mWXT8SL+4MM97mxoA02sQJBaN
         maEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052729; x=1764657529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uixkdHz2W1OxAeTB8kIWarNmV6OuPh2tjNQ9I3Rfaw=;
        b=Dtb/81pOlmrDTfEyar58rme4xONWBiSEd4jjG3o+PcDKAVtTBvSxQDkzxwq2ifzRdV
         vw/cmLxYVNht/TGNea/UgM/MjQQtDZJShg3YZ70r8WbOk5e4M3uBDzvID2AErruNJZjO
         PLUov4gPfMPZwnyG6dxBM22UUjVSeT5NBvrhnR+DqLyBRHZJMwUhfj0IrYrYsR+g4972
         FIFNudOqQQHNw2MS72I/80pMm0IwCuF3WwyaCmi0Fe/dZ/OK7ghl57JQA4fRe1QovLOQ
         SMoFE7n3CcK0uZb4JzxrAzm/7q/ifpbtjWWg1xij070/Akhpo5b4h9Yc4Mz7TTH4D+bQ
         BK/w==
X-Forwarded-Encrypted: i=1; AJvYcCWlce5jwVf8jSy+2AuStvPw/tnAVgmh6uMIiIHunggOBeZZlk5aRu9DqUYVuTQ+/RGSs+cAUOrx26d9ndTk@vger.kernel.org
X-Gm-Message-State: AOJu0YwvNRzYXNJhUkpHxU8866u2Vh3QL68LqCclabYJi+lz1qu0KDE8
	N39mWyj4fyeadpTxmvw6bWoTyoA72FeFQRTtUhY1ye4mRc43X/DhiJtc7YKFrXxAt7UOy3dSqdN
	Ul/y2fL8P3tzycv0Nt5O3GQ6N15QQh9CZi5B5oIXOVhhmaPW98Zh3CUmnewtrXMT7ndpL
X-Gm-Gg: ASbGnctJBSPDnaAQ4lZjU4mnM5lz3B0pqKHvJa3rm1r8w/bSbZ12HCBbrHgz2VbdDYV
	Ce0Pwv8ITNB4qyn+Sr26J7tFU3bHn1hyvKEz5K3kG5aXQoCQsg5DgTeS4tN5k93084RfO+iXmbC
	5P34uYEVBeAEvoNeVgwQvd6svD4+oHUMy18OnT/WYqjjta7ZPko1MxgLJNSn1cn+8ps74inj6dB
	cMhPBfFCgnXDX9ahz/pHaW7A4iqT0ayV8siR2TrPdNcFYPr1923f/NIXMT5cdvxql5b/ZxYORxX
	U+TStAXkeH+9RJ7ne2lGDg0XgCAExkQdCv21QvH/jc9DPQcjDXqdSc6rXPqJ8McWpj29dUrcl8t
	s27RxLUghuPKRWDtJQUvQprozx+tI4tiwmgBl
X-Received: by 2002:a17:903:234e:b0:27d:69cc:9a6 with SMTP id d9443c01a7336-29bab1e4df8mr16980745ad.53.1764052728739;
        Mon, 24 Nov 2025 22:38:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvedjTqlit6FZiIdCeP4MMNXApNYOo61bMYOnJnY5mU3IIP8XgBo78XBuznSpUOy5HerHBFw==
X-Received: by 2002:a17:903:234e:b0:27d:69cc:9a6 with SMTP id d9443c01a7336-29bab1e4df8mr16980495ad.53.1764052728079;
        Mon, 24 Nov 2025 22:38:48 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e56esm156249785ad.57.2025.11.24.22.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:38:47 -0800 (PST)
Date: Tue, 25 Nov 2025 12:08:42 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Message-ID: <20251125063842.v742i2rg7krcpd57@hu-mojha-hyd.qualcomm.com>
References: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
 <20251123-multi_waitq_scm-v9-1-0080fc259d4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123-multi_waitq_scm-v9-1-0080fc259d4d@oss.qualcomm.com>
X-Proofpoint-GUID: je4YnYvoiVUghVY2LmVuUen5uae8FeVl
X-Proofpoint-ORIG-GUID: je4YnYvoiVUghVY2LmVuUen5uae8FeVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1MyBTYWx0ZWRfX5U4ffwhtu/FY
 S3YtnterDWMZbK6H79TG0WozIrVSjreAvXVtJoX7yjKbJUY4/1pMUVjQ0hMRbVTZsWEkF+YUwwg
 4JinxAfe+yrCmIQoi+Y3rD43eNZSiINY9DdHOeVd7ztjN+ISiaaeKBNOhDBWBSQA9vrgsHQyNvk
 rXLcynxLXGg3BYL63EPwWIofTOEk4O6ITEl+z38r5PkX5z0MM3iOieG7cSw1iaJ4AFd35IZEAxn
 TcGLJqcyNI9FmyThDhQE2SoZ7B4Grn3Z1zDrqrs0V0Cuth9f0OYMk/pnJLSC/RP31zUUyLfUIl1
 GlrfgD/NaKMFj6JhU/fn1w68bRtEl+w4V9HKvJa7Y2kieG0ddXTJnHzqfwIBe72qZkkVrmHCBQK
 v7NhxyVUCl3phu4rAM6xi+/BCliYng==
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69254ef9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Y7djENUC0tI9L5OBGHEA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250053

On Sun, Nov 23, 2025 at 07:49:30PM +0530, Shivendra Pratap wrote:
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> 
> Bootloader and firmware for SM8650 and older chipsets expect node
> name as "qcom_scm", in order to patch the wait queue IRQ information.
> However, DeviceTree uses node name "scm" and this mismatch prevents
> firmware from correctly identifying waitqueue IRQ information. Waitqueue
> IRQ is used for signaling between secure and non-secure worlds.
> 
> To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
> hardware IRQ number to be used from firmware instead of relying on data
> provided by devicetree, thereby bypassing the DeviceTree node name
> mismatch.
> 
> This hardware IRQ number is converted to a Linux IRQ number using newly
> defined fill_irq_fwspec_params(). This Linux IRQ number is then supplied

nit: qcom_scm_fill_irq_fwspec_params() ?

> to the threaded_irq call.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 62 +++++++++++++++++++++++++++++++++++++++-
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b127944fe112f453cae9cbc40c06cae..28979f95e51fbee94b84c1570a4d88a76f72db4e 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -29,12 +29,18 @@
>  #include <linux/reset-controller.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>  #include "qcom_scm.h"
>  #include "qcom_tzmem.h"
>  
>  static u32 download_mode;
>  
> +#define GIC_SPI_BASE        32
> +#define GIC_MAX_SPI       1019  // SPIs in GICv3 spec range from 32..1019
> +#define GIC_ESPI_BASE     4096
> +#define GIC_MAX_ESPI      5119 // ESPIs in GICv3 spec range from 4096..5119
> +
>  struct qcom_scm {
>  	struct device *dev;
>  	struct clk *core_clk;
> @@ -2223,6 +2229,57 @@ bool qcom_scm_is_available(void)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_is_available);
>  
> +static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)

nit:  s/virq/hwirq ?

> +{
> +	if (virq >= GIC_SPI_BASE && virq <= GIC_MAX_SPI) {
> +		fwspec->param[0] = GIC_SPI;
> +		fwspec->param[1] = virq - GIC_SPI_BASE;
> +	} else if (virq >= GIC_ESPI_BASE && virq <= GIC_MAX_ESPI) {
> +		fwspec->param[0] = GIC_ESPI;
> +		fwspec->param[1] = virq - GIC_ESPI_BASE;
> +	} else {
> +		WARN(1, "Unexpected virq: %d\n", virq);
> +		return -ENXIO;
> +	}
> +	fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
> +	fwspec->param_count = 3;
> +
> +	return 0;
> +}
> +
> +static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
> +{
> +	int ret;
> +	u32 hwirq;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct qcom_scm_res res;
> +	struct irq_fwspec fwspec;
> +	struct device_node *parent_irq_node;

Since, this is newly introduce function.
please follow reverse xmas tree..

> +
> +	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	hwirq = res.result[1] & GENMASK(15, 0);
> +
> +	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
> +	if (ret)
> +		return ret;
> +	parent_irq_node = of_irq_find_parent(scm->dev->of_node);
> +	if (!parent_irq_node)
> +		return -ENODEV;
> +
> +	fwspec.fwnode = of_fwnode_handle(parent_irq_node);
> +
> +	ret = irq_create_fwspec_mapping(&fwspec);
> +
> +	return ret;

return irq_create_fwspec_mapping(&fwspec);

> +}
> +
>  static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
>  {
>  	/* FW currently only supports a single wq_ctx (zero).
> @@ -2396,7 +2453,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
>  				     "Failed to create the SCM memory pool\n");
>  
> -	irq = platform_get_irq_optional(pdev, 0);
> +	irq = qcom_scm_get_waitq_irq(scm);
> +	if (irq < 0)
> +		irq = platform_get_irq_optional(pdev, 0);
> +
>  	if (irq < 0) {
>  		if (irq != -ENXIO)
>  			return irq;
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c41021e5a067d52b7d5dcc49107ea..8b1e2ea18a59ac143907a381b73236148bace189 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -152,6 +152,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_SVC_WAITQ			0x24
>  #define QCOM_SCM_WAITQ_RESUME			0x02
>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
> +#define QCOM_SCM_WAITQ_GET_INFO		0x04
>  
>  #define QCOM_SCM_SVC_GPU			0x28
>  #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

