Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE9741DDC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 17:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345126AbhI3Pl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 11:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344951AbhI3Plz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 11:41:55 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30175C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 08:40:13 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id s20so8135953ioa.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3rSIy18tZojmsrzjfN9FHZFTJAPBKRcMqEY55dmth7w=;
        b=H/6IrwGnlqZqz+Zp8FvojRJnoTCF0J5joy+th6XZ0bLY8vA5ptPZ73KFd0zpaZOPFm
         2UdU+uTV0yCGeeqr6jasZs757aIgb2S7xNZZVJBQ9RpW69ufXMWRkQRLTdrvY3PoqoCP
         8Zcmk0EEifP+TrZ20drZqiFfCjmtAZ+ckByzn938xj+0J58xoFUlcomtD4wlKPMB6X0d
         m8zWToLc/1L+aSh8wG+DwXntZzFfiW1P4i0iCH6wDWzD6Kd4/AWqSa/pgTA+90sZGTRp
         aqlrq/x2jzWUyAPBygKkDKMxNbISBOvEagt+YgKjcD+Eql4RNSlO/vJEBdztAXKp6MvM
         RW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3rSIy18tZojmsrzjfN9FHZFTJAPBKRcMqEY55dmth7w=;
        b=IxHv/SbaLWuRjcKYqcQIiaqx8lQ5Cxh/D8EqbDH3i3jQ/BsM9802OUy0CBjLOQVr22
         ayA5hJaPJvDuEqGmn159xf/9Dfgf9y4Z+upHPm7QJoYKO5w896njrZs+M945izkHwoDS
         m4Vdw2GmLmVAT9+ZmqybBrHTXkKgysDmHpUeAeGZvn+4vC/6w/Qys5VegsZZ9oY4zqio
         USI9Qh/E5dxAr1AXjQzhy4Yy7h2ouW0Ruxd2ZKTM48VWh7ZH83qs8mCDBLxRR1zcrbxa
         KIaBpH6LS3sSESP14H9IqFLOy3aE3hn2FEaiQefUpWlzyHm6KTzz1/g+KXxpvKiINeyd
         MPiA==
X-Gm-Message-State: AOAM533xwqvucnN6QD+vLi32rrfi69u3UasFkn5iwv1V9vfyM0sVukPV
        3NfTq6SSCehwWZ0igAtQ/0s6nK75XQ/WgnttT07qvg==
X-Google-Smtp-Source: ABdhPJyQb/uJaGJlYxt7XHtcYu354PpX7r3E/vrRNXFvnIQvH5kFYsuh7+ZNQ0DQrpwz0sv8l9mUREABQvbBsBgcVPs=
X-Received: by 2002:a6b:f915:: with SMTP id j21mr4456834iog.98.1633016412417;
 Thu, 30 Sep 2021 08:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210930030557.1426-1-bjorn.andersson@linaro.org> <20210930030557.1426-2-bjorn.andersson@linaro.org>
In-Reply-To: <20210930030557.1426-2-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@google.com>
Date:   Thu, 30 Sep 2021 08:40:00 -0700
Message-ID: <CAD=FV=UY7=gr4xFOR40fWA42B2T0jFS+=bOmwSb2_=ebTN7gXw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/bridge: ti-sn65dsi86: Use regmap_bulk_write API
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-pwm <linux-pwm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 29, 2021 at 8:06 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The multi-register u16 write operation can use regmap_bulk_write()
> instead of two separate regmap_write() calls.
>
> It's uncertain if this has any effect on the actual updates of the
> underlying registers, but this at least gives the hardware the
> opportunity and saves us one transation on the bus.

s/transation/transaction/


> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v5:
> - Extracted this hunk from patch 3.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Looks keen. I'll plan to apply this after giving it a few days on the
list to make sure nobody is upset, though I'm not sure why they would
be. ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
