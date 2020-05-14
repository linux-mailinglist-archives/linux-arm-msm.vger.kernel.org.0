Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7413C1D3854
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 19:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgENRcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 13:32:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:44834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgENRcc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 13:32:32 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E7F2206D8;
        Thu, 14 May 2020 17:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589477551;
        bh=Vq89tzkVrFPsfX5X2TnUxZ2kkQChVcmUNzfx+d4Mw8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ap7QRQnMNTnMXMSQXmMMVP1DyCOxHCUFWZmPQd7rJEFsYwzi3Ov0iktfqGcaTDUUx
         ih05SPhm9WzuYCc/BCKHIL42XaK2NnXHx6PjZw2fs/0vLN5uCCcIorqDpU/V7ogWii
         yypDh3sSMCLTT8wODeKCJEbneOzAJKaMo+PSgWpU=
Date:   Thu, 14 May 2020 23:02:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] hwspinlock: qcom: Allow mmio usage in addition to
 syscon
Message-ID: <20200514173220.GH14092@vkoul-mobl>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
 <20200513005441.1102586-4-bjorn.andersson@linaro.org>
 <20200514141523.GW14092@vkoul-mobl>
 <20200514170013.GX2165@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514170013.GX2165@builder.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-05-20, 10:00, Bjorn Andersson wrote:
> On Thu 14 May 07:15 PDT 2020, Vinod Koul wrote:
> 
> > On 12-05-20, 17:54, Bjorn Andersson wrote:
> > > In all modern Qualcomm platforms the mutex region of the TCSR is forked
> > > off into its own block, all with a offset of 0 and stride of 4096. So
> > > add support for directly memory mapping this register space, to avoid
> > > the need to represent this block using a syscon.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  drivers/hwspinlock/qcom_hwspinlock.c | 72 +++++++++++++++++++++-------
> > >  1 file changed, 56 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> > > index f0da544b14d2..d8d4d729816c 100644
> > > --- a/drivers/hwspinlock/qcom_hwspinlock.c
> > > +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> > > @@ -70,41 +70,81 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
> > >  };
> > >  MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
> > >  
> > > -static int qcom_hwspinlock_probe(struct platform_device *pdev)
> > > +static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
> > > +						   u32 *base, u32 *stride)
> > >  {
> > > -	struct hwspinlock_device *bank;
> > >  	struct device_node *syscon;
> > > -	struct reg_field field;
> > >  	struct regmap *regmap;
> > > -	size_t array_size;
> > > -	u32 stride;
> > > -	u32 base;
> > >  	int ret;
> > > -	int i;
> > >  
> > >  	syscon = of_parse_phandle(pdev->dev.of_node, "syscon", 0);
> > > -	if (!syscon) {
> > > -		dev_err(&pdev->dev, "no syscon property\n");
> > 
> > any reason to drop the log?
> > 
> 
> Given that we first check for the syscon and then fall back to trying to
> use the reg, keeping this line would cause this log line to always show
> up on targets putting this under /soc.
> 
> So I think it's better to drop the line and then require the presence of
> either syscon or reg using the DT schema.

ok

> > > -		return -ENODEV;
> > > -	}
> > > +	if (!syscon)
> > > +		return ERR_PTR(-ENODEV);
> > >  
> > >  	regmap = syscon_node_to_regmap(syscon);
> > >  	of_node_put(syscon);
> > >  	if (IS_ERR(regmap))
> > > -		return PTR_ERR(regmap);
> > > +		return regmap;
> > >  
> > > -	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, &base);
> > > +	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, base);
> > >  	if (ret < 0) {
> > >  		dev_err(&pdev->dev, "no offset in syscon\n");
> > > -		return -EINVAL;
> > > +		return ERR_PTR(-EINVAL);
> > >  	}
> > >  
> > > -	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, &stride);
> > > +	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, stride);
> > >  	if (ret < 0) {
> > >  		dev_err(&pdev->dev, "no stride syscon\n");
> > > -		return -EINVAL;
> > > +		return ERR_PTR(-EINVAL);
> > >  	}
> > >  
> > > +	return regmap;
> > > +}
> > > +
> > > +static const struct regmap_config tcsr_mutex_config = {
> > > +	.reg_bits		= 32,
> > > +	.reg_stride		= 4,
> > > +	.val_bits		= 32,
> > > +	.max_register		= 0x40000,
> > > +	.fast_io		= true,
> > > +};
> > > +
> > > +static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
> > > +						 u32 *offset, u32 *stride)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct resource *res;
> > > +	void __iomem *base;
> > > +
> > > +	/* All modern platform has offset 0 and stride of 4k */
> > > +	*offset = 0;
> > > +	*stride = 0x1000;
> > 
> > Wouldn't it make sense to read this from DT rather than code in kernel?
> > 
> 
> I did consider this as well as platform specific compatibles, but
> realized that pretty much all 64-bit targets have these values. So given
> that we still can represent this using the syscon approach I don't think
> we need to add yet another mechanism to specify these.

Sounds good.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
