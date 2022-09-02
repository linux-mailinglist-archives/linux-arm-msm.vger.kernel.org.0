Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AE45AB8AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 21:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiIBTFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 15:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiIBTFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 15:05:43 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41322956BE
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 12:05:42 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id k2so1637824ilu.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PcBSc6a8UZv5xzd8pSUF6lLroJ00ejm4NJFNAId16X0=;
        b=gk0ts4OJPcwryEWgS1bUmaXGR23QGUL+e2BcaME2+pIFo40EK2ujGBPW0+mpHCjeR5
         JioG4VVQIzA4nkDzPHDS6Wvnv2XPgKiVpPaLYotRAoczuzdxCDPd16eOQf140hiJHaiB
         PLJ7PRpxIqVeawl85RJWPTL98+T+hgzRHfXQBXVfMEOPMC+oaPVwrVEa8c325QgJEFkq
         puPYlFTSKSJVWa9LiVuYNsnZQc/Ioz+tEWSHGAYF2JAAK1eOuQ94NHqxmtFM6HTl5IaF
         igTRXOQdSYlp3o1AjGHU1bWK+6BnsV9VuIYp8X5Sf0BcWEQkkqv0Ld06OoSjs5pKwYCK
         zyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PcBSc6a8UZv5xzd8pSUF6lLroJ00ejm4NJFNAId16X0=;
        b=B+vg8LbgVTSaB269aL5XECa/m+c8QF3P46O1bV+H0PGjnLtsDx2Qu1VvJ/HecvAo0K
         shHxgF5UKBCIhJlIVqrbqo17wzWTL8ctmXoAl5PNjRqiNsYWISwfGo9aqPW+0cue73to
         4im7Dbh4Hut8P5pZzrJPAUzlNYtolMArE8xWQeDc+7mLXdo0dtiCoIIeOJKVrCZqIA3b
         HZM1FRK0MMZDghA92V5j/MdB5E2kMUmzwiXm3soXS/higNmpXclxSfvZqWOMK7jk21aZ
         tjRFJUtp4Z7vGkcEX4z+4UuB+2JcYGG8nxgiNHwuy98s8bF0GvVJQVS4zOjAco8gOduU
         Ij2Q==
X-Gm-Message-State: ACgBeo2LetlicXXOVCWVddcXkp0rvplpwjmHXmkeyHf1s1dQzVshHZyX
        EEB90TsP92O2YJyshYQBWvJKDbMQc0NfMUbVBJSt+g==
X-Google-Smtp-Source: AA6agR72mwILvqt/1sdnWQePgHBv0lz9N4Gk5sbggvhUmRQ0oyyxmgO7QcEZn4ESgwXjMSzC1bXH1811w0CXOiRNeeA=
X-Received: by 2002:a05:6e02:20e9:b0:2e5:e584:d616 with SMTP id
 q9-20020a056e0220e900b002e5e584d616mr19728566ilv.236.1662145541505; Fri, 02
 Sep 2022 12:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-4-dmitry.baryshkov@linaro.org> <014fc43f-bee6-88eb-9d3c-69aed2fcd7c6@quicinc.com>
 <7D8A3C28-85A1-4737-B6ED-EACBF488FF70@linaro.org> <005fd4aa-7f7c-af98-6787-48f04fa2f166@quicinc.com>
