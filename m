Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85458399240
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 20:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhFBSMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 14:12:41 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:34790 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhFBSMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 14:12:41 -0400
Received: by mail-oi1-f178.google.com with SMTP id u11so3557884oiv.1;
        Wed, 02 Jun 2021 11:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eEPJgXDdFGgpykP7+AfDN274Zwe0NtArK2e1pu+6hwE=;
        b=V1QEzRVTHDam/HG/9AJ6wGexCfg9BoL5DTBpxC1KzOyiiWrbl5ARoRe0BybHLePjNZ
         hSthy6IzoIpLsoXo5PH5oyDSwYRSBHBkH+2H+AJdZgkDTg5H2neWkRQp92F1MmehpGQd
         WW5FbZi4SO3KCbH9lVqcglcIyE+omhDS7lnScaBG+KV9iF3usryIAebTKHsjcjQgUrq0
         x9Kgtjwx4Qu6mkUUP5u7CThfHfXzsXej1ahzYi5g/nxwCMjKnF6CPE42Is7pL+KTtrYc
         TOkg71fEnO/n7qFRW2tJYMBO97+eSZOFx8z22pYHQF5t5kD7mjIJ0SR2ePnpUiU9wOFn
         vztg==
X-Gm-Message-State: AOAM531qMTrUbiXx2KTz07LvmLmA78N4Qcf/AJvdWOqmH7hXzAb8Ywg8
        XN4vgyL1cleHBX/vJRG+2g==
X-Google-Smtp-Source: ABdhPJwxQY3B5CeWKe9JjY2bJkxq1L74q0ZXWfcblHLwtfe7tcidYtu2cMFA4TdvQqfCEVjJEWaCVw==
X-Received: by 2002:a05:6808:a97:: with SMTP id q23mr6733569oij.39.1622657441869;
        Wed, 02 Jun 2021 11:10:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q63sm133503oic.15.2021.06.02.11.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:10:41 -0700 (PDT)
Received: (nullmailer pid 3693279 invoked by uid 1000);
        Wed, 02 Jun 2021 18:10:39 -0000
Date:   Wed, 2 Jun 2021 13:10:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <treding@nvidia.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
Message-ID: <20210602181039.GA3692772@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 24 May 2021 17:01:51 -0700, Douglas Anderson wrote:
> The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> how using the DP AUX bus is better than learning how to slice
> bread. Let's add it to the ti-sn65dsi86 bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v8:
> - ti-sn65dsi86 references the new aux bus bindings.
> 
> Changes in v7:
> - ti-sn65dsi86: Add aux-bus child patch new for v7.
> 
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

With the path updated,

Reviewed-by: Rob Herring <robh@kernel.org>
