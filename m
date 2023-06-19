Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0C52735ECE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 23:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjFSVGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 17:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFSVGv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 17:06:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C7AC4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:06:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f871c93a5fso1926046e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687208808; x=1689800808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkVUeJo8DF/DMTbUaoGZepsmdm4n19YNQ9t4FuVsxcw=;
        b=zOaAVIgkuq0/6D3JXP7gEsmI63RvuSrt/zepsT3o68GPDhzIG1McOEShS0fLGNLzTt
         6pZF9l+KkRtwOxH42j1TSZEgsF+5sciGwhYhmRK7Jm1fAXXHZj6S5XEuGOAGh7p0xOln
         sIIDrj9Che3BwomoRiK+nQhUdrfdobPT/tLn1N0/m/vugdqU/YKORnwRVTijpHCzemyq
         h1gWMVxJL2Oi2eBLvU4iE0bpZL25vYU5DHSaGBULk0D/EinUvlzgcASUJ0GzpvxIQOuG
         /I0vEvfVaEz0BAQbTElPghEDGicin3j+E6loy1a6YQsKxvhl3eNBhNY1qFp4m9BdahTg
         Mdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687208808; x=1689800808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkVUeJo8DF/DMTbUaoGZepsmdm4n19YNQ9t4FuVsxcw=;
        b=IDQwXuVDo1WU7ascKUF58ybWefrnMiuCXNh7MpAq67dUl2vRktxKHZRqXFzkI+epLF
         Ek3eAQFO3gtIntMFV0Eit49bKdlfEeI5g3U1t1SiWrKpc+gE8wkgKubBq4j17bH5D3Yh
         HupwN49kowO6Mtlm8c80CJbLfTuzRs3enjjfg2hm/VAH8DkkcRL3asYDNWtBVO9k/4ok
         Xf+W60OVpmNXiklkbquc18zMiadnOf1PA/Ts6AIJyHizXYMn2QPLZubuC5uC7oKgU4XT
         HMQOzlCjeanYi4CM8gYqz/8LzHHQrMeJrz8UD8kodYPp646VaS0d6d4rfBq3LaaMO5/b
         uBwg==
X-Gm-Message-State: AC+VfDyYwXFFdQkRXPY6kOBWTm/9rh9jTgj/obYEB2+ahIrOkHopPImz
        pcjhj2A7w2JTXzBOldHJQe372Q==
X-Google-Smtp-Source: ACHHUZ4SmBnw+CU2EjLU4rEOSyCgwOagG4ydP5o2/Vnk9RVFV6Xhu/FQbT00rWxCSDdG797Z0/T0FA==
X-Received: by 2002:a19:4f43:0:b0:4f8:6aa4:17ec with SMTP id a3-20020a194f43000000b004f86aa417ecmr2824624lfk.43.1687208808238;
        Mon, 19 Jun 2023 14:06:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d17-20020ac25ed1000000b004f86c6573ebsm76072lfq.168.2023.06.19.14.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 14:06:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
Date:   Tue, 20 Jun 2023 00:06:47 +0300
Message-Id: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Provide actual documentation for the pclk and hdisplay calculations in
the case of DSC compression being used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
- Added a pointer from dsi_timing_setup() docs to
  dsi_adjust_pclk_for_compression() (Marijn)
- Fixed two typo (Marijn)

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 3f6dfb4f9d5a..a8a31c3dd168 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+/**
+ * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
+ * @mode: the selected mode for the DSI output
+ * @dsc: DRM DSC configuration for this DSI output
+ *
+ * Adjust the pclk rate by calculating a new hdisplay proportional to
+ * the compression ratio such that:
+ *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
+ *
+ * Porches do not need to be adjusted:
+ * - For the VIDEO mode they are not compressed by DSC and are passed as is.
+ * - For the CMD mode there are no actual porches. Instead these fields
+ *   currently represent the overhead to the image data transfer. As such, they
+ *   are calculated for the final mode parameters (after the compression) and
+ *   are not to be adjusted too.
+ *
+ *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
+ *  refresh rate and data overhead as a starting point of the calculations.
+ */
 static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
 		const struct drm_dsc_config *dsc)
 {
@@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
+		 * less or equal to 8 or 3 compressed pixels in case bpp is
+		 * greater than 8.
+		 *
+		 * The back/font porch and pulse width are kept intact.  They
+		 * represent timing parameters rather than actual data
+		 * transfer. See the documentation of
+		 * dsi_adjust_pclk_for_compression().
+		 *
+		 * XXX: widebus is not supported by the driver (yet).
 		 */
 		h_total -= hdisplay;
 		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
-- 
2.39.2

