Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3FE543818
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 17:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244577AbiFHPuh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 11:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244440AbiFHPuf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 11:50:35 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55393ED0D
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 08:50:20 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so11300058wms.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=CMsRXdWPmCDKvHowScgEPfcStDkBg94b5gd4aiXfFOo=;
        b=Xqtl8Ykb4qZhu60PLm3yREsrhfN7nycopV9Cg9DUODp+2a1GNn/lBEVFmoUaJT4ctn
         Og0NsuClCH8RLjcbeHc3nTohfjXaaOF5zeejqNfesaxvPyIkipv6pYygVud9iJNcmYKh
         ahaIdZft8ba9IAW5aiqjdFaX5F43Oza1EtamY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=CMsRXdWPmCDKvHowScgEPfcStDkBg94b5gd4aiXfFOo=;
        b=Y5I4x8khQa0r84KLGNvnnsiLRwxHYyerwKl+76s5bSphZ0kahpPpFHQyUnmU/WfdlF
         UeyJq6nAUZeigr6OdfUVq+pHtpG7Eldb2q6iUPxUAcW715sPQ0KJEf0Jke8cSGeoCHib
         aF/tDNi2aP9Kl/whVDoKbW5UgEHaW7I8MFpfvfLP5vzZ/xbuQW2gXi0vDPHeZSFg2iwI
         0A13HxyrX64CA9wOp4Z9T4k5B5DlVOf/ayw2CV1tJczgctyNa78lEjLVa9dj7GPZS7pX
         u2tMq9WdD7TuBauNvPAqirGpqNavvQ3NnP+FpE3KSUy+4sLNYyLzwL6AJLIxiALX3Mjo
         JnNw==
X-Gm-Message-State: AOAM531pzlMVtGvQWdZvSykPT7xRcPgb9K7yr8vocJ4vsJp4YEs7XbYL
        WVk3Q7XWmjGQmMMg5iXGTTDslQ==
X-Google-Smtp-Source: ABdhPJyiIwGCreHBsvQ2VeugCyr176Iz/EYHcScGY1DBTFXJ2J9uF7B9z1Usvrt4vZT/C7DnLh5RkA==
X-Received: by 2002:a05:600c:10cb:b0:39c:4e74:2b41 with SMTP id l11-20020a05600c10cb00b0039c4e742b41mr19026418wmd.130.1654703418228;
        Wed, 08 Jun 2022 08:50:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h4-20020adffd44000000b002102d4ed579sm21547079wrs.39.2022.06.08.08.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 08:50:17 -0700 (PDT)
Date:   Wed, 8 Jun 2022 17:50:15 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
Message-ID: <YqDFNx0Oim9RBIMf@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521091751.opeiqbmc5c2okdq6@houat>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 21, 2022 at 11:17:51AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > This adds a devm managed version of drm_bridge_add(). Like other
> > "devm" function listed in drm_bridge.h, this function takes an
> > explicit "dev" to use for the lifetime management. A few notes:
> > * In general we have a "struct device" for bridges that makes a good
> >   candidate for where the lifetime matches exactly what we want.
> > * The "bridge->dev->dev" device appears to be the encoder
> >   device. That's not the right device to use for lifetime management.
> > 
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> 
> If we are to introduce more managed helpers, I think it'd be wiser to
> introduce them as DRM-managed, and not device managed.
> 
> Otherwise, you'll end up in a weird state when a device has been removed
> but the DRM device is still around.

Top-level post since I didn't see any good place to reply in the thread
below:

- devm is for device stuff, which drm_bridge is (it's not uapi visible in
  any way or fasion)

- drmm is for uapi visible stuff (like drm_encoder)

Yes the uapi-visible stuff can outlive the device-related pieces. The way
to handle this is:

- drm_dev_unplug() when the device disappears underneath you (or just a
  part, I guess the infra for that doesn't exist yet and maybe we should
  add it).

- drm_dev_enter/exit wrapped around the device related parts.

Iow, this patch here I think is the right direction, and gets my

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But also, it's definitely not a complete solution as the discussion in the
thread here points out.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
