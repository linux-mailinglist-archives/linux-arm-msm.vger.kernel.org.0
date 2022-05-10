Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 861235224C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 21:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiEJTaA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 15:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiEJT37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 15:29:59 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC90729741F
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:29:58 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id g184so12940910pgc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m2wbH10hLIaixT4gU4VcnqZ+N4u1LZ2SXLM2sDFPj5I=;
        b=csjpvF+tDG4L1MZ5teqJ4rm6FqoRpwUnKDW7N4J2SR1Z/jE7y5d+SavGXDDtg8GPDS
         bFhHSqTMXZVAjrp7ppBr+fGEa44adJ9NnoQFiex8tZS+oayc1/K6oNNDYroHeUpDAUeC
         SGRHtWQaQJ7JK4t0y/WGBIxvJYqV0v8K3f1tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m2wbH10hLIaixT4gU4VcnqZ+N4u1LZ2SXLM2sDFPj5I=;
        b=Pcx7B+XwNitI4vzYIN6uXjqXyoRpgnn4/IhZho9tK2KeX+ZMnS+gEUz8lf5QStwxfu
         db9xIt4CuyBLuPazHeJrxhj6qlN308hWrFtjwbelmt0Pm19EQ9dx7Vl2xjfTWO/KpOZ0
         TeKzRoBT5aMV1e6CCRHwbC84yGawVYyXab4cZBOr5YoMQaQPWjPrPhDDKwQN+bLplRs7
         2DFS4GSnuwYiBGXNoiJtXVxrBDPB8E9XvIdjpdppmkxLZ2gYX/HjnDvjosolx+ArHsSS
         MUgKM9M40uKHaV5U9FwANKNiobP9k612xddsqsoygA6G7y5aWY01XysXl6ggHB4dINAK
         rMEw==
X-Gm-Message-State: AOAM532F/EkZnUUgVd+XDRaGaI0m/Jhj85kXuvZWv3Ap2npqsmNvUjVn
        dqyTC5isqlqVhfZOC8BW9d8O4w==
X-Google-Smtp-Source: ABdhPJx1kjvHHwuQUwQAxV/SPI0cp2pBJRjMlaOwFgnpxf2uBmn2EuQKScO7rtAiarLlv5alh3XA1A==
X-Received: by 2002:a65:6c10:0:b0:380:437a:c154 with SMTP id y16-20020a656c10000000b00380437ac154mr17822001pgu.549.1652210997923;
        Tue, 10 May 2022 12:29:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6f08:624c:c762:d238])
        by smtp.gmail.com with ESMTPSA id s43-20020a056a001c6b00b0050dc762819dsm10786989pfw.119.2022.05.10.12.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 12:29:57 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] drm/dp: Make DP AUX bus usage easier; use it on ps8640
Date:   Tue, 10 May 2022 12:29:40 -0700
Message-Id: <20220510192944.2408515-1-dianders@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch is v3 of the first 2 patches from my RFC series ("drm/dp: Improvements
for DP AUX channel") [1]. I've broken the series in two so we can make
progress on the two halves separately.

v2 of this series tries to incorporate all the feedback from v1. Hopefully
things are less confusing and simpler this time around. The one thing that got
slightly more confusing is that the done_probing() callback can't return
-EPROBE_DEFER in most cases so we have to adjust drivers a little more.

v3 takes Dmitry's advice on v2. This now introduces
devm_drm_bridge_add() (in an extra patch), splits some fixups into
their own patch, uses a new name for functions, and requires an
explicit call to done_probing if you have no children.

The idea for this series came up during the review process of
Sankeerth's series trying to add eDP for Qualcomm SoCs [2].

This _doesn't_ attempt to fix the Analogix driver. If this works out,
ideally someone can post a patch up to do that.

NOTE: I don't have any ps8640 devices that _don't_ use the aux panel
underneath them, so I'm relying on code inspection to make sure I
didn't break those. If someone sees that I did something wrong for
that case then please yell!

[1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
[2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/

Changes in v3:
- Adapt to v3 changes in aux bus.
- Don't call done_probing() if there are no children; return -ENODEV.
- Patch ("drm/bridge: Add devm_drm_bridge_add()") new for v3.
- Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
- Split out EXPORT_SYMBOL and kerneldoc fixes to its own patch.
- Use devm_drm_bridge_add() to simplify.
- Used Dmitry's proposed name: of_dp_aux_populate_bus()

Changes in v2:
- Change to assume exactly one device.
- Have a probe callback instead of an extra sub device.
- Rewrote atop new method introduced by patch #1.

Douglas Anderson (4):
  drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
  drm/dp: Add callbacks to make using DP AUX bus properly easier
  drm/bridge: Add devm_drm_bridge_add()
  drm/bridge: parade-ps8640: Handle DP AUX more properly

 drivers/gpu/drm/bridge/parade-ps8640.c   |  74 +++++---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 211 +++++++++++++++--------
 drivers/gpu/drm/drm_bridge.c             |  23 +++
 include/drm/display/drm_dp_aux_bus.h     |  34 +++-
 include/drm/drm_bridge.h                 |   1 +
 5 files changed, 238 insertions(+), 105 deletions(-)

-- 
2.36.0.550.gb090851708-goog

