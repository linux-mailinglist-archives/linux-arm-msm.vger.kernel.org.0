Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32080201FC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 04:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731885AbgFTCc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 22:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731866AbgFTCc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 22:32:56 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EAAC0613EE
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 19:32:55 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id n5so8827648otj.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 19:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0D6RM81CHxtLSPNd2h5o+DyxuvzJSa5Nzy3+jmmUj6k=;
        b=kVSbdH9SLZhwQmFcOG+gMjul+MkxrpcfmmL5nmRC8j3xNsYEAGsXj5Ad47nXUniYS1
         PZc0bfZYz5BSae/9VozU/EhlVyuy4YFoz3hPBpPgIHrjmMrlFKZiZhnofnPcILGl4ScO
         t7vzCj+Zum03GDj4Q9ndBVVMKYO7bUhHNf8ha76qXC2YG6tlYcXK9v8Is/4HfwPCKgR3
         HIjbrPfrot3wmhDhuPovWXb8NCmq4ZkzpEsNF/lcfeOS/bT3d9I5vKROM2bKMjG5YIAL
         BrehL9e118MzeTeXR11y6VOZtXts/3lPlw2h1duJUZzom6sHt70zltClI55Q0ZNh3vKq
         FZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0D6RM81CHxtLSPNd2h5o+DyxuvzJSa5Nzy3+jmmUj6k=;
        b=tew2mOYNeSa6MpiDj/24N/14azgBPjZ6mAvAWwPPKIVr6KNeYoRBh5jycpQTgZ5NQV
         8AW6+7yFsPhl3l0IrW7ytdoC1lEDr1X5QMKX9hrZwhM2c6ytvTlSuUGPBhEtp3xA+vUj
         Eec/QRI3BbFajaOj4rYmlEnWvr0gnnd4mpuX6Lhdfux4ZiyIqofrkXJxj9UEWLsDz938
         teIunNeBWvf0CKAhwyDxrbPn9vMMx+RYaGOtSnG8oSnsDMt/7PacU5OALK+XzYZX8bak
         IE86+VRcck3aUnAkXc3IYgeOEgkU57xw2rN/I/yAZv7re0TsWH1uFUAj8qvLHpoWV5fs
         ASdg==
X-Gm-Message-State: AOAM533YDPtgA6NaUVlKacFWmM5MnF105M/fZURJ/ChKpylYGErIdvsD
        OsR1vQrIUD5kEnK3PD5RihKXwcMP9wNTNuSTbVjvSQ==
X-Google-Smtp-Source: ABdhPJxEiXH06dVVQQgwAAkquvCNpg4wOXt0fbkrP+XzPPPLx6X3/Hj0NM4tYLWfkqawUdxNY3Oz2MPc1FLWO8yu84s=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr5217355otn.221.1592620374200;
 Fri, 19 Jun 2020 19:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200617105950.3165360-1-vkoul@kernel.org>
In-Reply-To: <20200617105950.3165360-1-vkoul@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 19 Jun 2020 19:32:43 -0700
Message-ID: <CALAqxLWSBrYWK8ggzd7JU4F8QGuLpP6D5ENxzYc8XXype84Jyw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add LT9611 DSI to HDMI bridge
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 17, 2020 at 4:00 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> This series adds driver and bindings for Lontium LT9611 bridge chip which
> takes MIPI DSI as input and HDMI as output.
>
> This chip can be found in 96boards RB3 platform [1] commonly called DB845c.
>
> [1]: https://www.96boards.org/product/rb3-platform/
>
> Changes in v3:
>  - fix kbuild reported error
>  - rebase on v5.8-rc1
>
> Changes in v2:
>  - Add acks by Rob
>  - Fix comments reported by Emil and rename the file to lontium-lt9611.c
>  - Fix comments reported by Laurent on binding and driver
>  - Add HDMI audio support
>
> Vinod Koul (3):
>   dt-bindings: vendor-prefixes: Add Lontium vendor prefix
>   dt-bindings: display: bridge: Add documentation for LT9611
>   drm/bridge: Introduce LT9611 DSI to HDMI bridge

Hey Vinod,
  Thanks for pushing these!
I know same-company tags aren't super valuable, but I'm actively using
these patches for HDMI/audio support on the db845c w/ AOSP.

So for what it's worth, for the series:
Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
