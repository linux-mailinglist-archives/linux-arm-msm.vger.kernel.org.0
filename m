Return-Path: <linux-arm-msm+bounces-30489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7FD969703
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFD25B21DE4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7064E210186;
	Tue,  3 Sep 2024 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pO+oiBEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AF120FA84
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352054; cv=none; b=UkLv58dUqaP/v5eoOhrZHQveh8cJxH239fJSNGG2SCf8zDmy0JBRZLRB0GYqgoAlw6gZhpBlHz61LO6cG6k5fgzNpRCxIpP11dI4cj2BlHmi/e+7m1f7f6zoVAR3Kz7VDd2MrBB1vAnsOKCnpZxN1EjFxtSWfwNrXliNICgX8sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352054; c=relaxed/simple;
	bh=lombF5cWOqHkdIVejUQ42Pqs+zu7y++1h9z2RZYEsjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9apHQe6WkgkmC4Mqm+wILg9gUPOI9Hlir+TI8bJSyvwmzuGeo62b9rdwkh6A8vehCnrAiLrWyFNFphtfzRN4QhxkvbTn3vtONW8XmNBw6IbUB+QqYrxD5Rlw90peOUPgeeU9IIGPZQmsyuxetS9r5hpuhpIYPGLSMqvClx0BcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pO+oiBEU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2053525bd90so22416065ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725352052; x=1725956852; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyJE4Pk0SI+4EnrkozEkOqhJvUJMQCN0/eHqI3shIqM=;
        b=pO+oiBEU0y6wGuvrzIIoEo3tHhqu61sWIsTED+shK0g1tAfXqsXNL27YcbyjvEMDsS
         TpVE3lzyeFXy/KTP7ZiHhfnWqn/vvzJ1Ak6fbI49P6yB4bEhPxRNzPXsqU7wLyp6r9JO
         koSqmoxdnOZvPkMJfRr8ZUewb4rrT+qS4I3mYWrE8pmj7jY5TotUE5vJZwL7iKi3BcGj
         z0nrLpv5tb30sjr+6cJdTwMlHg66F+opZoCpyZfEvlxTLFuUZMJUKd8N4oZk7/pW5ZOl
         8SJXXM/PbHWJbRjjH+tceik1YQSBct/vpNTmN2n0Wrhi/hRfjA3d7IkmAks6fNN9zab2
         saGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725352052; x=1725956852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyJE4Pk0SI+4EnrkozEkOqhJvUJMQCN0/eHqI3shIqM=;
        b=mZjw0f+PthDHic23Pg3iYNAIt/GpesLSpjR4LgLT2mzlKTLlREZr5yWrVjCBkOCuvJ
         /dRqSMdCcLQ75vxEBi3EvLLI3NyakH5I44+EHof9VJRjCOnTOlwA79EIE8K8qN9uXEJK
         h6p9lCjdweOaJXYCrRmi0PPI/eYoMZ20L53P4RoF7f013Hzh02GNv+ervdW4OVcCh2cN
         dEyCseFv6bBYghNgbVvtLOlEJCTWxJhKJNXZl9VuJoA5OoTVNtndhwra0Ga7JiGKlYq2
         j1Oac40WrUINnLOIrJJPCWpa+dUeYA1w6VIhvdT5e7XEgYRJVV2Oxwrj4SZzmk4MFAO+
         UpcA==
X-Forwarded-Encrypted: i=1; AJvYcCUs9RY2k7iNUvr9LS9KiUVNqNHF0UucXMlSvv/lB+9dXKngYO1mbeyoFQC0P/h3kSn7LXCeuJ7bDlOpJety@vger.kernel.org
X-Gm-Message-State: AOJu0Yy67HY1Icp8+WlxpYQPtxlmE89SwhtsH7SRtMyTxe1uA0p2+Oz7
	oczYj4k4BOQW1QZEPrmZ3hjeM31H+NGsPNmbeSwwu/+QFm1CVRERT1MNuVy5iQ==
X-Google-Smtp-Source: AGHT+IECktknlJ9qhM7V0rMbWds95DBOPQoe101rLzV+w6/QuQuazDswtKt696yWTS8dqjJiAxSm/Q==
X-Received: by 2002:a17:902:ec86:b0:1fd:6c5b:afbc with SMTP id d9443c01a7336-2054c248edfmr84077105ad.49.1725352051954;
        Tue, 03 Sep 2024 01:27:31 -0700 (PDT)
