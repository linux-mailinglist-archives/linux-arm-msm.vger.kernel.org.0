Return-Path: <linux-arm-msm+bounces-31223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A633497094D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 20:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B3F21F21192
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 18:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215A3175D2F;
	Sun,  8 Sep 2024 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K7zfNxR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF041531F9
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Sep 2024 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725821729; cv=none; b=FolgAa23krLBJRRy1RAeKdXeNU7RaD84NjbSeQ/Xe4NmNbtQAzniHFh1ZUlnWpqH5YJUkvCTbZp828+45hZLiCLEbZSFYuozclaTa54wZ1gMJfLbRgimXndDXDskRvktpxE/72+iVCq6Pyy/GeKWNZDHTPo9qZ/8G18JD9zwqLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725821729; c=relaxed/simple;
	bh=1/3Q6ZHOxGza3tyCQKF+hUivViClPMnF5pw3ko1ZF/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbWdjaH1CniLcaEnJCxUTmwOrspuK94q4Bx5F2vMqtkBXPxV6R+L13ATEldjLlcjRuwMz9IYXyVaKKvd/vyBBdsgtB3PHR3tRIVp1cda3/fwuaJzEy/7Rr7S8xh8ehN49b32IqVhaax6TwQw8QaJaKEDty9X4Ioor38ju8lFSco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K7zfNxR/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a83597ce5beso594455166b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Sep 2024 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725821725; x=1726426525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZqIGddUBas03ff3I6BsSNqLWw68X6NTJ5NUnBgSAJs=;
        b=K7zfNxR/qQYdX2d4JfVltBFWA3IfPd/dXngK/VvpI5DZLHV7+JwCkP6YbBRcS9ntab
         M3/KHcf/EwhD+b+iplDhoA9prWFNUWIrv5K4h8h3Ir5EfsFv/eKVYU6ETRRCYo5Hb8Qp
         ExSzgGixTDCCdzEeoHLAmRUopNSpq1bcVVO4/CPf5pqePf4fk3ufywwrCAf5iJheFvj8
         SDfR3uhm7GqKjPrD3X+UtFPj7Uwug7tzZJkSWMSujOym8yFv6l1yxXCtEgTxJ5GYBHwz
         0hHuOGz4Lx+hBhm6jeZkQBkJEMP87xSdbdN8XxBIj5Em1U2T1JRYoNcAatd2KaZ96gBi
         HmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725821725; x=1726426525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZqIGddUBas03ff3I6BsSNqLWw68X6NTJ5NUnBgSAJs=;
        b=VxoWLCuwnVl6MHmgAwLqqgzJKY87fclViOw0zCMdTsJc3j9Amp7n8lGdT+R9bL87vW
         f1qCQJ1LeMtsiloRYJeXzMmNunM3UarYffdaCo5ACLAhputRp2ulu+5zUf0h5zD0V0Sv
         AIg+D0a4QsSrDdXjexqLiZQNJ+qEDmqcEYmbn2QV5VYgZW+XwF0x332FQE6GV/BQov+f
         M5XT053NoK5mclorgQjKYQ0f50NA/o8iNeyhid9AWOQAOFu6/KwlyD1KmYTib2lEeTM8
         uqB8FdfTOt7QQRFc69G+Rj0hJQq84PtTGlRPjEHzOR5AN1GgYDUE9dKR82I+YRa6fSrh
         hjSw==
X-Forwarded-Encrypted: i=1; AJvYcCUPpT7lD2PIdNmF8KXHy8LwX28b9DNmci6Bs0MAZTUp/yPmUPzGrYuukUK/6CFOkWM2UY2V7EvnVrvelu2G@vger.kernel.org
X-Gm-Message-State: AOJu0YzIcOitjkYoSatsuJNLkL1K/LlqjGqN2exJmdRNZaFNfIfSmjLW
	BiVMl/DqajxpELl490WGegAKqSBbV77JVkb/SiDxWfE9x+sAjpkimrBZv4TXD/1rccwW4B54zrn
	U
X-Google-Smtp-Source: AGHT+IETZqM2pc1rLuzoyDSyX/OFqGWUSsTan/jxSxZruPDYvwhZl5X8EVMtgIHXYzE+I2N7GQc1qw==
X-Received: by 2002:a17:907:3da4:b0:a80:c0ed:2145 with SMTP id a640c23a62f3a-a8a85f2ee3dmr874155266b.2.1725821724657;
        Sun, 08 Sep 2024 11:55:24 -0700 (PDT)
Received: from linaro.org ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c73c00sm236188466b.101.2024.09.08.11.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 11:55:24 -0700 (PDT)
Date: Sun, 8 Sep 2024 21:55:22 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
Message-ID: <Zt3zGg6VhZJ7qdgz@linaro.org>
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
 <CAA8EJpqw6pB4d_zQyYdhq9_prLnh+mLMdRSzJ+5EvAjT9wi86A@mail.gmail.com>
 <Zt3pFdndtTw/nbgs@linaro.org>
 <CAA8EJppTp5S1L-rHKDW58uXQO08p6o=aNbE3kA9UjVKZsyJ-Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppTp5S1L-rHKDW58uXQO08p6o=aNbE3kA9UjVKZsyJ-Jw@mail.gmail.com>

