Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4340242A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 15:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgHLNwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 09:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbgHLNwW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 09:52:22 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F50C061385
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 06:52:21 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id l184so512654vki.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8InXO4IHlwCJ/3LHKr2wC5cvoqCeqc4wxbX8rXjUiPg=;
        b=N+kSkmDigJZm9bdYj2CCq6cRuTJusMts4MyrYLhaepzh1SFeONS44pX8HelNsXmkpt
         Sar1XiJvk4yffabWSLuwN6z7snQ+dFjiNxSHvBEnAwmsfgNATsdM1HHNgVZ0t9hUvslm
         ipOuT2PSmwUT1HfAGS8oOlizyFM9mh0PMN6DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8InXO4IHlwCJ/3LHKr2wC5cvoqCeqc4wxbX8rXjUiPg=;
        b=stnpHojT5AcxCCeHG1v9/hXB8wkPOHNX7fiAerlPEgO+Nnvse7i5gHxfaWFMOLGyWh
         iG3yjJ0ULoIvGoqxy63KUl2XzvHDZ68L4havdWVuUXs+ImkZWbORlqMoMkGun5wRq5eE
         aV92YaGJQBN81ASQEsvQ3oX2amUTxbgjGQ21g1408JEgmytvykpwHXI5BcXnd8hljWae
         n1rGNjQfaNdAlpaoY7mZXecNbQCEQxfya45dsxF3KN4b+oodQpiUaT8T8X3m3fZjhcFD
         EmsqKzC7UUeppiI63aKQaRxA369HCPIaxBp4xth8ydJ78lxKHc51GSbq/Gt8V1w8UhiH
         R49Q==
X-Gm-Message-State: AOAM5330tu7FsPSNY67sXjcR/1szg3Pmda4qgdxxWfibPytKc443YehN
        hkfdu4j/MByJsKBKHwNaB7f5JsmNDpg=
X-Google-Smtp-Source: ABdhPJynEfcvPilR4yQmKRM8UkDR6nOthlfAlyHJrDJetiKDHf8TngN75plrzahbSObbqekYjSgU/g==
X-Received: by 2002:ac5:cb6e:: with SMTP id l14mr28544513vkn.72.1597240339158;
        Wed, 12 Aug 2020 06:52:19 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id y9sm216075uay.14.2020.08.12.06.52.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 06:52:17 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id x19so616857uap.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 06:52:17 -0700 (PDT)
X-Received: by 2002:ab0:3114:: with SMTP id e20mr27858800ual.104.1597240337098;
 Wed, 12 Aug 2020 06:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200215021232.1149-1-mdtipton@codeaurora.org> <158378825407.66766.14135857856613969751@swboyd.mtv.corp.google.com>
In-Reply-To: <158378825407.66766.14135857856613969751@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Aug 2020 06:52:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WsD7w9oqbUUKJwWSRsfZ9qTLy9KyNp8i+BShi7S-R92w@mail.gmail.com>
Message-ID: <CAD=FV=WsD7w9oqbUUKJwWSRsfZ9qTLy9KyNp8i+BShi7S-R92w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Wait for completion when enabling clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc:     Mike Tipton <mdtipton@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 9, 2020 at 2:11 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Mike Tipton (2020-02-14 18:12:32)
> > The current implementation always uses rpmh_write_async, which doesn't
> > wait for completion. That's fine for disable requests since there's no
> > immediate need for the clocks and they can be disabled in the
> > background. However, for enable requests we need to ensure the clocks
> > are actually enabled before returning to the client. Otherwise, clients
> > can end up accessing their HW before the necessary clocks are enabled,
> > which can lead to bus errors.
> >
> > Use the synchronous version of this API (rpmh_write) for enable requests
> > in the active set to ensure completion.
> >
> > Completion isn't required for sleep/wake sets, since they don't take
> > effect until after we enter sleep. All rpmh requests are automatically
> > flushed prior to entering sleep.
> >
> > Fixes: 9c7e47025a6b ("clk: qcom: clk-rpmh: Add QCOM RPMh clock driver")
> > Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
> > ---
>
> Applied to clk-next but I squashed in some changes to make it easier for
> me to read.

This landed upstream as commit dad4e7fda4bd ("clk: qcom: clk-rpmh:
Wait for completion when enabling clocks") but seemed to have missed
stable.  Can stable pick it up?  It has a Fixes tag so presumably it
should be easy to track down where it needs to go.

Thanks!

-Doug