In-Reply-To: <005fd4aa-7f7c-af98-6787-48f04fa2f166@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 2 Sep 2022 22:05:30 +0300
Message-ID: <CAA8EJprWr5XV9Ky1KgBdJE9gBVAUspkwg=fS5wryt-k7SPfnMA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] drm/msm/mdp4: move resource allocation to the
 _probe function
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2 Sept 2022 at 21:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 9/1/2022 11:06 PM, Dmitry Baryshkov wrote:
> >
> >
> > On 2 September 2022 03:24:17 GMT+03:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >> On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
> >>> To let the probe function bail early if any of the resources is
> >>> unavailable, move resource allocattion from kms_init directly to the
> >>> probe callback. While we are at it, replace irq_of_parse_and_map() with
> >>> platform_get_irq().
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++++------------
> >>>    1 file changed, 51 insertions(+), 56 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> >>> index 41dc60784847..6499713eccf6 100644
> >>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> >>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> >>> @@ -139,8 +139,6 @@ static void mdp4_destroy(struct msm_kms *kms)
> >>>             pm_runtime_disable(dev);
> >>>             mdp_kms_destroy(&mdp4_kms->base);
> >>> -
> >>> -   kfree(mdp4_kms);
> >>>    }
> >>>      static const struct mdp_kms_funcs kms_funcs = {
> >>> @@ -383,57 +381,27 @@ static int mdp4_kms_init(struct drm_device *dev)
> >>>    {
> >>>     struct platform_device *pdev = to_platform_device(dev->dev);
> >>>     struct msm_drm_private *priv = dev->dev_private;
> >>> -   struct mdp4_kms *mdp4_kms;
> >>> +   struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
> >>>     struct msm_kms *kms = NULL;
> >>>     struct iommu_domain *iommu;
> >>>     struct msm_gem_address_space *aspace;
> >>> -   int irq, ret;
> >>> +   int ret;
> >>>     u32 major, minor;
> >>>     unsigned long max_clk;
> >>>             /* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
> >>>     max_clk = 266667000;
> >>>    -        mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
> >>> -   if (!mdp4_kms) {
> >>> -           DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
> >>> -           return -ENOMEM;
> >>> -   }
> >>> -
> >>>     ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
> >>>     if (ret) {
> >>>             DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
> >>>             goto fail;
> >>>     }
> >>>    -        priv->kms = &mdp4_kms->base.base;
> >>>     kms = priv->kms;
> >>>             mdp4_kms->dev = dev;
> >>>    -        mdp4_kms->mmio = msm_ioremap(pdev, NULL);
> >>> -   if (IS_ERR(mdp4_kms->mmio)) {
> >>> -           ret = PTR_ERR(mdp4_kms->mmio);
> >>> -           goto fail;
> >>> -   }
> >>> -
> >>> -   irq = platform_get_irq(pdev, 0);
> >>> -   if (irq < 0) {
> >>> -           ret = irq;
> >>> -           DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
> >>> -           goto fail;
> >>> -   }
> >>> -
> >>> -   kms->irq = irq;
> >>> -
> >>> -   /* NOTE: driver for this regulator still missing upstream.. use
> >>> -    * _get_exclusive() and ignore the error if it does not exist
> >>> -    * (and hope that the bootloader left it on for us)
> >>> -    */
> >>> -   mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
> >>> -   if (IS_ERR(mdp4_kms->vdd))
> >>> -           mdp4_kms->vdd = NULL;
> >>> -
> >>>     if (mdp4_kms->vdd) {
> >>>             ret = regulator_enable(mdp4_kms->vdd);
> >>>             if (ret) {
> >>> @@ -442,24 +410,6 @@ static int mdp4_kms_init(struct drm_device *dev)
> >>>             }
> >>>     }
> >>>    -        mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
> >>> -   if (IS_ERR(mdp4_kms->clk)) {
> >>> -           DRM_DEV_ERROR(dev->dev, "failed to get core_clk\n");
> >>> -           ret = PTR_ERR(mdp4_kms->clk);
> >>> -           goto fail;
> >>> -   }
> >>> -
> >>> -   mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
> >>> -   if (IS_ERR(mdp4_kms->pclk))
> >>> -           mdp4_kms->pclk = NULL;
> >>> -
> >>> -   mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
> >>> -   if (IS_ERR(mdp4_kms->axi_clk)) {
> >>> -           DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
> >>> -           ret = PTR_ERR(mdp4_kms->axi_clk);
> >>> -           goto fail;
> >>> -   }
> >>> -
> >>>     clk_set_rate(mdp4_kms->clk, max_clk);
> >>>             read_mdp_hw_revision(mdp4_kms, &major, &minor);
> >>> @@ -474,10 +424,9 @@ static int mdp4_kms_init(struct drm_device *dev)
> >>>     mdp4_kms->rev = minor;
> >>>             if (mdp4_kms->rev >= 2) {
> >>> -           mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
> >>> -           if (IS_ERR(mdp4_kms->lut_clk)) {
> >>> +           if (!mdp4_kms->lut_clk) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
> >>> -                   ret = PTR_ERR(mdp4_kms->lut_clk);
> >>> +                   ret = -ENODEV;
> >>>                     goto fail;
> >>>             }
> >>>             clk_set_rate(mdp4_kms->lut_clk, max_clk);
> >>> @@ -560,7 +509,53 @@ static const struct dev_pm_ops mdp4_pm_ops = {
> >>>      static int mdp4_probe(struct platform_device *pdev)
> >>>    {
> >>> -   return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
> >>> +   struct device *dev = &pdev->dev;
> >>> +   struct mdp4_kms *mdp4_kms;
> >>> +   int irq;
> >>> +
> >>> +   mdp4_kms = devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
> >>> +   if (!mdp4_kms)
> >>> +           return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
> >>> +
> >>> +   mdp4_kms->mmio = msm_ioremap(pdev, NULL);
> >>> +   if (IS_ERR(mdp4_kms->mmio))
> >>> +           return PTR_ERR(mdp4_kms->mmio);
> >>> +
> >>> +   irq = platform_get_irq(pdev, 0);
> >>> +   if (irq < 0)
> >>> +           return dev_err_probe(dev, irq, "failed to get irq\n");
> >>> +
> >>> +   mdp4_kms->base.base.irq = irq;
> >>> +
> >>> +   /* NOTE: driver for this regulator still missing upstream.. use
> >>> +    * _get_exclusive() and ignore the error if it does not exist
> >>> +    * (and hope that the bootloader left it on for us)
> >>> +    */
> >>> +   mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
> >>> +   if (IS_ERR(mdp4_kms->vdd))
> >>> +           mdp4_kms->vdd = NULL;
> >>> +
> >>> +   mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
> >>> +   if (IS_ERR(mdp4_kms->clk))
> >>> +           return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed to get core_clk\n");
> >>> +
> >>> +   mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
> >>> +   if (IS_ERR(mdp4_kms->pclk))
> >>> +           mdp4_kms->pclk = NULL;
> >>> +
> >>> +   mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
> >>> +   if (IS_ERR(mdp4_kms->axi_clk))
> >>> +           return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "failed to get axi_clk\n");
> >>> +
> >>> +   /*
> >>> +    * This is required for revn >= 2. Handle errors here and let the kms
> >>> +    * init bail out if the clock is not provided.
> >>> +    */
> >>> +   mdp4_kms->lut_clk = devm_clk_get_optional(&pdev->dev, "lut_clk");
> >>> +   if (IS_ERR(mdp4_kms->lut_clk))
> >>> +           return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
> >>
> >> I can see that you have moved this from init to probe and only rev >=2 needs it.
> >>
> >> But, your check here will end up returning from probe because you have a return. So I guess you means just having dev_err_probe without the return and let the init fail if the clk is not found because we have the hw_rev only in init.
> >
> > No. The function called here is the devm_clk_get_optional(). So the driver will get NULL if the clock is not present in the DT and an error only in an error case (e.g. EINVAL, EPROBE_DEFER).
> >
> > Later on the mdp4_kms_init() will check hw_rev and return -ENODEV if the clock is required, but is set to NULL (not present in DT).
> >
>
> Ok, I have understood. But dont you think this is too much convolution
> just for this check? Why not leave the lut_clk in the init instead of
> trying to move it to probe and add all this?

No, I don't. I saw no point in leaving the lut_clk getter unconverted.
Having everything handled in a similar way is a neat bonus from my
point of view.



-- 
With best wishes
Dmitry
