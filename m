Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29622549C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 17:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgH0Pnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 11:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbgH0Pns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 11:43:48 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41320C06121B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:43:48 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id p185so2292887vsp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LekZT6fqormIzr3OUBB/YeLGwuYnhpwtjwtvj+hv9LU=;
        b=WQPNeYqiaulc2ojLWwrgnjus6raDUYTc4Qykz77pOH2Xth9vKVOp6jb7ZrGRaH58sl
         5v1H7aFeGNdsR6acKQzi+ThrW+f08avaHkMEpVuSNn88gbsorlV0megWSV4gUhezyX4n
         v5mFTTSxim9LK8YwQAcEMx0b+uVaRMrEi6ZoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LekZT6fqormIzr3OUBB/YeLGwuYnhpwtjwtvj+hv9LU=;
        b=pHeV92oJquJke0DA6rXxtgzRBMk1YcK1t50g36ApIGqNO/ao9oPWRQC1UXzpEJiMme
         7J+2TA+sj9b1BaIWlQiwofis8zqQaR2ouuDKe3iWiv0hRTM7x7IhowRHsclVN6/gE6Lp
         JK2DiYh58h3hYlzl6Q2XZdA1B3MMbQdO/m6vp6NDpRAn8vMfnC7UCnHrFsgxICWqaTJG
         WG7ZZJx+pPGoc/Vf1Vxn0DQUvwDvc3rjwffWz67dfJTASHev/Ah+Gxn9hZsoJJerK4sE
         x4CZoTQtZpy5WCXtdNakuPE6nuz0xp9iTMh87QH9IFotaGp7Oi4FRbsCdPPAI3P8Jh6W
         Bwqw==
X-Gm-Message-State: AOAM533bYjfd/0QPTVkHc2vS5id7hKwOFnYClsARjPFocj8DMCcMw6hO
        5Rch5HorBa8bP2TLTo8+Dp2CDxMYZexj+Q==
X-Google-Smtp-Source: ABdhPJwmmN9loh6WpavZr2KJS4YwrPKaBUWbfMJFlZIL6lA1rpZxY4ya0GOvjUj1rEOi2ubZH1SBYw==
X-Received: by 2002:a67:e1ce:: with SMTP id p14mr12730644vsl.24.1598543027210;
        Thu, 27 Aug 2020 08:43:47 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id c193sm453841vke.11.2020.08.27.08.43.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 08:43:46 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id 68so1805726ual.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:43:46 -0700 (PDT)
X-Received: by 2002:ab0:3114:: with SMTP id e20mr12437342ual.104.1598543025890;
 Thu, 27 Aug 2020 08:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <1598541694-15694-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1598541694-15694-1-git-send-email-vbadigan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 Aug 2020 08:43:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzkwnxqZ04dqWUdZ+RJ4ioSJ4ruBp9u8NxL3mvuwJnuQ@mail.gmail.com>
Message-ID: <CAD=FV=VzkwnxqZ04dqWUdZ+RJ4ioSJ4ruBp9u8NxL3mvuwJnuQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: Enable restore_dll_config flag for sc7180 target
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 27, 2020 at 8:22 AM Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> On sc7180 target, issues are observed with HS400 mode due to a
> hardware limitation. If sdcc clock is dynamically gated and ungated,
> the very next command is failing with command CRC/timeout errors.
>
> To mitigate this issue, DLL phase has to be restored whenever sdcc
> clock is gated dynamically. The restore_dll_config ensures this.
> Enabling this flag with this change. And simply re-using the sdm845
> target configuration for this flag.
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 1 +
>  1 file changed, 1 insertion(+)

Whoops!  I was too busy debugging and preparing patches and didn't
realize that you'd already sent this.  Sorry for sending it too.
Let's take yours.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
