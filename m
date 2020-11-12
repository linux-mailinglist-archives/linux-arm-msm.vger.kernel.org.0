Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4592B051E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 13:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgKLMoT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 07:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgKLMoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 07:44:19 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E073DC0613D1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 04:44:18 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id w145so6196813oie.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 04:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=03E0bNVNK4Y3y+OxMPgawMwEP2YPQ9Exbd3NfJENI2M=;
        b=p5O7DGdkUmmz643hKudZkjePrSC+QmrCMAbMLweY2xgOb+bhVks7KPefpThoFpnaq2
         TwZWXjHpJbEPS2Wg4JJRWtVGb4S1s6d02xJuZlUMVYNJ/Zy2pJcpjbTCs3REjE5R9icu
         IXTETytMgZImlpJM2Dpyc7Mkbdrb3AJECFdj1R4iKrOiolVvCgtHLue/IQLm4co7Q/cq
         EsKlT0OYRbxwmilRmjdd6ESKMREE6GfZi81+65B0pD/vbzUD9Hzb7dQrTpfsvJhZ4DX5
         EwWx7rnfeXMmz9MTWkSeyefVBzZ36GrdlQrY/88qxSKLo6ADdKxqTXsuBk4gUlO45XSO
         zVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03E0bNVNK4Y3y+OxMPgawMwEP2YPQ9Exbd3NfJENI2M=;
        b=fRW+hg6RU0OdQnplVhpFZ7wiID30zom1H7UQ92K0x6drPWlAVz7O6mNv1BVhSpaqya
         Bc/hzLmdLSWmb2GMB4SBALxP5IqiXDHtPWkYsdadiU3LX4Ke7DyHkUxCTzpYZ5Zlex7O
         xy//AvRUcKc+5usS/0F1mBRwZP6pkHjWb99F+MCAvpeLtCmNsH2hHnYDsDOdpaSOxGNg
         UqrVimXn2gxQTGW6P6eVselwWclV1n8053fn1O/D+mx5hl6pVJAyCbILMfwrlSoKFcvE
         BXolZoqldNWdlqyAZttUItj4MznfFGTcwVKW3RWf7IotsIcVv2js5GmWjsPtamsHgfI1
         gAvQ==
X-Gm-Message-State: AOAM530dZ2RByVtFcuDwIFMJ8tM4Jh5xltBk1D/i/1Uev3UxPrxEGuhy
        8CsS77wb2T34Agzcl1tETB046tC0SanZDzjZS05woQ==
X-Google-Smtp-Source: ABdhPJx3FVXzIOqDDXV13Unq+2x79nN/M39R/qvSoRh+lgHocAbHgG/95t34bR7QcS7b8mdZCML2vasnH63bbL4eYfc=
X-Received: by 2002:aca:b145:: with SMTP id a66mr5713510oif.92.1605185058346;
 Thu, 12 Nov 2020 04:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20201111220122.2392823-1-dmitry.baryshkov@linaro.org> <b1cd32a4-64ea-2322-985a-219083671e4b@codeaurora.org>
In-Reply-To: <b1cd32a4-64ea-2322-985a-219083671e4b@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 12 Nov 2020 15:44:07 +0300
Message-ID: <CAA8EJpomFZuVy+V40y=M1Kuboc4XPGXJcQqeAOPNei=sK8zUZA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: detect if tassadar_dll is used by using
 core version
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 Nov 2020 at 08:59, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
>
> On 11/12/2020 3:31 AM, Dmitry Baryshkov wrote:
> > Detect if tassadar_dll is required by using core version rather than
> > just specifying it in the sdhci_msm_variant_info.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> > ---
> >   drivers/mmc/host/sdhci-msm.c | 15 +++++----------
> >   1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index 3451eb325513..dd67acab1660 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -248,7 +248,6 @@ struct sdhci_msm_variant_ops {
> >   struct sdhci_msm_variant_info {
> >       bool mci_removed;
> >       bool restore_dll_config;
> > -     bool uses_tassadar_dll;
> >       const struct sdhci_msm_variant_ops *var_ops;
> >       const struct sdhci_msm_offset *offset;
> >   };
> > @@ -2154,18 +2153,11 @@ static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
> >       .offset = &sdhci_msm_v5_offset,
> >   };
> >
> > -static const struct sdhci_msm_variant_info sm8250_sdhci_var = {
> > -     .mci_removed = true,
> > -     .uses_tassadar_dll = true,
> > -     .var_ops = &v5_var_ops,
> > -     .offset = &sdhci_msm_v5_offset,
> > -};
> > -
> >   static const struct of_device_id sdhci_msm_dt_match[] = {
> >       {.compatible = "qcom,sdhci-msm-v4", .data = &sdhci_msm_mci_var},
> >       {.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
> >       {.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
> > -     {.compatible = "qcom,sm8250-sdhci", .data = &sm8250_sdhci_var},
> > +     {.compatible = "qcom,sm8250-sdhci", .data = &sdm845_sdhci_var},
> Since you have made it 'uses_tassadar_dll' check generic,
> SM8250 should work with default compatible string (qcom,sdhci-msm-v5).
> We can drop the entry to SM8250 from this table.

Does SM8250 need restore_dll_config like sdm845/sc7180?

> >       {.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
> >       {},
> >   };
> > @@ -2249,7 +2241,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> >       msm_host->restore_dll_config = var_info->restore_dll_config;
> >       msm_host->var_ops = var_info->var_ops;
> >       msm_host->offset = var_info->offset;
> > -     msm_host->uses_tassadar_dll = var_info->uses_tassadar_dll;
> >
> >       msm_offset = msm_host->offset;
> >
> > @@ -2396,6 +2387,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> >       if (core_major == 1 && core_minor >= 0x49)
> >               msm_host->updated_ddr_cfg = true;
> >
> > +     if (core_major == 1 &&
> > +         (core_minor == 0x6e || core_minor == 0x71 || core_minor == 0x72))
> > +             msm_host->uses_tassadar_dll = true;
> > +
> This new registers that got introduced for supporting this new DLL are
> present on all versions > 0x71
> So we can update check as core_minor >= 0x71.
>
> And i dont find any target with SDCC controller minor version 0x6e.So we
> can remove check for version 0x6e.

I was basing this patch on the published 4.19 tree, which checks for
0x6e. I'll drop it from v2.

> >       ret = sdhci_msm_register_vreg(msm_host);
> >       if (ret)
> >               goto clk_disable;



-- 
With best wishes
Dmitry
