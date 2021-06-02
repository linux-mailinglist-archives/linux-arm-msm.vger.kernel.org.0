Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C97399235
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 20:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhFBSLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 14:11:05 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:43673 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBSLF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 14:11:05 -0400
Received: by mail-oo1-f43.google.com with SMTP id e27-20020a056820061bb029020da48eed5cso760546oow.10;
        Wed, 02 Jun 2021 11:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vnHybBgAjzt6wo1nMM/aqyo7w71bDWALGEv4VshDtlY=;
        b=dmI1lkgxP/o10qJK+wzvLEeXXDr6j5C9ovjuJYttdetHTQLYJx+LFJUikasbtzAjP+
         QztGV9ewRfV8zHZHBSZp+aHa8R/DWDCbAdjksPsIz19f/+hGPWN8YyFN4U1SjDf/Nwvv
         BNK3cQy1ifEJpx3hXZNFCGyxzRdAyP0huAnuwme6SDt4voTRDVDU3hHrsVnu9h4ztU8X
         JESArrfHImwortRaxncVAha41WOYcHbkRbqMXi2u2cjL4oEE2UsjkJ4687n/ky2JF2M+
         Ad6HTK/P7Pcgn5wOPUsX/3NdepOxVmgIuM2HzEeskzv6dyK2Zj4pH/vAKgTutgR6L/c5
         cuqQ==
X-Gm-Message-State: AOAM533buIlrfnYtbxf7iCHVRg6nePEog7poW/iX5XBCAJYQ5pwzMbi3
        hnrnkahTWp1gee7ChEcRbQ==
X-Google-Smtp-Source: ABdhPJxZrFYvBsKiokAIm8orQVdEC4gthZCw5wBjwvD4m3wbZOnOtOPgP+NjteblvT+gLVM/rOUUlQ==
X-Received: by 2002:a4a:ba87:: with SMTP id d7mr2875156oop.6.1622657361888;
        Wed, 02 Jun 2021 11:09:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g24sm134583otp.17.2021.06.02.11.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:09:21 -0700 (PDT)
Received: (nullmailer pid 3690808 invoked by uid 1000);
        Wed, 02 Jun 2021 18:09:19 -0000
Date:   Wed, 2 Jun 2021 13:09:19 -0500
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
Message-ID: <20210602180919.GA3688973@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
 <CACRpkdZQ_4OMfUPZj1hXzRzqcfbhnrOHZ42NdP+giKbcz3=2VQ@mail.gmail.com>
 <20210602180609.GA3675041@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602180609.GA3675041@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 02, 2021 at 01:06:09PM -0500, Rob Herring wrote:
> On Fri, May 28, 2021 at 02:29:53AM +0200, Linus Walleij wrote:
> > On Tue, May 25, 2021 at 2:02 AM Douglas Anderson <dianders@chromium.org> wrote:
> > 
> > > The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> > > how using the DP AUX bus is better than learning how to slice
> > > bread. Let's add it to the ti-sn65dsi86 bindings.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > (...)
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.>
> > 
> > Just use the full path:
> > /schemas/pwm/pwm.yaml
> 
> Really, just drop it. If we want have generic references and/or 
> descriptions for common properties, we should generate that in pretty 
> documentation (there are json-schema to doc tools already).

Ah, now I see this was just context, so no need for you to fix/change 
this here.

Rob

