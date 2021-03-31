Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A513503E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 17:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbhCaP40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 11:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbhCaP4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 11:56:00 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EA1C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:55:59 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id g24so14779814qts.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3txpl7SPHqYWFmYajWj2ZLqZQklbOiGgSGT1F0s0WDs=;
        b=NQWUaXXWMySIF2EP+8LpYt2VqT0hEYBBQPiLFjsHR6kSUpulZam5AaYGVvXpIOfMLf
         OsgyFb42lxRPZDjBSuOxeV2GqM+6W2QryNNKQ8ks3PqlyEZcN5M27OVl8w3pIYj2aS/k
         J1RzZvE1dtaWstaKZ7sZiDlHlAOiriZmnGnng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3txpl7SPHqYWFmYajWj2ZLqZQklbOiGgSGT1F0s0WDs=;
        b=ujNa6in3J8OcSvzYzAePU/bt/ugT9nTDoeAYM8vDJpMkQ8J9OVI7A2b0Q1gs6g3XGq
         Dg3EFKzx4QqP6HGXwPsUI0YmE0TOw/JXuPPnWkAUeP4U5giNQHt8t9bWs/ciAF0UckdL
         XaQGrGzi8P5fDH2RKtN/UOE0ZVQa96lEhvTzqCOQejwAEzjsITpGEdkr+bxgTzJQxTF+
         N2cMwrQ9VsxqGWayd466/OjkMqa64Y4VW7KnTxO6LS55eVXBsjE1xdWXqfleeDx1I9t8
         K7jB4yHLCfQada7umOqXFFrgpQ0UXIzv2SqJBdhTC75IIWmsZq46MwDnag6xARXqGhgb
         RdGQ==
X-Gm-Message-State: AOAM5311tTMl2K4uNz3DEYKjF3CZDCD1MbL72qW/KrfG6izLVlaQf3kt
        Fqoq26mc7vd+wNfiJpp4Xtjhzg5dSauq6Q==
X-Google-Smtp-Source: ABdhPJwjfUaO67qGmlWHs+eF5GGG93pPC5ngTasLXBesLx44nz5hbV0e2o+6EfufbTGfRLoglx851g==
X-Received: by 2002:ac8:4a19:: with SMTP id x25mr3008268qtq.271.1617206158624;
        Wed, 31 Mar 2021 08:55:58 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id m13sm1649822qkm.103.2021.03.31.08.55.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 08:55:58 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id o66so21651091ybg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:55:57 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr5658516ybp.476.1617206157416;
 Wed, 31 Mar 2021 08:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 Mar 2021 08:55:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XKr_0Zw+EaChRuyb9K8XZZvzF9CiZt69C6akRhCGFLvQ@mail.gmail.com>
Message-ID: <CAD=FV=XKr_0Zw+EaChRuyb9K8XZZvzF9CiZt69C6akRhCGFLvQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: fix warn stack reported during dpu resume
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, mkrishn@codeaurora.org,
        Daniel Hung-yu Wu <hywu@google.com>,
        Matthias Kaehlcke <mka@google.com>,
        Michelle Dean <midean@google.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 31, 2021 at 4:27 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> @@ -294,6 +294,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>         struct icc_path *path1;
>         struct drm_device *dev = dpu_kms->dev;
>
> +       if (!dpu_supports_bw_scaling(dev))
> +               return 0;
> +
>         path0 = of_icc_get(dev->dev, "mdp0-mem");
>         path1 = of_icc_get(dev->dev, "mdp1-mem");
>

Instead of hard coding a check for specific SoC compatible strings,
why not just check to see if path0 and/or path1 are ERR_PTR(-ENODEV)?
Then change dpu_supports_bw_scaling() to just return:

!IS_ERR(dpu_kms->path[0])

It also seems like it would be nice if you did something if you got an
error other than -ENODEV. Right now this function returns it but the
caller ignores it? At least spit an error message out?


> @@ -154,6 +154,15 @@ struct vsync_info {
>
>  #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
>
> +/**
> + * dpu_supports_bw_scaling: returns true for drivers that support bw scaling.
> + * @dev: Pointer to drm_device structure
> + */
> +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
> +{
> +       return of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss");

See above, but I think this would be better as:

  return !IS_ERR(dpu_kms->path[0]);

Specifically, I don't think of_device_is_compatible() is really
designed as something to call a lot. It's doing a whole bunch of data
structure parsing / string comparisons. It's OK-ish during probe
(though better to use the of_match_table), but you don't want to call
it on every runtime suspend / runtime resume.
