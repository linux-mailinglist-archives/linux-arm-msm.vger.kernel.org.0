Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C379537123A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 10:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbhECIBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 04:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECIBY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 04:01:24 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11634C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 01:00:31 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2855559pjv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 01:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pPkRu271k1VtMsrvFMhOCOHk+uYbcduLdSOYa4USJOw=;
        b=XI1fRVVOtkTSM5Q3ixXkJd/EDI81jweGn5k3LY3cFI3Mwk8UgpO6JnS1yQSwPe45H3
         XsJRNt5WVF5su65j9PgtvdZJa60/9tK6TUpWH7BIg0EqCXJP+Uw2B768+izLHPhmc+AI
         rhoDFAhYHkQUl0rkUQE1ecv7nclOD3OlqtUNCvj8O76Koles1kydtZo244S7kVL97IsS
         zZ8MOGLnA9pP1UE0nLb9n3sPjvZm2zGofwTs0RwKdU1LkZtnRjewkASvRmZT4kuTn5bu
         Ks5lv3cU4IhQw/1RkqnynGspMZPqlgCfx8VRFTmeOGwA9nUNqH8OZwRRpxqsdzxE26m3
         /JdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pPkRu271k1VtMsrvFMhOCOHk+uYbcduLdSOYa4USJOw=;
        b=XiOJMuzYPGd/ZgV3Yr3btvhYNNaVA7O8ftj+GwK9CE6oPPJdTvbOKd7IoJFJC88Jgx
         E+122hAza6ml6Rgrssmv52SPqRtVNEnMFM/p/6ZlN1wGPRMd1lXVK53CwhLM0x+8IJeW
         V1HvEOu5yJGvYTaBFkdJLRGeJ0ai/3p9C0TFT9fgJMPA81YgiIyAfYgRMWXTRSGWy8FQ
         Pn/j0Jn/FNPV2kSfCoZRMy5aXwQtEyNDKS6xpeDgoQ1D1lJo2vx93kVyZgZAV7mu5+ss
         ZE8qaTtvg2PLzyB0PCI8w8zpLttp6WjLYZdA/D7JtzCBDXf01ZLc/tprdtNzRuyap32g
         e6ww==
X-Gm-Message-State: AOAM532kVx9dHNEkSgkSQHtV4PDzOW419oqaxFfyToWNadOTHqcdY6K8
        IPHNRPTBuKIZtqyL1gV5Fi6e2GIFAXMjxz3NrDTG1A==
X-Google-Smtp-Source: ABdhPJy9HgB+o3DYnLKHRZ8iEYUd8eT/EQLuFJQPCoFJd8ejfH9TWyg7+/nw5FLvaSIOa8fPHM/P7vs9ZRPclqNiBoA=
X-Received: by 2002:a17:902:b20e:b029:eb:47e3:5977 with SMTP id
 t14-20020a170902b20eb02900eb47e35977mr18837749plr.67.1620028830573; Mon, 03
 May 2021 01:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210429014226.21017-1-jarvis.w.jiang@gmail.com>
In-Reply-To: <20210429014226.21017-1-jarvis.w.jiang@gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 3 May 2021 10:09:06 +0200
Message-ID: <CAMZdPi_d5_LvyATp3P3qy7cns7-2kcU4YCTdm2Gnx0-3indKnQ@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: pci_generic: T99W175: update channel name
 from AT to DUN
To:     Hemant Kumar <hemantk@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Jarvis Jiang <jarvis.w.jiang@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Chi-Wei Chen50 <cchen50@lenovo.com>,
        Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani, Hemant,

On Thu, 29 Apr 2021 at 03:44, Jarvis Jiang <jarvis.w.jiang@gmail.com> wrote:
>
> According to MHI v1.1 specification, change the channel name of T99W175
> from "AT" to "DUN" (Dial-up networking) for both channel 32 and 33,
> so that the channels can be bound to the Qcom WWAN control driver, and
> device node such as /dev/wwan0p3AT will be generated, which is very useful
> for debugging modem
>
> Fixes: aac426562f56 ("bus: mhi: pci_generic: Introduce Foxconn T99W175 support")
> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>

Should be considered for 5.13-rc* since to properly fix the issue.

Thanks,
Loic

> ---
>
> v2: Add: Fixes: aac426562f56
>
>  drivers/bus/mhi/pci_generic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 7c810f02a2ef..8c7f6576e421 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -311,8 +311,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>         MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
>         MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> -       MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> -       MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>         MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>         MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> --
> 2.25.1
>
