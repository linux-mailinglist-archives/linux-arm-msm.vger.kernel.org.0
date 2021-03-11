Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911A6336D49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 08:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhCKHsu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 02:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhCKHsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 02:48:32 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3B6C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 23:48:30 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id e2so4537049pld.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 23:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDzgsi/zQArAqR3wP77Q8sN/ubukvsfLrTw8SVvD9d8=;
        b=fy9eeH4R+s7QGd5baD33n+bIU2JEcg/Snr0YSwlYByOSuGfiaHTXpTjyZdhc46KrV2
         hx4r3I4rUpUZNLKCncMlASWbOVefbmi4iWb9sioVcewvgEZ6ni+cHFL4L3irC1K0bSZB
         wHJjQjwTjDrSzJ5tUVfgs1Lao12JI6yWY1i8Y4ldXY1WViwemUpI2MxHryRNivRX+KKg
         BxGtD3ZL45NcaNME/P3RSeSXGyoRSR/oAJb63VIlf6ypugFt+d8GP+DvpBe5+Kr8EUOf
         BBDeqD+G1y3xwzJXY19YYsQsNpbE/4yTmR3E8uyNcujCK5VYEz2MrrVn1rPcJFpVrfsM
         6dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDzgsi/zQArAqR3wP77Q8sN/ubukvsfLrTw8SVvD9d8=;
        b=eeoUdgM3ArHJ3eTsHIn8P6zsOI9pkNnunQXFsZBRCw0wa/xzBu+VD5DzB8Ja0tGMLj
         2SQrvc3Gyqy9AkclmKURZDElqAK1NhGw51A/LhJve1lnAalmdYNd4ha5S0yR20h4EnDJ
         r6nYhJLUo0WPikhAGIzpD4z2IKp1ZBLYHuhy9twp0o3bA+V2LnSWdsTBxcoy0Jh5xJd8
         XgHSpr2BLeQnDe2xpMHdsrV/pTzZi04nb2YQ4C4AeQLV/MGzAFp2NqiS/7bAqoho5pIF
         artZ+h7AQ+NrB9nycpZRZFWzX7eVknJ/JnW2Yd7qmEEb/3n59i47B2etnf4VSYvwyfPY
         camA==
X-Gm-Message-State: AOAM5305SydMR7kcnJlpx5g5G37mgPp/YGk2pg6KAsIrVz6WstgQWNxl
        iLIP54INn5M4WYctTR3pL5vXW8OmHK0oMCdcFNCwZA==
X-Google-Smtp-Source: ABdhPJwo2FHZPohcpNCmnBBmhRzjZNr+1g1sGYgwUAYNuUsQEabjCOdJAQP8Ol2NAcEhGadpwNFaOd3puQ1gBVI9R9g=
X-Received: by 2002:a17:90b:4008:: with SMTP id ie8mr7948173pjb.231.1615448909765;
 Wed, 10 Mar 2021 23:48:29 -0800 (PST)
MIME-Version: 1.0
References: <1615376308-1941-1-git-send-email-loic.poulain@linaro.org> <a24bb3a0-30f8-a32c-dcde-849725b38ebd@codeaurora.org>
In-Reply-To: <a24bb3a0-30f8-a32c-dcde-849725b38ebd@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 11 Mar 2021 08:56:29 +0100
Message-ID: <CAMZdPi_2VW4VWx5ntFqYHLvwg2Sk=rMdjn2WpHdqnUuim7SyhQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Command completion workaround
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant,

On Wed, 10 Mar 2021 at 21:43, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 3/10/21 3:38 AM, Loic Poulain wrote:
> > Some buggy hardwares (e.g sdx24) may report the current command
> > ring wp pointer instead of the command completion pointer. It's
> > obviously wrong, causing completion timeout. We can however deal
> > with that situation by completing the cmd n-1 element, which is
> > what the device actually completes.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   drivers/bus/mhi/core/main.c | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > index 16b9640..3e3c520 100644
> > --- a/drivers/bus/mhi/core/main.c
> > +++ b/drivers/bus/mhi/core/main.c
> > @@ -707,6 +707,7 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
> >   {
> >       dma_addr_t ptr = MHI_TRE_GET_EV_PTR(tre);
> >       struct mhi_cmd *cmd_ring = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
> > +     struct device *dev = &mhi_cntrl->mhi_dev->dev;
> >       struct mhi_ring *mhi_ring = &cmd_ring->ring;
> >       struct mhi_tre *cmd_pkt;
> >       struct mhi_chan *mhi_chan;
> > @@ -714,6 +715,23 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
> >
> >       cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
> >
> > +     if (unlikely(cmd_pkt == mhi_ring->wp)) {
> As per spec : The location of the command ring read pointer is reported
> to the host on the command completion events in the primary event ring.
>
> If device is buggy and updates with WP instead of Rp, we should not
> workaround it by processing Wp - 1. We can print a warning if cmd_pkt !=
> mhi_ring->rp and let the command completion timeout. This needs to be
> fixed by device. We can not accommodate device side bug in host side.

I see your point, but here it's not to accommodate the device but the
users using such
'buggy' device. The kernel has a ton of 'quirks' in various drivers,
I'm not a fan of this
but my argument is that:
- It captures a behavior that was not captured until now
- It workarounds an issue without any impact on non 'buggy' devices
- It clearly prints a warn to highlight that it's a known issue that
should be fixed
- Fixing devices in the wild is quite complex, and we may have to live with it.

Regards,
Loic
