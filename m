Return-Path: <linux-arm-msm+bounces-30486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1590D9696B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFD67282CB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A922A201276;
	Tue,  3 Sep 2024 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTDgsK2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EC11D6DC7
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351397; cv=none; b=Hl3SI3bq6/+reS8K3jeZS6HXFXmK55cFDyRBE8TlE4u7w1bOSQdApQO1QRzHag+LAeIyuzXJ7WFxXTXpHX1pZtQgbEO8VWekg9vgiRTUjwK6VZvZc1Ls+ZLsFPH3mKrXXK5aMMhWU6M2eMf6QHaY6DO3XWc5IA22HHO1wJhBbQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351397; c=relaxed/simple;
	bh=qWD6oDmFhlFtQ26RoWil/u2Xd529kAvKgP/VU8DME+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQx548k9EZ5IpQdAukK4TxCesfaFJWy1lb6P21aO8dqyg+TcazdcGk0kwp2FjQbMci/pFYSn1Yd6qMNyQF2PiXueMxxuQqEwz5auSmdnkAWf2f5eTAiMr483HrgYm+qGT/9YXZ3zclK+ww9ivy/9NwzpA4i8hVxC1Ih8gsCjKpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTDgsK2d; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7176212de5cso963237b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725351395; x=1725956195; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+fJrQ0rSs/8UnGUidxILu8gjShkL29ZW5cKN+M+hzbY=;
        b=bTDgsK2dD6zILapCWerUhi3AG8H0J77nPxP0cS6bYbylvL2O/PGSUjTl1wV3NWsEso
         95ItRNlQfajjInWZ5UzZel77mvUUGcVI5P2E3sP7fVeNm8tP2LH/tLHq5DW4SAtZbpQo
         Vfnbolgti7zWyQ5boKI4n+gaYcfW5HcTC+0ArvbPK0WleAHq0wbi5LT7XbFdpKvJrw1u
         6xVP1O47DFIa+irGdVyzw+e68nYlgf+zi18Oe8fH+hdHUGdDD05XUzQx1A+llD7dFgPC
         7Ui6g4c2RZjZse+EdcUhJt3jWTWKJ6RAHShAJQMwySv0hhGdC5u+RFNe94lhcQ2T96Iu
         tv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725351395; x=1725956195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fJrQ0rSs/8UnGUidxILu8gjShkL29ZW5cKN+M+hzbY=;
        b=gXGcAoEaEmx0gJTCzFxGyw094wg9yw6BV547va4gjk+pzHwR7CLAngffmHisilu4hm
         TbFjyN31uJNcOUjCWc3T2+q70Y5yrdxW4Om+DlJ5rhoZYcEh1BbFxaAjqj3AZoS2Z4Ky
         DSLAnCQSg0RyS5C2ntghD94bWAS2w+IQ26XVBrjP5fFX+Vdfe3vJFySEIW0vE18bMlJL
         Lyn+A6nbyaemO/blTdbkyRGpWG4vF5ImNeQeaJuKUgr7DEUtQtaDx4MgkBC3bCN9U3wo
         48WoJvcfRkGhnIaOKeesIJW3GoEkQhZ1LHBITONBQXsCoVvM64fkLQlusk8+oyIPL6sI
         ub1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUrMVzPLB7cv3ykGKX6K/Hi5Jlts4svfFXvhkdjDYQ2uM8EYtI3vttZ9Pm51A/NGqMlVmVFl78VRFA58vF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3W/axKwcAIa18D8CJeXthQkhd5+Ys/FtrIFos3dcne3bRvbHY
	n2XC2ATucKPLVKTjca3Uhl57mHobCG1n6ewXCNngIv4s1ioVgsSKA4Pae+bcEA==
X-Google-Smtp-Source: AGHT+IEzx2sb61Iw+yKJhSuGvUoiIKIG0B4pIn/MVeglfMXiafwv7HEXXVcBM0YZkQn9Iask8viUjw==
X-Received: by 2002:a05:6a00:14d1:b0:70d:1b48:e362 with SMTP id d2e1a72fcca58-7173c5c3abemr9762123b3a.26.1725351395259;
        Tue, 03 Sep 2024 01:16:35 -0700 (PDT)
