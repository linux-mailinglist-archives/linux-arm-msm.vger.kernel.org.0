Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2807136B5A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 17:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbhDZPXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 11:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbhDZPXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 11:23:09 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EB3C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 08:22:27 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id 1so41842869qtb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zuSjukxiCRyevuIEXMUCFXprO3MtbZtp2zyl9pqNUaQ=;
        b=SIl7PMMijX8PUREe43mG9a3nM8E8+Iexl49edlsjepXdr/ncicugL1pQX9OdHPlLcQ
         FEhOMkKBToxMTQEsUuoXRtAapJU7OLHb8yDZGyZv+cleBH5YoDgx4pTxwL8MCQi4rrYC
         nzikqyDGf80rXwofWysSRzqHCGy0QW1o0/HQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zuSjukxiCRyevuIEXMUCFXprO3MtbZtp2zyl9pqNUaQ=;
        b=RKkyPkT7uRrgBK+meFCRNJXpY2mrMQZpXozKi7GJQ1VkUuznSrzqV6/XGp7FvL0r/m
         zx7u+jbP/C3uEFFha9lQxl5ASkFcE0OVAvnQlu7njMqnsn36mzWHvTUnN2RUmSXK1+07
         BI3aeup35Krwso+76dQ0GlxcYwwz9pBPP+3P1hbOSIjtYH0/jRx+tG2uNZNvYAk2hOCz
         trghoH+BBgvfn65rm8MTlNSDY2ZMNOakqi1IMYnHW4goLhvUS/L3rYe5A+FLfsQXEM65
         h2C4F8bX5mYHAPksev45uyTjhwJEqnQqlXR4sHrQUD/I3e05MBn3Slq4lG6FEIN9zl6s
         oWNw==
X-Gm-Message-State: AOAM53203VD41V0cZ51OLkbRf0+V5uvZGiqlq5AhvB0pHJnm5mHfMDIV
        8yqe4h0b1/df1hkmY0iqgtQ1XZr1wYUWig==
X-Google-Smtp-Source: ABdhPJw4S76yQR2g7pyz0vcC+xwU/Vqv00QZOvXZSNEpORlSqpEQss0ZA7RNBAvzPMn6VmedPq4Ddg==
X-Received: by 2002:ac8:5b8f:: with SMTP id a15mr3390769qta.21.1619450546617;
        Mon, 26 Apr 2021 08:22:26 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id r81sm248714qka.82.2021.04.26.08.22.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 08:22:25 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id p3so44672137ybk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 08:22:25 -0700 (PDT)
X-Received: by 2002:a25:2d0b:: with SMTP id t11mr21536730ybt.79.1619450545324;
 Mon, 26 Apr 2021 08:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <1619416452-6852-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1619416452-6852-1-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 26 Apr 2021 08:22:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=dGfp2qvDNSg8keGSrGsOf_pEqjRzabrEyr8OdeBARA@mail.gmail.com>
Message-ID: <CAD=FV=W=dGfp2qvDNSg8keGSrGsOf_pEqjRzabrEyr8OdeBARA@mail.gmail.com>
Subject: Re: [PATCH v2] nvmem: qfprom: minor nit fixes
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Apr 25, 2021 at 10:54 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Fix a missed newline, change an 'if' to 'else if' and update
> a comment which is stale after the merge of '5a1bea2a: nvmem:
> qfprom: Add support for fuseblowing on sc7280'
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> v2: Added the change to move the 'if' to 'else if'
> Sending a follow-up patch for these nits since they came in after
> the previous patch was already pulled in
> https://lore.kernel.org/patchwork/patch/1401964/
>
>  drivers/nvmem/qfprom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index d6d3f24..1ba666b 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -122,6 +122,7 @@ static const struct qfprom_soc_compatible_data sc7280_qfprom = {
>         .keepout = sc7280_qfprom_keepout,
>         .nkeepout = ARRAY_SIZE(sc7280_qfprom_keepout)
>  };
> +
>  /**
>   * qfprom_disable_fuse_blowing() - Undo enabling of fuse blowing.
>   * @priv: Our driver data.
> @@ -195,7 +196,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>         }
>
>         /*
> -        * Hardware requires 1.8V min for fuse blowing; this may be
> +        * Hardware requires a min voltage for fuse blowing; this may be
>          * a rail shared do don't specify a max--regulator constraints

Joe pointed out a typo in the original comment that "do" should be
"so" [1], but that's not new to your patch so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/73945e7037ab61eb34a2a1af05aa3eef75c8f836.camel@perches.com
