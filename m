Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011D9621ECB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 23:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiKHWDA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 17:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKHWC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 17:02:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CD243ADA
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 14:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667944922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=B4XOqV1gMleVpJRmsEaG0IDF2IsnRx/bBVmiudDCRhE=;
        b=U/4f468laQEdzCUAsyiTeWLvBNZAXt5uPw1x3L73MMAxxjI2P2C5m0ogQ7kxOl6/u0qt69
        aFht7XcccslU98p1MsVWXqUy5jkVRBVy2k9VdbiX0roZdAgDo9wZqU/ixl6pR25Omja9+r
        Imblz+y2XnZ4iRmPgHI+qkIYJCAwpjQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-5_IlX10PNNCKO9d8RT6dDA-1; Tue, 08 Nov 2022 17:02:01 -0500
X-MC-Unique: 5_IlX10PNNCKO9d8RT6dDA-1
Received: by mail-lf1-f72.google.com with SMTP id p10-20020a19f00a000000b004b028a42706so5281686lfc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 14:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4XOqV1gMleVpJRmsEaG0IDF2IsnRx/bBVmiudDCRhE=;
        b=IhiV3ik+mL0IVeBTndD6k7IRISQzlA2w/8sx+ju0EIvs/Rk8ij14/NbN2v8bUoM4TZ
         wm7xCfmA/aX7D8PjWFZSKdpD6aiFtX0s+Jl7DLhYopVikZKiGxtXlAoYELL0Koqa3qaA
         QNHcRhEbr7LW2hbCNu8hloCK2XgVzL8Dm9BRRsSVtfK0MnWHZtcgfNFm+YBjGoi1UgGY
         mHujjxaxSTKgp7v81oonfkIaiehjGGVoKL0TySz8TMey8ZSNMGfrNpKGzHHqDfVWG3dR
         MtH5o1kZX4dZ8HpQ7xIYgWk890KSafuiPzgzhvrkRLYdym1nnM7pONnGbc8KXdqHyxCE
         hYRw==
X-Gm-Message-State: ACrzQf17fcVw3VKvupTYGjCYlQsDRCJZRxVG0QLfxxq3/fGFtX712+V+
        wGwjPkOdM6kpvykgXPsQjxB3sCczL78DZ3K4ehRJZcXrFF88oIgJCG1iDwLlKAIBVct1ojtK9kE
        nh0eC+stpbaOjWdSpMcQ00/87R3duz5DNQlHdtVyPjA==
X-Received: by 2002:ac2:5e35:0:b0:4a4:754f:e2d5 with SMTP id o21-20020ac25e35000000b004a4754fe2d5mr22681746lfg.77.1667944919369;
        Tue, 08 Nov 2022 14:01:59 -0800 (PST)
X-Google-Smtp-Source: AMsMyM52Mtsi7gjV6anF7IJB1SSAqcpPVaiT1aF3M6yT6qKnkUV02vegAu4K8KA7JqOQICiIS1ew+ggq+sGeNFvuceU=
X-Received: by 2002:ac2:5e35:0:b0:4a4:754f:e2d5 with SMTP id
 o21-20020ac25e35000000b004a4754fe2d5mr22681740lfg.77.1667944919138; Tue, 08
 Nov 2022 14:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com> <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
 <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
In-Reply-To: <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
From:   Sebastian Wick <sebastian.wick@redhat.com>
Date:   Tue, 8 Nov 2022 23:01:47 +0100
Message-ID: <CA+hFU4wrDtSpU5owaNVP=8F3bQCnFCaJ7RmGOS0y4cooKQ5+CQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
To:     Simon Ser <contact@emersion.fr>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
        dri-devel@lists.freedesktop.org, swboyd@chromium.org,
        robdclark@gmail.com, seanpaul@chromium.org,
        laurent.pinchart@ideasonboard.com, daniel.vetter@ffwll.ch,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        wayland-devel <wayland-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 8, 2022 at 7:51 PM Simon Ser <contact@emersion.fr> wrote:
>
> cc'ing Pekka and wayland-devel for userspace devs feedback on the new uAPI.
>
> On Saturday, October 29th, 2022 at 14:08, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On 29/10/2022 01:59, Jessica Zhang wrote:
> > > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > > drm_plane. In addition, add support for setting and getting the values
> > > of these properties.
> > >
> > > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > > represents the format of the color fill. Userspace can set enable solid
> > > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > > framebuffer to NULL.
> > >
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >
> > Planes report supported formats using the drm_mode_getplane(). You'd
> > also need to tell userspace, which formats are supported for color fill.
> > I don't think one supports e.g. YV12.
> >
> > A bit of generic comment for the discussion (this is an RFC anyway).
> > Using color_fill/color_fill_format properties sounds simple, but this
> > might be not generic enough. Limiting color_fill to 32 bits would
> > prevent anybody from using floating point formats (e.g.
> > DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with
> > e.g. using 64-bit for the color_fill value, but then this doesn't sound
> > extensible too much.
> >
> > So, a question for other hardware maintainers. Do we have hardware that
> > supports such 'color filled' planes? Do we want to support format
> > modifiers for filling color/data? Because what I have in mind is closer
> > to the blob structure, which can then be used for filling the plane:
> >
> > struct color_fill_blob {
> >      u32 pixel_format;
> >      u64 modifiers4];
> >      u32 pixel_data_size; // fixme: is this necessary?
> >      u8 pixel_data[];
> > };
> >
> > And then... This sounds a lot like a custom framebuffer.
> >
> > So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_FILL
> > flag to the framebuffers, which would e.g. mean that the FB gets stamped
> > all over the plane. This would also save us from changing if (!fb)
> > checks all over the drm core.
> >
> > Another approach might be using a format modifier instead of the FB flag.
> >
> > What do you think?
>
> First off, we only need to represent the value of a single pixel here. So I'm
> not quite following why we need format modifiers. Format modifiers describe how
> pixels are laid out in memory. Since there's a single pixel described, this
> is non-sensical to me, the format modifier is always LINEAR.
>
> Then, I can understand why putting the pixel_format in there is tempting to
> guarantee future extensibility, but it also adds complexity. For instance, how
> does user-space figure out which formats can be used for COLOR_FILL? Can
> user-space use any format supported by the plane? What does it mean for
> multi-planar formats? Do we really want the kernel to have conversion logic for
> all existing formats? Do we need to also add a new read-only blob prop to
> indicate supported COLOR_FILL formats?
>
> We've recently-ish standardized a new Wayland protocol [1] which has the same
> purpose as this new kernel uAPI. The conclusion there was that using 32-bit
> values for each channel (R, G, B, A) would be enough for almost all use-cases.
> The driver can convert these high-precision values to what the hardware expects.
> The only concern was about sending values outside of the [0.0, 1.0] range,
> which may have HDR use-cases.
>
> So, there are multiple ways to go about this. I can think of:
>
> - Put "RGBA32" in the name of the prop, and if we ever need a different
>   color format, pick a different name.
> - Define a struct with an enum of possible fill kinds:
>   #define FILL_COLOR_RGBA32 1
>   #define FILL_COLOR_F32 2
>   struct color_fill_blob { u32 kind; u8 data[]; };
> - Define a struct with a version and RGBA values:
>   struct color_fill_blob { u32 version; u32 rgba[4]; };
>   If we need to add more formats later, or new metadata:
>   struct color_fill_blob2 { u32 version; /* new fields */ };
>   where version must be set to 2.
> - Define a struct with a "pixel_format" prop, but force user-space to use a
>   fixed format for now. Later, if we need another format, add a new prop to
>   advertise supported formats.
> - More complicated solutions, e.g. advertise the list of supported formats from
>   the start.
>
> [1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104
>

Agreeing with most of what you said here. However, what's the idea
behind a format anyway? The 4 values provided here are fed directly
into the color pipeline which seems to define the color channels it's
working on as RGBA (or doesn't define anything at all). The only
reason I can think of is that hardware might support only ingesting
values either in a format with high bit depth color channels and no
alpha or a format with low bit depth color but with alpha, so choosing
between the formats provides a real trade-off. Is that actually
something hardware might be restricted to or do they all just support
ingesting the color data with enough precision on every channel?

