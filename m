Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07A967CB098
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 18:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234442AbjJPQ4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 12:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbjJPQ4h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 12:56:37 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BE4111A
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:03 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40566f8a093so47088725e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697475242; x=1698080042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4YcpFsN2TSMs34leTZQIhhDmmY5p8SAeysdXXfcQJY=;
        b=bmNj056ztzl0VYdTedGhn+6dnUCqBbuUiOvKFOq+d9gOUdm9PHpQnVeCxaytmT7ikT
         11ovGxEs7LoB3ArYNAy/yknDRIfv4I2crA8NlufsOXryCciNlXDzKPmTueoKDPuN8B5+
         giMdp/Pd6JgKRqSUcZO0Weznbutm2KJIDm+/eGGwjANzDxCOZ7T7FacIGIsVzhDPQCkc
         FqnMLul7jH48ZUIxj7JAA1Wfef7LupIOsCcGXzxoYg4WPI8MOIVVTDhR6xq6DTLTWVY0
         qZvvvqcjM6bAA0/XJVaFZLa8d3W7HNJiFjfA5HWap90bn30pQaxVFM/0nJJYs4Y+AiGZ
         l6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475242; x=1698080042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4YcpFsN2TSMs34leTZQIhhDmmY5p8SAeysdXXfcQJY=;
        b=cKW/g2RCOI9Bhf3H8dLy6f+x+v5HlXYmADka1Kt5wkGD0DUqri2q6362omyMpmeiqH
         BWPFdpmMUEJppwB27ZrtvTppFJ3Aw5emh4G6ZPH9p/NgBQF9HwgYfRyBvbAiPVXE4tdP
         5eXlTrOU9F/QftJANxKYW7Vh/5dJmwPxAmrMPiO2w/zurlJ5YGLORZA5WbkzS40InY+i
         2IXUbfB60s9337swXewto3aho257k7Fgp7ifRuG5rn+5H++LSiOQBfckF0wvWNrZdWGC
         wybP1NcJrQYbMid3fZ9VAQGVpP1RTgC8sqUVYM5cbSz1H0zMAFDLT9ubqTOmcMnKmdYi
         78Iw==
X-Gm-Message-State: AOJu0Yw19sICQ8abpbUkudPAyo6KebJTrg8EfuWv71nApA9GXeHik563
        SxoJltXAwYYWUjzK4+jxUq5b0w==
X-Google-Smtp-Source: AGHT+IG9ptuOZK2qMMs221TBvhrKBhc0p1PMjKU8/S3TkYk4xU7qgakeBAb/XsiPpTTx7XzPxsCcZA==
X-Received: by 2002:a7b:c394:0:b0:403:31a:77b9 with SMTP id s20-20020a7bc394000000b00403031a77b9mr30584923wmj.37.1697475241822;
        Mon, 16 Oct 2023 09:54:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
        by smtp.gmail.com with ESMTPSA id s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:54:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 02/10] drm/mipi-dsi: document DSI hosts limitations
Date:   Mon, 16 Oct 2023 19:53:47 +0300
Message-ID: <20231016165355.1327217-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the known limititations of the DSI hosts vs commands transfers
in LP mode. For the details see sun6i_dsi_encoder_enable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c9df0407980c..167742e579e3 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -85,6 +85,10 @@ int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
  * host is in. Drivers that need the underlying device to be powered to
  * perform these operations will first need to make sure it's been
  * properly enabled.
+ *
+ * Note: some hosts (sunxi) can not send LP commands between HS video
+ * packets. Thus all DSI transfers sent in LP mode should be limited to the
+ * drm_bridge_funcs::pre_enable() and drm_panel_funcs::prepare() callbacks.
  */
 struct mipi_dsi_host_ops {
 	int (*attach)(struct mipi_dsi_host *host,
-- 
2.42.0

