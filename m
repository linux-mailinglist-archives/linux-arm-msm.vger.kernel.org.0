Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C48C52E11A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 02:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbiETAUv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 20:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343944AbiETAUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 20:20:50 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AD1CE24
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:20:47 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id fd25so8877839edb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q2SsP49FcCChtmjGtwbSaTMmlIgf4FKqMdxkNXcLZxo=;
        b=HXRvwBSe1kdLw+E5XZQUg1aqD+Xzx1EPDD38vER8o23tEByEWKBd7UsuCsmlQjS2IA
         UrFRDsWb1JfLL64GhKqULVkddtRl8NXbTC9LPYW7SISZVG8H9KSTco/tZyI1GcTczIEC
         gnDMhQk9vYaGXJfrN3vT+O6EmsVeRrRGlccwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q2SsP49FcCChtmjGtwbSaTMmlIgf4FKqMdxkNXcLZxo=;
        b=vvKgrdM24ewrTNVPNRQYTSsjD2HLNAlVoKmYtWOtZROoz01iJuckIJxAD2z42aZDSU
         kfRrLqzu5UXOYa1J2rTIMT4lHUHVdXup/2fogVEEwQwqGdQhicS960JkzyelweHb+smH
         wWmcHDqbGfjQIKkuHsf/O0YUXzUpkNp1Pkwv9S4IxhSbKMSOiyRdb7uM656BvhSe34vK
         Prnj28RopT5MSgAPKd2d0ziIvzGF0O6dVeJPoBXkkMd+cNc8SDwIRsiP3I4bvX+SWTvy
         8UEA/FH6N23DkvAfAHrQs6EJYmQBmCptDat0rGAIIlgnLyhJIBBPtABFgg63ZtNOm8nX
         r4ZA==
X-Gm-Message-State: AOAM530JfgN78QV7lo+/Sh2oEh7B8Sbma+h+91EFk8L2GSuWgOoQ2D5p
        E9d6jmzuasCGJlQzqGsg3SLVU/y53bzS4k6wLFI=
X-Google-Smtp-Source: ABdhPJxy1erGW9Wkn+ut0rYp7/MngvZZW4uFd8Rp8WvpJcTYlvWRLI1+71ljszokXRxqxhH7ejMpJQ==
X-Received: by 2002:a05:6402:2805:b0:42a:ea9b:e6a0 with SMTP id h5-20020a056402280500b0042aea9be6a0mr8101152ede.102.1653006045685;
        Thu, 19 May 2022 17:20:45 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id y28-20020a170906519c00b006fa981fcd78sm2651024ejk.93.2022.05.19.17.20.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 17:20:44 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id j25so9359928wrc.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:20:44 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr5985688wrq.513.1653006043655; Thu, 19
 May 2022 17:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
In-Reply-To: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 19 May 2022 17:20:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Und7oTNBf8+=d9_RMQyv1v0vzh6OSGpvvPTYWtGF07MA@mail.gmail.com>
Message-ID: <CAD=FV=Und7oTNBf8+=d9_RMQyv1v0vzh6OSGpvvPTYWtGF07MA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/probe-helper: Add helper for drm_helper_probe_single_connector_modes()
To:     dri-devel <dri-devel@lists.freedesktop.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
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

On Wed, May 11, 2022 at 3:58 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The drm_helper_probe_single_connector_modes() is a bit long. Let's
> break a chunk off to update and validate modes. This helps avoid one
> goto and also will allow us to more easily call the helper a second
> time in a future patch without adding looping or another goto.
>
> This change is intended to be a no-op change--just code movement.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>
> Changes in v3:
> - Removed WARN_ON
>
> Changes in v2:
> - Two underscores for __drm_helper_update_and_validate().
> - Return err and use WARN_ON instead of returning a bool.
>
>  drivers/gpu/drm/drm_probe_helper.c | 106 ++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 46 deletions(-)

Pushed to drm-misc-next:

4a2a13a57b60 drm/probe-helper: Add helper for
drm_helper_probe_single_connector_modes()
