Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4BA82DFB24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 11:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgLUKlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 05:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgLUKlm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 05:41:42 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CCEC0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 02:41:02 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id z136so8421658iof.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 02:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tzabDuWmM3g5ZkaOr2QySkn/9M6a1A2MD8omeBNCWbM=;
        b=OoK9GePTmRNbd6WWPi0aUbjvK9fwYRW49mNoUmvsgE0GRxMQ9EjdYWTRQFXzKM6VV3
         TUPCQFzVNsdor9TmGl6s25zqjVR0tRyoOFGzepRpANjqRNGPpNZkR5dhZyH6qXwDgqnV
         hsrh7rL2/eHAijyYeXEEKiy0QDQNjCobg23N39P44MS2AxATpCtb2lejXlhWpHRDQPNL
         8n4qGA7Yll74ppfXUE3eQAQ6KsiLOzCt/Wa3rudRjbJ66veA4Dv7U1d0f0WhPnQxNznf
         jJI3M91U1n8Sk8BIpIMytPZussgTfiEpwjgpDps3qAhEbEFkFtWGE1GnsR5KEuAShxGj
         2ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzabDuWmM3g5ZkaOr2QySkn/9M6a1A2MD8omeBNCWbM=;
        b=eJTc+Ctc8vLJPi9PCk1ZChgRFvI5kAwdE2LIGt2qz3R9DRuCdzCQR2gvozk/NZzqQH
         lD7dDzWbY7QSAzb5qJnOybpWde++g0ET6lDPsWRqgj5TPN+VSdcB0R8Kio6FwJRgwK1s
         4a8LLvKpyIvz5vzQkv9mfOaJIJZm0oRT2t3j/qDwhfWmCTZ3/nvBmW3djN9+BYG08W1n
         +HzjfHo5b/SeYxp6ek6rmceEkwoRoO3cNMKYgcBv6BcZe7F1w+zszg16NG1Eb4TgTcKY
         Xap7knnoevHUKF5ldzYKVYSap49cJgr5de0G88iyQpRTohmM3FWiZ4h+7tvI4cBLjiXQ
         nD2g==
X-Gm-Message-State: AOAM530s9MxalSw3plIWUW46ADZ4UVuGS+QAVEa4ROohvfu6XDh0rquh
        cJ6ystcvWPgBBhoKVOIUPR/AriWmug09lQde+5TPOw==
X-Google-Smtp-Source: ABdhPJyFQyl1t0H4p6tZG/o1SwqRmGMAx0ZxPSCwOV7m56OEBD7j9iKK9VmxZJ3e+OwcF6LCmRCkuR8LP/mn38i3NyQ=
X-Received: by 2002:a05:6602:2b01:: with SMTP id p1mr13586508iov.156.1608547261441;
 Mon, 21 Dec 2020 02:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Mon, 21 Dec 2020 18:40:50 +0800
Message-ID: <CAAQ0ZWRU71ayBKQG3956XqEBkOmwjKi4LE8_OH=YYZ9LFbZB5g@mail.gmail.com>
Subject: Re: [PATCH] venus: core: Fix platform driver shutdown
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 21, 2020 at 5:58 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> With TZ system reboot cannot finish successfully. To fix that
> enable core clocks by runtime pm before TZ calls and disable
> clocks after that.
>
> Fixes: 7399139be6b2 ("media: venus: core: add shutdown callback for venus")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

It fixes reboot on Lenovo Yoga C630 laptop for me, so:

Tested-by: Shawn Guo <shawn.guo@linaro.org>
