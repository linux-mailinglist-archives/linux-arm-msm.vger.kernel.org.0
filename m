Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2025848F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jul 2022 02:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbiG2ASo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 20:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbiG2ASm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 20:18:42 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C277B1DC
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 17:18:38 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w5so4024492edd.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PyBgADkFmRZGD19YV3bJfXKekitzQhA7zmplwDjvl4A=;
        b=EBDfKbN161jfJ2QBSHpfJwdM19oVk8aVJ4xikkdC2kuXRN+8QRATaPmhq8E7nW+CwY
         0BgTL+iXQpYb3/SFbGQJMC8MumsErqG7MH3njWLFzrqPP1pRCjSDD9mvh9NlaP21SyHV
         gJmZF+TK74SlIlGljuDFIZFOnwtouZg04HSZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PyBgADkFmRZGD19YV3bJfXKekitzQhA7zmplwDjvl4A=;
        b=FKdf1t7OlwkxRafcUOAosWxG+H7uRoVzVG8nghe+IK9vaK8G7ZOOCccnD6ZDjcmqjx
         3w6RTzcbtN54GOXK/1fXt28GIqGuRShfOlmOTH3MYaGNMoMDlIFXXBrQilVEuD5fKp24
         9iBjQ04jAqKz9jM5pRkwvrA0JRgii8iP5Z2UA9EoLAMnju9ShEgqHgta+2UpbpRFh+Wx
         W9UkMYZy5oE1jQPF+nxYVLu2AyjTxu203Szai4Ars9Lfk5B4t4O78N518nTnCsuI83O0
         nUsx8ssrgj2AXy60JTuYPCVFVTVjh005DnuQ5lL/WPySEyPLNonCnMe2uxkq7hmvnIqL
         CDIg==
X-Gm-Message-State: AJIora9GfmwvfutvqM4J58JYiYQbZOZyIt7t6MW98bQBHlJ7XO7kWlKn
        p2e8NTDaqAPsa5tVjqRG6cg2l+3l+44MbXQS
X-Google-Smtp-Source: AGRyM1scWnNOyDF/mlM05rCYCx2JVJWH0rW5WwY+jlIlactoq3UuSkW0/cWdmV+6y01JTGNRFjfPGg==
X-Received: by 2002:a05:6402:e08:b0:43a:f435:ff1a with SMTP id h8-20020a0564020e0800b0043af435ff1amr1266819edh.123.1659053916527;
        Thu, 28 Jul 2022 17:18:36 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id uz12-20020a170907118c00b0072aed3b2158sm968867ejb.45.2022.07.28.17.18.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 17:18:34 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id m13so199157wrq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 17:18:33 -0700 (PDT)
X-Received: by 2002:a5d:6843:0:b0:21f:1114:fc54 with SMTP id
 o3-20020a5d6843000000b0021f1114fc54mr146662wrw.138.1659053913662; Thu, 28 Jul
 2022 17:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com> <1657544224-10680-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-3-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Jul 2022 17:18:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2Ci6G5c4LNibKTWu5ZC962j8QeHpG2nn7uCCoRCuFdw@mail.gmail.com>
Message-ID: <CAD=FV=X2Ci6G5c4LNibKTWu5ZC962j8QeHpG2nn7uCCoRCuFdw@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] drm: add helper functions to retrieve old and
 new crtc
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Add new helper functions, drm_atomic_get_old_crtc_for_encoder
> and drm_atomic_get_new_crtc_for_encoder to retrieve the
> corresponding crtc for the encoder.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  7 ++++++
>  2 files changed, 67 insertions(+)

I don't have a lot of intuition about the code here since I haven't
messed much at this level, but what you have here looks right and
matches other similar helpers. I'm happy enough with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
