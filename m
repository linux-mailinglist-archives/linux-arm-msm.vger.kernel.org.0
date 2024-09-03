Return-Path: <linux-arm-msm+bounces-30509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E59C9699BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28431F21AF0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE041AD246;
	Tue,  3 Sep 2024 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMwAti1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C3317C9B3
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358092; cv=none; b=SYwQ1MO+Xg7mmfNpUlYNYR0VU2L1da+QUnTD/q6Lylgoth78WQ1OboPyAjaIWU3HCnTtW+Lsmr6Cf1IfYJ13CsOt2WdkEEorsRw3S+/a+IkDPzNL3ipTJr5xDTDdXfCyZkLWDFFcJYCTYtmyNx4FRGjv3hYX7eBN1IDdaK6jdIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358092; c=relaxed/simple;
	bh=6bTRYQZHTglWTJC7wyHP20pyge5C84o1/IGAmWaRwf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHnNKlqy/8r+vPRNUI3zaVjaYJQqCJHwmsomLxcsnfcoye0O3kL7PjbY+vecxRTITm3MUgtwtEWLFK5qPWohNtK3s6SbaPP6gc45oouvYTPOoWDEwjY2Laf3hn/WBwDsf1sMPh3vbk4FwGby6XEOZ7Uay3lW8rn2cYpHocK81O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMwAti1/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3f68dd44bso54193071fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725358089; x=1725962889; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0e+/bOJFRqb0nes1Q9jMToVP1YJTjUlu3i/U84Ta6UA=;
        b=jMwAti1/LOWzUL3x7sa8Uzvlk73tnuwpphcW0l6+fhlAQsajzZCbZsFKXLbwl0YRox
         5WJgljxViOHU7XnnGtj0JomxUXZCBr23hsBEZc6CmYLscfEGIOJSI+K9jDrT71A0Mqw9
         rQAHTNO6wKJaCcInKn1fH1QLjL1J5CJXaWgC+Cmr+usvDx9O7qRSB9u2EmOICDj3bBE4
         TkUviGfybJ6Ma1CF3cw08a1Ky2WUK7Q+ksfVHoGKQTbMbcrnt9/6iJiZJtSxioyMU6KR
         QIdkFaJB1wEQlJdaNrhSWrRh+9Zfr/csWhw/1P8o7O8MwGWK8VLjpCT+EXKOnDWrcFNx
         buhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725358089; x=1725962889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e+/bOJFRqb0nes1Q9jMToVP1YJTjUlu3i/U84Ta6UA=;
        b=dAJoK25ikX7v0rKPSS+Qj5MT9JPtcE9HFHVTWKtKRvwaihShVI67tHYsyBGMuBM1Tj
         S/EJ5Wow+znk2kTTvvpzQa/b6YBqFYgAg5pXTPLDggQNSeirfnZjIiWdqUw+1VtkdIG5
         jEGzAzT5kukwQk6PP6+I59G0tG6nwBa9K+F62Mg9q9T0czK3j7OwIZpoU2Q3Sf4aFvvr
         UTG/xFRedIGOuwOV1HvkGB6aIFwpXmxUdY8qOMo2Y8ZBhqRKjTWOqml+ta9N5XCTwq1d
         pCIX6aiNubpuVQ3aFzjkOalFyUXniWYAPaCDfthc+xstDcT51IJbs4A897VzvHBKkUSq
         jGNg==
X-Forwarded-Encrypted: i=1; AJvYcCXBDGmrfAJ4JRkF2giFjHfhYgr5GxHnqYNHjjurA2dfw0zgZqkDGM0jrYXHVMIqKDEo7eI0CTfaxGk2G3bj@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/8WPlFdk4W+9R5K+ghPYXmx258M7Ese16S3d/gI78ZONnRcu
	aiAdDbFN65SRpJFXHoQn/MI/3xjz9USFbDsaFbYxNit8yEXjIZLqDh76apuuANc=
X-Google-Smtp-Source: AGHT+IHURSxn8JuHtVJVvoiEiZTlTfhw8w8J8/Z7bW8FeSLPqZdVZHzr8ZEPh/23jMl+hcIYhPbHaA==
X-Received: by 2002:a05:651c:550:b0:2f5:11f6:1b24 with SMTP id 38308e7fff4ca-2f61e0562admr98342451fa.18.1725358088606;
        Tue, 03 Sep 2024 03:08:08 -0700 (PDT)
Received: from linaro.org ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24b5ad63dsm3808995a12.80.2024.09.03.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 03:08:08 -0700 (PDT)
Date: Tue, 3 Sep 2024 13:08:06 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, bp@alien8.de,
	tony.luck@intel.com, mchehab@kernel.org, rric@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	quic_sibis@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/qcom: Make irq configuration optional
