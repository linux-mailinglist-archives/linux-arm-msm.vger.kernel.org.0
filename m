Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED144E507B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 11:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbiCWKlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 06:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiCWKlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 06:41:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419F66210E
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:39:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id l20so1932248lfg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LJG6LchEWg7eLND4+i+6tV16qS1u0tcHKvRxEtTuG+w=;
        b=yAkPXvHZVB3DXiA6lnV3OJs4l7boHKACGrx2zNN0q0WdW4bDDBFu/J4udxtyTi4LnD
         EW5GVcRjYXzEeDLkpqeGo1qdR36WyqvDgbQswBau6NJctIIV72R0Wo2Kj1TEosLVpGaq
         UvO0sdl+erB80ekBTDMX7IEdiKF3ft8qxVaWiecxxSgBJsWhhrQHl5YOnjDD05TZdcGP
         GDOInQ2USvHXmJkV5XU+7gTi59xIrI9Dv6xe++mHYqDqDI5n+u4nmlN8qRthsqM0DM33
         fzmhSc0ONmXxs82ScbBBb79fjsbtQFhKXPJYW/HWmd9J56xvz4lQapq28hyricqZ/Ueu
         gp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LJG6LchEWg7eLND4+i+6tV16qS1u0tcHKvRxEtTuG+w=;
        b=s9rUWF2a0Wz2UsQLFRQPopBDTHecMvHBytyYNQMFKCBF42AdceCZ5yDbkNVTfsSVlW
         4MlVId8Yspr62VfcIloxp4EMfLH7IpoVZWAQxbfLdCWMHbPMZkS3y5FkjTHlqhXw5UAE
         O050ZrPt4jNHjmgy6h2eeaVOnmMJuqDgzlPh9Usf20THIiVmjVkfIedMc/i7ClfOkydW
         0xrXEtSzXnPvSYXdPosa+DouWfe+yfjuJk092nfxzCAWfde0xV6qArC08h55Pbin0OVL
         JzbvDFIGVDn8RyE80j7Xj+nEu1cukhfTWVWGglGXXlV992YtD1mGKfjbyEh6HMaYOTHK
         bCXA==
X-Gm-Message-State: AOAM532m/nnmY/gBw/IqCyAusgt9swCSGogflyLF+ErY6rKyOcpDI1fR
        vmeFPGNyJBUYqFlVck2VXMNMmg==
X-Google-Smtp-Source: ABdhPJxdoE2MJzCwqFEPkOY+WggWU0jxIXl/lqXQbtd4rieBWf/meitV/U1e3m4J8NKMlt9q9m+iIA==
X-Received: by 2002:a05:6512:34c7:b0:44a:37de:9d74 with SMTP id w7-20020a05651234c700b0044a37de9d74mr6436931lfr.314.1648031986613;
        Wed, 23 Mar 2022 03:39:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x33-20020a0565123fa100b00443d3cffd89sm2479850lfa.210.2022.03.23.03.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 03:39:46 -0700 (PDT)
Message-ID: <e9937a37-70c8-cc6f-15f2-1dbbb7f1bfba@linaro.org>
Date:   Wed, 23 Mar 2022 13:39:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 00/22] drm: Review of mode copies
Content-Language: en-GB
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Emma Anholt <emma@anholt.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        linux-rockchip@lists.infradead.org,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nikola Cornij <nikola.cornij@amd.com>,
        John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Tomi Valkeinen <tomba@kernel.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Sandy Huang <hjc@rock-chips.com>,
        Robert Foss <robert.foss@linaro.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <Yi+9n0eGn3rNKb4X@intel.com>
 <CADnq5_NS07TPBWSnETRhjzqtX_oUuCu86ewurFT3MJO=PcLAuQ@mail.gmail.com>
 <Yjj+RSVBWk6UO2C7@intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Yjj+RSVBWk6UO2C7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/03/2022 01:37, Ville Syrjälä wrote:
> On Tue, Mar 15, 2022 at 02:52:38PM -0400, Alex Deucher wrote:
>> On Mon, Mar 14, 2022 at 6:12 PM Ville Syrjälä
>> <ville.syrjala@linux.intel.com> wrote:
>>>
>>> On Fri, Feb 18, 2022 at 12:03:41PM +0200, Ville Syrjala wrote:
>>>>    drm: Add drm_mode_init()
>>>>    drm/bridge: Use drm_mode_copy()
>>>>    drm/imx: Use drm_mode_duplicate()
>>>>    drm/panel: Use drm_mode_duplicate()
>>>>    drm/vc4: Use drm_mode_copy()
>>> These have been pushed to drm-misc-next.
>>>
>>>>    drm/amdgpu: Remove pointless on stack mode copies
>>>>    drm/amdgpu: Use drm_mode_init() for on-stack modes
>>>>    drm/amdgpu: Use drm_mode_copy()
>>> amdgpu ones are reviewed, but I'll leave them for the
>>> AMD folks to push to whichever tree they prefer.
>>
>> I pulled patches 2, 4, 5 into my tree.
> 
> Thanks.
> 
>> For 3, I'm happy to have it
>> land via drm-misc with the rest of the mode_init changes if you'd
>> prefer.
> 
> Either way works for me. I don't yet have reviews yet for
> the other drivers, so I'll proably hold off for a bit more
> at least. And the i915 patch I'll be merging via drm-intel.
> 
>>>>    drm/radeon: Use drm_mode_copy()
>>>>    drm/gma500: Use drm_mode_copy()
>>>>    drm/tilcdc: Use drm_mode_copy()
>>>>    drm/i915: Use drm_mode_copy()
> 
> Those are now all in.
> 
> Which leaves us with these stragglers:
>>>>    drm/hisilicon: Use drm_mode_init() for on-stack modes

>>>>    drm/msm: Nuke weird on stack mode copy
>>>>    drm/msm: Use drm_mode_init() for on-stack modes
>>>>    drm/msm: Use drm_mode_copy()

These three patches went beneath my radar for some reason.

I have just sent a replacement for the first patch ([1]). Other two 
patches can be pulled in msm/msm-next (or msm/msm-fixes) during the next 
development cycle if that works for you.

[1] https://patchwork.freedesktop.org/series/101682/

>>>>    drm/mtk: Use drm_mode_init() for on-stack modes
>>>>    drm/rockchip: Use drm_mode_copy()
>>>>    drm/sti: Use drm_mode_copy()
>>>>    drm: Use drm_mode_init() for on-stack modes
>>>>    drm: Use drm_mode_copy()
> 


-- 
With best wishes
Dmitry
