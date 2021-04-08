Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E4A35792E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhDHAwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbhDHAwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:52:23 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91434C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 17:52:13 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id u8so193446qtq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 17:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L5yfAUGiZFJkNA9RfiOgP3uV3LeaPw6a590eKETYIu0=;
        b=fKfNaOs7X82cJk1fgyRtmEvQVgCHBl4vm+WCkijF++iaQFxZGIqQYf0AkCsuPPInna
         bkfvwcREPxlujfTS2Tk1M6Mm2sUTOt51YyqEIIglfDE1AdTSaFOWI54u/etx4yLeSfky
         I7QlrtUKNhL3nks5nDLVI3QyMt6bBNanSmWK9DLb7BzBhro5tGm0QGxXcFRi5D7q2iFG
         +rxJMAVw6LhH4tf3QdZ9vMgqf+kc4z45VM1jXJUQjhy9rESinejs9atGB7p8WLuQLPQB
         mBcXVROzs5/D7OWCKO6VxY5hBscXJZbVdvZ5sM68I+DD3e1g0cHdYlLXkHnjGr4OrMEn
         SpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L5yfAUGiZFJkNA9RfiOgP3uV3LeaPw6a590eKETYIu0=;
        b=MjwBCOlGzYt/FCJpTHvrLC3s68SQd24Lpc9svxpUPhL8MAUeYc+AUZiA6kWSHkrnj9
         v15N58rGFFaEEPQzsyVA21Yc0piYsFqgMsPjoN2vevZMEmodMoCwDWM9O+7rykmbXcrk
         QW9jCV4YAjmRbtaXbDjr9JGkjkWWomQ+vKTZSiqhbW7fzsvklxpMrRqYco1gYyNXR+Ul
         YQUPzFA5MmqyqmLXaO6FmC8kGYu/gKtegfYtT3BmrCzx7QDZZqq4ALhLqgaM6+gURpf0
         33iTW3YTWVvAfGlSLM0oDa5YtZYqqkp/VthIL36wPSFmJLCYXIS+TbaGUD5GsnFh/W0U
         WySg==
X-Gm-Message-State: AOAM5321yM/NGLE7HgsRuvxcbB8pNVkdgJfuDxvgH0l3pF4pt2f3gbA6
        SI3EzUCySKbYG/YceLlvQKEjRhUnNFzlmpL2yJEQkg==
X-Google-Smtp-Source: ABdhPJzJ8+guDK2jykRmIgjQKrxvpiLJtyPHjNkJrx3bJ09kkML0pQ5QsCxEFOsrCIYaODTl5cHqVcOJ7cG9vJrNs0A=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr5037841qta.135.1617843132752;
 Wed, 07 Apr 2021 17:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
 <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
 <CAA8EJppsM1sP=OTiMY8jsLLgU=+p3qgZDD7M+M5naJhfFEF_Zg@mail.gmail.com> <161783803315.3790633.10829887417379757624@swboyd.mtv.corp.google.com>
In-Reply-To: <161783803315.3790633.10829887417379757624@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 8 Apr 2021 03:52:01 +0300
Message-ID: <CAA8EJprrQVPZxV7nhScgTCL7ZKU2c1AicNjOvd2YUEu8pCUxkQ@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>, open
        list:DRM DRIVER FOR MSM ADRENO GPU <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>, Rob Clark
        <robdclark@chromium.org>, Daniel Palmer" <daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Apr 2021 at 02:27, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-04-07 15:57:01)
> > On Thu, 8 Apr 2021 at 01:41, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> > > > devm_clk_hw_register_fixed_factor_release(), the release function for
> > > > the devm_clk_hw_register_fixed_factor(), calls
> > > > clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> > > > after that the devres functions will also kfree the allocated data,
> > > > resulting in double free/memory corruption. Just call
> > > > clk_hw_unregister() instead, leaving kfree() to devres code.
> > > >
> > > > Reported-by: Rob Clark <robdclark@chromium.org>
> > > > Cc: Daniel Palmer <daniel@0x0f.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >
> > > > Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> > > > getting it into 5.12, otherwise there will be a cross-dependency between
> > > > msm-next and clk-next.
> > >
> > > Think I can get this into the last fixes PR. One question though, I
> > > think this follows the pattern that things like clk-divider.c use for
> > > devm. Are those also broken?
> >
> > It looks so. See e.g. the devres_release() function. It calls
> > (*release) callback, then it will kfree the resource.
> > Also see Documentation/driver-api/driver-model/devres.rst, which does
> > not kfree() in release functions.
> >
> > Do you wish for me to send all the fixes?
> >
>
> Yes please send more fixes. They're not high priority though so I'll
> probably leave them to bake in next for a week or so.

Short story: no other patches needed.

Long story:
I've checked the rest of devres allocations in clk subsystem.
Interesting, they use a bit different pattern: they devres_alloc a
pointer to the clock, then they fill the pointer with the new clock
data. The release callback would (correctly) free the clock pointer by
the devres and then devres code would kfree the devres data (clock
pointer).

The fixed-factor is unique in this area, because it devres_alloc's a
clock instance (rather than the pointer) and then fills it, so it
should not be freed in the release callback (only unregistered) with
the devres code kfreeing() the instance itself.


-- 
With best wishes
Dmitry
