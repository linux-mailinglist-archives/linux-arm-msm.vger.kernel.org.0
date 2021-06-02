Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1CB399231
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 20:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhFBSKQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 14:10:16 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:46780 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBSKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 14:10:15 -0400
Received: by mail-ot1-f48.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso3211330otl.13;
        Wed, 02 Jun 2021 11:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VYMb7NvZcxWiw7PptXFVUegcgKe65wVgGhLojpylJWs=;
        b=Z+f4utDPcuM6fprNoNiT+ER3nOUS5ct5KeuwKNHX2AAghkzevE24clBRCFaXiZsmbg
         p7gH3NglwLEPBxAuFAU7VQwMzHn7DdwJEPEZT137lxzwdHy5s2ZV/3VTykEXICNipum9
         ZNj3mPDRNwqG49xUwvzkdpp0E3yW1zStvGRp2eDZF8cof/sksfxR1MihR5f942BIJuIJ
         199b999Obnkee6xALzutTIcFa19Up9RrbXk4qkmkjMFI7wv47QNWmIk1kJ/GaQMaO+Id
         HCnaINycolzE/vkqq5yDWndkK/+2nuNXruxZBjt4PiomL91jIt0+mJvYB2YXqHFcBoqp
         3sPA==
X-Gm-Message-State: AOAM531gKrp7BSUkGiYsvd2N4FvwLHm7zOD11fiPlCQ+c0QlDP6EmpJq
        j/JeeGoT0koKTqk4DOCRNQ==
X-Google-Smtp-Source: ABdhPJzTkgLV2ppLE4o5GqJG1XKd/A0PrjZETTVCaL15qyF/JiWlCifrnxt/418lRvc/jrVNLNVqWw==
X-Received: by 2002:a9d:3644:: with SMTP id w62mr18937060otb.205.1622657296860;
        Wed, 02 Jun 2021 11:08:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x63sm127364oix.47.2021.06.02.11.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:08:16 -0700 (PDT)
Received: (nullmailer pid 3688828 invoked by uid 1000);
        Wed, 02 Jun 2021 18:08:14 -0000
Date:   Wed, 2 Jun 2021 13:08:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Steev Klimaszewski <steev@kali.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>, Lyude Paul <lyude@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus W <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v8 02/11] dt-bindings: drm: Introduce the DP AUX bus
Message-ID: <20210602180813.GA3688734@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 24 May 2021 17:01:50 -0700, Douglas Anderson wrote:
> We want to be able to list an eDP panel as a child of an eDP
> controller node to represent the fact that the panel is connected to
> the controller's DP AUX bus. Though the panel and the controller are
> connected in several ways, the DP AUX bus is the primary control
> interface between the two and thus makes the most sense to model in
> device tree hierarchy.
> 
> Listing a panel in this way makes it possible for the panel driver to
> easily get access to the DP AUX bus that it resides on, which can be
> useful to help in auto-detecting the panel and for turning on various
> bits.
> 
> NOTE: historically eDP panels were _not_ listed under their controller
> but were listed at the top level of the device tree. This will still
> be supported for backward compatibility (and while DP controller
> drivers are adapted to support the new DT syntax) but should be
> considered deprecated since there is no downside to listing the panel
> under the controller.
> 
> For now, the DP AUX bus bindings will only support an eDP panel
> underneath. It's possible it could be extended to allow having a DP
> connector under it in the future.
> 
> The idea for this bus's design was hashed out over IRC [1].
> 
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> My DT yaml-fu is still weak. If I did something stupid, please help me
> learn how to do this better!
> 
> NOTE: there is no "Example" in this bindings file. Yikes! This is
> because I wanted to keep this patch separate from the one that enables
> the first eDP controller. See the patch ("dt-bindings: drm/aux-bus:
> Add an example") for the example.
> 
> ALSO: if anyone else would like to be listed as a "Maintainer" in this
> file then please shout!
> 
> Changes in v8:
> - Separate DP AUX bus binding is new for v8.
> 
>  .../bindings/display/dp-aux-bus.yaml          | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/dp-aux-bus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