Received: from thinkpad ([120.60.129.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569e220sm7999432b3a.132.2024.09.03.01.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 01:16:34 -0700 (PDT)
Date: Tue, 3 Sep 2024 13:46:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: bp@alien8.de, tony.luck@intel.com, mchehab@kernel.org, rric@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	quic_sibis@quicinc.com, abel.vesa@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/qcom: Make irq configuration optional
Message-ID: <20240903081619.5our5kkz5umszdio@thinkpad>
References: <20240903060138.3191160-1-quic_rjendra@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903060138.3191160-1-quic_rjendra@quicinc.com>

On Tue, Sep 03, 2024 at 11:31:38AM +0530, Rajendra Nayak wrote:
> On most modern qualcomm SoCs, the configuration necessary to enable the
> Tag/Data RAM realted irqs being propagated to the SoC irq controller is
> already done in firmware (in DSF or 'DDR System Firmware')
> 
> On some like the x1e80100, these registers aren't even accesible to the
> kernel causing a crash when edac device is probed.
> 
> Hence, make the irq configuration optional in the driver and mark x1e80100
> as the SoC on which this should be avoided.
> 
> Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/edac/qcom_edac.c           | 8 +++++---
>  drivers/soc/qcom/llcc-qcom.c       | 3 +++
>  include/linux/soc/qcom/llcc-qcom.h | 2 ++
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> index d3cd4cc54ace..96611ca09ac5 100644
> --- a/drivers/edac/qcom_edac.c
> +++ b/drivers/edac/qcom_edac.c
> @@ -342,9 +342,11 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>  	int ecc_irq;
>  	int rc;
>  
> -	rc = qcom_llcc_core_setup(llcc_driv_data, llcc_driv_data->bcast_regmap);
> -	if (rc)
> -		return rc;
> +	if (!llcc_driv_data->ecc_irq_configured) {
> +		rc = qcom_llcc_core_setup(llcc_driv_data, llcc_driv_data->bcast_regmap);
> +		if (rc)
> +			return rc;
> +	}
>  
>  	/* Allocate edac control info */
>  	edev_ctl = edac_device_alloc_ctl_info(0, "qcom-llcc", 1, "bank",
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 8fa4ffd3a9b5..b1c0ae9991d6 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -139,6 +139,7 @@ struct qcom_llcc_config {
>  	int size;
>  	bool need_llcc_cfg;
>  	bool no_edac;
> +	bool irq_configured;
>  };
>  
>  struct qcom_sct_config {
> @@ -718,6 +719,7 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
>  		.need_llcc_cfg	= true,
>  		.reg_offset	= llcc_v2_1_reg_offset,
>  		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> +		.irq_configured = true,
>  	},
>  };
>  
> @@ -1345,6 +1347,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  	drv_data->cfg = llcc_cfg;
>  	drv_data->cfg_size = sz;
>  	drv_data->edac_reg_offset = cfg->edac_reg_offset;
> +	drv_data->ecc_irq_configured = cfg->irq_configured;
>  	mutex_init(&drv_data->lock);
>  	platform_set_drvdata(pdev, drv_data);
>  
> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> index 9e9f528b1370..acad1f4cf854 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -125,6 +125,7 @@ struct llcc_edac_reg_offset {
>   * @num_banks: Number of llcc banks
>   * @bitmap: Bit map to track the active slice ids
>   * @ecc_irq: interrupt for llcc cache error detection and reporting
> + * @ecc_irq_configured: 'True' if firmware has already configured the irq propagation
>   * @version: Indicates the LLCC version
>   */
>  struct llcc_drv_data {
> @@ -139,6 +140,7 @@ struct llcc_drv_data {
>  	u32 num_banks;
>  	unsigned long *bitmap;
>  	int ecc_irq;
> +	bool ecc_irq_configured;
>  	u32 version;
>  };
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

