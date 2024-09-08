Return-Path: <linux-arm-msm+bounces-31222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BDA97093E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 20:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF30E1C20B10
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 18:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF1F17836B;
	Sun,  8 Sep 2024 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XaxHCPlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C72B1531F9
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Sep 2024 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725820997; cv=none; b=qobZ1Tpse3MCHZblbv2c0WqSRFatdTo54Lw98W0ouVu6P8VieG12FL1otll0mXQ3/dVZQ1A3ccgBzhnGru7a09Xnc/OTzU/CU+eRRduWGcwLb6aDWPAZ63MNOlS9kI4sAnPg8VPJMs2D9j6eWIi9ii3HFwJPxB+odXVcxiDIbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725820997; c=relaxed/simple;
	bh=uB33C88J8iGGoIe43YrctdacY2Dnt7mTKACX4tBVY1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rkxu9tKh6GbSpZBvn3JeeSWLw+7FNslVIgFmAOTecWpiIViodcla7O2dv2RmH6bzd1UTSb7d8MDyeuWGnmLGT5zV+r5M7BeQ7LEhB7mh6YSk+KzO9+VN2NI4RLLMCj73BJYvHqOVsFYZcf1vPpcg/fZ/N5tAi/oy/Cv6fXO6/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XaxHCPlX; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6db449f274fso23999727b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Sep 2024 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725820993; x=1726425793; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HouJKlzQGlxBZrF/HSs6BlgvBUa0seOB33UUxhYXADs=;
        b=XaxHCPlX/pt8p6NokVYUPcGrRgJNGwQp6XqPBDOx6fgT5vPldXCpPTs6ozvSedqfx/
         g1Vh/OrDvegJR96Qx6cKv5TzjzoR9cAZxGa6hfGFwiz159uq9KmsR+V5u1L7i+NBbdBq
         iGwvq3eIGdo9eIzYY3Is6GaMQVqfmQz8NL8SYVF/wILoUtVZOHTIa90PPot97utPEgtX
         vRIcWAzdf+prpIC8T7omVw1ZecRpFUsT/cf4qN0PFenaezhzfqJiZ+X/SXAcgKRmsFZm
         Qyd7IXAa1pkoR1WUuFFFRtCIdZcaIRSPUsiR6Y34EbI/SAfO2orPtmFmmi9Hn8S/2kK1
         KqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725820993; x=1726425793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HouJKlzQGlxBZrF/HSs6BlgvBUa0seOB33UUxhYXADs=;
        b=TMnAA4MslTuoGhfCCE6dX0/68bx82/5XMeEBNItZT0dMV/XtQknrOAxZv9WA4XRqgG
         RfyYQjpORbF+zzNIi6ysy4uwSUweVZJzPx0jqJa7fJVdyjrd4GOTXViC2q7DfQ89uO9n
         hTf5swBItrONYAJE7kZhjus2WxDr2obEu/FvsGFA4iIyv2dyZbuPdIAOOQNwx919JgzL
         XYs/Z9Sy2uJk1zFhDpBb7fpSNV23TbxMSG3l9qstz1bHQwYe7LrsbuOIuvW7uJpaRmBV
         az4a7pO5vNDW9T0zzy+VeYiun6Lpza6PMjq6B7lRC+QPOf6PTmcZ1ztM+5Dm46iWROOv
         7Q0A==
X-Forwarded-Encrypted: i=1; AJvYcCU/6Q4EFwmKKi8+KFzxtD5x4iFwbjvO8gpKs+m97UoLEhZrG3UDjvJj7Vw1kxWAlCfYq+b2qGiGQ8gJtaqd@vger.kernel.org
X-Gm-Message-State: AOJu0YxnanWQpEMiYkkOqhOMrBH/Fr5rGlA2izb2ETtasQZuo55Mq0Ui
	AnGbhEOMv+p+Gesg6rSnZhLTCqTGq5/AMei/eVmuiPRGGkIJlArBwuEqTjwqKPN7vxqLDETOU3K
	HSbGhNTb1UrSP5hYCdQOvXaX0gNkz+99+deyo5g==
X-Google-Smtp-Source: AGHT+IG1W6C+fuQKfz3zWC6rxecJuU+VR4edb25dZ29Dnw/MjzoK8yMILcI2oxLWfU4UdpTarTU47yOV20v7nDQhmEg=
X-Received: by 2002:a05:690c:b:b0:64a:e7ec:f3d with SMTP id
 00721157ae682-6db44f2c6b1mr121092047b3.18.1725820993008; Sun, 08 Sep 2024
 11:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
 <CAA8EJpqw6pB4d_zQyYdhq9_prLnh+mLMdRSzJ+5EvAjT9wi86A@mail.gmail.com> <Zt3pFdndtTw/nbgs@linaro.org>
