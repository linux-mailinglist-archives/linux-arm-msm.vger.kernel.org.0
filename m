Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA0B386B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 22:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238877AbhEQUSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 16:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238749AbhEQUSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 16:18:55 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70569C061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:17:38 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id a22so7085222qkl.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vLJpaxOqtbI+Qb2zKdqGEkILQIDGWpq1zNOEwsHFtPQ=;
        b=ZrQnlImcr9WmIFORVAFZEDpXisiakdk1c7hJMqPolW1P1zOfpLXZ3jX5JU9XArrkzs
         G34/AQNfxUiOIu9TsyBjCX92VuSpj1TU4tm1DDgZ1LYT+tZzk7hX8XHH+P0xYvW8BNO5
         78J1WTzrDq24zp159QAD+LFEZPxjmaEHktb1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLJpaxOqtbI+Qb2zKdqGEkILQIDGWpq1zNOEwsHFtPQ=;
        b=aCJ8eyKvJmSDNUDE9QNtcvrchYIgxk7MnWpjuSB+Zg8FEmG8JzuBiN38iSG265heNI
         Rduv3rxud1TIeam1HSPTB8aTjNxos+8TgnIP03cbKtqX7TaRJY9xjI5VmguO6FctAEAf
         sZrxlp0d07JBJfns9cJJhCta8t3wilfYiDwV8AJfs4YsN8WdC0+syIKWQa25r84ydujH
         ras7ZGR3IHRRHg4CpiHMKMxHvPqycW9yV2FpMDOLmc6ndvMopFsCFqlkx1KDWlAb34hi
         aF6Go20UX8mLg58YQUM+uMEuQ1docDRtpizimlO7RHyMXLnYj1hxd+kf+iafF5Fnord7
         Gt5w==
X-Gm-Message-State: AOAM531A+UpRJt2MeHaRawAQNhFSysKYoKtkHkBsI7nQZPmhtFO21YXg
        CSoCRBdxZ2A2oUiXLDBYmBKlO5fMxklxkQ==
X-Google-Smtp-Source: ABdhPJzD6FZ3TIUZNgsyt1mqrqZ16pM6/LM3H/kB6ucJICNfekwXSJmxQPiHaL7vDaUTsPsVellSxw==
X-Received: by 2002:a37:a751:: with SMTP id q78mr1618418qke.482.1621282657761;
        Mon, 17 May 2021 13:17:37 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id c141sm11253881qke.12.2021.05.17.13.16.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 13:17:05 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id b13so8842302ybk.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:16:58 -0700 (PDT)
X-Received: by 2002:a25:aad4:: with SMTP id t78mr2151750ybi.343.1621282601374;
 Mon, 17 May 2021 13:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210503215844.2996320-1-dianders@chromium.org> <20210503145750.v6.1.Ib7e3a4af2f3e2cb3bd8e4adbac3bcfc966f27791@changeid>
In-Reply-To: <20210503145750.v6.1.Ib7e3a4af2f3e2cb3bd8e4adbac3bcfc966f27791@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 17 May 2021 13:16:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UuBo_T_FiPWT3Wz1SGtcAkwnsKKAtxtLkGDnzeYaybtg@mail.gmail.com>
Message-ID: <CAD=FV=UuBo_T_FiPWT3Wz1SGtcAkwnsKKAtxtLkGDnzeYaybtg@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] i2c: i2c-core-of: Fix corner case of finding
 adapter by node
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Lyude Paul <lyude@redhat.com>, Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Linus W <linus.walleij@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 3, 2021 at 2:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The of_find_i2c_adapter_by_node() could end up failing to find an
> adapter in certain conditions. Specifically it's possible that
> of_dev_or_parent_node_match() could end up finding an I2C client in
> the list and cause bus_find_device() to stop early even though an I2C
> adapter was present later in the list.
>
> Let's move the i2c_verify_adapter() into the predicate function to
> prevent this. Now we'll properly skip over the I2C client and be able
> to find the I2C adapter.
>
> This issue has always been a potential problem if a single device tree
> node could represent both an I2C client and an adapter. I believe this
> is a sane thing to do if, for instance, an I2C-connected DP bridge
> chip is present. The bridge chip is an I2C client but it can also
> provide an I2C adapter (DDC tunneled over AUX channel). We don't want
> to have to create a sub-node just so a panel can link to it with the
> "ddc-i2c-bus" property.
>
> I believe that this problem got worse, however, with commit
> e814e688413a ("i2c: of: Try to find an I2C adapter matching the
> parent"). Starting at that commit it would be even easier to
> accidentally miss finding the adapter.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> Later patches in this series won't work right without this one, but
> they won't crash. If we can't find the i2c bus we'll just fall back to
> the hardcoded panel modes which, at least today, all panels have.
>
> I'll also note that part of me wonders if we should actually fix this
> further to run two passes through everything: first look to see if we
> find an exact match and only look at the parent pointer if there is no
> match. I don't currently have a need for that and it's a slightly
> bigger change, but it seems conceivable that it could affect someone?
>
> (no changes since v1)
>
>  drivers/i2c/i2c-core-of.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

FYI that I've just posted v7 of this series and I've dropped
${SUBJECT} patch from my series.

I think that ${SUBJECT} patch is still correct and could be useful to
land, but it's no longer needed by my series since I'm getting access
to the DDC bus in a different way. If this patch needs to be spun,
please let me know. ...or, feel free to land it! :-)

-Doug
