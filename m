Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BC73C254C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 15:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGIN5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 09:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbhGIN5D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 09:57:03 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE21C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 06:54:19 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id a6so9354264qka.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qiOUB7HLvLlvZOpZ/gkN2JlQJ5E4mMeYNLinigOA+9s=;
        b=T3wAp9DoNvgWy0Ro/pS13nqAvPokAxi8LgstNsyBbwHLqLqINLmtfgoFs/Q+BlwsIj
         8gvKq/S9P92Ny6t7qSxlsWjHtwZcDtNlGlFjVqIfX3ba00kPul2dqbIUTDiz2sOPMEWj
         EP/uYiL2UszRtbPSpERLnzSKOQQ6pm2kpZxkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qiOUB7HLvLlvZOpZ/gkN2JlQJ5E4mMeYNLinigOA+9s=;
        b=YTHBECIsv2V+uZpdaLicH4bEwr81WKU47GSFYD+2asytrdjEB+RDveljANmN9OEtKu
         z1F8sClCcxgKrHBijtX3K3pyAaGGBsrMw2ifzlKd5G/JsrlnQoT6CPfY5I9phvzbPcNl
         TiVolRmyF2Cbl6ygzyXTeemLJGNxVbmp8Pe35+JOEZVTA550Nrs738VMPECvOND7U6kN
         QULlEhFF/W+zonyq9aOM7UVnJW7PXyjh4tFWC6ibeyYQHRI4bpOb/Eae6e9CZoNP4lCO
         3xUkY//J0UlePJ6NMdmmXgLHeR1fy3c7/atg5luMmea/zUv53RNUpMV1l3gU99qyaLlZ
         NKnA==
X-Gm-Message-State: AOAM531/Pgnv7s28tG0Ic8YlRSmwTKbrqP7/OWFuYGXsqrtoG36cISvG
        E+FAypqUo2Oi3HvNnR2VdQngiNs6qp7GWg==
X-Google-Smtp-Source: ABdhPJzvK2cF1QBHZoqJdmi5b6o/UZo+GMb1CJervp7mstvLOTv4tjM/gksJeaps7WuPxx+sChk+Pg==
X-Received: by 2002:a05:620a:23d:: with SMTP id u29mr27896463qkm.239.1625838858383;
        Fri, 09 Jul 2021 06:54:18 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id b25sm2523353qkk.111.2021.07.09.06.54.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 06:54:17 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id i4so14781379ybe.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 06:54:17 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr49090811ybb.257.1625838856780;
 Fri, 09 Jul 2021 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 9 Jul 2021 06:54:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UP9jrS=JG=TuB7+i9QcZv8GOLYdPdb3_KNhEsgapGeww@mail.gmail.com>
Message-ID: <CAD=FV=UP9jrS=JG=TuB7+i9QcZv8GOLYdPdb3_KNhEsgapGeww@mail.gmail.com>
Subject: Re: [v8 0/6] drm: Support basic DPCD backlight in panel-simple and
 add a new panel ATNA33XC20
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@gmail.com>, Lyude Paul <lyude@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Jun 26, 2021 at 9:52 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> This series adds the support for the eDP panel that needs the backlight
> controlling over the DP AUX channel using DPCD registers of the panel
> as per the VESA's standard.
>
> This series also adds support for the Samsung eDP AMOLED panel that
> needs DP AUX to control the backlight, and introduces new delays in the
> @panel_desc.delay to support this panel.
>
> This patch series depends on the following two series:
> - Doug's series [1], exposed the DP AUX channel to the panel-simple.
> - Lyude's series [2], introduced new drm helper functions for DPCD
>   backlight.
>
> This series is the logical successor to the series [3].
>
> Changes in v1:
> - Created dpcd backlight helper with very basic functionality, added
>   backlight registration in the ti-sn65dsi86 bridge driver.
>
> Changes in v2:
> - Created a new DisplayPort aux backlight driver and moved the code from
>   drm_dp_aux_backlight.c (v1) to the new driver.
>
> Changes in v3:
> - Fixed module compilation (kernel test bot).
>
> Changes in v4:
> - Added basic DPCD backlight support in panel-simple.
> - Added support for a new Samsung panel ATNA33XC20 that needs DPCD
>   backlight controlling and has a requirement of delays between enable
>   GPIO and regulator.
>
> Changes in v5:
> Addressed review suggestions from Douglas:
> - Created a new API drm_panel_dp_aux_backlight() in drm_panel.c
> - Moved DP AUX backlight functions from panel-simple.c to drm_panel.c
> - panel-simple probe() calls drm_panel_dp_aux_backlight() to create
>   backlight when the backlight phandle is not specified in panel DT
>   and DP AUX channel is present.
> - Added check for drm_edp_backlight_supported() before registering.
> - Removed the @uses_dpcd_backlight flag from panel_desc as this
>   should be auto-detected.
> - Updated comments/descriptions.
>
> Changes in v6:
> - Rebased
> - Updated wanrning messages, fixed word wrapping in comments.
> - Fixed ordering of memory allocation
>
> Changes in v7:
> - Updated the disable_to_power_off and power_to_enable panel delays
> as discovered at <https://crrev.com/c/2966167> (Douglas)
>
> Changes in v8:
> - Now using backlight_is_blank() to get the backlight blank status (Sam Ravnborg)
> - Added a new patch #4 to fix the warnings for eDP panel description (Sam Ravnborg)
>
> [1] https://lore.kernel.org/dri-devel/20210525000159.3384921-1-dianders@chromium.org/
> [2] https://lore.kernel.org/dri-devel/20210514181504.565252-1-lyude@redhat.com/
> [3] https://lore.kernel.org/dri-devel/1619416756-3533-1-git-send-email-rajeevny@codeaurora.org/
>
> Rajeev Nandan (6):
>   drm/panel: add basic DP AUX backlight support
>   drm/panel-simple: Support DP AUX backlight
>   drm/panel-simple: Support for delays between GPIO & regulator
>   drm/panel-simple: Update validation warnings for eDP panel description
>   dt-bindings: display: simple: Add Samsung ATNA33XC20
>   drm/panel-simple: Add Samsung ATNA33XC20
>
>  .../bindings/display/panel/panel-simple.yaml       |   2 +
>  drivers/gpu/drm/drm_panel.c                        | 108 +++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               |  73 +++++++++++++-
>  include/drm/drm_panel.h                            |  15 ++-
>  4 files changed, 190 insertions(+), 8 deletions(-)

Pushed to drm-misc-next.

4bfe6c8f7c23 drm/panel-simple: Add Samsung ATNA33XC20
c20dec193584 dt-bindings: display: simple: Add Samsung ATNA33XC20
13aceea56fd5 drm/panel-simple: Update validation warnings for eDP
panel description
18a1488bf1e1 drm/panel-simple: Support for delays between GPIO & regulator
bfd451403d70 drm/panel-simple: Support DP AUX backlight
10f7b40e4f30 drm/panel: add basic DP AUX backlight support

-Doug
