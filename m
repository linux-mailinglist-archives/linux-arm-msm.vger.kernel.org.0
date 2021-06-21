Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F139C3AF976
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 01:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhFUXiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 19:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhFUXiD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 19:38:03 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEB2C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 16:35:48 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so707407ota.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AXhLaNRlItV846H2J1h+pbbqWtyd8CdKwFzlrXFypk4=;
        b=vvX+3l5Iko5F5wawiBO2oOulWbnrWs/EuReLSqZd2mbbkLKe8RelP36ZHfTveJH05P
         QC/lDKAN69gONbAmSOO8q2KwLJS2E42g51BDbocUcWiFfI9KHbY/EerPwfVDZ9HwgsMg
         GNZUTtFtY7DFeiwBBCUcgEv/n1BNNN9s9YONKr+m6lpXqKnfxI0d2Ygf3s8MAiJh8VKZ
         qdnx3xfbV3KI/BuHNMHtSI+buAbTTGui6WBd8vdhtS2fJPNsQ7fYyiMyyp54cmF0vWkV
         XSRGPl/dqom3nL5l7rF1ghp5Ru3KCEjcPqSC4DBqgRw6DjYMGXKVsVia22fnzsdSgpP6
         iX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AXhLaNRlItV846H2J1h+pbbqWtyd8CdKwFzlrXFypk4=;
        b=Q7Es+jN+EZ/5UIByRD+AhUiePI5S8zuWYIDSJfL/9kQTC6YWD8gKhJanuTAq+UvwgC
         FWYGnzWZu4RB8vhruJczVI5Tvr5kKWN3unVVsIGit2yXF74pxDdeeafRCOgm/mFPUOdh
         Vbr/4FPOyVjhGkBG6MKSM2iQRobMQGu/+F2PHxKyOrph/M1eStY6nP15w3c6+SvnTNG2
         Cz3OV34kJiZr6H6YtVQRsVnrx3Ibef5qvtRSKvFLXqdKHzeSK3/eqzrfa0K9uU18v9ql
         aZsRQSEX6LP+M1dKSCSfqMyzN48IalC5g3/Cv4Qy6T2V6rWgcEx41VpwgNvDGeg/NM7r
         VU1w==
X-Gm-Message-State: AOAM533WBaZwowrhawuiklPUgolei2/HqZOlaehrAl4ceWaJ+5wHN2Ja
        Z1tXW2KLDMg2RHn1rdvIz/J27A==
X-Google-Smtp-Source: ABdhPJwbgQBwTmzxN8A2Pyo1XyUa/E+pwItXExwq/V3hdrGj2dPjnmw3yUMqCY8jNO69G8h7xQ7yRA==
X-Received: by 2002:a05:6830:2244:: with SMTP id t4mr483428otd.336.1624318547911;
        Mon, 21 Jun 2021 16:35:47 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 24sm2292069oiz.26.2021.06.21.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 16:35:47 -0700 (PDT)
Date:   Mon, 21 Jun 2021 18:35:44 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
Message-ID: <YNEiUMBqGAx1zLVX@yoga>
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org>
 <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
 <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Jun 18:19 CDT 2021, Rob Herring wrote:

> On Mon, Jun 21, 2021 at 5:10 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> >
> > On Mon, Jun 21, 2021 at 2:46 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Sun, Jun 20, 2021 at 10:03 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > > >
> > > > On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
> > > > <martin.botka@somainline.org> wrote:
> > > > >
> > > > > This commit adds compatible for the SM6125 SoC
> > > > >
> > > > > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > > > > ---
> > > > > Changes in V2:
> > > > > None
> > > > > Changes in V3:
> > > > > Change compatible to apcs-hmss-global
> > > > >  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > index f25324d03842..f24c5ad8d658 100644
> > > > > --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
> > > > >         .offset = 8, .clk_name = NULL
> > > > >  };
> > > > >
> > > > > +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
> > > > > +       .offset = 8, .clk_name = NULL
> > > > > +};
> > > > > +
> > > > >  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
> > > > >         .offset = 12, .clk_name = NULL
> > > > >  };
> > > > > @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> > > > >         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> > > > >         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
> > > > >         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> > > > > +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
> > > > >         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
> > > > >         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> > > > >         {}
> > > > >
> > > > These all are basically different names for the same controller.
> > > > The 'offset' is a configuration parameter and the 'clock', when NULL,
> > > > is basically some "always-on" clock.
> > > > I am sure we wouldn't be doing it, if the controller was third-party.
> > >
> > > If newer implementations are 'the same', then they should have a
> > > fallback compatible to the existing one that is the same and no driver
> > > change is needed. If the differences are board or instance (within an
> > > SoC) specific, then a DT property would be appropriate.
> > >
> > The controllers (13 now) only differ by the 'offset' where the
> > registers are mapped. Clock-name is a pure s/w artifact.
> > So, maybe we could push all these in DT.
> 
> Why is 'reg' not used for the offset?
> 

The DT node and its "reg" describes the whole IP block.

The particular register that we care of has, as you can see, moved
around during the various platforms and some incarnations of this IP
block provides controls for CPU-related clocks as well.

We can certainly have the multiple compatible points to the same
apcs_data, but I'm not able to spot a reasonable "catch-all compatible"
given that I don't see any natural groupings.

> In any case, we can't really get rid of the first 13 instances though...
> 

Right, we have the problem that we have DTBs out there that relies on
these compatibles, but as Jassi requests we'd have to start describing
the internal register layout in DT - which this binding purposefully
avoids.

Regards,
Bjorn
