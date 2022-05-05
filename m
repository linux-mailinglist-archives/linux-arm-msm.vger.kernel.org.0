Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E5B51C99D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 21:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354733AbiEETvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 15:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385438AbiEETvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 15:51:22 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C73A5DA7B
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 12:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651780060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DnqJVZbPVeI46s0enhoaS6Hy7uEfMjKkZf47zK1+eGQ=;
        b=ZdcMudt7d1LgawJrkaYfxbjkSiItJQ4CqIrU4R0XxG+F5jDVU32XoEkpDUUVMLAWLKz2fw
        sEkxr4dfK84TNY6+Dti0l7Is7lBCmNsEglojtHUD9VxQdAHJkO5m5XGvE3obhK4lWkx2pX
        1PCq37fbjdB9VnNoOb/TrZHkiHWrWrs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-pt_Nyqw2ONWbCP3hZcngNA-1; Thu, 05 May 2022 15:47:31 -0400
X-MC-Unique: pt_Nyqw2ONWbCP3hZcngNA-1
Received: by mail-qt1-f200.google.com with SMTP id n4-20020ac85b44000000b002f3940d55eeso4126725qtw.19
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 12:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=DnqJVZbPVeI46s0enhoaS6Hy7uEfMjKkZf47zK1+eGQ=;
        b=d+MSpHkBjiDj/d5UGzuqcyFAX3i57j9hC6fJ8oDmrhh6zHVIQJsP0rwFUMrJkL4F97
         LUYgjAENLA5zuSn72hEn5rtl5yShaKCPY/HjtswPObNFZ5K85ZMy9D8g+kyud3xxX9kU
         inAWjZLie3ybuwTfab4i6boMYXPXcUbnbZxmCej2d3xWLrRw6qyWSY7NODPP3DDX6IG8
         5t5vYzaZrg5X+eCo1+m35eHqchUxtSQydmjq9zdHolvLYzKOa2biPby4q1nrv1mMxb+B
         xpvTJurb+y5JlaoH0GA3ROxu9HUAXXcrDd7ZcPDtcOMfM+TR1Mp6KnmhMbHD3StLX5Qc
         pT0Q==
X-Gm-Message-State: AOAM533KoNRevgCTd0G7rpW3excy8CLimMATzUDtcAVGB+leDdTyfZRl
        QcDHctu0FxHtxB4VzMJaqgnIsK6+um5eQ+DUdZ9P4/8GtL1FUAHfz8z7lTBH9g9H3XEN5dhGJC3
        LXTDz1GgiE7ZKxJhbQDfhkjWnpQ==
X-Received: by 2002:a05:622a:1899:b0:2f3:b09e:dbe9 with SMTP id v25-20020a05622a189900b002f3b09edbe9mr12328371qtc.199.1651780050725;
        Thu, 05 May 2022 12:47:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw9VxJIDFIIwB9AlGQDX3a0wArIewXNGv5CEduHIStpRGXI2+xlxlAMXfahblbt2mKcwJawQ==
X-Received: by 2002:a05:622a:1899:b0:2f3:b09e:dbe9 with SMTP id v25-20020a05622a189900b002f3b09edbe9mr12328357qtc.199.1651780050495;
        Thu, 05 May 2022 12:47:30 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id m21-20020aed27d5000000b002f39b99f686sm1290873qtg.32.2022.05.05.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 12:47:29 -0700 (PDT)
Message-ID: <b1a7310afc2b09dd0575826d0df973df839ef5ac.camel@redhat.com>
Subject: Re: [PATCH] drm: Document that power requirements for DP AUX
 transfers
From:   Lyude Paul <lyude@redhat.com>
To:     Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Imre Deak <imre.deak@intel.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>, linux-kernel@vger.kernel.org
Date:   Thu, 05 May 2022 15:47:28 -0400
In-Reply-To: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So I think if Ville is OK with it (an ack at least) I'm fine with this
documentation change. I think it's worth me noting for other reviewers I made
this decision based on the fact that the documentation is for the transfer()
function - which I agree shouldn't need to be responsible for powering the
panel on.

Since that doesn't actually specify what we expect the behavior for userspace
accesses to be (since we could in theory add more behavior in those codepaths
around the transfer() calls that don't exist for the driver's own AUX usages)
I think this is totally fine

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2022-05-03 at 16:21 -0700, Douglas Anderson wrote:
> When doing DP AUX transfers there are two actors that need to be
> powered in order for the DP AUX transfer to work: the DP source and
> the DP sync. Commit bacbab58f09d ("drm: Mention the power state
> requirement on side-channel operations") added some documentation
> saying that the DP source is required to power itself up (if needed)
> to do AUX transfers. However, that commit doesn't talk anything about
> the DP sink.
> 
> For full fledged DP the sink isn't really a problem. It's expected
> that if an external DP monitor isn't plugged in that attempting to do
> AUX transfers won't work. It's also expected that if a DP monitor is
> plugged in (and thus asserting HPD) that it AUX transfers will work.
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
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  include/drm/display/drm_dp_helper.h | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index dca40a045dd6..e5165b708a40 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -370,9 +370,17 @@ struct drm_dp_aux {
>          * helpers assume this is the case.
>          *
>          * Also note that this callback can be called no matter the
> -        * state @dev is in. Drivers that need that device to be powered
> -        * to perform this operation will first need to make sure it's
> -        * been properly enabled.
> +        * state @dev is in and also no matter what state the panel is
> +        * in. It's expected:
> +        * - If the @dev providing the AUX bus is currently unpowered then
> +        *   it will power itself up for the transfer.
> +        * - If we're on eDP and the panel is not in a state where it can
> +        *   respond (it's not powered or it's in a low power state) then
> this
> +        *   function will return an error (but not crash). Note that if a
> +        *   panel driver is initiating a DP AUX transfer it may power
> itself
> +        *   up however it wants. All other code should ensure that the
> +        *   pre_enable() bridge chain (which eventually calls the panel
> +        *   prepare function) has powered the panel.
>          */
>         ssize_t (*transfer)(struct drm_dp_aux *aux,
>                             struct drm_dp_aux_msg *msg);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

