Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7885363D1BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 10:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbiK3JXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 04:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbiK3JXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 04:23:50 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F11C10FC9
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 01:23:49 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id d128so20759666ybf.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Io0nMOCW8iv7C49ek7QosikEfryx1Mcozl2/XH3V0Ys=;
        b=khEWx9lfrWvp89T043eZD6ERveqt4wO+YC+qtJJEgowPCNksgMASbx2w5juuA1QJfW
         xzfa6R57wEYrj63BCKjGDeo78fdo4pudjo0qr3KIf+0l4jM/460zHOSPxNvBJjv+BfJJ
         KCCDtzW8YiPu/q894Brfyi4YJ39Y4UXvgCEsruXea6YhZ3DWgWl6oKzt1NAbE3REd/6m
         BKiLEFhPp8hCuAmV9c/X28X0Tn/8uJl6DcC6lqEDuxBbM0H4+cmXSmJuJ4LHQpGG4Iyb
         ighRJJyOwJcUgbeiUSMt1NAOYKlEZzvSH9G771paKQwK4iOv+NXB9JLL4qxsSBcnUVKk
         ov+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Io0nMOCW8iv7C49ek7QosikEfryx1Mcozl2/XH3V0Ys=;
        b=N6U+qnA+LSG+t2o3AUhBZhW2qo7k+v1vUv2DrQrjfWBpo0u1O9i6BwqoN73C3YQiOM
         YCdCFqOuEfHGqeOSjRhAj6L/LMXc/If2VRF9c5ofwFtGs7P4hWcfaG2xTOe0Uwz82OKQ
         I33QDycTSpUOHFLuy5jMXffOBMdtKw6MXF7mWdjNfNVTnvjMtF2IWRRAPxUriKxonfQB
         0dkC9dbAGHGIhyBHeg7migN+BJlUm7jcBucLd9kGeVx19/Utd7705OxO8uClAaMmpQyv
         ss9B83rqh2jZe2iWDI9WM7Ya61k2pRTGtbLuQJDQphF4jM97EaaZfj3RTJkgojclJccx
         O+AQ==
X-Gm-Message-State: ANoB5pmGa+hJupCbJqBMvWxc1CuH13nC8ix4oD/xprKMYhLZf/895XZA
        aWegypxQXErxSEWtjaW7H4XJ+Sy3SFIqHXmaO3PGlg==
X-Google-Smtp-Source: AA0mqf4uTlRldLTHNX9Oy3lllFzfrO81W9GITTh4EKjh0UYYdSLL/UJzmCpC2WM9mGacYzXPaMI7WE8830cjJzkNgmU=
X-Received: by 2002:a25:cf4b:0:b0:6f4:6cd2:501b with SMTP id
 f72-20020a25cf4b000000b006f46cd2501bmr21007224ybg.194.1669800228605; Wed, 30
 Nov 2022 01:23:48 -0800 (PST)
MIME-Version: 1.0
References: <1669767131-13854-1-git-send-email-quic_khsieh@quicinc.com> <1669767131-13854-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1669767131-13854-4-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Nov 2022 11:23:37 +0200
Message-ID: <CAA8EJppAPCLj0JZf7v8ThFq1C=Ngx3AdzReatRwGC-_jhrANFA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/msm/dp: add support of max dp link rate
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Nov 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> By default, HBR2 (5.4G) is the max link link be supported. This patch add
> the capability to support max link rate at HBR3 (8.1G).
>
> Changes in v2:
> -- add max link rate from dtsi
>
> Changes in v3:
> -- parser max_data_lanes and max_dp_link_rate from dp_out endpoint
>
> Changes in v4:
> -- delete unnecessary pr_err
>
> Changes in v5:
> -- split parser function into different patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 7 ++++---
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
