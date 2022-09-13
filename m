Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7DDC5B6D76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 14:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbiIMMn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 08:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiIMMn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 08:43:27 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C1652818
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 05:43:23 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 29so17403305edv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 05:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sbb0BJfxSJ0bvHV5wkGwxNNxQE++mNh72PtFxZYdbyw=;
        b=fKbUU7RNxlQl+VA9rK9x6fuo4I5OHpjbBX6iooSmH8j2dhxcAOmNSE8zqOmavODS+m
         LuxcXt3P9JkKEwEVC1MiOt78KIlqAKdBtMugt8WZ8+Zhu/nr/u+MJoeUAV0iQdju4EET
         zR91JVo8I8Tz+zapJ5jTBrH5mexNnTqVyfEsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sbb0BJfxSJ0bvHV5wkGwxNNxQE++mNh72PtFxZYdbyw=;
        b=ECofKk2RlV3CTunYuO/IHUIlIn3FBA7ZUGORHPSjBqyXt5ehpyeoMylb7IiEgZRcIk
         DFRPUEOiDX/WpS/QMNp/zmONO5IrTFb27rY4bZbTmZEkNqArbg/cBxmfXEbYOiQCpflM
         XgwBBlFGwYAQmEh5lL0g+sDtbXiqEe40/98xwh+3SI7EnU5kkFje9TPKCdlIkdFFkWq/
         mLowxFFXlIgx5yGkGX9Uiz+NTiusJiBNWCDu8JJHUHzbp1Ht1zdcDYDayTSxno8YfgnJ
         k3x0HNGCVVFlFSUw64xUHg2vt0LGHZxOFyBctMTvO9mrwcdMqB0etxfNVqo5Rf5f3Igj
         uKZw==
X-Gm-Message-State: ACgBeo2ov1vXipjdcHg0jptt24DdYoEFJxqP3GUgbowsTFUbfwfG1/px
        49mZDnbvr8NnixBioni/ugZ7OxEKFYVDvIwJ8o0=
X-Google-Smtp-Source: AA6agR441yFKOW5OkjWnpB6TGyijlAxPsxhsmdTSQpIQx8XU9BvtVOykYedQPuivh/LIJLiyEWyoRg==
X-Received: by 2002:a05:6402:2937:b0:44e:b578:6fdd with SMTP id ee55-20020a056402293700b0044eb5786fddmr25690047edb.159.1663073002225;
        Tue, 13 Sep 2022 05:43:22 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id t11-20020aa7d4cb000000b0044e8774914esm7949244edr.35.2022.09.13.05.43.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 05:43:22 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id r66-20020a1c4445000000b003b494ffc00bso816335wma.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 05:43:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr2359963wmq.85.1663072581167; Tue, 13
 Sep 2022 05:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220913085320.8577-1-johan+linaro@kernel.org> <20220913085320.8577-7-johan+linaro@kernel.org>
In-Reply-To: <20220913085320.8577-7-johan+linaro@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Sep 2022 13:36:09 +0100
X-Gmail-Original-Message-ID: <CAD=FV=XXCOgRwdsHxnH5DhoNb5QAT6n9m8iUNOQ5at4YAKd-cw@mail.gmail.com>
Message-ID: <CAD=FV=XXCOgRwdsHxnH5DhoNb5QAT6n9m8iUNOQ5at4YAKd-cw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] drm/msm/dp: fix aux-bus EP lifetime
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "# 4.0+" <stable@vger.kernel.org>
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

On Tue, Sep 13, 2022 at 9:58 AM Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Device-managed resources allocated post component bind must be tied to
> the lifetime of the aggregate DRM device or they will not necessarily be
> released when binding of the aggregate device is deferred.
>
> This can lead resource leaks or failure to bind the aggregate device
> when binding is later retried and a second attempt to allocate the
> resources is made.
>
> For the DP aux-bus, an attempt to populate the bus a second time will
> simply fail ("DP AUX EP device already populated").
>
> Fix this by tying the lifetime of the EP device to the DRM device rather
> than DP controller platform device.
>
> Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
> Cc: stable@vger.kernel.org      # 5.19
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

This seems fine to me as a short term fix until we get the DP AUX
populating moved to probe.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
