Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4AC2C7F89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 09:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgK3IMk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 03:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgK3IMj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 03:12:39 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B177C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 00:11:59 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id q16so14715237edv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 00:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EJSG5WnkMc0SKWblHa1XPA1EJ79UxhinYQaynzi6VWs=;
        b=a/+S+oHDReDHuEwY+wL2N5ynuc1okpE+Dr41vU+nCy8VWJmVZtpDGIPPxGAwd0MPqx
         kA1chMzfuvkojAYsUUTOiPvM3R2lbkitbeRDFUcJ7+IXQic62GmjS3F9uUYTKAJkf++P
         aQnTI3iCBxu411OP5JLnLGDFi/Yjb3EjN8uR057ek1iTjxeRd/efk+3vFhn/GHDZOOYx
         /icV4jT3aS+9e1NZKHABTMOd9Su35rZ45JzVqzqQwI3nye3fYTnJ2gCl1nkIDJo8Q8qd
         YEUIeZqd0hBBPZEOxH8OIT9VQQGNNIzF525PdwbqKYCVKPItf0shQv14g8kTkPoY1a/F
         bEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EJSG5WnkMc0SKWblHa1XPA1EJ79UxhinYQaynzi6VWs=;
        b=G9K7dAKaELFFQdHTPYKUrGyY3LrRsJmN49/sCrW5DX5qvh3fg0TueSPiijfwIBbYYh
         g87K01Wt5hPYMsoQBPHg2+o+SFY7AsL3bFlVjZ7/b5k3fY7YZ8gmS/IAy/s9vxysDlpe
         QCVjkT5tZRlcYhPazuXiZ8CaS4hhX4NqRylySMS7OPD8rr8nDwj0fpsNMHMb1n3eBmbx
         /IhiePwM0XnV0SawAA4mlGQFOPJn/CBPYI6s8ZrnFWVO1P6iuUtLKTYcGNM9M6qaIs2U
         RGP2i7Grgmae2Cb0FKbWH6BQOT86HT6rCru9tihbp2CBLQXaTtxnORI9FOF8hjBqz1qI
         tE2Q==
X-Gm-Message-State: AOAM533PVePjEGX5GKCiD24yA0XrnF3SO5lb5n5/V7253+MAAvQ8N5Ij
        A/xZTUdv5NbnhO3l0QLoXi8UR8dRXJi+p9iqooUx5JEfB9gOyA==
X-Google-Smtp-Source: ABdhPJxtco0/psaElqeHA8ePjgiaXU6pdtQHy94OTOAUZ7NixMfNxnkBIMy0DoIFes/a+gKEOh050fDx5s29nJI2tCo=
X-Received: by 2002:aa7:c80c:: with SMTP id a12mr10348869edt.165.1606723918159;
 Mon, 30 Nov 2020 00:11:58 -0800 (PST)
MIME-Version: 1.0
References: <1606403201-5656-1-git-send-email-loic.poulain@linaro.org> <20201128060331.GH3077@thinkpad>
In-Reply-To: <20201128060331.GH3077@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 30 Nov 2020 09:18:14 +0100
Message-ID: <CAMZdPi-kUkoqz2Yx_rWOHfCovk_MjZxoq1QV413y54E7F-QE4w@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: Ensure correct ring update ordering with
 memory barrier
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 28 Nov 2020 at 07:03, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Thu, Nov 26, 2020 at 04:06:41PM +0100, Loic Poulain wrote:
> > The ring element data, though being part of coherent memory, still need
> > to be performed before updating the ring context to point to this new
> > element. That can be guaranteed with a memory barrier (dma_wmb).
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: fix comment style
> >
> >  drivers/bus/mhi/core/main.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > index 67188ea..ea39df0 100644
> > --- a/drivers/bus/mhi/core/main.c
> > +++ b/drivers/bus/mhi/core/main.c
> > @@ -111,7 +111,14 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
> >       dma_addr_t db;
> >
> >       db = ring->iommu_base + (ring->wp - ring->base);
> > +
> > +     /*
> > +      * Writes to the new ring element must be visible to the hardware
> > +      * before letting h/w know there is new element to fetch.
> > +      */
> > +     dma_wmb();
> >       *ring->ctxt_wp = db;
>
> As Jeff pointed out, the barrier should come after updating ctxt_wp.

Actually, device can poll for the write pointer (e.g. in burst mode),
so we need to be sure the element data are written before writing this
write pointer (since it can be accessed at any time on device side,
not only after doorbell).

I think that what jeff pointed is that we also need to ensure that
write pointer is also updated before we ring the doorbell (doorbell
mode), but this is implicitly done by the MMIO writing (using
writeX()) of the doorbell register.(cf
https://www.kernel.org/doc/Documentation/memory-barriers.txt).

Regards,
Loic



>
> Thanks,
> Mani
>
> > +
> >       mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
> >                                   ring->db_addr, db);
> >  }
> > --
> > 2.7.4
> >