In-Reply-To: <Zt3pFdndtTw/nbgs@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 8 Sep 2024 21:43:01 +0300
Message-ID: <CAA8EJppTp5S1L-rHKDW58uXQO08p6o=aNbE3kA9UjVKZsyJ-Jw@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Sept 2024 at 21:12, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-09-07 20:52:14, Dmitry Baryshkov wrote:
> > On Sat, 7 Sept 2024 at 18:25, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > Enable runtime PM support by adding proper ops which will handle the
> > > clocks and regulators. These resources will now be handled on power_on and
> > > power_off instead of init and exit PHY ops. Also enable these resources on
> > > probe in order to balance out the disabling that is happening right after.
> > > Prevent runtime PM from being ON by default as well.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-edp.c | 105 ++++++++++++++++++++++++++----------
> > >  1 file changed, 77 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > index da2b32fb5b45..3affeef261bf 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > @@ -192,14 +192,6 @@ static int qcom_edp_phy_init(struct phy *phy)
> > >         int ret;
> > >         u8 cfg8;
> > >
> > > -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > > -       if (ret)
> > > -               return ret;
> > > -
> > > -       ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > > -       if (ret)
> > > -               goto out_disable_supplies;
> > > -
> > >         writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> > >                DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> > >                edp->edp + DP_PHY_PD_CTL);
> > > @@ -246,11 +238,6 @@ static int qcom_edp_phy_init(struct phy *phy)
> > >         msleep(20);
> > >
> > >         return 0;
> > > -
> > > -out_disable_supplies:
> > > -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > > -
> > > -       return ret;
> > >  }
> > >
> > >  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
> > > @@ -721,6 +708,8 @@ static int qcom_edp_phy_power_on(struct phy *phy)
> > >         u32 val;
> > >         u8 cfg1;
> > >
> > > +       pm_runtime_get_sync(&phy->dev);
> > > +
> > >         ret = edp->cfg->ver_ops->com_power_on(edp);
> > >         if (ret)
> > >                 return ret;
> > > @@ -841,6 +830,8 @@ static int qcom_edp_phy_power_off(struct phy *phy)
> > >
> > >         writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
> > >
> > > +       pm_runtime_put(&phy->dev);
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -856,23 +847,12 @@ static int qcom_edp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submod
> > >         return 0;
> > >  }
> > >
> > > -static int qcom_edp_phy_exit(struct phy *phy)
> > > -{
> > > -       struct qcom_edp *edp = phy_get_drvdata(phy);
> > > -
> > > -       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > > -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > > -
> > > -       return 0;
> > > -}
> > > -
> > >  static const struct phy_ops qcom_edp_ops = {
> > >         .init           = qcom_edp_phy_init,
> > >         .configure      = qcom_edp_phy_configure,
> > >         .power_on       = qcom_edp_phy_power_on,
> > >         .power_off      = qcom_edp_phy_power_off,
> > >         .set_mode       = qcom_edp_phy_set_mode,
> > > -       .exit           = qcom_edp_phy_exit,
> > >         .owner          = THIS_MODULE,
> > >  };
> > >
> > > @@ -1036,6 +1016,32 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
> > >         return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
> > >  }
> > >
> > > +static int __maybe_unused qcom_edp_runtime_suspend(struct device *dev)
> > > +{
> > > +       struct qcom_edp *edp = dev_get_drvdata(dev);
> > > +
> > > +       dev_err(dev, "Suspending DP phy\n");
> >
> > Debug leftovers?
>
> Well, I should've made those dev_vdbg instead.
>
> >
> > > +
> > > +       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > > +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int __maybe_unused qcom_edp_runtime_resume(struct device *dev)
> > > +{
> > > +       struct qcom_edp *edp = dev_get_drvdata(dev);
> > > +       int ret;
> > > +
> > > +       dev_err(dev, "Resuming DP phy\n");
> >
> > Debug leftovers?
> >
>
> See above.
>
> > > +
> > > +       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       return clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> >
> > Missing error handling
> >
>
> Yep, will fix.
>
> > > +}
> > > +
> > >  static int qcom_edp_phy_probe(struct platform_device *pdev)
> > >  {
> > >         struct phy_provider *phy_provider;
> > > @@ -1091,20 +1097,57 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
> > >                 return ret;
> > >         }
> > >
> > > -       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> > > -       if (ret)
> > > +       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > > +       if (ret) {
> > > +               dev_err(dev, "failed to enable regulators, err=%d\n", ret);
> > >                 return ret;
> > > +       }
> > > +
> > > +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > > +       if (ret) {
> > > +               dev_err(dev, "failed to enable clocks, err=%d\n", ret);
> > > +               goto err_disable_regulators;
> > > +       }
> >
> > Please use pm_runtime_get_sync() instead().
> >
>
> So let me explain how I thought this through first. This DP PHY is
> usually used on platforms where display is left enabled by the
> bootloader. So doing pm_runtime_get_sync would mean we increment the
> device's usage counter while it is known to be already enabled, even if
> genpd doesn't consider it so. So doing set_active instead would be more
> accurate. Now, for the regulator and clock generic frameworks, that
> seemed OK to do at the time. Now I can see that the same argument can be
> made for those as well. So I'm thinking maybe I just drop the enable
> here and don't do _get_sync, but rather rely on the resume being done
> on power on instead.

Please don't rely on the bootloader. The device should be in the
resumed state when registering clocks. Also devm_pm_runtime_enable()
should also be called before, so that the CCF makes note of PM being
enabled.

>
> > > +
> > > +       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> > > +       if (ret) {
> > > +               dev_err(dev, "failed to register PHY clocks, err=%d\n", ret);
> > > +               goto err_disable_clocks;
> > > +       }
> > >
> > >         edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
> > >         if (IS_ERR(edp->phy)) {
> > >                 dev_err(dev, "failed to register phy\n");
> > > -               return PTR_ERR(edp->phy);
> > > +               ret = PTR_ERR(edp->phy);
> > > +               goto err_disable_clocks;
> > >         }
> > >
> > > +       pm_runtime_set_active(dev);
> > > +       ret = devm_pm_runtime_enable(dev);
> >
> > If this handles earlier, you don't need to call pm_runtime_set_active() manually
> >
>
> Enable and set_active are two separate things. Maybe I'm
> misunderstanding your comment.

Yeah, I wrote something strange here. I meant that if enable is called
earlier and then if the device is resumed, there is no need to call
set_active.

>
> > > +       if (ret)
> > > +               goto err_disable_clocks;
> > > +       /*
> > > +        * Prevent runtime pm from being ON by default. Users can enable
> > > +        * it using power/control in sysfs.
> >
> > why?
> >
>
> OK, so this is a tricky one. If there is any platform out there that
> makes use of this PHY but the resources are not properly described, we
> might get in trouble. So I was thinking that maybe we don't risk that
> but let the user enable it via sysfs. That way, this patch will not
> break by default such platforms.

If the platform doesn't describe resources, it is broken, there is no
need to support it.
>
> Also, this would be in line with the rest of the other Qcom PHYs.

I think it's a bit of a cargo cult. Such code was added in 2018 and
then it was c&p'ed since that time.

>
> > > +        */
> > > +       pm_runtime_forbid(dev);
> > > +
> > > +       dev_set_drvdata(dev, edp);
> > >         phy_set_drvdata(edp->phy, edp);
> > >
> > >         phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > > -       return PTR_ERR_OR_ZERO(phy_provider);
> > > +       if (IS_ERR(phy_provider))
> > > +               goto err_disable_clocks;
> > > +
> > > +       return 0;
> > > +
> > > +err_disable_clocks:
> > > +       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > > +
> > > +err_disable_regulators:
> > > +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> >
> > Ideally this should be handled by pm_runtime. Or at least by pm_runtime_put().
>
> Will drop entirely. Again, lets not enable anything on probe for now.

NAK.

>
> >
> > > +
> > > +       return ret;
> > >  }
> > >
> > >  static const struct of_device_id qcom_edp_phy_match_table[] = {
> > > @@ -1117,10 +1160,16 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
> > >  };
> > >  MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
> > >
> > > +static const struct dev_pm_ops qcom_edp_pm_ops = {
> > > +       SET_RUNTIME_PM_OPS(qcom_edp_runtime_suspend,
> > > +                          qcom_edp_runtime_resume, NULL)
> > > +};
> > > +
> > >  static struct platform_driver qcom_edp_phy_driver = {
> > >         .probe          = qcom_edp_phy_probe,
> > >         .driver = {
> > >                 .name   = "qcom-edp-phy",
> > > +               .pm     = &qcom_edp_pm_ops,
> > >                 .of_match_table = qcom_edp_phy_match_table,
> > >         },
> > >  };
> > >
> > > ---
> > > base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> > > change-id: 20240907-phy-qcom-edp-enable-runtime-pm-6fad07af8947
> > >
> > > Best regards,
> > > --
> > > Abel Vesa <abel.vesa@linaro.org>
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

