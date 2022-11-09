Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66AE9622D06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 14:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiKIN71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 08:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiKIN71 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 08:59:27 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A8512E
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 05:59:25 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id s12so17754735edd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 05:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMkOBtT6ObLYy25oIgnCsgVbQYMchVinpbWDYzQjMs4=;
        b=L+QdDEi5Ht9Q/Ahc5HiTLg+H07UBVGKbXPJ6mMMu7d9iXXtRBx4C6HziIj3xF8XfJM
         hToaoS81myOhtdl2AGQopt9vBn9GPREAkPxvG8ZVF6KHNWt4FgpouVWhd5HWbR7MAdXd
         92q2pDpOspptsiichLv8pJ43Cc+CGNZzSashA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMkOBtT6ObLYy25oIgnCsgVbQYMchVinpbWDYzQjMs4=;
        b=tcprniFKv7TXufK2B51yeww5y00+DsoLknrfpCTHbo64KHoSg2sd67+ExClN8WkHf8
         CnO9ilhbKGEd+6De4jGOdIUhnf+1Dj8rqH00NRjTAmIFJfD79+sK4tNoQtbGd+yR/r14
         rnKjNA+80Txq0VA3Wmtnd5I5ICOtRGAGyRzRwbtW/sap15hiH1TqCyl7MCY6kkiol884
         nq5NWy4e1EcocQXKJCsTiu0zWv+Mk90JKX52KuEiU0o5MxfRzt4w/Gz9iYwY20sHFo6C
         Bb1MkIuRvQuaY23op2yPsOUI7Pc2dnSYYhXtr4akS2fdlonn+1QELP26ZteZAkXIQkWP
         DahQ==
X-Gm-Message-State: ANoB5plJPU9W9GHXxePQuXV9EJkOUjHx0jteuhGfTs0sPutRl17OseTd
        FCL9cFChhswxjDbogceZyUO+aw==
X-Google-Smtp-Source: AA0mqf5Df8RAFDDstHdqMCyloMhuIL43rSDRflmFTW1LmU3mQWkvhHRC+anCIHsBnl8RS8zvUKgT4Q==
X-Received: by 2002:aa7:db4e:0:b0:463:2979:5e49 with SMTP id n14-20020aa7db4e000000b0046329795e49mr16244024edt.266.1668002364506;
        Wed, 09 Nov 2022 05:59:24 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906210a00b0078d21574986sm5816943ejt.203.2022.11.09.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 05:59:23 -0800 (PST)
Date:   Wed, 9 Nov 2022 14:59:21 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, daniel.vetter@ffwll.ch,
        laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm
 plane
Message-ID: <Y2uyOcVbadRwr9/O@phenom.ffwll.local>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
 <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
 <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
 <ee755c43-434a-a990-0efa-ed5c6baa237e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee755c43-434a-a990-0efa-ed5c6baa237e@linaro.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 09, 2022 at 04:53:45PM +0300, Dmitry Baryshkov wrote:
> On 09/11/2022 16:52, Daniel Vetter wrote:
> > On Tue, Nov 08, 2022 at 06:25:29PM +0000, Simon Ser wrote:
> > > On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > 
> > > > On 29/10/2022 01:59, Jessica Zhang wrote:
> > > > 
> > > > > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > > > > drm_plane. In addition, add support for setting and getting the values
> > > > > of these properties.
> > > > > 
> > > > > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > > > > represents the format of the color fill. Userspace can set enable solid
> > > > > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > > > > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > > > > framebuffer to NULL.
> > > > 
> > > > I suppose that COLOR_FILL should override framebuffer rather than
> > > > requiring that FB is set to NULL. In other words, if color_filL_format
> > > > is non-zero, it would make sense to ignore the FB. Then one can use the
> > > > color_fill_format property to quickly switch between filled plane and
> > > > FB-backed one.
> > > 
> > > That would be inconsistent with the rest of the KMS uAPI. For instance,
> > > the kernel will error out if CRTC has active=0 but a connector is still
> > > linked to the CRTC. IOW, the current uAPI errors out if the KMS state
> > > is inconsistent.
> > 
> > So if the use-case here really is to solid-fill a plane (and not just
> > provide a background color for the crtc overall), then I guess we could
> > also extend addfb to make that happen. We've talked in the past about
> > propertery-fying framebuffer objects, and that would sort out this uapi
> > wart. And I agree the color fill vs PLANE_ID issue is a bit ugly at least.
> > 
> > But if the use-cases are all background color then just doing the crtc
> > background color would be tons simpler (and likely also easier to support
> > for more hardware).
> 
> No. The hardware supports multiple color-filled planes, which do not have to
> cover the whole CRTC.

The use case here means the userspace use-case. What the hw can do on any
given chip kinda doesnt matter, which is why I'm asking. KMD uapi is not
meant to reflect 100% exactly what a specific chip can do, but instead:
- provide features userspace actually needs. If you want per-plane fill,
  you need userspace that makes use of per-plane fill, and if all you have
  is crtc background, then that's it.
- we should create uapi with an eye towards what's actually possible on a
  reasonable set of drivers and hw. Sometimes that means a slightly more
  restricted set so that it's possible to implement in more places,
  especially if that restricted feature set still gets the job done for
  userspace.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