On 24-09-08 21:43:01, Dmitry Baryshkov wrote:
> On Sun, 8 Sept 2024 at 21:12, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-09-07 20:52:14, Dmitry Baryshkov wrote:
> > > On Sat, 7 Sept 2024 at 18:25, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > >
> > > > Enable runtime PM support by adding proper ops which will handle the
> > > > clocks and regulators. These resources will now be handled on power_on and
> > > > power_off instead of init and exit PHY ops. Also enable these resources on
> > > > probe in order to balance out the disabling that is happening right after.
> > > > Prevent runtime PM from being ON by default as well.
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-edp.c | 105 ++++++++++++++++++++++++++----------
> > > >  1 file changed, 77 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > > index da2b32fb5b45..3affeef261bf 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c

[...]

> > > > +}
> > > > +
> > > >  static int qcom_edp_phy_probe(struct platform_device *pdev)
> > > >  {
> > > >         struct phy_provider *phy_provider;
> > > > @@ -1091,20 +1097,57 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
> > > >                 return ret;
> > > >         }
> > > >
> > > > -       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> > > > -       if (ret)
> > > > +       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > > > +       if (ret) {
> > > > +               dev_err(dev, "failed to enable regulators, err=%d\n", ret);
> > > >                 return ret;
> > > > +       }
> > > > +
> > > > +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > > > +       if (ret) {
> > > > +               dev_err(dev, "failed to enable clocks, err=%d\n", ret);
> > > > +               goto err_disable_regulators;
> > > > +       }
> > >
> > > Please use pm_runtime_get_sync() instead().
> > >
> >
> > So let me explain how I thought this through first. This DP PHY is
> > usually used on platforms where display is left enabled by the
> > bootloader. So doing pm_runtime_get_sync would mean we increment the
> > device's usage counter while it is known to be already enabled, even if
> > genpd doesn't consider it so. So doing set_active instead would be more
> > accurate. Now, for the regulator and clock generic frameworks, that
> > seemed OK to do at the time. Now I can see that the same argument can be
> > made for those as well. So I'm thinking maybe I just drop the enable
> > here and don't do _get_sync, but rather rely on the resume being done
> > on power on instead.
> 
> Please don't rely on the bootloader. The device should be in the
> resumed state when registering clocks. Also devm_pm_runtime_enable()
> should also be called before, so that the CCF makes note of PM being
> enabled.

Fair enough. Will do that.

> 
> >
> > > > +
> > > > +       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> > > > +       if (ret) {
> > > > +               dev_err(dev, "failed to register PHY clocks, err=%d\n", ret);
> > > > +               goto err_disable_clocks;
> > > > +       }
> > > >
> > > >         edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
> > > >         if (IS_ERR(edp->phy)) {
> > > >                 dev_err(dev, "failed to register phy\n");
> > > > -               return PTR_ERR(edp->phy);
> > > > +               ret = PTR_ERR(edp->phy);
> > > > +               goto err_disable_clocks;
> > > >         }
> > > >
> > > > +       pm_runtime_set_active(dev);
> > > > +       ret = devm_pm_runtime_enable(dev);
> > >
> > > If this handles earlier, you don't need to call pm_runtime_set_active() manually
> > >
> >
> > Enable and set_active are two separate things. Maybe I'm
> > misunderstanding your comment.
> 
> Yeah, I wrote something strange here. I meant that if enable is called
> earlier and then if the device is resumed, there is no need to call
> set_active.

I guess you meant "that if _get_sync is called earlier and then ...", right?
Enable won't resume it.

> 
> >
> > > > +       if (ret)
> > > > +               goto err_disable_clocks;
> > > > +       /*
> > > > +        * Prevent runtime pm from being ON by default. Users can enable
> > > > +        * it using power/control in sysfs.
> > >
> > > why?
> > >
> >
> > OK, so this is a tricky one. If there is any platform out there that
> > makes use of this PHY but the resources are not properly described, we
> > might get in trouble. So I was thinking that maybe we don't risk that
> > but let the user enable it via sysfs. That way, this patch will not
> > break by default such platforms.
> 
> If the platform doesn't describe resources, it is broken, there is no
> need to support it.
> >
> > Also, this would be in line with the rest of the other Qcom PHYs.
> 
> I think it's a bit of a cargo cult. Such code was added in 2018 and
> then it was c&p'ed since that time.

OK, will drop it.

> 
> >
> > > > +        */
> > > > +       pm_runtime_forbid(dev);
> > > > +
> > > > +       dev_set_drvdata(dev, edp);
> > > >         phy_set_drvdata(edp->phy, edp);
> > > >
> > > >         phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > > > -       return PTR_ERR_OR_ZERO(phy_provider);
> > > > +       if (IS_ERR(phy_provider))
> > > > +               goto err_disable_clocks;
> > > > +
> > > > +       return 0;
> > > > +
> > > > +err_disable_clocks:
> > > > +       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > > > +
> > > > +err_disable_regulators:
> > > > +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > >
> > > Ideally this should be handled by pm_runtime. Or at least by pm_runtime_put().
> >
> > Will drop entirely. Again, lets not enable anything on probe for now.
> 
> NAK.

OK, your argument above about the registering of clocks needing the
PHY resumed makes sense. Will do _get_sync on probe.


