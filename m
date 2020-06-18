Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87FC01FFEB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 01:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgFRXh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 19:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgFRXh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 19:37:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C80C0613EF
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 16:37:57 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h95so3476771pje.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 16:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=WVpMi69RhX6AlKIc/TV+JAVrcTVQ8jcepQSU/Lx1Ia8=;
        b=ZrdFXYvrd7w7AxZmBqDQ7XDvlgXtG7LCUhK/NlZgc+S8B4hTRH4lWnej597gWOw3Ch
         2gQYIFD1JsrSpG4a3Pqw3ZzMvNsSYzDdxBOC+KVFzfSQZ4fdKV4qYEVrGiQGbYyEKnbw
         r/cTQ/KI/nnu5A9DYBGElCFs5ENXAkHO/qfOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=WVpMi69RhX6AlKIc/TV+JAVrcTVQ8jcepQSU/Lx1Ia8=;
        b=p0HdcrNoFOvZOcG0AQTQz1aMT0NZ9to9f+Ql0JoFk2MtoGajc/IgfsgE/LKvjaDtZm
         lKz0dzpzJrf5WylNNlh4O8hPfc5ipEglP4emzbcCBBgRglpzPK8tIMaPNj2QO7XW2A7L
         ZgFiIpJjZDvtaXU9LwnaWnP+urHdDNlnT1yxYDC/AwURZdYiOB7Sdmd+tRnr00HRILUD
         7AkSaVk7mpodXD7b9rJ4ldMuKOPv983YHfFezpi5nCj6P7BBK191nln09kvloXyGTfJd
         +TMAcrLXs6u3Xb6bVqyHZSkTe67S5SQYwCzHkmZvFUe5pZKpQpcYr/EmI5iCrKXSmjdy
         32NA==
X-Gm-Message-State: AOAM5314RKYPkOTOq6lt/7FCLzkIobC0u7cykbjiO9vq667bomHuPTsM
        GBMLGy0/tIvAtV+kftLp0/pkvA==
X-Google-Smtp-Source: ABdhPJxlzELG49LGZDZUYQPHCXKPiBbx6hWYaTzn3v+DaL2ie6JbODXE9Z16wsDVzwst62vFk6lIeQ==
X-Received: by 2002:a17:90a:2843:: with SMTP id p3mr675332pjf.187.1592523476571;
        Thu, 18 Jun 2020 16:37:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m15sm3403754pgv.45.2020.06.18.16.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 16:37:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=W1y4Z4T13i410zkb27mUxqn+rQE889=ckEEBhbPuci2w@mail.gmail.com>
References: <20200618150626.237027-1-dianders@chromium.org> <20200618080459.v4.5.Ib1e6855405fc9c99916ab7c7dee84d73a8bf3d68@changeid> <159250352382.62212.8085892973272354046@swboyd.mtv.corp.google.com> <CAD=FV=Xh3+cROZC8dCn99MLkngsyBcxq+Gv1CERayZXExwdygA@mail.gmail.com> <159251712230.62212.10744179843753723398@swboyd.mtv.corp.google.com> <CAD=FV=W1y4Z4T13i410zkb27mUxqn+rQE889=ckEEBhbPuci2w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] spi: spi-geni-qcom: Don't keep a local state variable
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 16:37:55 -0700
Message-ID: <159252347502.62212.15886549130634139267@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-06-18 15:00:10)
> On Thu, Jun 18, 2020 at 2:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > -----8<----
> > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > index d8f03ffb8594..670f83793aa4 100644
> > --- a/drivers/spi/spi-geni-qcom.c
> > +++ b/drivers/spi/spi-geni-qcom.c
> > @@ -121,6 +121,10 @@ static void handle_fifo_timeout(struct spi_master =
*spi,
> >         spin_lock_irq(&mas->lock);
> >         reinit_completion(&mas->cancel_done);
> >         writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> > +       /*
> > +        * Make sure we don't finalize a spi transfer that timed out but
> > +        * came in while cancelling.
> > +        */
> >         mas->cur_xfer =3D NULL;
> >         mas->tx_rem_bytes =3D mas->rx_rem_bytes =3D 0;
> >         geni_se_cancel_m_cmd(se);
>=20
> Sure.  It gets the point across, though
> spi_finalize_current_transfer() is actually pretty harmless if you
> call it while cancelling.  It just calls a completion.  I'd rather say
> something like "If we're here because the SPI controller was calling
> handle_err() then the transfer is done and we shouldn't hold onto it
> anymore".
>=20

Agreed it's mostly harmless. I thought the concern was that 'cur_xfer'
may reference a freed piece of memory so it's best to remove ownership
of the pointer from here so that the irq handler doesn't try to finalize
a transfer that may no longer exist. "Shouldn't hold onto it anymore"
doesn't tell us why it shouldn't be held onto, leaving it to the reader
to figure out why, which isn't good.
