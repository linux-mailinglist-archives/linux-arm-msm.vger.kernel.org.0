Return-Path: <linux-arm-msm+bounces-9242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C26843F36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 13:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4132834D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 12:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7C978680;
	Wed, 31 Jan 2024 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aF2KQPn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984087866F
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706703159; cv=none; b=ELU7sclD346QdR+vFJ8efGHSoab3vJf8dpk/BiuTXpu4wKCrEkLhv3JiLbc0sdtQg88qm56dHpprIOqz7HbwAJqwd2wBhWRyOzlHBiqkwZsOZbV9pqj5w3GXu7Qxs4und8UqOUU40I3/y7SeyAlYDfG0JgY6sh93oj//ZAc5Wq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706703159; c=relaxed/simple;
	bh=/wVA/4AFAw4JgOYNgYRJpbRJX3HBAQ0JInxifG3k/Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXIaGvwP5rDNJa8WEnLtnHDzUjy+K56v6tOTKe3EYFxd6zemysbabKN1b9Mjef/3NiAywKEEsmq6HJlh+L7XqR+9p0lj7rLX7R1FhxAhvAlg7RB1CT+xY2gjW8yZvJDD2wIP0xIJ1V4udDdAXs7uT9JZnQuIMw0jd9CLINSflSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aF2KQPn2; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6040e7ebf33so3134467b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 04:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706703156; x=1707307956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=saoJoK9zStSfMj3STxg2WdyLizENiKtg2wNhGKTv28w=;
        b=aF2KQPn2T7Z+qBYWgxZRVcdF8BwDapLvSGAjGUQZkETdjabKy67dop89KfZ0y4Me2T
         up7l1HlMyL+/ucZ4GJEmrLkn8PyeU78/Sl0K092XVz7VhmEKts7tmyv40RZE7idTgFqI
         pWdqz7EQeBNEHUXvS3T/+fwxeyHn0PXutFYu6zIXdXBgL6X4vwWwQTjTpj4UdMkMROGJ
         mrdcfZaAGVMUcDo1rcOSG9vXQcEWeFcXvNIxEphvqVTtcJAXvwkW//beAgiTS7hIrIDJ
         g9/y96JGGe5Tw0iycfFlLcRnd3qtXyawucs1H2zH4/ZEXYuw+OWd8Q/lx2FjB0H0vYuo
         PFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706703156; x=1707307956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saoJoK9zStSfMj3STxg2WdyLizENiKtg2wNhGKTv28w=;
        b=WLToxkAdJ80ZOk6YTAH8OsE1OkH1f30xC/6DDBzr/tv6yOr/pg5DQx5UsnmpDufakC
         Ij8h3IC6GqsuswgzNBKIkcWg6iBx+9MShkF1/q6qGp0oZvgenEfpnE8rln2CiByDOsw2
         7Cfq0+Sdi95A2LV9tcaqT1XQllWCPfBOE4iTCArBBMZz91s7O59UHHAGxOTRtX22coJ8
         EkgiF8IPLhYXzVgxgzwDIF5QwsomiE6nx7EoJv9M+H6GtfebACQYnTCrrosugOU2Y7IZ
         JRxX+l1iQH3M9iuWQdQR6SLYqZobpeGfeo/A2EBdvoWdgLX4aFa7wiT5U6btXfhSinF5
         uBhg==
X-Gm-Message-State: AOJu0Yx2rvs/yEx5DseoC/hH+/CA4O2J8u+p91/gCMYKIX79aGtOEsO/
	ptpSHiSTuHv/0SAbAsRq63u02x3iLdJKs7Wdzca3uwNKBanlbV+GoUkDybiuOe11Jtvh0H9nd3w
	OCV8KQLUMxvIg75JiXpAMffNEB/t9OhknC2Fdxw==
X-Google-Smtp-Source: AGHT+IHyahz3e4s2n42YdMrUWKGK11tElif28yCW0pIcplk+tuCLctSvZ9MyE7xh0xkmoOSg5CSw+arOO7LUGqKd/7A=
X-Received: by 2002:a81:a0c3:0:b0:604:fd3:e656 with SMTP id
 x186-20020a81a0c3000000b006040fd3e656mr453925ywg.19.1706703156500; Wed, 31
 Jan 2024 04:12:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org>
 <20240122-gdsc-hwctrl-v4-1-9061e8a7aa07@linaro.org> <tax3c6o5qjegy6tv3zbgrd5rencfvypr3zg7twxfrmdngscp74@n44ei3q63g64>
