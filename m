Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2109455058
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 23:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235944AbhKQWYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 17:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241149AbhKQWYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 17:24:01 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A0EC061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:21:02 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id z18so5346020iof.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DQ6elq6nVtK4KAFlbAj13glbxl4LSkGCHsTX6YgbDv4=;
        b=bc57ITuy+htwK3TsFcu+NbB6EmJlVvh0s2BfK1gjuvqBaezyOXu3Ldlg+ZhTuqxWed
         hCggVPwmc5Tkg+dpDgINU349sfcV6PN6/B5+TqpyJnTBS6vYuZ3fPAbLn86iCVoZXLd5
         dcFEdKstEsKKCo7WC+Y61uysrBreDuW7qAYzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DQ6elq6nVtK4KAFlbAj13glbxl4LSkGCHsTX6YgbDv4=;
        b=40W8kNPzf6kablFZSoQmQiHIKx9aOoV3owpugCqFL0QK6oZu1RIYZTFPIc5NsAlu4X
         lU3kRU3fjhuAjP9WR/W6qQx6vTrEkZcj8rAhvpY7r6Yhxg6UApagnuSURgimpvftFTK6
         1wJSBp7Bdh5wuaErmnQpAVgAGPHGys0zeAxKsVyerC+dnhM4UP5ErDFp/KIe6QxpLDP0
         4gVWoNvW3XERO2rO/hNdX2+0n7ZJGAc95BX5YHqFwHAwoBhSxegyWLZmLsm2CDbi8PZC
         8AsBrcftk5B7rcBkLtuicDZwNDU5wGgj1enHxiQBBY4iwGAkYrwTw3fYrIXsDolw+jhg
         nWkQ==
X-Gm-Message-State: AOAM532CLy98E1ljIsiD+ptI0zFUTgkWxxhKUqgVjz5e0CTZTmozWZ8k
        HY03/1Iz7Prqjfqd/Qsk0D9p184MrV0MOQ==
X-Google-Smtp-Source: ABdhPJx2Lgl0Xwlq8w/duWGSOe5/lBW4e5KrP7pRP2IEpr+9FNID37ckI8CbogCViQ/4Gfr3h05JDw==
X-Received: by 2002:a6b:f715:: with SMTP id k21mr13791260iog.96.1637187661634;
        Wed, 17 Nov 2021 14:21:01 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id y11sm621877ioy.19.2021.11.17.14.21.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 14:21:01 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id y16so5327526ioc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:21:01 -0800 (PST)
X-Received: by 2002:a05:6638:190f:: with SMTP id p15mr16449373jal.82.1637187660805;
 Wed, 17 Nov 2021 14:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20211117133110.2682631-1-vkoul@kernel.org> <20211117133110.2682631-2-vkoul@kernel.org>
In-Reply-To: <20211117133110.2682631-2-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Nov 2021 14:20:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+JD6Bmsfa-e-L--wLrdUVfDF+EKOAe9Pp9pc7G5FkyQ@mail.gmail.com>
Message-ID: <CAD=FV=U+JD6Bmsfa-e-L--wLrdUVfDF+EKOAe9Pp9pc7G5FkyQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] spi: qcom: geni: set the error code for gpi transfer
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 17, 2021 at 5:31 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> @@ -346,17 +346,20 @@ spi_gsi_callback_result(void *cb, const struct dmaengine_result *result)
>  {
>         struct spi_master *spi = cb;
>
> +       spi->cur_msg->status = -EIO;
>         if (result->result != DMA_TRANS_NOERROR) {
>                 dev_err(&spi->dev, "DMA txn failed: %d\n", result->result);
>                 return;
>         }

Don't you want to call spi_finalize_current_transfer() in the case of
a DMA error? Otherwise I think you're still going to wait for a
timeout? ...and then when you get the timeout then spi_transfer_wait()
will return -ETIMEDOUT and that will overwrite your -EIO, won't it?

-Doug
