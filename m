Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFEA755C789
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235032AbiF0QyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 12:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235363AbiF0QyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 12:54:18 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146C2186F2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 09:54:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g4so17645513lfv.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sb3k59JCSBUMXZbamAYmyTO7aoqJwmjb8uQud/mKblY=;
        b=vFZU0OFvS1K2DlH9hzvum8NS33IxACslnIwDv4kzg3Dex+y/9iHXmAv3kUxDwx3ZJY
         OKtnxH2Ry4MT5cjEM2zRQscxEBOkFedcQw1/hSoiHkZmruAYArgvPy/JdQHzspXvuqI1
         TpFzhCodzeXAmlGbnl4QN9QmI/jz9umenHbwmP77k6+I4z44tSAseM3xgMBOxPpvuojL
         Z+k7v8fV8QyfL9BCFq/k57iivg/iwdtpD48w2Hblyg17mZnqipvJjv7Ickr+1j3jZku0
         QAktubsyPsABRm3zD9cWp1OnujLUJbqDVHQKRfvX2u9HN6Swg8onIslrd6fnKLO0lRW3
         SK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sb3k59JCSBUMXZbamAYmyTO7aoqJwmjb8uQud/mKblY=;
        b=NgzR+t80O56oTpkIcgCWDh0iaIlQ6ShZ0PQLXQu8LdBOto94Mty7c2T8LIBadvaIIb
         nTxXkWTPjZdrzD7m98ESE98a3yJ6NQWZkCRyMCQxA9VYDhkpiWAw+xslGNJN/4eQpY6p
         NLRv0zniLA6AUrKqW/41E23Za9N0dALmySe98daF9qJsgjhDahBWOQrJ1bbhEXCbtoL8
         Wblfkg6hMyo25Wydx19UTmi39jr/W+b4sHd352ksruc4DXNb33tr5yBUC+rxyLMZQ+Bs
         clhCVO4tqRpc0DcR7ARfhYBsFCdFT3cXtM1U5KsrGz2/EKci7uTodbJLXyO/rIvNwHZR
         8ShQ==
X-Gm-Message-State: AJIora9vLEGzQ5btR1E5tb4dapLUH0jXZuoPxp8DVstkyToobXkunlHF
        6V3juWX6fAHkzq7ErkbflOie1u1gxBVPLusm
X-Google-Smtp-Source: AGRyM1uY95jAClQqcZtuObNVNt0GA8FWexab+pJ671Nf0ttJH9A/w1qHC47bDIk+4eGfxO+eIGemHQ==
X-Received: by 2002:a19:8c04:0:b0:47f:65b7:bf11 with SMTP id o4-20020a198c04000000b0047f65b7bf11mr9100950lfd.630.1656348854388;
        Mon, 27 Jun 2022 09:54:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e18-20020ac25472000000b0047fa941066bsm1867451lfn.96.2022.06.27.09.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 09:54:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
Date:   Mon, 27 Jun 2022 19:54:13 +0300
Message-Id: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If for some reason the msm_dp_config::descs array starts from non-zero
index or contains the hole, setting the msm_dp_config::num_descs might
be not that obvious and error-prone. Use ARRAY_SIZE to set this field
rather than encoding the value manually.

Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f87fa3ba1e25..6fed738a9467 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -131,35 +131,43 @@ struct msm_dp_config {
 	size_t num_descs;
 };
 
+static const struct msm_dp_desc sc7180_dp_descs[] = {
+	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+};
+
 static const struct msm_dp_config sc7180_dp_cfg = {
-	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-	},
-	.num_descs = 1,
+	.descs = sc7180_dp_descs,
+	.num_descs = ARRAY_SIZE(sc7180_dp_descs),
+};
+
+static const struct msm_dp_desc sc7280_dp_descs[] = {
+	[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
 };
 
 static const struct msm_dp_config sc7280_dp_cfg = {
-	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-	},
-	.num_descs = 2,
+	.descs = sc7280_dp_descs,
+	.num_descs = ARRAY_SIZE(sc7280_dp_descs),
+};
+
+static const struct msm_dp_desc sc8180x_dp_descs[] = {
+	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
 };
 
 static const struct msm_dp_config sc8180x_dp_cfg = {
-	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
-	},
-	.num_descs = 3,
+	.descs = sc8180x_dp_descs,
+	.num_descs = ARRAY_SIZE(sc8180x_dp_descs),
+};
+
+static const struct msm_dp_desc sm8350_dp_descs[] = {
+	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
 };
 
 static const struct msm_dp_config sm8350_dp_cfg = {
-	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-	},
-	.num_descs = 1,
+	.descs = sm8350_dp_descs,
+	.num_descs = ARRAY_SIZE(sm8350_dp_descs),
 };
 
 static const struct of_device_id dp_dt_match[] = {
-- 
2.35.1

