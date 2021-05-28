Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C821D393A44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 02:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbhE1Abl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 20:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbhE1Abl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 20:31:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECF2C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 17:30:06 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f30so2791197lfj.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 17:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cAYxSZ2/LUsSsn8d06yEcKP0Gfca5oqTYVqfarEyY4Q=;
        b=CGtHb0yWAyWtrKrDJIeR8VvZXgsNXy84JWlXeb19e88ME4csylVRHl7Lcd0FSfDG0h
         ryKXiFr8u9YGB+o8gN9tyhxz+8cY1mpCam+L8sKlzDjb/42QPB8sNGoba6bPqd9anVEN
         kxYBVVuI2MpYL5detAHUgrZRAHMV3L25XISvh6/vovNXuIn3BTU2ZD5RJuDCVhmLP+LF
         aHdccEzIYbbY9D1GDhNCytmG45H5v/JQZyvRqjYzagGmAfhnPFrh4qIu6DsGUN8B55zh
         wxYwjrkV1MIPbk8KDhuf3kM6wY3c0iOY5tgMqzWgJrnM/Rhk3RniD0Lwb2pb7uCZJZXs
         UV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cAYxSZ2/LUsSsn8d06yEcKP0Gfca5oqTYVqfarEyY4Q=;
        b=uQQhBCXmMX0iW/Ys0FW1ZdxyuRBD1IWuSUgKaNXdsDbYbsHPZpQK3+KQEfMu4N90Yj
         PHf40o3QEYuW6PbkL01/GuDpuu03S6AQ3ImSyLbvLhWo4AWFif7Ou6GZ6QGsLkP3sPKM
         C24luedRBaKOCQX1yELCc5iwEaOgF9XB8b8KApdzML5/guq72TJviraP0z4AyIwW2wf6
         SbYIEyDNBI0r1APtyGxovkuuV+yopD0MLJ157aNr++KxfBLgldVyThe/F76puRkf1DKv
         f3zdnEOv/6HaTHV5MDExUYlMDbVR7U+x8uyvhlvKaIaVffGcxvLAAQ0LDQZV/0F9MVAJ
         Br3A==
X-Gm-Message-State: AOAM532Je/Fp347AzgcupI3F5rLdEIR5vNk0+lmVC0vuKT95ByqCVgLx
        gM9DMQ+nmgHvOc/ppov7lTXlSsCke0ZcGaA7WNCUVg==
X-Google-Smtp-Source: ABdhPJxjKWZl4nXKcEb8D++9zwhUGTk9lmQJdMjIN1Wc6enAt0Oqdih6wD8S0QT6XSpnKxPCjDnCZ7wSs6HcuOnh1dU=
X-Received: by 2002:a19:f616:: with SMTP id x22mr3924647lfe.291.1622161804749;
 Thu, 27 May 2021 17:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org> <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
In-Reply-To: <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 02:29:53 +0200
Message-ID: <CACRpkdZQ_4OMfUPZj1hXzRzqcfbhnrOHZ42NdP+giKbcz3=2VQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 25, 2021 at 2:02 AM Douglas Anderson <dianders@chromium.org> wrote:

> The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> how using the DP AUX bus is better than learning how to slice
> bread. Let's add it to the ti-sn65dsi86 bindings.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
(...)
>      description: See ../../pwm/pwm.yaml for description of the cell formats.>

Just use the full path:
/schemas/pwm/pwm.yaml

> +  aux-bus:
> +    $ref: ../dp-aux-bus.yaml#

Use the full path. (Same method as above)

This removes the need for ../../... ....

You do it here:

>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports

Other than that I think it looks all right!

Yours,
Linus Walleij
