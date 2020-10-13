Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11CF528DD08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgJNJV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731025AbgJNJVz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:21:55 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A85C0613A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:35:57 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id p25so901447vsq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iiAtiRUeW6oFP6bPz2CmGroK6Abx1GWkjquROnHlI5E=;
        b=iOhvs4D5QbPHGozMtELjSwH+fm7jfhq59gfVs5kOHdGvIC10UBOAeOKfC6hI6pJyzI
         o01rKiTo8ESzBbhkq2+liiaOhIc4WW/VnpNuym0IpPjddz8GtNcHG9E50YPsRNwiTJj4
         OF1nhltURrLgqhX5DLup0PoVOfOQPaNpe5/Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiAtiRUeW6oFP6bPz2CmGroK6Abx1GWkjquROnHlI5E=;
        b=cVJ7QBaj3p+RXTFCb95Ux4m/h8v8M5xQnJCscjQqcYvad58uBqzy066oD5Wjs0ca/O
         N6z7Yh0T80rf/1MT9S658rx1T7LtWN4KRwIj3W/oxXdreAulspgXXA8S6dlAWCqgcHpg
         xHicZniWaE+tRG9s7LHZnMhshCXtILEmCX9Bw3yzQTHcLeJL7s0lzb0AmUevKvuFpJdN
         bltKtc4YwaSlFIfegLYIKTd9qzN6p+oYXehU62iYE8H3ihoImHI5o9cMUK/yIw3HBBvL
         InOiMN39FS3R5xxI2U3fpzT/tGcccrK5jGT+5LUT408NgkQVXs0BqhnUBWWvxq6v34iE
         wGzw==
X-Gm-Message-State: AOAM531shQqrwjAjj0kSgZUpavmYiFyrConN0TMgvfs/opQQIQPTbbR6
        krUBKYe+fIoPTm7siUkZFCqIzJaFU0AVFg==
X-Google-Smtp-Source: ABdhPJxLrbzwlJICzcfVZKysI9vrkiu9xWCZaad0+k1VjyOw0PDLuSsNT8r6kykWxdLL8L+QDsTi7Q==
X-Received: by 2002:a67:314a:: with SMTP id x71mr1630089vsx.24.1602624956294;
        Tue, 13 Oct 2020 14:35:56 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id r65sm175330vkr.27.2020.10.13.14.35.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 14:35:54 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id p25so901368vsq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:35:54 -0700 (PDT)
X-Received: by 2002:a67:eb52:: with SMTP id x18mr1584898vso.34.1602624953624;
 Tue, 13 Oct 2020 14:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201008225235.2035820-1-dianders@chromium.org>
 <20201008155154.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
 <160229038385.310579.7502548054994849649@swboyd.mtv.corp.google.com> <2ccc26a0-5d54-e06c-5a73-7eb353c393d2@codeaurora.org>
In-Reply-To: <2ccc26a0-5d54-e06c-5a73-7eb353c393d2@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Oct 2020 14:35:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VWPqswOXJejyXjYT_Yspdu75ELq42cffN87FrpTwPUQg@mail.gmail.com>
Message-ID: <CAD=FV=VWPqswOXJejyXjYT_Yspdu75ELq42cffN87FrpTwPUQg@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: qcom: geni: More properly switch to DMA mode
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Oct 12, 2020 at 2:05 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Stephen,
>
>
> >>
> >>   static void geni_se_select_dma_mode(struct geni_se *se)
> >>   {
> >> +       u32 proto = geni_se_read_proto(se);
> >>          u32 val;
> >>
> >>          geni_se_irq_clear(se);
> >>
> >> +       val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> >> +       if (proto != GENI_SE_UART) {
> > Not a problem with this patch but it would be great if there was a
> > comment here (and probably in geni_se_select_fifo_mode() too) indicating
> > why GENI_SE_UART is special. Is it because GENI_SE_UART doesn't use the
> > main sequencer? I think that is the reason, but I forgot and reading
> > this code doesn't tell me that.
> >
> > Splitting the driver in this way where the logic is in the geni wrapper
> > and in the engine driver leads to this confusion.
>
> GENI_SE_UART uses main sequencer for TX and secondary for RX transfers
> because it is asynchronous in nature.
>
> That's why  RX related bits (M_RX_FIFO_WATERMARK_EN |
> M_RX_FIFO_LAST_EN)  are not enable in main sequencer for UART.
>
> (M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN) bits are controlled from UART
> driver, it's gets enabled and disabled multiple times from start_tx
> ,stop_tx respectively.

For now I've "solved" this by adding some comments (in the 3rd patch)
basically summarizing what Akash said.  I didn't want to go further
than that for now because it felt more important to get the i2c bug
fixed sooner rather than later and re-organizing would be a big enough
change that it'd probably need a few spins.

Our bug trackers don't make it trivially easy to file a public bug
tracking this and assign it to Qualcomm, but I've filed a bug asking
folks at Qualcomm to help with re-organizing things after my patch
series lands.  This is internally tracked at Google as b:170766462
("Rejigger geni_se_select_fifo_mode() / geni_se_select_dma_mode() to
not manage interrupt enables").

-Doug
