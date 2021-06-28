Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC7B3B6B7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 01:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbhF1XlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 19:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233087AbhF1Xkw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 19:40:52 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B6BC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 16:38:25 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id f6so4944467qka.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 16:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24QEkp0ruWhDlT9VQmxg2IKCctjJ1YCdLUMV4LRFyKE=;
        b=n26F1lBmm4to9yGPrWtcwiSQlCE8KWJY8cbH7iQ4rk1IYXPxPFs2M6rM8hmszNUgqL
         hZf4vIMkv9rQ8DcEDy+TH2m7mmH6Z0/QKLcNLz/OUc6Ck2sn0ncFULz1+CMCYw+x9Mv+
         mdFa22ui/u+464tf4K7a8BDoPKWzQ75CHlRjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24QEkp0ruWhDlT9VQmxg2IKCctjJ1YCdLUMV4LRFyKE=;
        b=F4rVh3nWHOg39wLCeXOsUT+FPXn8PF5FQshXNX2544rCg1aSCgnIhlFj6NjMsGKRG9
         Uz19NWdEjaQNI3Wg7rTK/+XLUA8XOQOZxpZhlJeNlqutm/n7FAc/Bg1ALbgGVFSKzLrX
         h7l78W9IJYqaiJR+tzGR+/3wxMvvcgjlioX2gP5vOcSFYqtLDDTS3lXB0sXcVmuSim0n
         A/VPFwzEOUJFJ+vuF60n0i/92qqfatqfCUGtCNlXHuMsK9vrG7GyVua9/P/uzVKAeTlA
         eeRcn6cKZ0TTUd11JccPxJ9J5oFo3lIjZb1J6wps5DC7Oia0QiIOt0pijpvnXKf8uqjb
         ciRQ==
X-Gm-Message-State: AOAM5315eoL4XsKwLugFtoE/cFQchKZoariuOQ2iBpgbNe0/3GY8Dam4
        MaSgm54dasIW7rQGVp524yYbAUn4j6FWrg==
X-Google-Smtp-Source: ABdhPJy0lQUYlbHWWYisf5UL8baIMt5H0fdi9QywNQEsIsyg2apU+yFrX89aHYtw8LGL1vp8heo8aw==
X-Received: by 2002:a37:bb82:: with SMTP id l124mr27790566qkf.119.1624923504641;
        Mon, 28 Jun 2021 16:38:24 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id y8sm4622357qtw.43.2021.06.28.16.38.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 16:38:23 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id p15so21378469ybe.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 16:38:23 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr35812620ybb.257.1624923502959;
 Mon, 28 Jun 2021 16:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210625052213.32260-1-vkoul@kernel.org> <20210625052213.32260-3-vkoul@kernel.org>
In-Reply-To: <20210625052213.32260-3-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Jun 2021 16:38:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ULVo=vz2Vww6_bcfrhosy0GRC2oVEcXt6zw8n4C2MiuQ@mail.gmail.com>
Message-ID: <CAD=FV=ULVo=vz2Vww6_bcfrhosy0GRC2oVEcXt6zw8n4C2MiuQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] soc: qcom: geni: Add support for gpi dma
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 24, 2021 at 10:22 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> +static void geni_se_select_gpi_mode(struct geni_se *se)
> +{
> +       u32 val;
> +
> +       geni_se_irq_clear(se);
> +
> +       writel(0, se->base + SE_IRQ_EN);
> +
> +       val = readl(se->base + SE_GENI_S_IRQ_EN);
> +       val &= ~S_CMD_DONE_EN;
> +       writel(val, se->base + SE_GENI_S_IRQ_EN);
> +
> +       val = readl(se->base + SE_GENI_M_IRQ_EN);
> +       val &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
> +                M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> +       writel(val, se->base + SE_GENI_M_IRQ_EN);
> +
> +       writel(GENI_DMA_MODE_EN, se->base + SE_GENI_DMA_MODE_EN);
> +
> +       val = readl(se->base + SE_GSI_EVENT_EN);
> +       val |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN | GENI_M_EVENT_EN | GENI_S_EVENT_EN);

nit: the above has some extra parenthesis that aren't needed.

I will continue to assert that all of the "set mode" stuff doesn't
really belong here and should be managed by individual drivers [1].
I'll accept that it doesn't have to block forward progress, though I'm
at least a bit disappointed that we asked Qualcomm to do this over 8
months ago and no action was taken. :(

In any case, this looks OK to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


[1] https://lore.kernel.org/r/CAD=FV=VWPqswOXJejyXjYT_Yspdu75ELq42cffN87FrpTwPUQg@mail.gmail.com/
