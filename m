Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024C322852D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 18:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbgGUQSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 12:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729607AbgGUQSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 12:18:51 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FA0C061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 09:18:51 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id e13so19875525qkg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 09:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J4aW0UxvuQIduet3jIOxOj54MUkYDsbNIhpVvbjijkw=;
        b=dZbyKZk2dBGB1hjMOMBTIT9aCXKW26+6koDX+2g0z9R04UYraQAHZhWcdihWn80tlu
         bKkZrTGe2+ITwRCeOMCCm0KQfKp0/NZHlXVfyt1yTkfS35q52z69ZJdyHknNSPOUmYyT
         A/YPAmfiXCqSWLsWBN+7eKZsZ4yRxzBFx95FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J4aW0UxvuQIduet3jIOxOj54MUkYDsbNIhpVvbjijkw=;
        b=XN1UO0yvtQpRPPZOWcfTlm7xiBnuJ5JVopKFB1pgSWB4NvbsWo/3XTf6SFPbIuoxSe
         BaeaxToAWcIgXSwDYMynWj7nqzpIdD61gpFeh6rDEd0u2GRZ/3wSwTNPIskBNZFiwPkl
         0THy8r4l49dLBOAJd0msUGEzTcKMbISX8jwvlpuRdVwF9Vy5ytWmAQaG82UhxydbUmZv
         acaK1uMl8A3fOniafgJID6NkUCoVxWhWfiGoo4ifO6UhDCv+AD1sUxDxMhySrJ28t9ns
         Hoa0MMjzAvBC2ywzulT/pVhgfd5K1vl+xFsOJf4Zu2t0gdaEB9EdLj7xFhRCrDqcDuBt
         FI/Q==
X-Gm-Message-State: AOAM530D6hnIw4Ug846OKhJZDvdqzEUhc8I7TQm19/6m+jXMFroxS+nI
        CW65yQY+ErZL1gPNLstveFL/H817kA4=
X-Google-Smtp-Source: ABdhPJxY2YiCg1IrrkcvqcuRD0wez9iotRrbh248+64JF1+71i9X5Z51dXLpZVEG/2xtR5Cm8uilUw==
X-Received: by 2002:a05:620a:2158:: with SMTP id m24mr27783007qkm.494.1595348329799;
        Tue, 21 Jul 2020 09:18:49 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id i84sm2668237qke.32.2020.07.21.09.18.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 09:18:48 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id f5so10271924ybq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 09:18:48 -0700 (PDT)
X-Received: by 2002:a25:9d86:: with SMTP id v6mr42999027ybp.452.1595348328068;
 Tue, 21 Jul 2020 09:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
 <159531115483.3847286.18280088484118119899@swboyd.mtv.corp.google.com> <159531527579.3847286.1254956818647049462@swboyd.mtv.corp.google.com>
In-Reply-To: <159531527579.3847286.1254956818647049462@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 21 Jul 2020 09:18:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=NDym3V31dQ8c341UwQm9pDybUCR8jFF1JR99XeVKVw@mail.gmail.com>
Message-ID: <CAD=FV=X=NDym3V31dQ8c341UwQm9pDybUCR8jFF1JR99XeVKVw@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 21, 2020 at 12:08 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Stephen Boyd (2020-07-20 22:59:14)
> >
> > I worry that we also need a dmb() here to make sure the dma buffer is
> > properly mapped before this write to the device is attempted. But it may
> > only matter to be before the I2C_READ.
> >
>
> I'm suggesting this patch instead where we make geni_se_setup_m_cmd()
> use a writel() so that it has the proper barrier semantics to wait for
> the other memory writes that happened in program order before this point
> to complete before the device is kicked to do a read or a write.

Are you saying that dma_map_single() isn't guaranteed to have a
barrier or something?  I tried to do some searching and found a thread
[1] where someone tried to add a barrierless variant of them.  To me
that means that the current APIs have barriers.

...or is there something else you're worried about?


> ----8<----
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 18d1e4fd4cf3..7f130829bf01 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -367,7 +367,6 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>
>         writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> -       geni_se_setup_m_cmd(se, I2C_READ, m_param);
>
>         if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
>                 geni_se_select_mode(se, GENI_SE_FIFO);
> @@ -375,6 +374,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>                 dma_buf = NULL;
>         }
>
> +       geni_se_setup_m_cmd(se, I2C_READ, m_param);

I guess it's true that we only need the setup_m_cmd moved.


> +
>         time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>         if (!time_left)
>                 geni_i2c_abort_xfer(gi2c);
> @@ -408,7 +409,6 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>
>         writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
> -       geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
>
>         if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
>                 geni_se_select_mode(se, GENI_SE_FIFO);
> @@ -416,6 +416,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>                 dma_buf = NULL;
>         }
>
> +       geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
> +

True, it's probably safer to do the TX too even if I'm not seeing
problems there.  Of course, I don't think I'm doing any large writes
so probably never triggering this path anyway.


>         if (!dma_buf) /* Get FIFO IRQ */
>                 writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd464943f717..1dc134e9eb36 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -262,7 +262,7 @@ static inline void geni_se_setup_m_cmd(struct geni_se *se, u32 cmd, u32 params)
>         u32 m_cmd;
>
>         m_cmd = (cmd << M_OPCODE_SHFT) | (params & M_PARAMS_MSK);
> -       writel_relaxed(m_cmd, se->base + SE_GENI_M_CMD0);
> +       writel(m_cmd, se->base + SE_GENI_M_CMD0);

I'll wait a little bit to see if you agree that the implicit barrier
that's part of dma_map_single() gets rid of the need to change
geni_se_setup_m_cmd().  If you agree then I'll send a v2 that moves
just the setup_m_cmd and does TX in addition to RX.  I'll plan to keep
accumulated tags unless someone says this is a bad idea.


[1] https://lore.kernel.org/r/1264473346-32721-1-git-send-email-adharmap@codeaurora.org/

-Doug
