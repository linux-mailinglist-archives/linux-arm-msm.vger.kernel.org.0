Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97AB86785A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 20:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbjAWTAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 14:00:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbjAWTAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 14:00:01 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC051716
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 11:00:00 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id b1so10828661ybn.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 11:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B8sSohvWdeGR854ywrgR9OxUM3Kmm0F/pKhgNWx62Gc=;
        b=G6FnlpNfZErOiG4DtB5aA5k1KFTRsZW6MSzsHwFNA7/BB7+QqojQBEyWFyis3TyeAt
         VplDekwOOHXZbk96HcnsextR2Vub/u1FZMm6GHYsqqzwGclYzch27EnbKwt2HyKhk7y4
         nZMu4YP7WP2Ge1t9ALpDl4DshLg2L40c3sUmz8T25DSuErdzlR6QzLHHDLuYD41P/1XF
         0yWAeTPT1M8VZ2NRwrJ/NhadihrATZ6mKbOx5piUGPCHpyE2EexHeY3c3LSZ3Ah3/wsY
         wapJcs5ll/5Q1DivlfhDvt5iRHF9lsP3pDOvjVY07J83F1jqtdw9ryaXMmDejLLqVAlT
         lSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8sSohvWdeGR854ywrgR9OxUM3Kmm0F/pKhgNWx62Gc=;
        b=XLquOGnoNMLShHNTurosHpy/GUbn+dAKhXyh2cEUKQX0jW0LWEhp9+TAuuMVhGQvEl
         m11lHhDqcG7NNArps96lIOc38mUSMDEPD9yGYm3JXbEnwjQkSY7a/QB2Qa9HXnoGyTie
         I2eHP9PJzZfFCxm6qBr4Ljzi4ELI550rIH6ehAQ6Ts49sY2cnU/3O5yhGAfA+oZZ8KGJ
         CyAjP78bY9jkdJYwOiQCeZqBO9bikOQxIULN80lnWZVNtWWKmPY/KLkU95pL0IWxISH+
         jWA5SXzyBOuWjlk1ItDp2GgXCU1bk3P49QljsqGTAWEKKk+C10v0wQUuX4vFtcu1AaoC
         plpw==
X-Gm-Message-State: AFqh2kpg724PopIijnDjJIJduPyNhkaBGbulEfkCg8BQPjT1FHaySE3y
        BpkDNDtHzFF1LDDDaAgPwkxJBp+SDNnUXQAELMuWSg==
X-Google-Smtp-Source: AMrXdXsXcpimRuFloMT17rxdhV5ggwkbSJFO8dxxUhNSQDaPeT2613uy05QEP75h+EwfYywQpAI6h3Lmus1Th02/Q6Y=
X-Received: by 2002:a5b:305:0:b0:709:9335:236e with SMTP id
 j5-20020a5b0305000000b007099335236emr2370198ybp.288.1674500399574; Mon, 23
 Jan 2023 10:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20230123120807.3101313-1-dmitry.baryshkov@linaro.org> <Y86TDYOKtpcLdZYx@hovoldconsulting.com>
In-Reply-To: <Y86TDYOKtpcLdZYx@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 23 Jan 2023 20:59:48 +0200
Message-ID: <CAA8EJppU4nQRYWwAahWtjrVbU1ywF4P+zxHs1PZm98bzKswiZA@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qmp-combo: correct DP register offsets
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 Jan 2023 at 16:00, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Jan 23, 2023 at 02:08:07PM +0200, Dmitry Baryshkov wrote:
> > Correct DP register offsets used with new DT bindings scheme. First, DP
> > TX registers reside in separate regions, not in the same regions as USB
> > TX registers do. Second, correct DP_PHY region offset to follow the
> > offset used for earlier generations/bindings.
>
> No, this patch is broken. SC8280XP is different, doesn't seem to have
> separate DP TX regions and the DP_PHY registers lies at a different
> offset than on previous generations.
>
> You can't just pull these numbers out of your ... ;)
>
> This is the only platform that I can test the DP part on and it is
> working. If that happens to be by chance, then you need to blame the
> commit adding support for sc8280xp (i.e. not the one that fixed the
> binding). And note that this was added by Bjorn who do have access to
> the documentation for this SoC (as well as actual hardware).

Ack, let's wait for Bjorn to check the offsets. I find it extremely
suspicious that dp_txa/txb use the same region as usb txa/txb do.

>
> > Cc: Johan Hovold <johan+linaro@kernel.org>
> > Fixes: 83a0bbe39b17 ("phy: qcom-qmp-combo: add support for updated sc8280xp binding")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > index 1f022e580407..c6634f92de19 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > @@ -807,6 +807,8 @@ struct qmp_combo_offsets {
> >       u16 usb3_pcs;
> >       u16 usb3_pcs_usb;
> >       u16 dp_serdes;
> > +     u16 dp_txa;
> > +     u16 dp_txb;
> >       u16 dp_dp_phy;
> >  };
> >
> > @@ -984,7 +986,9 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
> >       .usb3_pcs       = 0x1400,
> >       .usb3_pcs_usb   = 0x1700,
> >       .dp_serdes      = 0x2000,
> > -     .dp_dp_phy      = 0x2200,
> > +     .dp_txa         = 0x2200,
> > +     .dp_txa         = 0x2600,
>
> You added dp_txa twice.

Ack

>
> > +     .dp_dp_phy      = 0x2a00,
> >  };
> >
> >  static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
> > @@ -2639,8 +2643,8 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
> >       qmp->pcs_usb = base + offs->usb3_pcs_usb;
> >
> >       qmp->dp_serdes = base + offs->dp_serdes;
> > -     qmp->dp_tx = base + offs->txa;
> > -     qmp->dp_tx2 = base + offs->txb;
> > +     qmp->dp_tx = base + offs->dp_txa;
> > +     qmp->dp_tx2 = base + offs->dp_txb;
> >       qmp->dp_dp_phy = base + offs->dp_dp_phy;
> >
> >       qmp->pipe_clk = devm_clk_get(dev, "usb3_pipe");
>
> Johan



-- 
With best wishes
Dmitry
