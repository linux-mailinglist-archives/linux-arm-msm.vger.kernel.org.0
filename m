Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16CF01C905A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 16:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgEGOjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 10:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgEGOjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 10:39:40 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88485C05BD43
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 07:39:39 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id k25so13345vkn.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z7IFA9stGr7AQIAUx30OK+wSMM9GgogchHTSn33YI0U=;
        b=oKrgg6+ohJKVAOjUfdVbli6fopWWBK9ouxsK7MkYl2D0qBOvCFhQahNLKGcyctP0/3
         GuQCx6TcEKb7uN2XV751z4mfwU5kpykWAbuevm+p41uR8/egw097FPbwgDTfIlAaV1bB
         mk+N35TAXodLwzAsbM5yVi87spgJIxwJ/nNIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7IFA9stGr7AQIAUx30OK+wSMM9GgogchHTSn33YI0U=;
        b=qw3LMiOfmmtsNk4m+llgM5kB2DJu3weLxq/WTe+B4v/a0co4SDQBLIcB42xrbcRZ0c
         N6RI41i3AJIRUoU7AnwSmcTmthyoO/V0oBJRk2DF8klJP76q5qZJZoQh+dJ6QVtS4Owf
         D/jtheubdAZJwb0ZIqvrjT6v/rKzhuUKMTw4JeQXmpkeTxZRCe/sS/A+KWJQ1yoj3Hdk
         yAvGvhIJaFctZHZZf7RBH/hK6+nZwj1rk/qJbpwWDoxZuxMaHnIjH664LtAx64g5drI8
         cbXlJsUxjYhDWjQQK7cO9IQQ+/PsfbUtS3J9PEZiKoIVzCQOMMh1OFzrx51d0Ts8uMqw
         VGWw==
X-Gm-Message-State: AGi0Puaoy/uepLQsZ5OrSVCcvGD8PUcWeMQaiMHpz51bKeVPFk0X7zVe
        EtTM2CvCeLk7xQBCnNMrO3H/ysHTGEo=
X-Google-Smtp-Source: APiQypL1GC5RfIPliBsB23ikJvXeIEohgSapLgo8ZRlN9kx+GOsLCqyI5SMCVDLaCB77Lxqd+LIgLA==
X-Received: by 2002:a1f:9fc9:: with SMTP id i192mr11679959vke.97.1588862378632;
        Thu, 07 May 2020 07:39:38 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id l11sm2868766vkm.20.2020.05.07.07.39.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 07:39:38 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id l25so3507684vso.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 07:39:37 -0700 (PDT)
X-Received: by 2002:a67:f5d6:: with SMTP id t22mr12876499vso.73.1588862377337;
 Thu, 07 May 2020 07:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200430194617.197510-1-dianders@chromium.org> <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
In-Reply-To: <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 May 2020 07:39:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
Message-ID: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
To:     LinusW <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 30, 2020 at 12:46 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM

One suggestion that came off-list is to change the code to make the
numbering match up better with the datasheet.  Right now if you want
GPIO 2 you have to refer to it like:

hpd-gpios = <&sn65dsi86_bridge 1 GPIO_ACTIVE_HIGH>;

That's because the code right now numbers things starting at 0 even if
the datasheet numbers things starting at 1.

I'm planning to spin the series later today for this.  While at it,
I'll squash my yaml bindings fixup into the bindings patch in this
series.  If someone would rather I wait and not spin yet, please yell.
