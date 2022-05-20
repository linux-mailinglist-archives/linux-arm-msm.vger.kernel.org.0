Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C130052E121
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 02:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343950AbiETAXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 20:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244137AbiETAXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 20:23:45 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A5212B01C
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:23:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id m20so12761688ejj.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NkNsmxiQk+nW3UDbjO7QxzvaqncjAzBvhuR1VH6Vk60=;
        b=bA4kB8OhrG3AO6xz5No7HEoss1T72t7wOhdeRdSsdZLYCzD5aJYviGdcdpnznfPifZ
         yuRj+lDxOoXXam02skD8mXDZraaqUDT3pVNFce59ArewYDhYNcYKJahlU2Ir6PagSJtJ
         9VEQUM21705l7JBJccvc9ZdGE5VGkEK28WMdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NkNsmxiQk+nW3UDbjO7QxzvaqncjAzBvhuR1VH6Vk60=;
        b=Beri1A302Dy1Bpv5QO5slz13HyLUNEHdlRpk9Q8LYhM57Wuw89IX6deHB30l8wZyao
         k0BUaz+KjHvfZ4yFWxKJLdWTEq+H09gS37rpr6hpXWhabtP2RqGYg9Dvkt0MkLaLWUDT
         0JtdA0uygOdlhW6NxHh4097WpF9uK89KUPUmWe7ikbvLv2EOhDLVbIjD5oQ3NLwmyfpP
         aczP314XUAkw3tvydmByKAsF50KRjAJw9FQG8nOv85bsxVUSW/bM5xEUV9aELpO/Achf
         4TXYHrv5VEeflKD5J6PVZiK99ArroLQYVcRMToLibccMTsBD99CKnEQ7MRc1WBuNN+6V
         YkwA==
X-Gm-Message-State: AOAM532XRP3x2W+T9a97I5T3MW66Dw/lY500zyRLhmINX1ksAefHQbPY
        WoLXThqSXih25m8am65+TIwp4SNXzZZkYjhmICk=
X-Google-Smtp-Source: ABdhPJyjohFR2nEaZFBPFIFjSGS0GShpDrjviDUSw/xhkvWEc3QRTi0B7XlAaWiLk/Pkk0xks3f0wQ==
X-Received: by 2002:a17:907:9690:b0:6f5:160a:25b8 with SMTP id hd16-20020a170907969000b006f5160a25b8mr6669734ejc.504.1653006221459;
        Thu, 19 May 2022 17:23:41 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a2-20020aa7d742000000b0042617ba638esm3462400eds.24.2022.05.19.17.23.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 17:23:39 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id v191-20020a1cacc8000000b00397001398c0so5950521wme.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:23:39 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr5830883wmb.199.1653006218866; Thu, 19
 May 2022 17:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220509161733.v2.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
In-Reply-To: <20220509161733.v2.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 19 May 2022 17:23:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWYFDMYvZJWDnV2Yc+5X=NThYnE78aOeMrhrEvBiDLkQ@mail.gmail.com>
Message-ID: <CAD=FV=XWYFDMYvZJWDnV2Yc+5X=NThYnE78aOeMrhrEvBiDLkQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Document the power requirements for DP AUX transfers
To:     dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 9, 2022 at 4:18 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> When doing DP AUX transfers there are two actors that need to be
> powered in order for the DP AUX transfer to work: the DP source and
> the DP sink. Commit bacbab58f09d ("drm: Mention the power state
> requirement on side-channel operations") added some documentation
> saying that the DP source is required to power itself up (if needed)
> to do AUX transfers. However, that commit doesn't talk anything about
> the DP sink.
>
> For full fledged DP the sink isn't really a problem. It's expected
> that if an external DP monitor isn't plugged in that attempting to do
> AUX transfers won't work. It's also expected that if a DP monitor is
> plugged in (and thus asserting HPD) then AUX transfers will work.
>
> When we're looking at eDP, however, things are less obvious. Let's add
> some documentation about expectations. Here's what we'll say:
>
> 1. We don't expect the DP AUX transfer function to power on an eDP
> panel. If an eDP panel is physically connected but powered off then it
> makes sense for the transfer to fail.
>
> 2. We'll document that the official way to power on a panel is via the
> bridge chain, specifically by making sure that the panel's prepare
> function has been called (which is called by
> panel_bridge_pre_enable()). It's already specified in the kernel doc
> of drm_panel_prepare() that this is the way to power the panel on and
> also that after this call "it is possible to communicate with any
> integrated circuitry via a command bus."
>
> 3. We'll also document that for code running in the panel driver
> itself that it is legal for the panel driver to power itself up
> however it wants (it doesn't need to officially call
> drm_panel_pre_enable()) and then it can do AUX bus transfers. This is
> currently the way that edp-panel works when it's running atop the DP
> AUX bus.
>
> NOTE: there was much discussion of all of this in response to v1 [1]
> of this patch. A summary of that is:
> * With the Intel i195 driver, apparently eDP panels do get powered
>   up. We won't forbid this but it is expected that code that wants to
>   run on a variety of platforms should ensure that the drm_panel's
>   prepare() function has been called.
> * There is at least a reasonable amount of agreement that the
>   transfer() functions itself shouldn't be responsible for powering
>   the panel. It's proposed that if we need the DP AUX dev nodes to be
>   robust for eDP that the code handling the DP AUX dev nodes could
>   handle powering the panel by ensuring that the panel's prepare()
>   call was made. Potentially drm_dp_aux_dev_get_by_minor() could be a
>   good place to do this. This is left as a future exercise. Until
>   that's fixed the DP AUX dev nodes for eDP are probably best just
>   used for debugging.
> * If a panel could be in PSR and DP AUX via the dev node needs to be
>   reliable then we need to be able to pull the panel out of PSR. On
>   i915 this is also apparently handled as part of the transfer()
>   function.
>
> [1] https://lore.kernel.org/r/20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
> Hopefully I've resolved everything here to everyone's
> satisfaction. There's no crazy hurry here. I'll give this a week or so
> and then land it on drm-misc if there is no additional discussion.
>
> Changes in v2:
> - Updated wording as per discussion on v1.
> - Updated commit message as per discussion on v1.
> - Add pointer to v1 discussion for future reference.
>
>  include/drm/display/drm_dp_helper.h | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Pushed to drm-misc-next:

69ef4a192bba drm: Document the power requirements for DP AUX transfers
