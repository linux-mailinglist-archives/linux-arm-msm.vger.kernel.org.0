Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85749399229
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 20:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhFBSHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 14:07:55 -0400
Received: from mail-oo1-f44.google.com ([209.85.161.44]:44933 "EHLO
        mail-oo1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFBSHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 14:07:54 -0400
Received: by mail-oo1-f44.google.com with SMTP id o5-20020a4a2c050000b0290245d6c7b555so757033ooo.11;
        Wed, 02 Jun 2021 11:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OXQfC+XKgJEeb6dM9eMgXu59hvMyoJzOchI782JgqsE=;
        b=kaM8QM1ZJ+OvZL2/qyQkVkj9lxzU6mcZ4Amvi07wT15qQYikr0BLS2TZ/gpB6Sb5pL
         tVeD2Vg7kI4e+++mb5tBQk+iuBBL8eTme5UeEeZCbSf8hHZoede57e/jhRewy3phuGHt
         j28TGcsGCneuqVuR0ccXT63DhVl4h4hQ07bqtn5PgE1+39a/JEVzYYkCYPD5ajRvwH/z
         wYJ7i3A/VOPI18limUaycm9wdVEh+MKvNrXfzojKOt2fAbdsVAqwUjdx+TGbrEKi8myP
         6MfSYybbfgvu7MGnr/e3nrWR3utrAVN31lJOfA+qSakReUOlo2WwSG1YZtaAvujBwY38
         rBjA==
X-Gm-Message-State: AOAM531xiwAUpVzADIb3STsNyekEf1rDloHprGKPkBlLWTg0+SlgXIOL
        +AP5V8OPwyi2Wd52JYItfg==
X-Google-Smtp-Source: ABdhPJwam6nqA2q4bi7B4qoK5vD5zo/AYazGpsK2qGbDlzHhFnQ6k8GumVkSvq5b7zM8n6ym5eulUA==
X-Received: by 2002:a4a:e945:: with SMTP id v5mr26155249ood.64.1622657171175;
        Wed, 02 Jun 2021 11:06:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 94sm137834otj.33.2021.06.02.11.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:06:10 -0700 (PDT)
Received: (nullmailer pid 3685093 invoked by uid 1000);
        Wed, 02 Jun 2021 18:06:09 -0000
Date:   Wed, 2 Jun 2021 13:06:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
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
        Sandeep Panda <spanda@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
Message-ID: <20210602180609.GA3675041@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
 <CACRpkdZQ_4OMfUPZj1hXzRzqcfbhnrOHZ42NdP+giKbcz3=2VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZQ_4OMfUPZj1hXzRzqcfbhnrOHZ42NdP+giKbcz3=2VQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 28, 2021 at 02:29:53AM +0200, Linus Walleij wrote:
> On Tue, May 25, 2021 at 2:02 AM Douglas Anderson <dianders@chromium.org> wrote:
> 
> > The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> > how using the DP AUX bus is better than learning how to slice
> > bread. Let's add it to the ti-sn65dsi86 bindings.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> (...)
> >      description: See ../../pwm/pwm.yaml for description of the cell formats.>
> 
> Just use the full path:
> /schemas/pwm/pwm.yaml

Really, just drop it. If we want have generic references and/or 
descriptions for common properties, we should generate that in pretty 
documentation (there are json-schema to doc tools already).

> 
> > +  aux-bus:
> > +    $ref: ../dp-aux-bus.yaml#
> 
> Use the full path. (Same method as above)

+1

> This removes the need for ../../... ....
> 
> You do it here:
> 
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> 
> Other than that I think it looks all right!
> 
> Yours,
> Linus Walleij
