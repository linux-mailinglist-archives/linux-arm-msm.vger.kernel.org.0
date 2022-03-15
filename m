Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14CDD4DA2B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 19:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351162AbiCOSyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 14:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243728AbiCOSyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 14:54:02 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D350A2DDE
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 11:52:49 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id s35-20020a0568302aa300b005b2463a41faso14581318otu.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zNTJopoLGltecGhSY1J4R8lxzUea0zgkojqKJ4ephYk=;
        b=QKqrXEraFO3Q3uNBiyoVf+76YiOzMhP9FHgSq5y/4jPXEHcYc3eyCOAjQg6UCpL4OQ
         Qf9+d3Uo2az+gLFI1IyvbHSH5ZV1ysaDuDFj0/qNCK9moMY7s8Gs9YFgbndXfkrVyUUx
         LQyl9nSQ0peCvu1hpg91TKQWHAt/3dkBPOLcX0NgebyxbORQyqK+3W6dxjnxGHIE8Xhd
         CTz8OSJhD9stugfUoZ8mPXpKMCRH1HOkp0cRsOstlyL7j8RirvS3d+MTNd7tR8HfmlLk
         iNxLnCVWd7/fV7L0LaXkpC7HRsH6dWSpW6SspqpszrTSx4ODFCNv8fk16O4pru+WhBVH
         zVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zNTJopoLGltecGhSY1J4R8lxzUea0zgkojqKJ4ephYk=;
        b=xK6BMAgMCyrwG4xTU1pD+1nNeS3HJi2v/vrTx59apnTMGyVoYopN69hV4SvtHrRIIr
         8vvEZVeI9CRB3gm2I2mNJyZdxJlTrFqYYCJijS0spIMWdBH6QheJYFHklnNK+t30Iwrx
         Y6lhSO+E6hsuUmyTRXz4f/ebr9w0/j9tO129cjb8pooT02ivlUhitMITse8UPSO5Q4e0
         21s2cV6qdW04lHvZdw9nwwGwYTMPwIW7rR5bUu8I1lchTBUDo88Ay0y5im1LJbgOGzJG
         a7yqJXDIDESKq0D6qPTQJbWWsLQwwHq3/mdIxoF4sB6+ZCcIs7SMUh3bHSLDksFLC8Rt
         wX+w==
X-Gm-Message-State: AOAM530JGzwXWtFPAAbuo2Hj9Ln21PUzy1fMw1LAzeL7fmbtDRZlBFmq
        pn2aPEbg5e0bSTMpbR8s6cWgAReYoqH2CrL4vOg=
X-Google-Smtp-Source: ABdhPJzPCJIJm2LwauK3uaMNRrspjb+0HPgBwT8LZe/bTDIdcPf8RkEU23DNd13AaKZGCPpi0IDa/fHQYab6R7PD2VI=
X-Received: by 2002:a05:6830:2709:b0:5b0:196:dcf with SMTP id
 j9-20020a056830270900b005b001960dcfmr13485823otu.357.1647370369237; Tue, 15
 Mar 2022 11:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com> <Yi+9n0eGn3rNKb4X@intel.com>
In-Reply-To: <Yi+9n0eGn3rNKb4X@intel.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 15 Mar 2022 14:52:38 -0400
Message-ID: <CADnq5_NS07TPBWSnETRhjzqtX_oUuCu86ewurFT3MJO=PcLAuQ@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm: Review of mode copies
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 14, 2022 at 6:12 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Feb 18, 2022 at 12:03:41PM +0200, Ville Syrjala wrote:
> >   drm: Add drm_mode_init()
> >   drm/bridge: Use drm_mode_copy()
> >   drm/imx: Use drm_mode_duplicate()
> >   drm/panel: Use drm_mode_duplicate()
> >   drm/vc4: Use drm_mode_copy()
> These have been pushed to drm-misc-next.
>
> >   drm/amdgpu: Remove pointless on stack mode copies
> >   drm/amdgpu: Use drm_mode_init() for on-stack modes
> >   drm/amdgpu: Use drm_mode_copy()
> amdgpu ones are reviewed, but I'll leave them for the
> AMD folks to push to whichever tree they prefer.

I pulled patches 2, 4, 5 into my tree.  For 3, I'm happy to have it
land via drm-misc with the rest of the mode_init changes if you'd
prefer.

Alex


Alex

>
>
> The rest are still in need of review:
> >   drm/radeon: Use drm_mode_copy()
> >   drm/gma500: Use drm_mode_copy()
> >   drm/hisilicon: Use drm_mode_init() for on-stack modes
> >   drm/msm: Nuke weird on stack mode copy
> >   drm/msm: Use drm_mode_init() for on-stack modes
> >   drm/msm: Use drm_mode_copy()
> >   drm/mtk: Use drm_mode_init() for on-stack modes
> >   drm/rockchip: Use drm_mode_copy()
> >   drm/sti: Use drm_mode_copy()
> >   drm/tilcdc: Use drm_mode_copy()
> >   drm/i915: Use drm_mode_init() for on-stack modes
> >   drm/i915: Use drm_mode_copy()
> >   drm: Use drm_mode_init() for on-stack modes
> >   drm: Use drm_mode_copy()
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
