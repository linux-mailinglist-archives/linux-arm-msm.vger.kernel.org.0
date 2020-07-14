Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B96621F76E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 18:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgGNQf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 12:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgGNQf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 12:35:28 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5117EC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 09:35:28 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ch3so1850653pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QT9HiLZlfLtj7d6b920+DKn037dSUdlopmzK56b/6q0=;
        b=IHirfcaJbhHyjx7vB9QvBqwOwTVcSdFMLZQl4j2hyW8YDmQaR4w9RlMvVF/+ktyHcZ
         ZXa0jlYWpeJ/c83he59zpW1zRjEemSQEgmLdo6cXHNDV8kLlESMwjZrMOZ8c9/s9sR/Z
         I/HYazN5iAgueFSwoJ62M03ijEhGTgM9bZDiN/msfYpV2SIcDISiXbnfMCMy8qn31jDz
         0yOCdG7TfGom86kbqbtw4lXTE+CZRRvtdnJmYRGAY4zdjsCPC1bjyVAN2waTu6+99+xg
         12QOOcg7HzsRLBQDmIrjcUeCYCytypMyyilqGYeGHboad6n2ZCYAP8/Vdy2E7xbXpQBg
         m97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QT9HiLZlfLtj7d6b920+DKn037dSUdlopmzK56b/6q0=;
        b=pXF8EbGOMzv+sDTybb+RUBlASQjBihlkQOBi72oziNJM8ZlmarVaF2w2Rnak6sLT8C
         sBs409RBJp9y5RcmTx6utvf3URaRIiiX0EsypsZPLaN+EBKr77fxBsAdmi05xVbPHWci
         XlfZHs2XpE11kCU0FtZ6Ly/I0t9r42hxioWtd2EuIZf5Np5FnL6OKefruoYLEVRUo2x8
         TAZ3ikVmeUrRMeFD7GLyYv2ZBUUuaahq6teHDrFUlpxyAUol9GmMAPfwXJH5MpqTxyfm
         I7ea+qk/68meIDOyud3VOnc2SOiK6VgaAhqFYwq9Yt/jrNy+rGiMuL72tcvhxk7PxIjE
         TLRg==
X-Gm-Message-State: AOAM530c+8LDEIaQsJykFWnJKIgh8OZwE6fe0nKGPgkukhUY61qyCZWZ
        yK/z/m9CL8RgS0zzho6lCUNtiA==
X-Google-Smtp-Source: ABdhPJxdoVBg8By1fNhgQ98NTF8VWMQfs6MbKMLnnkm/WDhjn0JlZYGXMD/9r1FFbxM2nyzdxZVqPA==
X-Received: by 2002:a17:90a:17e4:: with SMTP id q91mr5414151pja.61.1594744527521;
        Tue, 14 Jul 2020 09:35:27 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e16sm17946323pff.180.2020.07.14.09.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 09:35:26 -0700 (PDT)
Date:   Tue, 14 Jul 2020 09:33:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 3/4] hwspinlock: qcom: Allow mmio usage in addition to
 syscon
Message-ID: <20200714163320.GB2161373@builder.lan>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
 <20200622075956.171058-4-bjorn.andersson@linaro.org>
 <20200714160445.GA3848@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714160445.GA3848@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Jul 09:04 PDT 2020, Stephan Gerhold wrote:

> Hi Bjorn,
> 
> On Mon, Jun 22, 2020 at 12:59:55AM -0700, Bjorn Andersson wrote:
> > In modern Qualcomm platforms the mutex region of the TCSR is forked off
> > into its own block, all with a offset of 0 and stride of 4096, and in
> > some of these platforms no other registers in this region is accessed
> > from Linux.
> > 
> > So add support for directly memory mapping this register space, to avoid
> > the need to represent this block using a syscon.
> > 
> > Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - Use devm_platform_ioremap_resource()
> > 
> >  drivers/hwspinlock/qcom_hwspinlock.c | 70 +++++++++++++++++++++-------
> >  1 file changed, 54 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> > index f0da544b14d2..364710966665 100644
> > --- a/drivers/hwspinlock/qcom_hwspinlock.c
> > +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> > @@ -70,41 +70,79 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
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
> 
> Where does the 0x40000 come from?
> 

I presumably copied it off the dts I was looking (sm8250) as I wrote
this, but...

> It seems like this driver has QCOM_MUTEX_NUM_LOCKS = 32 hardcoded.
> With a stride of 4096 = 0x1000 you get 0x1000 * 32 = 0x20000.
> 
> This is also the reg size used in msm8996.dtsi and msm8916.dtsi for
> example, while sdm845.dtsi and sm8250.dtsi specify 0x40000.
> Are you not exposing all available locks on the newer SoCs?
> 
> I'm not sure how important max_register is... But I guess it should be
> either correct for all SoCs or not specified at all (since it's
> optional)?
> 

...you're right. I think it should be omitted.

> (That is assuming the hwlock can be also used directly via MMIO on
>  MSM8996 and MSM8916. It looks to me like it has its own register
>  space there as well...)
> 

If used on e.g. MSM8996 we still need to make sure the syscon is there,
so that the modem subsystem halt registers is available to the mpss
remoteproc. But specifying compatible as "qcom,tcsr-mutex", "syscon";
would use the new scheme and still would allow that access.


I merged patch 1-3 yesterday, so it would have to be an incremental
patch. I've put it on my todo list, but if you write up a patch I'd be
happy to merge it :)

Thanks,
Bjorn
