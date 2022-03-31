Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472DA4EE4C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 01:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237196AbiCaXbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 19:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiCaXbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 19:31:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986C514DFE4
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 16:29:17 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id m3so1806399lfj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 16:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i0Y8uJxAPTn+lPcbjKZMDigfiYGLfvVvyFJ8YmiOb0U=;
        b=ZTUl4ukv0e2NXaBF5xnMO9o+oFVlY2n2XoA0kUxOx6skIG9dTSaA7oECXPy4k5G/qR
         MtnM41dTUEMY98MWV1Q7y85uveZ3vNyBVCBdKuiNa70cypt1qBwokiaB5piPWsRGwfMf
         lQ3VnxZKPPbfZxfyG6Kj11Hei7OeO9IuoWwMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0Y8uJxAPTn+lPcbjKZMDigfiYGLfvVvyFJ8YmiOb0U=;
        b=KZcW+DJMm1QWthgnzsnBsqBCOLI5dSxQ6XUPgPZ1sos7kE2Kn8eIY9BEQikV32Iptm
         vMtNyG/Shv3xSlE82XtWro5wyRgHqYsx42JtJBC5x7qaEfW+TZIHfU5Psf/kdXY5odRv
         OZsYFfQkiG2wd5wEo6GVyM5ZnsZC1Is87w0v14sxZwSw7nHpk706Y3WBs+w0qS+SMJxe
         MD2PUmFzgDCZcaQgr3ETm44SCRzO7rvAB9CuR8V2gqREO5nzMIvrUNopi6lA+cYLodiO
         Da7nQtC/bLP0KuvttEaWCWdL4rzArX2lxV9kKAJ03OfwTA93i/iZbzU7eB0T2X+HlS9E
         tkbw==
X-Gm-Message-State: AOAM530ZvM/voBz5U1/6JTyWFY/9G6Q1N5aeLxgkqrP3aYqm9eiUeb9d
        oKzUoC25YX8p2tWKDvKucxUzP+nFvlBzkBFP5Zg=
X-Google-Smtp-Source: ABdhPJwkmV+pFN0tdvWG44i+6WBbNJMIhW1APFm7yIGr28EqCNlQMWIqXjsA9+TE1u31QHiy4dXPGA==
X-Received: by 2002:a05:6512:1153:b0:44a:3b47:4f88 with SMTP id m19-20020a056512115300b0044a3b474f88mr11808460lfg.447.1648769355561;
        Thu, 31 Mar 2022 16:29:15 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id x23-20020a19e017000000b0044a4820f882sm70444lfg.84.2022.03.31.16.29.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 16:29:15 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id v12so1784112ljd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 16:29:15 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr5615220wrq.342.1648768934136; Thu, 31
 Mar 2022 16:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com> <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 31 Mar 2022 16:22:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
Message-ID: <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        quic_aravindh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>
>         dp_display->encoder = encoder;
>
> +       ret = dp_display_get_next_bridge(dp_display);
> +       if (ret)
> +               return ret;

It feels weird to me that this is in a function called "modeset_init",
though I certainly don't know the structure of the MSM display code
well enough to fully comment. My expectation would have been that
devm_of_dp_aux_populate_ep_devices() would have been called from your
probe routine and then you would have returned -EPROBE_DEFER from your
probe if you were unable to find the panel afterwards.

Huh, but I guess you _are_ getting called (indirectly) from
dpu_kms_hw_init() and I can't imagine AUX transfers working before
that function is called, so maybe I should just accept that it's
complicated and let those who understand this driver better confirm
that it's OK. ;-)


> @@ -140,5 +140,6 @@ struct dp_parser {
>   * can be parsed using this module.
>   */
>  struct dp_parser *dp_parser_get(struct platform_device *pdev);
> +int dp_parser_find_next_bridge(struct dp_parser *parser);

Everything else in this file is described w/ kerneldoc. Shouldn't your
function also have a kerneldoc comment?
