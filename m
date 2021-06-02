Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A9E39920F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 20:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhFBSCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 14:02:06 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:43853 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBSCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 14:02:05 -0400
Received: by mail-ot1-f52.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso3209520otu.10;
        Wed, 02 Jun 2021 11:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=STNHXHQ+81oeK1CksPWVyFVkZuPW4pW3ZP19XpEkSjY=;
        b=VLmCpGDIDZ5ZfvLjkjOLwX3CMSne+WGDqo5C5hPQA7+CYt6BBCqDJ5Hpl80jum3zzY
         Poe9CIym6LgJTtgxY66UI8XTRJZuiK2MUbipJNaGs2ttI+JNm9EpMf81+JFxHEKRd289
         uJUw3snPyxxTn0kYFgQPl1jIMqfT1TU8OvyVcEs3HlXVPiPQBWAGh8eIIDllRamIk7m5
         nVSeJXfZ/zhr873/2GJ/U9NzvOHCEIIwxNrGp8B9k4RTffbQdCcl59FCcTFUNkc65y7S
         1xSxoFIPt5gY9AW4D0oG76Ym5jvj1gxaMplNnW0fs1MDOsd6GqXtqsAa8hYSRpBIUWXE
         fiyA==
X-Gm-Message-State: AOAM531GZeFfNeG7kOvp1BfuItEAGu5sVTR36axP0kowBVvMkDJGk7EX
        KvxLV7hreaBiZyU+5UNsGQ==
X-Google-Smtp-Source: ABdhPJw4Wnkkr1ZWBQNe8mwdd924fhfJkTTmphYm16a4o7+93YyM7ubX4h1P3RCN0vdbqFgl/6IyTw==
X-Received: by 2002:a9d:6f15:: with SMTP id n21mr12298359otq.154.1622656819618;
        Wed, 02 Jun 2021 11:00:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q63sm128029oic.15.2021.06.02.11.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:00:18 -0700 (PDT)
Received: (nullmailer pid 3674811 invoked by uid 1000);
        Wed, 02 Jun 2021 18:00:17 -0000
Date:   Wed, 2 Jun 2021 13:00:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        robdclark@chromium.org, Andrzej Hajda <a.hajda@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Steev Klimaszewski <steev@kali.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linus W <linus.walleij@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>, Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v8 01/11] dt-bindings: display: simple: List hpd
 properties in panel-simple
Message-ID: <20210602180017.GA3674744@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.1.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.1.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 24 May 2021 17:01:49 -0700, Douglas Anderson wrote:
> The HPD (Hot Plug Detect) signal is present in many (probably even
> "most") eDP panels. For eDP, this signal isn't actually used for
> detecting hot-plugs of the panel but is more akin to a "panel ready"
> signal. After you provide power to the panel, panel timing diagrams
> typically say that you should wait for HPD to be asserted (or wait a
> fixed amount of time) before talking to the panel.
> 
> The panel-simple bindings describes many eDP panels and many of these
> panels provide the HPD signal. We should add the HPD-related
> properties to the panel-simple bindings. The HPD properties are
> actually defined in panel-common.yaml, so adding them here just
> documents that they are OK for panels handled by the panel-simple
> bindings.
> 
> NOTE: whether or not we'd include HPD properties in the panel node is
> more a property of the board design than the panel itself. For most
> boards using these eDP panels everything "magically" works without
> specifying any HPD properties and that's been why we haven't needed to
> allow the HPD properties earlier. On these boards the HPD signal goes
> directly to a dedicated "HPD" input to the eDP controller and this
> connection doesn't need to be described in the device tree. The only
> time the HPD properties are needed in the device tree are if HPD is
> hooked up to a GPIO or if HPD is normally on the panel but isn't used
> on a given board. That means that if we don't allow the HPD properties
> in panel-simple then one could argue that we've got to boot all eDP
> panels (or at least all those that someone could conceivably put on a
> system where HPD goes to a GPIO or isn't hooked up) from panel-simple.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v8:
> - Explain better why HPD needs to be in panel-simple in commit msg.
> 
> Changes in v7:
> - List hpd properties bindings patch new for v7.
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