Received: from thinkpad ([120.60.129.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205881072e7sm20846235ad.250.2024.09.03.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 01:27:31 -0700 (PDT)
Date: Tue, 3 Sep 2024 13:57:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, bp@alien8.de,
	tony.luck@intel.com, mchehab@kernel.org, rric@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	quic_sibis@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/qcom: Make irq configuration optional
Message-ID: <20240903082720.zcln2da4y6kxju5g@thinkpad>
References: <20240903060138.3191160-1-quic_rjendra@quicinc.com>
 <ZtbG9plGQfUqVvXo@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtbG9plGQfUqVvXo@linaro.org>

On Tue, Sep 03, 2024 at 11:21:10AM +0300, Abel Vesa wrote:
> On 24-09-03 11:31:38, Rajendra Nayak wrote:
> > On most modern qualcomm SoCs, the configuration necessary to enable the
> > Tag/Data RAM realted irqs being propagated to the SoC irq controller is
> 
> Nitpick: s/realted/related/
> 
> > already done in firmware (in DSF or 'DDR System Firmware')
> > 
> > On some like the x1e80100, these registers aren't even accesible to the
> > kernel causing a crash when edac device is probed.
> > 
> > Hence, make the irq configuration optional in the driver and mark x1e80100
> > as the SoC on which this should be avoided.
> > 
> > Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> 
> Not sure about this fixes tag though.
> 

Because, this commit introduced LLCC node which triggers the probe of the EDAC
driver leading to the crash.

- Mani

> > Reported-by: Bjorn Andersson <andersson@kernel.org>
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > ---
> >  drivers/edac/qcom_edac.c           | 8 +++++---
> >  drivers/soc/qcom/llcc-qcom.c       | 3 +++
> >  include/linux/soc/qcom/llcc-qcom.h | 2 ++
> >  3 files changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> > index d3cd4cc54ace..96611ca09ac5 100644
> > --- a/drivers/edac/qcom_edac.c
> > +++ b/drivers/edac/qcom_edac.c
> > @@ -342,9 +342,11 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
> >  	int ecc_irq;
> >  	int rc;
> >  
> > -	rc = qcom_llcc_core_setup(llcc_driv_data, llcc_driv_data->bcast_regmap);
> > -	if (rc)
> > -		return rc;
> > +	if (!llcc_driv_data->ecc_irq_configured) {
> > +		rc = qcom_llcc_core_setup(llcc_driv_data, llcc_driv_data->bcast_regmap);
> > +		if (rc)
> > +			return rc;
> > +	}
> >  
> >  	/* Allocate edac control info */
> >  	edev_ctl = edac_device_alloc_ctl_info(0, "qcom-llcc", 1, "bank",
> > diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> > index 8fa4ffd3a9b5..b1c0ae9991d6 100644
> > --- a/drivers/soc/qcom/llcc-qcom.c
> > +++ b/drivers/soc/qcom/llcc-qcom.c
> > @@ -139,6 +139,7 @@ struct qcom_llcc_config {
> >  	int size;
> >  	bool need_llcc_cfg;
> >  	bool no_edac;
> > +	bool irq_configured;
> >  };
> >  
> >  struct qcom_sct_config {
> > @@ -718,6 +719,7 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
> >  		.need_llcc_cfg	= true,
> >  		.reg_offset	= llcc_v2_1_reg_offset,
> >  		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> > +		.irq_configured = true,
> >  	},
> >  };
> >  
> > @@ -1345,6 +1347,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
> >  	drv_data->cfg = llcc_cfg;
> >  	drv_data->cfg_size = sz;
> >  	drv_data->edac_reg_offset = cfg->edac_reg_offset;
> > +	drv_data->ecc_irq_configured = cfg->irq_configured;
> >  	mutex_init(&drv_data->lock);
> >  	platform_set_drvdata(pdev, drv_data);
> >  
> > diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> > index 9e9f528b1370..acad1f4cf854 100644
> > --- a/include/linux/soc/qcom/llcc-qcom.h
> > +++ b/include/linux/soc/qcom/llcc-qcom.h
> > @@ -125,6 +125,7 @@ struct llcc_edac_reg_offset {
> >   * @num_banks: Number of llcc banks
> >   * @bitmap: Bit map to track the active slice ids
> >   * @ecc_irq: interrupt for llcc cache error detection and reporting
> > + * @ecc_irq_configured: 'True' if firmware has already configured the irq propagation
> >   * @version: Indicates the LLCC version
> >   */
> >  struct llcc_drv_data {
> > @@ -139,6 +140,7 @@ struct llcc_drv_data {
> >  	u32 num_banks;
> >  	unsigned long *bitmap;
> >  	int ecc_irq;
> > +	bool ecc_irq_configured;
> >  	u32 version;
> >  };
> >  
> > -- 
> > 2.34.1
> > 

-- 
மணிவண்ணன் சதாசிவம்

