Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2D4622CD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 14:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiKINwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 08:52:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiKINwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 08:52:23 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886311FCC8
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 05:52:22 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id f5so46820322ejc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2S+J1iMBr46oe55nECdK26SAa6W64ZtOEh/PbByniAU=;
        b=AZMhWxuad20lIxfAUULABl3yIgEcHVNdTApiGdmGv/ZRoE4CsXXL4K3vxKFM9e+0Uf
         ITQwbHIx4eLw8MSlJ5Zh/OwdaUiheDOSJQ50J5aNPCuK8JJKz0X4vMtEcUMIKn1LW3uH
         s+VyaVx9nlc47fG3YPUl7sJxh5+1n2b312Ivw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S+J1iMBr46oe55nECdK26SAa6W64ZtOEh/PbByniAU=;
        b=yG0uGaMHe676qr9/Df2QtIEywcBkUJJ3dWACxBrFF6+xQt8RIh1sdMlaUZ0pQs4TCZ
         B7ZaknDqfuAX0/6r96VUkV0ETWNV5MpPen3G5N8zSFp9mwGZ2HD05cbd5aW4DiYhBjay
         K8Lciw6yWI0o2Lu8wadd10wWaTjMQ2eOBATR4doVG0I8qZv1yncXJ/solNFxbuAcBtYB
         0NKENWm0mdZZH0WlIsWWkpSMeiPLTK331i5GSjLeddK1uw7tdyP19cSC9UXJ83Vbg6EK
         k9adySU59v8wtDayQRLiXgGkPujfvLynpFaEHUli5lniiXa6RpKcRo98GP0KFUQ3VuS5
         Reqg==
X-Gm-Message-State: ACrzQf1Km2SByTrGGHkDiyiYOJ002roV1sN1/D3+VOep/0tq06U67qfg
        LXK/NbmnLH0+RHPFPo8ZToPrRw==
X-Google-Smtp-Source: AMsMyM5cM+yUjAcRBZ6MzVFWPzKG388UhMKyFKh3eL7E58JSyMRacGE4fimWfsAwbnzEawMVN42zNw==
X-Received: by 2002:a17:907:7639:b0:79f:d1dd:2f86 with SMTP id jy25-20020a170907763900b0079fd1dd2f86mr57825602ejc.586.1668001941057;
        Wed, 09 Nov 2022 05:52:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id q9-20020a170906360900b00795bb7d64d8sm5937137ejb.217.2022.11.09.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 05:52:19 -0800 (PST)
Date:   Wed, 9 Nov 2022 14:52:12 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Simon Ser <contact@emersion.fr>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, daniel.vetter@ffwll.ch,
        laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm
 plane
Message-ID: <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
 <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 08, 2022 at 06:25:29PM +0000, Simon Ser wrote:
> On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On 29/10/2022 01:59, Jessica Zhang wrote:
> > 
> > > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > > drm_plane. In addition, add support for setting and getting the values
> > > of these properties.
> > > 
> > > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > > represents the format of the color fill. Userspace can set enable solid
> > > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > > framebuffer to NULL.
> > 
> > I suppose that COLOR_FILL should override framebuffer rather than
> > requiring that FB is set to NULL. In other words, if color_filL_format
> > is non-zero, it would make sense to ignore the FB. Then one can use the
> > color_fill_format property to quickly switch between filled plane and
> > FB-backed one.
> 
> That would be inconsistent with the rest of the KMS uAPI. For instance,
> the kernel will error out if CRTC has active=0 but a connector is still
> linked to the CRTC. IOW, the current uAPI errors out if the KMS state
> is inconsistent.

So if the use-case here really is to solid-fill a plane (and not just
provide a background color for the crtc overall), then I guess we could
also extend addfb to make that happen. We've talked in the past about
propertery-fying framebuffer objects, and that would sort out this uapi
wart. And I agree the color fill vs PLANE_ID issue is a bit ugly at least.

But if the use-cases are all background color then just doing the crtc
background color would be tons simpler (and likely also easier to support
for more hardware).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
