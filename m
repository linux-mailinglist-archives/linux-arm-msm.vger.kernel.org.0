Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C074252164
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 21:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgHYT7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 15:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYT7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 15:59:10 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6220C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 12:59:09 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id a127so70799vsd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 12:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AyZxIenRzLRb0uRNdBtgusm7ii5Z3WvQsO/+O8B9aLw=;
        b=b+B9hcGB4rLX+gwJzENPKtNLlKGAgqbg52OJSJg1f0lT1z9E4c9rD3zsD6Zs3A/4y6
         cHhV2Z10WGiLIf3VBY6UQvvTeU+eAn8mpZw+QeyjOGm8nzZ6glkmyD4YKNzyo0KH4ngq
         9bN1QNwPEZriPLnpyzBN33I9fBMC/Nnhx1jD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AyZxIenRzLRb0uRNdBtgusm7ii5Z3WvQsO/+O8B9aLw=;
        b=fiH6pDdc28aY7YWSHHj/iPQRQIfs5SfAGCaWYH13Uxm0UCbP+gbRx2vwENnvGKHwiA
         eqkSm+KOs+uNmA+P5ZB+6fgU06KylP7EQOcUCEK1zAHLwvlrnByQ4UjmYghHO5lBxX6m
         jaSJeN6+zElsJoVzHQWHEmLKCmTnsx68zbylxRVMIqkGD3iJFB+AswyqU+3N1WB2/BFj
         WFtImYbXBJCx+X89YxE6Z8PWkVoZ57zFTROXZrliQaV5Tj+AswxkA+CRXSWdMM+ag2Fk
         bOVWb30t+VlyBAq2kjMA5IHXazW2O1ZdnBrC7cmAhUkKPI6u9bpYMrzpVhq2lwmoxmci
         KXIQ==
X-Gm-Message-State: AOAM531FU6S9bs4TsWnF5S7VUMgWfxPpaAuZzMfkXtLMPwzxDY+7fPvw
        2rzWLSqW0gDHwEfa53H5Fl/fA8Qwwh61OA==
X-Google-Smtp-Source: ABdhPJwHVA191729LHcLhmaRAkvETE6h3NDIT8754aRvCOZLbf8iezF1GfAdCJixDgQaMm6cI9kwiQ==
X-Received: by 2002:a05:6102:311a:: with SMTP id e26mr7141399vsh.86.1598385548635;
        Tue, 25 Aug 2020 12:59:08 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id d9sm17572vko.15.2020.08.25.12.59.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 12:59:07 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id b12so4110221uae.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 12:59:07 -0700 (PDT)
X-Received: by 2002:a9f:2966:: with SMTP id t93mr6981969uat.90.1598385547221;
 Tue, 25 Aug 2020 12:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-5-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1598113021-4149-5-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 12:58:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMSx4ORdztkb1L-zh+pYEsQOLLALRNjazaZFsEk0Rvkw@mail.gmail.com>
Message-ID: <CAD=FV=WMSx4ORdztkb1L-zh+pYEsQOLLALRNjazaZFsEk0Rvkw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] pinctrl: qcom: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND
 flag
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Aug 22, 2020 at 9:17 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag to enable/unmask the
> wakeirqs during suspend entry.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
