Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06678161838
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 17:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgBQQsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 11:48:02 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36459 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbgBQQsC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 11:48:02 -0500
Received: by mail-pg1-f193.google.com with SMTP id d9so9491920pgu.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2020 08:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+dYalRSbOahcygIG/bZllcSeh3ymAP3k2AyUse0dYCI=;
        b=mII34r67/bufhqQd9dQqCetitoqHTrrbW8vRZnRPg1PwUkd8tJ+8Mr9084zNVxlzib
         3eua/qF0W6iJnkf8IokoO56nKIcoKjslAX9TSz5rfujDwzvMlTseZms//itB13ofLcD3
         gL0Dp869sIiemJpyWxNXuX29oPqTYwUI3cKdOe61cmflx30o1nNgxDBvbsbfdUGqTZPB
         Nfik4yKH5vQA0JpniYGamAhEIzL74N6Jzkw/EPnT0elR5oLnt8gx35VUnFNEiRDpZQJe
         kObADUG9G7Zf+mudNN4VvOfvQW5u6eiA9TQFXxT7Zjt/wW3+whiNuUBf5NKoD2Sbkbuh
         OClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+dYalRSbOahcygIG/bZllcSeh3ymAP3k2AyUse0dYCI=;
        b=oC3JblQY1ypnEcwjAS2Djh00ZeLb4vw4Z9HHnndgaqL5Q+Zhap/uXbmeophkkDweTj
         covduzjb/3HDQegKoncLwcQ3T//HJ18iRFqxvCglP5qtYnR7x7Ym7dSV13YprZ4zUoHE
         Qn/jZfIymRC21IYE5yYliuANxnsK/FIwvgsHqQiI687PQ5m1y3/y3Gx1Rex0aUDF/Jid
         6cv0yIxYTR3l4sLyRQxXLvGp4FT5inB7Uci6SAbxCTK9iO6gf87vQtezShfwLbepUsj/
         cOhzYOMBIr/NDC31qMbqEwjbxrwfHMTqIqC1vxdBqPGfw0SoFkdwbOS/yWJRJmWGXvoD
         wmTA==
X-Gm-Message-State: APjAAAU1AYQ9WS3jCUFxIh1ItgVTtPv0GA33+TVWndmBha+GaeqH5B0e
        tR0BCTPmbp3u4JelXHdsVw6M
X-Google-Smtp-Source: APXvYqww9hFwhQhDFppuNnetXE1spR5nHeV2J6H2V98O42q2hVUMGmmNA52WaqDLYhTNvRfQi+jCEA==
X-Received: by 2002:a17:90a:30e8:: with SMTP id h95mr21154101pjb.30.1581958081234;
        Mon, 17 Feb 2020 08:48:01 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:48d:3349:2df9:3778:ccac:a356])
        by smtp.gmail.com with ESMTPSA id ev5sm19278pjb.4.2020.02.17.08.47.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 08:48:00 -0800 (PST)
Date:   Mon, 17 Feb 2020 22:17:51 +0530
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
Message-ID: <20200217164751.GA7305@Mani-XPS-13-9360>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-12-manivannan.sadhasivam@linaro.org>
 <CAK8P3a1DOta5Uj3dNFWVqwgyPKs0cQsoymXE7svcOZoPiY+YGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1DOta5Uj3dNFWVqwgyPKs0cQsoymXE7svcOZoPiY+YGw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnd,

On Mon, Feb 17, 2020 at 05:13:37PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 31, 2020 at 2:51 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> 
> > @@ -648,6 +715,31 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
> >                 mhi_chan->db_cfg.pollcfg = ch_cfg->pollcfg;
> >                 mhi_chan->xfer_type = ch_cfg->data_type;
> >
> > +               switch (mhi_chan->xfer_type) {
> > +               case MHI_BUF_RAW:
> > +                       mhi_chan->gen_tre = mhi_gen_tre;
> > +                       mhi_chan->queue_xfer = mhi_queue_buf;
> > +                       break;
> > +               case MHI_BUF_SKB:
> > +                       mhi_chan->queue_xfer = mhi_queue_skb;
> > +                       break;
> > +               case MHI_BUF_SCLIST:
> > +                       mhi_chan->gen_tre = mhi_gen_tre;
> > +                       mhi_chan->queue_xfer = mhi_queue_sclist;
> > +                       break;
> > +               case MHI_BUF_NOP:
> > +                       mhi_chan->queue_xfer = mhi_queue_nop;
> > +                       break;
> > +               case MHI_BUF_DMA:
> > +               case MHI_BUF_RSC_DMA:
> > +                       mhi_chan->queue_xfer = mhi_queue_dma;
> > +                       break;
> > +               default:
> > +                       dev_err(mhi_cntrl->dev,
> > +                               "Channel datatype not supported\n");
> > +                       goto error_chan_cfg;
> > +               }
> > +
> 
> While looking through the driver to see how the DMA gets handled, I came
> across the multitude of mhi_queue_* functions, which seems like a
> layering violation to me, given that they are all implemented by the
> core code as well, and the client driver needs to be aware of
> which one to call. Are you able to lift these out of the common interface
> and make the client driver call these directly, or maybe provide a direct
> interface based on mhi_buf_info to replace these?
> 

It sounds reasonable to me. Let me discuss this internally with Qcom guys to
see if they have any objections.

Thanks,
Mani

>       Arnd
