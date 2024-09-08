Return-Path: <linux-arm-msm+bounces-31220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4195997092B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 20:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E87B2281C3D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 18:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29D5175D50;
	Sun,  8 Sep 2024 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OP/K6lA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E116D4E5
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Sep 2024 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725819163; cv=none; b=eIwrW1PNY2pP851B5EpdOE1JMvfNhQ5temDwxgZz4fVDtq8rRRfd/tpRAgegN+T9uUuATOpZtUBTaYfEzOW87Q0OZpDk0YU1s2mYgQh7NzeF5j3buvvwVIu1bEBjTaJ7H5NPidhIKj6n+31rOHHxqP8OAZaRfmvsqQZqbaZRKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725819163; c=relaxed/simple;
	bh=pAlcQ1Gnpb2CK8FeyRxSYjzPAIE1VSrVqPgTmByThbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBVkVoEb5KTOC+Lb+UJvyuVJoe3/yyTw4FC4LV2S+ZPtdlpJCtiB8Be6a8bt1Hnt9U9A2rhuCbSMiYJEzJMi09mvxVP2Q2wjrKcdxj8piBjuR9lox5eDI1aii1tSXrl+BSWr124nQH4JSynorB2C4UyMS+UuRWXs/szdbukHsHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OP/K6lA1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c3d209db94so3785577a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Sep 2024 11:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725819160; x=1726423960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLpbA80LmxTHG9gW0hEcEP8bDOpNZeMU9QCy58Ejxfk=;
        b=OP/K6lA169yW9D007vfr+O/65uPNnceNAWG0D4OqHmvMe/9ydeEiybwThkLo74F4k5
         FfFfQXCYIVtAfZxRFuF8DZygsEc/zwHJe+xPs6ITIQnYz5Q6lCuqaqDnIyj82DdNbz1O
         PZ7xOo6LOHV4OZmZU591CK0nY6FJuEQ1/krSxGg7Tuvud3iO/760ksFAHRfQHfx+qrtK
         16RKbFEcS0Hgw2SPvvP3Wp5TCXMYRq9/PPdu97rfwxs6tz87dGPymQ3ksJ+lD15m2Nhj
         jIXkFQpJ4kOHCeUTPfQMSgC7XgJiRr+W+bagVGxyA93zk7H5nGeb73UuWzykL4ZyBRnQ
         fR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725819160; x=1726423960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLpbA80LmxTHG9gW0hEcEP8bDOpNZeMU9QCy58Ejxfk=;
        b=wCwPerv9LAsNiNe63sVoLjOvb4bXKbK3wQigu3xkM4J4y+2RFKLDUBSwNct3rt1/94
         Ycxcp+Iksald4GROjQOhpSvQYLsI9dIMCbFfnRB2dSSPeSnGyp0ytTb/3Z2WCKfBsH7q
         jE7ESJ2nQLbEzBsZzvOuqa+mBUUkoggz3LEHc8OGUkLCvnPp/JV78DFQM3RDFGr+0+jc
         uDSr5ZlZX2lTxzhtNXl5290lIe60hFzmtKC2+niKqLwqZlNNMYuPbzxydPeX7cd8D3f1
         jE5QhV/v/j+metqZCGllGGjcYsFRB/5geOFEjFilQX5HgrJpYsq99U+ap/GPm1Z1oDgW
         WAXA==
X-Forwarded-Encrypted: i=1; AJvYcCXvlkdyCvQTBoB1xAV2BHRokJrMB6aW9bTKshUtuLcmNK1EP5t17Xi5yB81upVbnB7ViqWZ42axi/gPWR7n@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYHjQ63AitQ6xFcWjDzupy1llogaNIkMVbW6S+A6HT40r+u6G
	OKIGqUVwiIfKpaqFZGZWd2TP45TvAxM50uhMZ9Sva3h+66V3AKAhO5ug76YRKvU=
X-Google-Smtp-Source: AGHT+IGZmYxgGiI70T7NWs+HoEGWThK7q03OcDCcCbtJuh4T+au00Xa5qZUqzPdTJml0KnkDuhKByQ==
X-Received: by 2002:a05:6402:4020:b0:5c3:c548:bb25 with SMTP id 4fb4d7f45d1cf-5c3e964ccc4mr4692004a12.23.1725819158955;
        Sun, 08 Sep 2024 11:12:38 -0700 (PDT)
