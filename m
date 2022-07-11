Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E31B45708DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 19:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbiGKRbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 13:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiGKRbE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 13:31:04 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3971333A25
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:31:03 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x91so7155871ede.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sw8gkUx8zCiOOcTJXnmfRDnj5fxg2VeQXfJ+u4gc5/4=;
        b=acvDDtc3nLB2RKkk9baYJ+3X9Tc/uc6EQ3Z+eK9dFjTK30Jzc4d572TluawWOu0Uvl
         xX7BvT1dhlxTq2DjFuBLbjO5niFHLbcy/ylswUeMuNHcUTJnry2cRSA7CiFhOoqbxT8R
         xDuNfuBAWBbEyWgwPaipg25EuKfxvBm4hVFSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sw8gkUx8zCiOOcTJXnmfRDnj5fxg2VeQXfJ+u4gc5/4=;
        b=Kv8FlG2sxPEQ715NQXaBbiuYq7HMWIQtBecfarkVXIW4EjIjEpV3nd+nWk4uW21NpF
         JIpP+fikdfr6z4X75V7sgJINHPGQuiWw5syNPo6WGbBcp/7DbO67b7n1PcuLo+41MU+y
         ccUfEw5mDlrJWtmen79K+OJBkpsPtzkHzH3tnbDwVwBMlXR3UTFqwdzczHtCrKrnQJSE
         V/fbhA2/tMENhgjkRssa4ILZGFs6fDFRI9Rjaa4O3lChwOk/MLAsStD1bD7eH+1ukPlr
         n2/bxXiDc+k2l+RlosXtq4oNrL1UAAj/mti/IyND34GWyXjO51Tv1JhUeBjYPiFEJXNK
         TIFQ==
X-Gm-Message-State: AJIora+YQKS99vzCM2rCpo1j5Eo8MFyswy7RedavaIrrVAdjd7rqASQe
        6qcRH5TFodN71pJv2UOgYeioYUhXCLpcIr9n8pI=
X-Google-Smtp-Source: AGRyM1tJyQHvd5Nex2O/lDOITtuFcqRgmIfqv6ltRPnzYzOLbuVYPQDXqkYfGuhYFdJ2XZMxk3GlRg==
X-Received: by 2002:a05:6402:f10:b0:43a:b4cb:4d04 with SMTP id i16-20020a0564020f1000b0043ab4cb4d04mr22595672eda.305.1657560661479;
        Mon, 11 Jul 2022 10:31:01 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id fi20-20020a056402551400b0043a0da110e3sm4579309edb.43.2022.07.11.10.31.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 10:31:01 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id c131-20020a1c3589000000b003a2cc290135so3867528wma.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:31:00 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:3a2:e97b:f3ae with SMTP id
 bi21-20020a05600c3d9500b003a2e97bf3aemr4140499wmb.188.1657560237962; Mon, 11
 Jul 2022 10:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org> <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 10:23:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
Message-ID: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Now as the driver does not depend on pdata->connector, add support for
> attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

 This has been on my list of annoyances for quite some time now. Most
excellent to have it fixed, thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Tested together with patch #1.

Tested-by: Douglas Anderson <dianders@chromium.org>


Unless someone yells that there's a problem or someone beats me to it,
I'll plan to land in drm-misc-next sometime next week.

-Doug
