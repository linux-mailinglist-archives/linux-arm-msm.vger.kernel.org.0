Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1420732C5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 11:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjFPJnT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 05:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344124AbjFPJmr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 05:42:47 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA933ABA
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 02:42:18 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b4274f7640so21170581fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686908516; x=1689500516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOdAkBA8FOVnbZoSsi+PF1F3scMmt2Df8O/OAnmM4VU=;
        b=UI/zlnBm/dscnXLIZ+pOpEko9tSEf14nSYHZg+p470KerrBvtZ+uPX1PW9TsMOEZ+E
         K2TDU0duDskkspbS2cSvcjoMgPsVXacVzZMSPoZwNwlLnW/xMkkcl+nSXcLqCnpkndH0
         f9CbEX/ZxmR+tei1rTUZK/XwkCoMqgB3sNpKYHdKMaOnruCPCsrxqQU9THnMc01DuEAr
         uPo2u8O9zOhJUtyANL4fxtLy2ggzTUKUAKxiEaR7zd470TDsAK4/4srybLAFLy+8jgQN
         XAiZ6Nx/Vl9ZQHnXDKJoGBra4/evWgW48DmLBwnNyHONT1FzA2/oxkR5ztlQV4paxDl3
         CO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686908516; x=1689500516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOdAkBA8FOVnbZoSsi+PF1F3scMmt2Df8O/OAnmM4VU=;
        b=SHzcAIAUSdlu89FoVCEwIirfk2FKE20/Y0FmWpyW3S36WkvCc3emsRlfT4OYxH5tvi
         yJO9HU9I9uFuHLCUbr/iikupoN/OxTsyuOu8i6Ag/A3ClR9zgmahYiMuR+MSQ8UcL+IY
         G2eBQDfDYtpup5FuulL9kzDAk6cXC9Xb+XtSxFAi5IyRj3J8kTbc6dM3HuJdKefr5+G/
         eSEvFXWC09z0CBvms5aVXcWxc/Sa3DU7STjEtbLePZO0xAHcxapvWPpGvqCIGjkFQ8gt
         7qJL6RJwvZITj4CiB2+9F6qmTZw6e4IF20WisWtbnQwIkBUmeW8t3BgdRRrOl1ansueZ
         aa0g==
X-Gm-Message-State: AC+VfDxyt27YmO0oUtSUUlQ8Ff4bbSzd2/cJKhYVFS6CdqgO7E/+UdMW
        meLQmswzWqBajBwd70zneQwAhZf6ANXcbhRdVp0=
X-Google-Smtp-Source: ACHHUZ47GquGnTYuMlPm2AJHqLpY6Q+MU1t9IezNRjf3b38AdAZhLfoHzbT48HcYyKs7T25DBmNqgQ==
X-Received: by 2002:a2e:9f55:0:b0:2b1:f90b:f51a with SMTP id v21-20020a2e9f55000000b002b1f90bf51amr443499ljk.5.1686908515946;
        Fri, 16 Jun 2023 02:41:55 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id e8-20020a2e9e08000000b00295a96a0f6csm3441184ljk.102.2023.06.16.02.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 02:41:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
Date:   Fri, 16 Jun 2023 12:41:52 +0300
Message-Id: <20230616094152.495723-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Provide actual documentation for the pclk and hdisplay calculations in
the case of DSC compression being used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 3f6dfb4f9d5a..72c377c9c7be 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -528,6 +528,21 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+/*
+ * Adjust the pclk rate by calculating a new hdisplay proportional to
+ * the compression ratio such that:
+ *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
+ *
+ * Porches do not need to be adjusted:
+ * - For the VIDEO mode they are not compressed by DSC and are passed as is.
+ * - For the CMD mode the are no actual porches. Instead they represent the
+ *   overhead to the image data transfer. As such, they are calculated for the
+ *   final mode parameters (after the compression) and are not to be adjusted
+ *   too.
+ *
+ *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
+ *  refresh rate and data overhead as a starting point of the calculations.
+ */
 static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
 		const struct drm_dsc_config *dsc)
 {
@@ -926,8 +941,24 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
-		/* Divide the display by 3 but keep back/font porch and
-		 * pulse width same
+		/*
+		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is
+		 * not used, a single pixel is transferred at each pulse, no
+		 * matter what bpp or pixel format is used. In case of DSC
+		 * compression this results (due to data alignment
+		 * requirements) in a transfer of 3 compressed pixel per pclk
+		 * cycle.
+		 *
+		 * If widebus is enabled, bus width is extended to 6 bytes.
+		 * This way the DPU can transfer 6 compressed pixels with bpp
+		 * less or equal to 8 or 3 compressed pyxels in case bpp is
+		 * greater than 8.
+		 *
+		 * The back/font porch and pulse width are kept intact.  They
+		 * represent timing parameters rather than actual data
+		 * transfer.
+		 *
+		 * XXX: widebus is not supported by the driver (yet).
 		 */
 		h_total -= hdisplay;
 		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
-- 
2.39.2

