Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6044F16208E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 06:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgBRFvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 00:51:54 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43684 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgBRFvx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 00:51:53 -0500
Received: by mail-pg1-f194.google.com with SMTP id u12so10026689pgb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2020 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ce8OOkWfjw5jVWk59ugGKRVgBYm6HB1xi8c9ebl4I5g=;
        b=p6vDnXRx8Lt2QQo5iqGpTCkRuqfGnM9Rzn4zwWMk7BAnTDsm2IuHaKSL+naL4/1bWQ
         UgCdjP0L3Sx5n7jcE6joCY05E56kEA4db4MeGbgQKlZVvY6bY5mp8BrsWvQr91/J/bXO
         e6vZ1jKdUPOeNcGUUa2lFF3PlWw9z5rSHfv9uhTF5Z1n4/YuLqmNK9iYaCs/7JN3Bhwt
         hUpaQ4z7bhBFfF1cV46ZbGoL2Pon2s2SKtpRLShSoT0kSlMYPAydUkyFvtavUjiwvyeI
         ja/KrwKZds8ZNePpKfIC69786U+lrT52WmnnOBfNX2pgUIyEsPv5Uu/G1ieaWVjLt3Jl
         uouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ce8OOkWfjw5jVWk59ugGKRVgBYm6HB1xi8c9ebl4I5g=;
        b=GGqjD75JEksNqwbnGJl6yBKK2QMz28w/Jl9IudlFlcyq4GQtDi8GycwFs+DvWBrRqK
         ktH20yvw3c/mvFrEkCCQU9v7vNgz2NhzgCzcVgvbTP83JrKiTuIIvdnsnhMfIp6Sf3tl
         gBQ9QBxXbPG3wbdyhVdmEyQ1UrooNlviuKbbBJ/olseDFgcMpeXNvBrvY5JuEfF5HGko
         snuJE80k9HZFPJz4IwXevOQddf4s8A20QO5HYgCzOAYU81ooSrPE59TbZVtFUhv3+wkf
         2OaUjV/Rx8Jf51zDQi8SrA4av1V0dFWrveHfwr9JtaW59aBvR5xxBssb01h1M3SN5Q9V
         XbdA==
X-Gm-Message-State: APjAAAXVVlI0FvDXv+obLseT7yeIOfNsVu0DXuXio6Gkc6pgPmvXtZRU
        jlt0IDNXKpBjd59323mgAqoQ
X-Google-Smtp-Source: APXvYqzzaktP/1JoWkazaAtmfHhtnCI9qNbQsjBJVhjflRxwYgzm6RzkNTTDQxlbQc3moXEw4befNw==
X-Received: by 2002:a63:7ce:: with SMTP id 197mr10404414pgh.429.1582005111632;
        Mon, 17 Feb 2020 21:51:51 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:604:4c69:39d7:c38:1134:8ea0])
        by smtp.gmail.com with ESMTPSA id b4sm2431774pfd.18.2020.02.17.21.51.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 21:51:50 -0800 (PST)
Date:   Tue, 18 Feb 2020 11:21:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 11/16] bus: mhi: core: Add support for data transfer
Message-ID: <20200218055142.GA29573@Mani-XPS-13-9360>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-12-manivannan.sadhasivam@linaro.org>
 <CAK8P3a1DOta5Uj3dNFWVqwgyPKs0cQsoymXE7svcOZoPiY+YGw@mail.gmail.com>
 <20200217164751.GA7305@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217164751.GA7305@Mani-XPS-13-9360>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnd,

On Mon, Feb 17, 2020 at 10:17:51PM +0530, Manivannan Sadhasivam wrote:
> Hi Arnd,
> 
> On Mon, Feb 17, 2020 at 05:13:37PM +0100, Arnd Bergmann wrote:
> > On Fri, Jan 31, 2020 at 2:51 PM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > 
> > > @@ -648,6 +715,31 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
> > >                 mhi_chan->db_cfg.pollcfg = ch_cfg->pollcfg;
> > >                 mhi_chan->xfer_type = ch_cfg->data_type;
> > >
> > > +               switch (mhi_chan->xfer_type) {
> > > +               case MHI_BUF_RAW:
> > > +                       mhi_chan->gen_tre = mhi_gen_tre;
> > > +                       mhi_chan->queue_xfer = mhi_queue_buf;
> > > +                       break;
> > > +               case MHI_BUF_SKB:
> > > +                       mhi_chan->queue_xfer = mhi_queue_skb;
> > > +                       break;
> > > +               case MHI_BUF_SCLIST:
> > > +                       mhi_chan->gen_tre = mhi_gen_tre;
> > > +                       mhi_chan->queue_xfer = mhi_queue_sclist;
> > > +                       break;
> > > +               case MHI_BUF_NOP:
> > > +                       mhi_chan->queue_xfer = mhi_queue_nop;
> > > +                       break;
> > > +               case MHI_BUF_DMA:
> > > +               case MHI_BUF_RSC_DMA:
> > > +                       mhi_chan->queue_xfer = mhi_queue_dma;
> > > +                       break;
> > > +               default:
> > > +                       dev_err(mhi_cntrl->dev,
> > > +                               "Channel datatype not supported\n");
> > > +                       goto error_chan_cfg;
> > > +               }
> > > +
> > 
> > While looking through the driver to see how the DMA gets handled, I came
> > across the multitude of mhi_queue_* functions, which seems like a
> > layering violation to me, given that they are all implemented by the
> > core code as well, and the client driver needs to be aware of
> > which one to call. Are you able to lift these out of the common interface
> > and make the client driver call these directly, or maybe provide a direct
> > interface based on mhi_buf_info to replace these?
> > 
> 
> It sounds reasonable to me. Let me discuss this internally with Qcom guys to
> see if they have any objections.
> 

I looked into this in detail and found that the queue_xfer callbacks are tied
to the MHI channels. For instance, the callback gets attached to ul_chan (uplink
channel) and dl_chan (downlink channel) during controller registration. And
when the device driver calls the callback, the MHI stack calls respective queue
function for the relevant channel. For instance,

```
int mhi_queue_transfer(struct mhi_device *mhi_dev,
                       enum dma_data_direction dir, void *buf, size_t len,
                       enum mhi_flags mflags)
{
        if (dir == DMA_TO_DEVICE)
                return mhi_dev->ul_chan->queue_xfer(mhi_dev, mhi_dev->ul_chan,
                                                    buf, len, mflags);
        else
                return mhi_dev->dl_chan->queue_xfer(mhi_dev, mhi_dev->dl_chan,
                                                    buf, len, mflags);
}
```

If we use the direct queue API's this will become hard to handle. So, I'll keep
it as it is.

Thanks,
Mani

> Thanks,
> Mani
> 
> >       Arnd