Received: from linaro.org ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd8cc28sm2094903a12.83.2024.09.08.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 11:12:38 -0700 (PDT)
Date: Sun, 8 Sep 2024 21:12:37 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
Message-ID: <Zt3pFdndtTw/nbgs@linaro.org>
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
 <CAA8EJpqw6pB4d_zQyYdhq9_prLnh+mLMdRSzJ+5EvAjT9wi86A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqw6pB4d_zQyYdhq9_prLnh+mLMdRSzJ+5EvAjT9wi86A@mail.gmail.com>

On 24-09-07 20:52:14, Dmitry Baryshkov wrote:
> On Sat, 7 Sept 2024 at 18:25, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Enable runtime PM support by adding proper ops which will handle the
> > clocks and regulators. These resources will now be handled on power_on and
> > power_off instead of init and exit PHY ops. Also enable these resources on
> > probe in order to balance out the disabling that is happening right after.
> > Prevent runtime PM from being ON by default as well.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 105 ++++++++++++++++++++++++++----------
> >  1 file changed, 77 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > index da2b32fb5b45..3affeef261bf 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > @@ -192,14 +192,6 @@ static int qcom_edp_phy_init(struct phy *phy)
> >         int ret;
> >         u8 cfg8;
> >
> > -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > -       if (ret)
> > -               return ret;
> > -
> > -       ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > -       if (ret)
> > -               goto out_disable_supplies;
> > -
> >         writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> >                DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> >                edp->edp + DP_PHY_PD_CTL);
> > @@ -246,11 +238,6 @@ static int qcom_edp_phy_init(struct phy *phy)
> >         msleep(20);
> >
> >         return 0;
> > -
> > -out_disable_supplies:
> > -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > -
> > -       return ret;
> >  }
> >
> >  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
> > @@ -721,6 +708,8 @@ static int qcom_edp_phy_power_on(struct phy *phy)
> >         u32 val;
> >         u8 cfg1;
> >
> > +       pm_runtime_get_sync(&phy->dev);
> > +
> >         ret = edp->cfg->ver_ops->com_power_on(edp);
> >         if (ret)
> >                 return ret;
> > @@ -841,6 +830,8 @@ static int qcom_edp_phy_power_off(struct phy *phy)
> >
> >         writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
> >
> > +       pm_runtime_put(&phy->dev);
> > +
> >         return 0;
> >  }
> >
> > @@ -856,23 +847,12 @@ static int qcom_edp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submod
> >         return 0;
> >  }
> >
> > -static int qcom_edp_phy_exit(struct phy *phy)
> > -{
> > -       struct qcom_edp *edp = phy_get_drvdata(phy);
> > -
> > -       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > -
> > -       return 0;
> > -}
> > -
> >  static const struct phy_ops qcom_edp_ops = {
> >         .init           = qcom_edp_phy_init,
> >         .configure      = qcom_edp_phy_configure,
> >         .power_on       = qcom_edp_phy_power_on,
> >         .power_off      = qcom_edp_phy_power_off,
> >         .set_mode       = qcom_edp_phy_set_mode,
> > -       .exit           = qcom_edp_phy_exit,
> >         .owner          = THIS_MODULE,
> >  };
> >
> > @@ -1036,6 +1016,32 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
> >         return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
> >  }
> >
> > +static int __maybe_unused qcom_edp_runtime_suspend(struct device *dev)
> > +{
> > +       struct qcom_edp *edp = dev_get_drvdata(dev);
> > +
> > +       dev_err(dev, "Suspending DP phy\n");
> 
> Debug leftovers?

Well, I should've made those dev_vdbg instead. 

> 
> > +
> > +       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused qcom_edp_runtime_resume(struct device *dev)
> > +{
> > +       struct qcom_edp *edp = dev_get_drvdata(dev);
> > +       int ret;
> > +
> > +       dev_err(dev, "Resuming DP phy\n");
> 
> Debug leftovers?
> 

See above.

> > +
> > +       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> 
> Missing error handling
> 

Yep, will fix.

> > +}
> > +
> >  static int qcom_edp_phy_probe(struct platform_device *pdev)
> >  {
> >         struct phy_provider *phy_provider;
> > @@ -1091,20 +1097,57 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
> >                 return ret;
> >         }
> >
> > -       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> > -       if (ret)
> > +       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > +       if (ret) {
> > +               dev_err(dev, "failed to enable regulators, err=%d\n", ret);
> >                 return ret;
> > +       }
> > +
> > +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > +       if (ret) {
> > +               dev_err(dev, "failed to enable clocks, err=%d\n", ret);
> > +               goto err_disable_regulators;
> > +       }
> 
> Please use pm_runtime_get_sync() instead().
> 

So let me explain how I thought this through first. This DP PHY is
usually used on platforms where display is left enabled by the
bootloader. So doing pm_runtime_get_sync would mean we increment the
device's usage counter while it is known to be already enabled, even if
genpd doesn't consider it so. So doing set_active instead would be more
accurate. Now, for the regulator and clock generic frameworks, that
seemed OK to do at the time. Now I can see that the same argument can be
made for those as well. So I'm thinking maybe I just drop the enable
here and don't do _get_sync, but rather rely on the resume being done
on power on instead. 

> > +
> > +       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> > +       if (ret) {
> > +               dev_err(dev, "failed to register PHY clocks, err=%d\n", ret);
> > +               goto err_disable_clocks;
> > +       }
> >
> >         edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
> >         if (IS_ERR(edp->phy)) {
> >                 dev_err(dev, "failed to register phy\n");
> > -               return PTR_ERR(edp->phy);
> > +               ret = PTR_ERR(edp->phy);
> > +               goto err_disable_clocks;
> >         }
> >
> > +       pm_runtime_set_active(dev);
> > +       ret = devm_pm_runtime_enable(dev);
> 
> If this handles earlier, you don't need to call pm_runtime_set_active() manually
> 

Enable and set_active are two separate things. Maybe I'm
misunderstanding your comment.

> > +       if (ret)
> > +               goto err_disable_clocks;
> > +       /*
> > +        * Prevent runtime pm from being ON by default. Users can enable
> > +        * it using power/control in sysfs.
> 
> why?
> 

OK, so this is a tricky one. If there is any platform out there that
makes use of this PHY but the resources are not properly described, we
might get in trouble. So I was thinking that maybe we don't risk that
but let the user enable it via sysfs. That way, this patch will not
break by default such platforms.

Also, this would be in line with the rest of the other Qcom PHYs.

> > +        */
> > +       pm_runtime_forbid(dev);
> > +
> > +       dev_set_drvdata(dev, edp);
> >         phy_set_drvdata(edp->phy, edp);
> >
> >         phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > -       return PTR_ERR_OR_ZERO(phy_provider);
> > +       if (IS_ERR(phy_provider))
> > +               goto err_disable_clocks;
> > +
> > +       return 0;
> > +
> > +err_disable_clocks:
> > +       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > +
> > +err_disable_regulators:
> > +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> 
> Ideally this should be handled by pm_runtime. Or at least by pm_runtime_put().

Will drop entirely. Again, lets not enable anything on probe for now.

> 
> > +
> > +       return ret;
> >  }
> >
> >  static const struct of_device_id qcom_edp_phy_match_table[] = {
> > @@ -1117,10 +1160,16 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
> >
> > +static const struct dev_pm_ops qcom_edp_pm_ops = {
> > +       SET_RUNTIME_PM_OPS(qcom_edp_runtime_suspend,
> > +                          qcom_edp_runtime_resume, NULL)
> > +};
> > +
> >  static struct platform_driver qcom_edp_phy_driver = {
> >         .probe          = qcom_edp_phy_probe,
> >         .driver = {
> >                 .name   = "qcom-edp-phy",
> > +               .pm     = &qcom_edp_pm_ops,
> >                 .of_match_table = qcom_edp_phy_match_table,
> >         },
> >  };
> >
> > ---
> > base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> > change-id: 20240907-phy-qcom-edp-enable-runtime-pm-6fad07af8947
> >
> > Best regards,
> > --
> > Abel Vesa <abel.vesa@linaro.org>
> >
> 
> 
> -- 
> With best wishes
> Dmitry

