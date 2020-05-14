Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E821D373C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 19:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgENRBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 13:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgENRBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 13:01:45 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DBDC061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 10:01:45 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id a4so1500800pgc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 10:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZuhsntYUMFZxRnUyqDlk5wRYaifNpo5JONkK2uBeMw8=;
        b=zQHEDIROdy/6E8RJIS9Cu0voHf1MlMmv2SrYL7sos3L8Znnxs9ubcS/WOm9A0BPSZ0
         n5av6qoxz4Gchfn1zFTLJqGT2eUZIh+KVILNxsPUJln6zB2yJQGtO2+3D2Exf6iFnETi
         WR10howEZogi8LvD43gCSmWiXXCXKJuq0EdoJGbDHzR+XNDWR8NwZkL8QF07d2aYc9KA
         P67louPdgP2Lt18Uxos2gKt/osQIwj8uafwgZr5CUo344bdxWThBaRUh+FVgJH5N1ibT
         wTjyWN0/Gngn69v0jAn+mehd0GlVg4ESIFcOreXly739xl/C3hZ6ku0bXHOnXN9z7DpJ
         du7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZuhsntYUMFZxRnUyqDlk5wRYaifNpo5JONkK2uBeMw8=;
        b=cDVrjXVCV4RLDG9EgU5gg+57MLITwcEjI4wbNXrwe/c6pMfoYugjKKJvpcw6wgpqBK
         xEdpSc1bO0OtrclvBXtnnE+nrYn73rqAmQNDYTxzn3dmUuUIE37LnY96iHTIopMjmF0L
         KXxuaxTS50mLNPfzmsoju3NYdAKGfKhWkUcioFhdiOA82XKt0ZMtO37cfpiqp/nRftht
         OijPVVGRIVZC1tm+PogC3KzwPilF4S3dJzj1UYgWBobuV0OW4PBmp8g5Pe2dK1YK/Rvz
         S9ZYUt/HKUFnC61r7weAD03i3WFqWOKEUdk31A7DhNLfLpKpwhGI7njYwNVFDOXPnDVf
         1ALA==
X-Gm-Message-State: AOAM530E4+NbjF6QZeAVFTda3FQ5pEIIZ9H88W9R6TgPUDpVU+nboWlj
        kCBwI7WY/BGpZkicZHRxMPuE4Q==
X-Google-Smtp-Source: ABdhPJyb1dz1psTKBYjcweFb9ar7rAG/ofRi7zGaZban+NrEY9U1EqPUAktGm/RqFNrqdHjdJ9qhUw==
X-Received: by 2002:a62:dd8a:: with SMTP id w132mr5333762pff.309.1589475704560;
        Thu, 14 May 2020 10:01:44 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p1sm19197796pjf.15.2020.05.14.10.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:01:43 -0700 (PDT)
Date:   Thu, 14 May 2020 10:00:13 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] hwspinlock: qcom: Allow mmio usage in addition to
 syscon
Message-ID: <20200514170013.GX2165@builder.lan>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
 <20200513005441.1102586-4-bjorn.andersson@linaro.org>
 <20200514141523.GW14092@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514141523.GW14092@vkoul-mobl>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 May 07:15 PDT 2020, Vinod Koul wrote:

> On 12-05-20, 17:54, Bjorn Andersson wrote:
> > In all modern Qualcomm platforms the mutex region of the TCSR is forked
> > off into its own block, all with a offset of 0 and stride of 4096. So
> > add support for directly memory mapping this register space, to avoid
> > the need to represent this block using a syscon.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/hwspinlock/qcom_hwspinlock.c | 72 +++++++++++++++++++++-------
> >  1 file changed, 56 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> > index f0da544b14d2..d8d4d729816c 100644
> > --- a/drivers/hwspinlock/qcom_hwspinlock.c
> > +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> > @@ -70,41 +70,81 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
> >  
> > -static int qcom_hwspinlock_probe(struct platform_device *pdev)
> > +static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
> > +						   u32 *base, u32 *stride)
> >  {
> > -	struct hwspinlock_device *bank;
> >  	struct device_node *syscon;
> > -	struct reg_field field;
> >  	struct regmap *regmap;
> > -	size_t array_size;
> > -	u32 stride;
> > -	u32 base;
> >  	int ret;
> > -	int i;
> >  
> >  	syscon = of_parse_phandle(pdev->dev.of_node, "syscon", 0);
> > -	if (!syscon) {
> > -		dev_err(&pdev->dev, "no syscon property\n");
> 
> any reason to drop the log?
> 

Given that we first check for the syscon and then fall back to trying to
use the reg, keeping this line would cause this log line to always show
up on targets putting this under /soc.

So I think it's better to drop the line and then require the presence of
either syscon or reg using the DT schema.

> > -		return -ENODEV;
> > -	}
> > +	if (!syscon)
> > +		return ERR_PTR(-ENODEV);
> >  
> >  	regmap = syscon_node_to_regmap(syscon);
> >  	of_node_put(syscon);
> >  	if (IS_ERR(regmap))
> > -		return PTR_ERR(regmap);
> > +		return regmap;
> >  
> > -	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, &base);
> > +	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, base);
> >  	if (ret < 0) {
> >  		dev_err(&pdev->dev, "no offset in syscon\n");
> > -		return -EINVAL;
> > +		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > -	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, &stride);
> > +	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, stride);
> >  	if (ret < 0) {
> >  		dev_err(&pdev->dev, "no stride syscon\n");
> > -		return -EINVAL;
> > +		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > +	return regmap;
> > +}
> > +
> > +static const struct regmap_config tcsr_mutex_config = {
> > +	.reg_bits		= 32,
> > +	.reg_stride		= 4,
> > +	.val_bits		= 32,
> > +	.max_register		= 0x40000,
> > +	.fast_io		= true,
> > +};
> > +
> > +static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
> > +						 u32 *offset, u32 *stride)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	void __iomem *base;
> > +
> > +	/* All modern platform has offset 0 and stride of 4k */
> > +	*offset = 0;
> > +	*stride = 0x1000;
> 
> Wouldn't it make sense to read this from DT rather than code in kernel?
> 

I did consider this as well as platform specific compatibles, but
realized that pretty much all 64-bit targets have these values. So given
that we still can represent this using the syscon approach I don't think
we need to add yet another mechanism to specify these.

Thanks,
Bjorn