Message-ID: <ZtbgBqYNDBr5d/fy@linaro.org>
References: <20240903060138.3191160-1-quic_rjendra@quicinc.com>
 <ZtbG9plGQfUqVvXo@linaro.org>
 <20240903082720.zcln2da4y6kxju5g@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903082720.zcln2da4y6kxju5g@thinkpad>

On 24-09-03 13:57:20, Manivannan Sadhasivam wrote:
> On Tue, Sep 03, 2024 at 11:21:10AM +0300, Abel Vesa wrote:
> > On 24-09-03 11:31:38, Rajendra Nayak wrote:
> > > On most modern qualcomm SoCs, the configuration necessary to enable the
> > > Tag/Data RAM realted irqs being propagated to the SoC irq controller is
> > 
> > Nitpick: s/realted/related/
> > 
> > > already done in firmware (in DSF or 'DDR System Firmware')
> > > 
> > > On some like the x1e80100, these registers aren't even accesible to the
> > > kernel causing a crash when edac device is probed.
> > > 
> > > Hence, make the irq configuration optional in the driver and mark x1e80100
> > > as the SoC on which this should be avoided.
> > > 
> > > Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> > 
> > Not sure about this fixes tag though.
> > 
> 
> Because, this commit introduced LLCC node which triggers the probe of the EDAC
> driver leading to the crash.
> 

Fair enough.

> - Mani
> 
> > > Reported-by: Bjorn Andersson <andersson@kernel.org>
> > > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > > ---
> > >  drivers/edac/qcom_edac.c           | 8 +++++---
> > >  drivers/soc/qcom/llcc-qcom.c       | 3 +++
> > >  include/linux/soc/qcom/llcc-qcom.h | 2 ++
> > >  3 files changed, 10 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> > > index d3cd4cc54ace..96611ca09ac5 100644
> > > --- a/drivers/edac/qcom_edac.c
> > > +++ b/drivers/edac/qcom_edac.c
> > > @@ -342,9 +342,11 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
> > >  	int ecc_irq;
> > >  	int rc;
> > >  
> > > -	rc = qcom_llcc_core_setup(llcc_driv_data, llcc_driv_data->bcast_regmap);
> > > -	if (rc)
> > > -		return rc;
> > > +	if (!llcc_driv_data->ecc_irq_configured) {
> > > +		rc = qcom_llcc_core_setup(llcc_driv_data, llcc_driv_data->bcast_regmap);
> > > +		if (rc)
> > > +			return rc;
> > > +	}
> > >  
> > >  	/* Allocate edac control info */
> > >  	edev_ctl = edac_device_alloc_ctl_info(0, "qcom-llcc", 1, "bank",
> > > diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> > > index 8fa4ffd3a9b5..b1c0ae9991d6 100644
> > > --- a/drivers/soc/qcom/llcc-qcom.c
> > > +++ b/drivers/soc/qcom/llcc-qcom.c
> > > @@ -139,6 +139,7 @@ struct qcom_llcc_config {
> > >  	int size;
> > >  	bool need_llcc_cfg;
> > >  	bool no_edac;
> > > +	bool irq_configured;
> > >  };
> > >  
> > >  struct qcom_sct_config {
> > > @@ -718,6 +719,7 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
> > >  		.need_llcc_cfg	= true,
> > >  		.reg_offset	= llcc_v2_1_reg_offset,
> > >  		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> > > +		.irq_configured = true,
> > >  	},
> > >  };
> > >  
> > > @@ -1345,6 +1347,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
> > >  	drv_data->cfg = llcc_cfg;
> > >  	drv_data->cfg_size = sz;
> > >  	drv_data->edac_reg_offset = cfg->edac_reg_offset;
> > > +	drv_data->ecc_irq_configured = cfg->irq_configured;
> > >  	mutex_init(&drv_data->lock);
> > >  	platform_set_drvdata(pdev, drv_data);
> > >  
> > > diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> > > index 9e9f528b1370..acad1f4cf854 100644
> > > --- a/include/linux/soc/qcom/llcc-qcom.h
> > > +++ b/include/linux/soc/qcom/llcc-qcom.h
> > > @@ -125,6 +125,7 @@ struct llcc_edac_reg_offset {
> > >   * @num_banks: Number of llcc banks
> > >   * @bitmap: Bit map to track the active slice ids
> > >   * @ecc_irq: interrupt for llcc cache error detection and reporting
> > > + * @ecc_irq_configured: 'True' if firmware has already configured the irq propagation
> > >   * @version: Indicates the LLCC version
> > >   */
> > >  struct llcc_drv_data {
> > > @@ -139,6 +140,7 @@ struct llcc_drv_data {
> > >  	u32 num_banks;
> > >  	unsigned long *bitmap;
> > >  	int ecc_irq;
> > > +	bool ecc_irq_configured;
> > >  	u32 version;
> > >  };
> > >  
> > > -- 
> > > 2.34.1
> > > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

