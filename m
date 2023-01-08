Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54FC36616E3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbjAHQ5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjAHQ5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:01 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546E925C7
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:56:59 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id cf42so9556322lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O+gZSEXgo3d9wOINWDK6xDs3+kicBr/DPouYqs1r8x0=;
        b=uYauKdgwq2husrEqlbthANQI+mK+yFDi8k3sa0byDLOOm+6NyM/tTVNf0gooCDRvHh
         TreprhmfQ6gm1B340FRGqx4ILphCrkz+5EeRV4ds91FpVi+31sN6Zi+COdCxf+U/6k5C
         2QUn6q5Y5+f7phN5GgGVAj2AHxJu/kepcl3lDu7/jmXMK20+vpUqaN6ITOz+vyA6f/xW
         GIAyIECVGh2FA6NqaiOB0I+NQSDktLdnks6obnsGLQLVx0QLkTv73+CNPnzmN+BNWlY4
         g7jBtiXgDA17+YtIntY+3KWaoT/MnV+T3nLGi7RzMCm0VOH3zLYyotu+qAST257Nobdv
         x7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+gZSEXgo3d9wOINWDK6xDs3+kicBr/DPouYqs1r8x0=;
        b=Wp9EWqDjy4WXP84uAdhDO21GQ1MyLnUQo37GzYAFkytSVLMxT/mxadQSwKN+96i+cF
         Cn5c7Vz8fX8m99iD7Uwom3E5TJvvOsISoD47VN6+HwjNiPlUMR9P8ioCiGXvOfNnEtWq
         JRbtlbLzypdTBxSTp2qwj9KJhbznk/z6bp8duoeglMFvCyyAd2IdlBr+YPISs9I7Utcn
         irjhrSzejfVc8yBXVM93gPmgnJ7nVq0QhNpM8/WYU2hBg/FdPVNiIEnPuIVAqlIEgpA3
         xhIjIj/EorO45//vvoxYr+mKnJtg3/S2MYNx00aLLYO2SpHR7fCOW2WaJIoFLbw8Wa3E
         iLdA==
X-Gm-Message-State: AFqh2koiM1BUvz3VZgGCeoEyz0Z+wwKuERF+Pwc+X7KmC/BspzILcV0o
        TezqgYuL8++zC9uwOvEIELCscQ==
X-Google-Smtp-Source: AMrXdXtmsgU+7bRE7IrRO3c8IZ4YXWbGiOa2nHIZQcjxsFyGPcOy9ExkJhV3ACmWtJvJnAMZ07mZQw==
X-Received: by 2002:ac2:5088:0:b0:4b5:688e:ee10 with SMTP id f8-20020ac25088000000b004b5688eee10mr18367932lfm.16.1673197017690;
        Sun, 08 Jan 2023 08:56:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:56:57 -0800 (PST)
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
Subject: [PATCH v2 00/13] drm/bridge: lt9611: several fixes and improvements
Date:   Sun,  8 Jan 2023 18:56:43 +0200
Message-Id: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
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

 drivers/gpu/drm/bridge/lontium-lt9611.c | 332 ++++++++++--------------
 1 file changed, 133 insertions(+), 199 deletions(-)

-- 
2.39.0

