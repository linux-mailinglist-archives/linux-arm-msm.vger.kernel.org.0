Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4936716CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjARJAb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjARI6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:58:45 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0875594
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:01 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ss4so73993255ejb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMFaJxYFrlXy63MEZ5DsEVe05+seYph43YbtRI0Er4w=;
        b=SmFOaIy/EpLz5Po+uXnkgrdziaaCZxSYa5aJg1Rfopp3v1+LSgRp9UP9FfnC1dQ4pi
         NNoHMnIKwpHOt19zxn6hTz85BGJ5IKrUp7yaccDpkj5SzAYgszjnaEh15m8G2xijVKkI
         tRidxBzlG8FHeIARu+G/H+3dK2sS3WrHa+HCgm5NdHA3jvRtDiextR1a7pNHwOM2Gcpu
         eXDit7z6f5VGkqL1snX/KGALxWwYyQIJlI+pw5Eg9ld2w8fwHhhHSO7VdJjBl1n+xP2p
         W4btXefY5G2ZBXOWtKxnerjDWopVerd71CrCtkC/LjQAE6VdEW176hqoVywaV60/klZb
         l55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMFaJxYFrlXy63MEZ5DsEVe05+seYph43YbtRI0Er4w=;
        b=5OqUCiQ13svHi9k76PTyxekPf2S+sKaZmr8sDg3cXyJ4+9ANPcfdpkJ83juYfJA+AF
         oRbE8+FjZkwaPRGUokXqwopbk0bTJ5TrSR9h/GJiUKxX9oXHEYbjYhuohM6D0EeVRN+z
         8OEMPkKsY/Xr74xi0GTb2ZIxW8e9Ct5ajUH7pvpO9qgzyVbsYgx6Es/Hzx88bfCrI+sq
         6v7l3kN+EJMm5NNKu+qnDRYMPCFJJnvyAs3o5ryL9zPhD0tL/omdp76Zc1bzA6B3xz91
         nky9/EsDjYCfr77uES20auljk/O46hqp3DxtrOAYavowu7j6OfotxebuScuRyT3znA3w
         5wRA==
X-Gm-Message-State: AFqh2krrrKASs4Y7MAypgexRAQRnUD/u0YBnO3s8oGz7VvtJgxSm55Kj
        s6HGIu5w9Rbcw3JpLfbaXXdguQ==
X-Google-Smtp-Source: AMrXdXtuOSpDdMnApkPXT0SbSO1kQRU8kHKvM5oSqybXqyROEZhIyMZldgDeDRs7kZZCyr7dX965+g==
X-Received: by 2002:a17:906:3b01:b0:84d:4767:734 with SMTP id g1-20020a1709063b0100b0084d47670734mr19766732ejf.6.1674029820369;
        Wed, 18 Jan 2023 00:17:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:16:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 00/13] drm/bridge: lt9611: several fixes and improvements
Date:   Wed, 18 Jan 2023 10:16:45 +0200
Message-Id: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A series of patches to fix mode programming for the Lontium lt9611
DSI-to-HDMI bridge (found e.g. on the Thundercomm RB3/Dragonboard845c
platform).

Changes since v2:
 - Rewrote mode_valid callback to be more explicit.

Changes since v1:
 - Fixed the double-DSI check to look for the lt9611->dsi1_node rather
   than lt9611->dsi1, modesetting happens before lt9611->dsi1 is set.

 - Added full dual-DSI support, properly enabling the 4k modes on RB3.

Dmitry Baryshkov (13):
  drm/bridge: lt9611: fix sleep mode setup
  drm/bridge: lt9611: fix HPD reenablement
  drm/bridge: lt9611: fix polarity programming
  drm/bridge: lt9611: fix programming of video modes
  drm/bridge: lt9611: fix clock calculation
  drm/bridge: lt9611: pass a pointer to the of node
  drm/bridge: lt9611: rework the mode_set function
  drm/bridge: lt9611: attach to the next bridge
  drm/bridge: lt9611: fix sync polarity for DVI output
  drm/bridge: lt9611: simplify video timings programming
  drm/bridge: lt9611: rework infoframes handling
  drm/bridge: lt9611: stop filtering modes via the table
  drm/bridge: lt9611: properly program the dual host mode

 drivers/gpu/drm/bridge/lontium-lt9611.c | 340 ++++++++++--------------
 1 file changed, 141 insertions(+), 199 deletions(-)

-- 
2.39.0

