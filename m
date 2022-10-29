Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 218EB6122C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 14:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJ2MIZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 08:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJ2MIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 08:08:25 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307294BD33
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 05:08:24 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z24so11386046ljn.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXEZ0SiAJsDBx6kQwPJlcjj9GjZJFbTgLrn2PJu4DcQ=;
        b=suSMcqpRXIsoVwxg5CQFuNE+7xV6t597mjxo4naDfeQFSr84KTvQnthV826Nh49JQZ
         rr5b9fVXhBczMDIaILxd9d3uLpppWPQ6uymgOEhH/xKsLshyk/UYJxwqVlX+VQvYjPTa
         FwCHkTYVPY0FnGxLjGkufV11SlEhpKQxPfA0lhQrWroYo8XmEIkjSi/YZ4Hew/Gs9PUs
         H8X6Y8wba7o4/gCwhPaYyqULVDfldDQE8HR3BznhwUJxKyXulAlXciPG2+GTTbz2I6Bc
         kasO4guLOulskzUMM6LzsnZBGLs7TcFJ83YTrZtb0AplDwHJyes0ZK1hTUOwZHlc6iOv
         4iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXEZ0SiAJsDBx6kQwPJlcjj9GjZJFbTgLrn2PJu4DcQ=;
        b=Q7Cw22jQPDeARUGyTvIReoPCCPEPeNEV4zXpoElzv2Jb75L04UqwMJEee3c9erUR4H
         viycTWFE+WdRoOGGOnoGub3F5ZcZLRuFL/d8qzx7S9B80PjX77iwSbMLGA6KAlz48lCw
         54IHU/5vgMjNgifobNzDCb2YwGaJcCRei5jkXxezheMT4Lf9XvrNvlQ9jDJhxXNHFL2Z
         qA2+BWiVlkC0qozMlNYsw+HDifUdgnWfSmUmdclU4dwOhggOnU1yYfkdck1fSJuPWj8i
         Abx6SEL01hWhwub1qqp9ts9nHFU0I73KenxqVmAUhgqsnd7o9WGnITurJkKWgnW+TS3R
         ISoQ==
X-Gm-Message-State: ACrzQf2g3d9+DWvcbm6Sn9rNxaSudEoEnR4VE34W9o9AiUd048QEkmq5
        O3Lbr0boKIWQ69e9VF7uSeMJqA==
X-Google-Smtp-Source: AMsMyM7QrN+wVCBWlK5JozAyEWh7jUIdwIrxna8eFiKA/cZuWW/mjCuWyQ/Piw0n5wA0Nn5Ik4iUMA==
X-Received: by 2002:a2e:a5c2:0:b0:261:d23a:2009 with SMTP id n2-20020a2ea5c2000000b00261d23a2009mr1411058ljp.303.1667045302545;
        Sat, 29 Oct 2022 05:08:22 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id v3-20020a05651203a300b004a95d5098f2sm255836lfp.226.2022.10.29.05.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 05:08:22 -0700 (PDT)
Message-ID: <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
Date:   Sat, 29 Oct 2022 15:08:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm
 plane
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        daniel.vetter@ffwll.ch, laurent.pinchart@ideasonboard.com
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028225952.160-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/10/2022 01:59, Jessica Zhang wrote:
> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> drm_plane. In addition, add support for setting and getting the values
> of these properties.
> 
> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> represents the format of the color fill. Userspace can set enable solid
> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> framebuffer to NULL.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Planes report supported formats using the drm_mode_getplane(). You'd 
also need to tell userspace, which formats are supported for color fill. 
I don't think one supports e.g. YV12.

A bit of generic comment for the discussion (this is an RFC anyway). 
Using color_fill/color_fill_format properties sounds simple, but this 
might be not generic enough. Limiting color_fill to 32 bits would 
prevent anybody from using floating point formats (e.g. 
DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with 
e.g. using 64-bit for the color_fill value, but then this doesn't sound 
extensible too much.

So, a question for other hardware maintainers. Do we have hardware that 
supports such 'color filled' planes? Do we want to support format 
modifiers for filling color/data? Because what I have in mind is closer 
to the blob structure, which can then be used for filling the plane:

struct color_fill_blob {
     u32 pixel_format;
     u64 modifiers4];
     u32 pixel_data_size; // fixme: is this necessary?
     u8 pixel_data[];
};

And then... This sounds a lot like a custom framebuffer.

So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_FILL 
flag to the framebuffers, which would e.g. mean that the FB gets stamped 
all over the plane. This would also save us from changing if (!fb) 
checks all over the drm core.

Another approach might be using a format modifier instead of the FB flag.

What do you think?

-- 
With best wishes
Dmitry