In-Reply-To: <tax3c6o5qjegy6tv3zbgrd5rencfvypr3zg7twxfrmdngscp74@n44ei3q63g64>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 31 Jan 2024 13:12:00 +0100
Message-ID: <CAPDyKFpdtrWbzNksLoY++aOY7Ltyt1HhtLZo8bj8sQ05-4Sq0g@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] PM: domains: Allow devices attached to genpd to be
 managed by HW
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 02:09, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Jan 22, 2024 at 10:47:01AM +0200, Abel Vesa wrote:
> > From: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > Some power-domains may be capable of relying on the HW to control the power
> > for a device that's hooked up to it. Typically, for these kinds of
> > configurations the consumer driver should be able to change the behavior of
> > power domain at runtime, control the power domain in SW mode for certain
> > configurations and handover the control to HW mode for other usecases.
> >
> > To allow a consumer driver to change the behaviour of the PM domain for its
> > device, let's provide a new function, dev_pm_genpd_set_hwmode(). Moreover,
> > let's add a corresponding optional genpd callback, ->set_hwmode_dev(),
> > which the genpd provider should implement if it can support switching
> > between HW controlled mode and SW controlled mode. Similarly, add the
> > dev_pm_genpd_get_hwmode() to allow consumers to read the current mode and
> > its corresponding optional genpd callback, ->get_hwmode_dev(), which the
> > genpd provider can also implement for reading back the mode from the
> > hardware.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/pmdomain/core.c   | 69 +++++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_domain.h | 17 ++++++++++++
> >  2 files changed, 86 insertions(+)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index a1f6cba3ae6c..41b6411d0ef5 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -548,6 +548,75 @@ void dev_pm_genpd_synced_poweroff(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(dev_pm_genpd_synced_poweroff);
> >
> > +/**
> > + * dev_pm_genpd_set_hwmode - Set the HW mode for the device and its PM domain.
>
> This isn't proper kernel-doc

Sorry, I didn't quite get that. What is wrong?

>
> > + *
> > + * @dev: Device for which the HW-mode should be changed.
> > + * @enable: Value to set or unset the HW-mode.
> > + *
> > + * Some PM domains can rely on HW signals to control the power for a device. To
> > + * allow a consumer driver to switch the behaviour for its device in runtime,
> > + * which may be beneficial from a latency or energy point of view, this function
> > + * may be called.
> > + *
> > + * It is assumed that the users guarantee that the genpd wouldn't be detached
> > + * while this routine is getting called.
> > + *
> > + * Returns 0 on success and negative error values on failures.
> > + */
> > +int dev_pm_genpd_set_hwmode(struct device *dev, bool enable)
> > +{
> > +     struct generic_pm_domain *genpd;
> > +     int ret = 0;
> > +
> > +     genpd = dev_to_genpd_safe(dev);
> > +     if (!genpd)
> > +             return -ENODEV;
> > +
> > +     if (!genpd->set_hwmode_dev)
> > +             return -EOPNOTSUPP;
> > +
> > +     genpd_lock(genpd);
> > +
> > +     if (dev_gpd_data(dev)->hw_mode == enable)
>
> Between this and the gdsc patch, the hw_mode state might not match the
> hardware state at boot.
>
> With hw_mode defaulting to false, your first dev_pm_genpd_set_hwmode(,
> false) will not bring control to SW - which might be fatal.

Right, good point.

I think we have two ways to deal with this:
1) If the provider is supporting ->get_hwmode_dev(), we can let
genpd_add_device() invoke it to synchronize the state.
2) If the provider doesn't support ->get_hwmode_dev() we need to call
->set_hwmode_dev() to allow an initial state to be set.

The question is then, if we need to allow ->get_hwmode_dev() to be
optional, if the ->set_hwmode_dev() is supported - or if we can
require it. What's your thoughts around this?

Kind regards
Uffe

