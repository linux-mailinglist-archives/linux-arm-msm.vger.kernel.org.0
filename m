Return-Path: <linux-arm-msm+bounces-15391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9BD88EAD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 17:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 477F9B32B3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 15:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E81912E1C9;
	Wed, 27 Mar 2024 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xORqEnHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B412EBE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711552702; cv=none; b=decVmzlcWPSqWFShpMkVOhYwk5ErD874H+7xpQtoWCjbX3PHUnWmORXL+U4Wkb6ddmU5yMONeIM+49byhqhMDrTGd3jDjePFq70slY9V1obn6Xe1HMsbN/GSQyOXJEbLeW8w9U2J5YQloY0aGDm9hddAw6AnCHifP+bbBF4ZItc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711552702; c=relaxed/simple;
	bh=HoUmdYuyO4TXhHzYOArK1IfW06wpBYBpTZDoyHjEXK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3yIP5TxZZL4O6IMDrnDfu5y0VlFWOO4Kdda8QaPvuAtATjWWwNpmwQv0MVG1FzOdxlrSaG4w4YQrQfbBtjpqpowWsLciOnPQ3xj056JeAKsBKD0hJX2xIbAj32JaxuYfl7z8U1lZmzdbko16+FR2Nh3wlgTdiQMaXtKedqACbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xORqEnHL; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so7062517276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711552699; x=1712157499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hJujr9RimFfO2QmiTRr7usgxHtS2vMpREAuBqxXSA/M=;
        b=xORqEnHL/grCqbSkfRzqkD4cK+nGyyodJjbAQVfzprUeDOe2/fw5+Xan3qzdgFlRCe
         9H0rmqsYoSlfmIMqKOTJZV3w2NeIqt5boCwEEa7yrz25cDICmbMeidrEHb+NbFS5nswl
         8UnCOGrXPHCECYey6WLvFgzKN9konNQHb+cV3eUZ3q5YWWudMasU98ULmClLZNreZRAk
         t5snH3EISOraWPKu3BhhkA63MyODfxyngQhisgG66FwqgMF8oExlSinuNyvYK2VswwXm
         SI7hEEZdTK4n4tjzJvHb1LDChGc0fEuraWCu0MyT74sPYlKZZHeGNRTPkjN6VM7/jisn
         ZucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552699; x=1712157499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJujr9RimFfO2QmiTRr7usgxHtS2vMpREAuBqxXSA/M=;
        b=CTtVF3xKLsEIcGcGDEJq0tgcjbZwSm/IT3Culp2VIWfi7q5eIG4Z5hiEKgkg6Fpbbd
         4Bx37/+0xSrakDuLz5dZU/qIb7lhcRQSN0YC79sOIsMokkdCJjfWtnRGk45v89mSaGZL
         RDkZDJnJ9ANKIdZuO6WF8Wjor1blouOXCAl8NqH64jeS02LgGCdAISAd96ehhD0vkmL8
         mBe0iXctHZ6wNTrnU+W6oMPw2PRiEjGog6MC9jDLdXwo4yLRaG6kpS95MbgDId/+dMnV
         d5RzrIdkUsgv5AwiA9GkugHTFP0K3yVrFRjFPiR27I3rBfNU1jYM6ZPak7Pp5/QpwKMP
         XcKg==
X-Forwarded-Encrypted: i=1; AJvYcCWTNBs4ZOtjCCWrtb0JvgJq29rdMNbWosffbXuE0/j2Kdhj3kgUFZrDjcMZOPPZFEObaBUxf/vpOR6lJ7rHZnVe73aIaNbhmBT0jf14WA==
X-Gm-Message-State: AOJu0YzwHyRYDUgqI3k10BI3tHomA5BopVbylrZ4wVLS0g8T6GQuCKgo
	Sr/MSYYnRgh7a08yH2/o4VekZRFAKmMdTHQzL+nmgp9mM/O6kkeeEfkeMe3uqRrUbkzVQYOEwzY
	Q+34LysMEXaPjokLjp8L02gUmYa3zcJFg1ZxBvQ==
X-Google-Smtp-Source: AGHT+IFbbnNsIwN9QIYafUzgy5PDtN8IbI5jwCbt0izw9mxTrfV6JaCm7Lt4CkK8Bmrp2eixisUNCE/8moYMBJZ2dRg=
X-Received: by 2002:a5b:509:0:b0:dc7:4859:6f1 with SMTP id o9-20020a5b0509000000b00dc7485906f1mr99707ybp.33.1711552699663;
 Wed, 27 Mar 2024 08:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-sdhci-mmc-suspend-v1-1-fbc555a64400@8devices.com> <2e712cf6-7521-4c0b-b6fd-76bacc309496@intel.com>
In-Reply-To: <2e712cf6-7521-4c0b-b6fd-76bacc309496@intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Mar 2024 16:17:43 +0100
Message-ID: <CAPDyKFoBgwWDXhcXsbCfBD_nJ=3w1e5eReqHgDQ1BiPf0zJRxw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: pervent access to suspended controller
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Mantas Pucka <mantas@8devices.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
	Pramod Gurav <pramod.gurav@linaro.org>, Ritesh Harjani <ritesh.list@gmail.com>, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 11:25, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 21/03/24 16:30, Mantas Pucka wrote:
> > Generic sdhci code registers LED device and uses host->runtime_suspended
> > flag to protect access to it. The sdhci-msm driver doesn't set this flag,
> > which causes a crash when LED is accessed while controller is runtime
> > suspended. Fix this by setting the flag correctly.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 67e6db113c90 ("mmc: sdhci-msm: Add pm_runtime and system PM support")
> > Signed-off-by: Mantas Pucka <mantas@8devices.com>
>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Looks like this problem may exist for other sdhci drivers too. In
particular for those that enables runtime PM, don't set
SDHCI_QUIRK_NO_LED and don't use sdhci_runtime|suspend_resume_host().

Don't know if there is a better way to address this, if not on a case
by case basis. Do you have any thoughts about this?

Kind regards
Uffe

>
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index 668e0aceeeba..e113b99a3eab 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -2694,6 +2694,11 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
> >       struct sdhci_host *host = dev_get_drvdata(dev);
> >       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> >       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&host->lock, flags);
> > +     host->runtime_suspended = true;
> > +     spin_unlock_irqrestore(&host->lock, flags);
> >
> >       /* Drop the performance vote */
> >       dev_pm_opp_set_rate(dev, 0);
> > @@ -2708,6 +2713,7 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
> >       struct sdhci_host *host = dev_get_drvdata(dev);
> >       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> >       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > +     unsigned long flags;
> >       int ret;
> >
> >       ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
> > @@ -2726,7 +2732,15 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
> >
> >       dev_pm_opp_set_rate(dev, msm_host->clk_rate);
> >
> > -     return sdhci_msm_ice_resume(msm_host);
> > +     ret = sdhci_msm_ice_resume(msm_host);
> > +     if (ret)
> > +             return ret;
> > +
> > +     spin_lock_irqsave(&host->lock, flags);
> > +     host->runtime_suspended = false;
> > +     spin_unlock_irqrestore(&host->lock, flags);
> > +
> > +     return ret;
> >  }
> >
> >  static const struct dev_pm_ops sdhci_msm_pm_ops = {
> >
> > ---
> > base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> > change-id: 20240321-sdhci-mmc-suspend-34f4af1d0286
> >
> > Best regards,
>

