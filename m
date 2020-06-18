Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB7E1FF62A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 17:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgFRPGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 11:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730950AbgFRPGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 11:06:08 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D84C0613EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:06:08 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id t23so1509239vkt.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uhyo0sKph8oAx2mIyvhHF5US4adK0E3GfKdnIj29E9Y=;
        b=aB8ub7BN1xbigSK9olQdwudzkwJ1S2Yyrfdib2JJjs9mSUrmcIBMO2frrAcBiZHX7l
         4L9kXEoi3EWaFw233GFFuBhCKCauoatr3Dh0Zel+L6LuxU0GkTw8Fz5FrXpPncLbU1ap
         Wjgam1IaQoIbFXWShumV1iaHOZseVhcJ8qLaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uhyo0sKph8oAx2mIyvhHF5US4adK0E3GfKdnIj29E9Y=;
        b=C3jK2KIbbFpVJxNB0kII/ewv+YuUol0by212P6v7Rk2EFUuW+WksgdEj3kaDZeMYiy
         w2hI2ROJOLKYKYvoVyXwF6iDKOauk+jlB8uL5nCa4fx7WNlEv/Y/mg7QqoLLv74n8q1c
         sFX1h9PEhkBR3w56mZE90Y5VwwNY+7ws2Lv3r9K2MQqV724jJiNsXFpx+W4Sn7D5zKea
         jYlZptGHwZnALprNdmi2YW8KP9fYUmLH09mELVet3KgRao+23qdfve7B1CJ+YdMLv5p2
         L5NeMTuBM3ZQs3/kqKN0H81wm+a8lUYGZsgsvKhzaWzoI1tDWL7xZiODoKqmAjQRBM3z
         kiRA==
X-Gm-Message-State: AOAM531dcnc/EADqrtM1iJ6MAu55ehof3zogI6jE9ysdPZMt1YyS2rCx
        kD7cYftRWeFwbBwGe2XTitqdQptk+xE=
X-Google-Smtp-Source: ABdhPJyocS/vEjwNlImQ4lzANhppSgRCfIfVwT+eAE0Z9UVsfOBf0I82hqS6AOEP5WHNealyurS5bw==
X-Received: by 2002:a1f:d444:: with SMTP id l65mr3687663vkg.27.1592492767203;
        Thu, 18 Jun 2020 08:06:07 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id m11sm364401vko.34.2020.06.18.08.06.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 08:06:06 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id s6so1506764vkb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:06:05 -0700 (PDT)
X-Received: by 2002:ac5:ce86:: with SMTP id 6mr3726475vke.75.1592492765249;
 Thu, 18 Jun 2020 08:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200616104050.84764-1-dianders@chromium.org> <20200616034044.v3.5.Ib1e6855405fc9c99916ab7c7dee84d73a8bf3d68@changeid>
 <159242860191.62212.18088243128415903480@swboyd.mtv.corp.google.com>
In-Reply-To: <159242860191.62212.18088243128415903480@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 08:05:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfYnkw2EFFHZNMRffmO3XJE9Qm8YtMzjK8OWLgL39XKQ@mail.gmail.com>
Message-ID: <CAD=FV=XfYnkw2EFFHZNMRffmO3XJE9Qm8YtMzjK8OWLgL39XKQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] spi: spi-geni-qcom: Don't keep a local state variable
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 17, 2020 at 2:16 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-06-16 03:40:50)
> > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > index 63a62548b078..6feea88d63ac 100644
> > --- a/drivers/spi/spi-geni-qcom.c
> > +++ b/drivers/spi/spi-geni-qcom.c
> > @@ -63,13 +63,6 @@
> >  #define TIMESTAMP_AFTER                BIT(3)
> >  #define POST_CMD_DELAY         BIT(4)
> >
> > -enum spi_m_cmd_opcode {
> > -       CMD_NONE,
> > -       CMD_XFER,
> > -       CMD_CS,
> > -       CMD_CANCEL,
> > -};
> > -
> >  struct spi_geni_master {
> >         struct geni_se se;
> >         struct device *dev;
> > @@ -81,10 +74,11 @@ struct spi_geni_master {
> >         unsigned int tx_rem_bytes;
> >         unsigned int rx_rem_bytes;
> >         const struct spi_transfer *cur_xfer;
> > -       struct completion xfer_done;
> > +       struct completion cs_done;
> > +       struct completion cancel_done;
> > +       struct completion abort_done;
>
> I wonder if it would be better to use the wait_bit() APIs. That would
> let us have one word for various bits like CS_DONE, CANCEL_DONE,
> ABORT_DONE and then wake up the waiters when the particular bit happens
> to come in through the isr. It is probably over-engineering though
> because it saves a handful of bytes while increasing complexity.
>
> Otherwise I like this patch.

I'm going to leave it as-is for v4.  We can always make it a future
improvement if we want.

-Doug
