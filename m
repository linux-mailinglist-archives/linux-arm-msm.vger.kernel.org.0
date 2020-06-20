Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476D5201FB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 04:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731729AbgFTCQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 22:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730293AbgFTCQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 22:16:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F51C0613EF
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 19:16:28 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z63so5315619pfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 19:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ze2RJd6uG6JmXJzKzTerk6Osac6PI+FOPGgCyR1yQO4=;
        b=HC1R1upQOtshrCTejxM03fE+JeWQY+sqnd3rpvX7H4M/gpiSrUEefgzMVfo6SPbphJ
         BQpEA7r4mN99svi5z7CmZS69RMO1p4sYi2bgT2quHl/EoG1Y4KcFSmxC/m/cYubLbefs
         sJx5/qtyitU9Fil2+lKIujKLWbLM9C30M/oqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ze2RJd6uG6JmXJzKzTerk6Osac6PI+FOPGgCyR1yQO4=;
        b=eSStgxg3Mf3vCEA8k784mzN3xZIHB6SPCmFz1CtQ6p1dEnjO3k7LZ0XEMr09TWxTtl
         fdDEMhVoWi4TMfbUotJzpbaS87Lqe+KGONc8QK88+c8Uyfx2k1EjFxwiZJNko47+rnWh
         IIcQAV5Z7aoiYFVHFP2lD7SS9hQrG0dG3R6WE4wKTu2WKgWHBkVOCirTryRmn8D1C4gQ
         SCp/g0AMneiGxogBsWlajvx4xBfg2L6a5znI1Ler/ZTTPpt+Z/xH3VQUN6JBmwplECRm
         tg8tXFztXX1Bd5EXn+a0Lb0alQtPW8bIQZXDNwurRUIPfiAr5Qd88Zu+6MvYeellbrMM
         uu7A==
X-Gm-Message-State: AOAM5302SAha/kJMcg3VEuqzYDuIwuQSMPblrg51d2+8bx4CYWCMaY98
        pmmZSzbaJQxVvken5FupYQ/XBA==
X-Google-Smtp-Source: ABdhPJwHV9WO1QQ2yG8QIv0nglQCNLg+UyY5O8F+KuUoOVIg8gA+tOpONo2wqPP+065cUjY7XUmreA==
X-Received: by 2002:a05:6a00:14ce:: with SMTP id w14mr10904276pfu.121.1592619388037;
        Fri, 19 Jun 2020 19:16:28 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q39sm6157566pja.30.2020.06.19.19.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 19:16:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=UwXKQcDPhqb0j+x-+kU1ZdBjVx52aY1JHx6oJRMLUPrg@mail.gmail.com>
References: <20200618150626.237027-1-dianders@chromium.org> <20200618233959.160032-1-swboyd@chromium.org> <CAD=FV=UwXKQcDPhqb0j+x-+kU1ZdBjVx52aY1JHx6oJRMLUPrg@mail.gmail.com>
Subject: Re: [PATCH 6/5] spi: spi-geni-qcom: Simplify setup_fifo_xfer()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Fri, 19 Jun 2020 19:16:26 -0700
Message-ID: <159261938655.62212.2181270604739207132@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-06-18 17:40:59)
> On Thu, Jun 18, 2020 at 4:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > @@ -373,12 +366,14 @@ static void setup_fifo_xfer(struct spi_transfer *=
xfer,
> >         len &=3D TRANS_LEN_MSK;
> >
> >         mas->cur_xfer =3D xfer;
> > -       if (m_cmd & SPI_TX_ONLY) {
> > +       if (xfer->tx_buf) {
> > +               m_cmd |=3D SPI_TX_ONLY;
> >                 mas->tx_rem_bytes =3D xfer->len;
> >                 writel(len, se->base + SE_SPI_TX_TRANS_LEN);
> >         }
> >
> > -       if (m_cmd & SPI_RX_ONLY) {
> > +       if (xfer->rx_buf) {
> > +               m_cmd |=3D SPI_RX_ONLY;
>=20
> If you're going to touch this, could you change "SPI_TX_ONLY" to
> "SPI_TX_ENABLED" and "SPI_RX_ONLY" to 'SPI_RX_ENABLED".  It felt
> really weird to me that if you had full duplex you were setting
> "RX_ONLY" and "TX_ONLY".

I agree, except in the register documentation it is called "TX only",
"RX only" and "Full-Duplex". So I'd rather leave it alone.

>=20
> Other than that, your change is nice and cleans things up a bit, so
> even if you don't do the extra cleanup:
>=20
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>=20
>=20

Thanks.
