Return-Path: <linux-arm-msm+bounces-30857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA2096D115
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 09:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3218C285C7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 07:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32884194AFB;
	Thu,  5 Sep 2024 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqJLTrmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD044194AEA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523148; cv=none; b=dQ22nrIXFneouDl2WclwlbISTv/F5wXDYnNTM8kMX08keaAqC6ls6vDZC5hZ3ZKauaNlQSILZW1XdFXmU8iNuujHVX2cd7hFJV8zPRp0ZxDt2B4A/Etvol9iLeMXNvITJzL0tt6F/C1IBpKihHLvwEHtQxY3WMCtlWDrvCdScR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523148; c=relaxed/simple;
	bh=xdhnztTPxQGFqumFULWSCVPSD+7WCW1uNXGmA9Q+MJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLcjnYzW+6wjj3fVUJDKuIVIlDl4RrIw92HTZk5cOfsTDmTRsqoEJMYPuS15JKQC9lGEjiwUjckV76Tq63WALkpBFJjRm0yYUgYZzpar1kjb1G+gM1kmzyVz4cFMcxlyilsZY7ItLsIED/86YhF7EfB6/PWZ3EV8x/xQiUwFLBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqJLTrmj; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70f6a1afc90so238535a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725523145; x=1726127945; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jqRnqe/PwJnjoCIcJEvnwvB4C1NjsE9+IflmvTs+MtE=;
        b=lqJLTrmjqmCNNQR1/4P8CtLEp3Kml5bKt3wbPqi2paDCwDmp6h2sIru8rUJbGmrUdg
         Q9VUqyM/rM+dZSiva4tKDdDkye77SmcFIFTvbDyEzLeb0FT1vawGyPvfitAeJd1DX8YF
         S1so7vMHVimvaVjpPnh1xdM+tzn4ErXGXIXjHL0IfLEwt5cV4sBCgE9O3iA/IfLpJdpB
         cUbIQb28iEQTHQ7vekZl1ZYLaiinQf/zRIIbBpvTxNnaXRhTc21GUDECWAgxlS83ebv5
         18XpUweGrjKsojeuMEWVmViSEFzQF0U0cJDuvJcFaqAvrfeOHRimvfRa7Lsu2y/S6Tb1
         XBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523145; x=1726127945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqRnqe/PwJnjoCIcJEvnwvB4C1NjsE9+IflmvTs+MtE=;
        b=Ubwt9wHVZBp7tNcvE6YC9w3z637GefR7tWJK0dHbp5L8b9UtRbkC5m1zLQ/554q5NB
         NxHTLPG4UezIIYz1FjCWs3zGdKM7rN93L0XEQRG/CTSElp/Wh/8JAHT4UuGPyXAWobBm
         vVYCSaoi6schJs6ehFmGtOoD3/45R9aTIHIe/B5j3Dv8hvxU7TweQvGp/ejYisQD8uGN
         K5VsfC3L1bPpnal/rUycsTAN6Wh6TLAH6zDql41spVQitoHqSsofzWC0wKd4vBSqHL18
         RiFUo/EyUS3l/66VJJnTR8G20HnW5z1Zsk+GQTqlSiJAKmoz+5zHfh3rz5jmV6Gi1fRB
         OP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCTcymJAXsdTPPINQFnBH90K8LpEJnDCcDYXZDcObITLTtOVtXSMigkFvWnEXtjYyBr6V1AYB9N/1SuAaR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3nuFk3h67CTNXq3lyYWWF2EtK7NpnitFGtrfcyuxA2pHZJRz
	I9El8rt6pdYClsstmdGIW8rW3O/MXjdcz4pD8fU9qjqDA8+G/XPRcQe/+Y69igbNXFwbaQSOaIc
	=
X-Google-Smtp-Source: AGHT+IHZ5p615JCGrxO+kj7BETsjcRtqwBMTcKwF5GhK6YPRwEiF5dxe6YNR6DMaUH9B/CHkjVlbrw==
X-Received: by 2002:a05:6359:1b05:b0:1b8:1fd9:8481 with SMTP id e5c5f4694b2df-1b81fd985abmr390333855d.8.1725523144794;
        Thu, 05 Sep 2024 00:59:04 -0700 (PDT)
Received: from thinkpad ([120.60.128.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbda8762sm2744422a12.69.2024.09.05.00.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:59:04 -0700 (PDT)
Date: Thu, 5 Sep 2024 13:28:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, bp@alien8.de,
	tony.luck@intel.com, mchehab@kernel.org, rric@kernel.org,
	konradybcio@kernel.org, quic_sibis@quicinc.com,
	abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/qcom: Make irq configuration optional
Message-ID: <20240905075854.e2almocmqdbm7etn@thinkpad>
References: <20240903101510.3452734-1-quic_rjendra@quicinc.com>
 <3rcpcypiv2cr3s66tz56lui57f7turqriwku3tvukwcejr6kh4@fkk5tyk3qgta>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3rcpcypiv2cr3s66tz56lui57f7turqriwku3tvukwcejr6kh4@fkk5tyk3qgta>

On Wed, Sep 04, 2024 at 03:56:47PM -0500, Bjorn Andersson wrote:
> On Tue, Sep 03, 2024 at 03:45:10PM GMT, Rajendra Nayak wrote:
> > On most modern qualcomm SoCs, the configuration necessary to enable the
> > Tag/Data RAM related irqs being propagated to the SoC irq controller is
> > already done in firmware (in DSF or 'DDR System Firmware')
> > 
> > On some like the x1e80100, these registers aren't even accesible to the
> > kernel causing a crash when edac device is probed.
> > 
> > Hence, make the irq configuration optional in the driver and mark x1e80100
> > as the SoC on which this should be avoided.
> > 
> > Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> > Reported-by: Bjorn Andersson <andersson@kernel.org>
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Mani, would you like me to pick this through the qcom tree?
> 

You can. Previously, qcom_edac patches with LLCC dependency were merged through
qcom tree. Since the EDAC change is pretty trivial, I think you don't need to
wait for an Ack from the EDAC maintainers.

EDAC maintainers: Feel free to yell at me if you feel like I'm stepping onto
your shoes.

- Mani

> Regards,
> Bjorn
> 
> > ---
> > v2: 
> > Minor typo fixed in changelog
> > 
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

