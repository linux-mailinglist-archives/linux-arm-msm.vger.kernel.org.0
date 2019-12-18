Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79572123BFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 01:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfLRAwg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 19:52:36 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:43737 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfLRAwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 19:52:36 -0500
Received: by mail-io1-f68.google.com with SMTP id s2so136069iog.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AYVMcfsYQ7/My9/CMSR2wcI0dgtFvQ4q3wHm6ZJbP7A=;
        b=FofQNljNG3XnDs6PJ7xFcBeDlHTzYOtvZ01PQExhZPG6io6qRbCyfSDgrfJus9w+RY
         EUKujDmdEuxs/2PL/yBZHnD0GDVJoKMAHnu8p4swz9hLkIom6X/4WAiA38KgIBg9eSPm
         LuXAOqwZ0wpbfJx4OFtWnU3nUhr2MWfrpndIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AYVMcfsYQ7/My9/CMSR2wcI0dgtFvQ4q3wHm6ZJbP7A=;
        b=pkw9A8DnvdgE17c2Yjj99+/f4C15mkR1mTCJqIQOrLr7lgM/HFJOTz5mQxe6sgSNn9
         aOiy4X48dLexWTBls/swxR2s0Gd1PI3rZDmN2MIEZ9RGOofEKM+x6uZPgv6+lwNEauXT
         JIylzzeK+5h6RRUZhotMB/06jgEZc6RxWDCHrg9is9XXDfb9z5O2eXx5JJqzCFji7S2Q
         KqCzntAsKqWy7gg69Er9yTaN1M+q37xQ3uWSE8UNvwus+65/ViwhKv7KWMzOJ3pAC9Yr
         slbSM6CUCiVG64cDwHbL9qnH3mKH8kLjcqPaJm0NBl5lcz/6JXfCDeEn1tvWEZBWbrY3
         a8dA==
X-Gm-Message-State: APjAAAWf01EswsBfU/xn7Eq/b/icuPiLApcfiBFx3c7ydrWukJdwN4jA
        yGZh/eEQpqkWqPTMhnvWEoc43rTIauc=
X-Google-Smtp-Source: APXvYqzJarXONSn4AmhNrVBRAqmTAUdfMg4IBYDgiMAQs/nv44WrpmmL9+ielA4OOHIJVwpgzZuUcA==
X-Received: by 2002:a02:40e:: with SMTP id 14mr876282jab.102.1576630354768;
        Tue, 17 Dec 2019 16:52:34 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id v17sm133834ilh.12.2019.12.17.16.52.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 16:52:34 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id x1so148197iop.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:52:33 -0800 (PST)
X-Received: by 2002:a6b:be84:: with SMTP id o126mr546930iof.269.1576630353286;
 Tue, 17 Dec 2019 16:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20191213154448.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
 <20191215200459.1018893-1-robdclark@gmail.com>
In-Reply-To: <20191215200459.1018893-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 16:52:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_trS6U4wTRMnW0_7xCjxqdTkTV5vmhyMC=vGbNAhQdw@mail.gmail.com>
Message-ID: <CAD=FV=U_trS6U4wTRMnW0_7xCjxqdTkTV5vmhyMC=vGbNAhQdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fixup! drm/bridge: ti-sn65dsi86: Train at faster
 rates if slower ones fail
To:     Rob Clark <robdclark@gmail.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Dec 15, 2019 at 12:05 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Fixes:
>
> In file included from ../drivers/gpu/drm/bridge/ti-sn65dsi86.c:25:
> ../drivers/gpu/drm/bridge/ti-sn65dsi86.c: In function =E2=80=98ti_sn_brid=
ge_enable=E2=80=99:
> ../include/drm/drm_print.h:339:2: warning: =E2=80=98last_err_str=E2=80=99=
 may be used uninitialized in this function [-Wmaybe-uninitialized]
>   339 |  drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
>       |  ^~~~~~~~~~~~~~
> ../drivers/gpu/drm/bridge/ti-sn65dsi86.c:650:14: note: =E2=80=98last_err_=
str=E2=80=99 was declared here
>   650 |  const char *last_err_str;
>       |              ^~~~~~~~~~~~
> In file included from ../drivers/gpu/drm/bridge/ti-sn65dsi86.c:25:
> ../include/drm/drm_print.h:339:2: warning: =E2=80=98ret=E2=80=99 may be u=
sed uninitialized in this function [-Wmaybe-uninitialized]
>   339 |  drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
>       |  ^~~~~~~~~~~~~~
> ../drivers/gpu/drm/bridge/ti-sn65dsi86.c:654:6: note: =E2=80=98ret=E2=80=
=99 was declared here
>   654 |  int ret;
>       |      ^~~
>   Building modules, stage 2.
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks!  I have rolled this into my v2.

-Doug
