Return-Path: <linux-arm-msm+bounces-3061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD6801FD9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 829DD1C20821
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0EB224CE;
	Sat,  2 Dec 2023 23:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8RLhXdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFE2BD
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 15:59:50 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bc2e7f1e4so4628036e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 15:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701561588; x=1702166388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOFkH9JHKvDEOwXO8Ocnw7zlrT506EsHCCBwsXp0OUA=;
        b=b8RLhXdnXLKsgyVeOnIVpQkmMRtiULCPINh7vf/0xHMGOLZPYbpImBnw1w5cJQFJ4t
         eZGPhqwXmqOPv0F/mW7UsO26LmKzwQPsG3nN7qU6Rw+fc6Hl9sbmgbWEfBCZJM+KhdoI
         9B0x9UmhMyY0/z+dtUk4BwWOlvtQeoZir5ptq8vd/tzrXRDVawNlf0C6xWtNsw3A+rVe
         0xL4tdrXo9Xf0mYJrPRaFVT6al6qTvQFPOlkcA1hKUYFk2jl4x8iYZivE0QzsfFbmAA7
         3tbJWRMk+F+SNiIpXEoDPCFtWgGGSfcET1/kqEVnneLZxeDwaXpQnvDpjBPSqMugF4yd
         aEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701561588; x=1702166388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOFkH9JHKvDEOwXO8Ocnw7zlrT506EsHCCBwsXp0OUA=;
        b=SiU6rncy2YVqjFaPAiYlJquOZ15KT7+NDmyonHAyclHiVqx/Q2/KYki03QveE2jiOJ
         DhPVNZ++7SZgWXrxl1CTRj2VnFmsGdF1x7WPFUm7HyCBkF2PFVJhNPV1ywM/VFomY1/1
         hFSwxAB7eBv0DNS1oNE4RAsRrQOuOyi1tN1KinYo4gG5BIX9V0A7itIayARnumLsGoYF
         DZHjKzOfnZny+2TGa+stjo7OhC0cUSbf1kvTmIxV2kEdoFFL4hR1UTGz5qFELV/Jbntq
         /dQbN9e6J+PZhbIFvM95IXHV6PHmwbhcxJreKGJ1czArWHzGMWxmfoIdYkcazrdVpMtm
         5Zog==
X-Gm-Message-State: AOJu0YyokVtBnWhALcizcHGsar2MH9/VXy85uIiEXvxgFNASxNYopGxW
	RVSeJe3j93D7NeLCxP9mVk3Gzw==
X-Google-Smtp-Source: AGHT+IEeEMWVs+CZQO9ifZtjh6+pVAh4iCB3eYpmSmK31Hwe1eJd7iRyjyqS+VKEYez95taP/tgIDQ==
X-Received: by 2002:a19:6913:0:b0:50b:c138:f42a with SMTP id e19-20020a196913000000b0050bc138f42amr1683725lfc.68.1701561588469;
        Sat, 02 Dec 2023 15:59:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i21-20020ac25235000000b0050bf0f7f095sm72339lfl.99.2023.12.02.15.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 15:59:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v3] drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
Date: Sun,  3 Dec 2023 02:59:47 +0300
Message-Id: <20231202235947.1284568-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide actual documentation for the pclk and hdisplay calculations in
the case of DSC compression being used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2:
- Followed suggestion by Abhinav and Marijn to improve documentatry
  comments.

Changes since v1:
- Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
- Added a pointer from dsi_timing_setup() docs to
  dsi_adjust_pclk_for_compression() (Marijn)
- Fixed two typo (Marijn)

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 33 ++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e..d60ad796527c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -529,6 +529,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+/**
+ * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
+ * @mode: The selected mode for the DSI output
+ * @dsc: DRM DSC configuration for this DSI output
+ *
+ * Adjust the pclk rate by calculating a new hdisplay proportional to
+ * the compression ratio such that:
+ *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
+ *
+ * Porches do not need to be adjusted:
+ * - For VIDEO mode they are not compressed by DSC and are passed as is.
+ * - For CMD mode there are no actual porches. Instead these fields
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
@@ -951,8 +970,18 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
-		/* Divide the display by 3 but keep back/font porch and
-		 * pulse width same
+		/*
+		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
+		 * enabled, bus width is extended to 6 bytes.
+		 *
+		 * Calculate the number of pclks needed to transmit one line of
+		 * the compressed data.
+
+		 * The back/font porch and pulse width are kept intact. For
+		 * VIDEO mode they represent timing parameters rather than
+		 * actual data transfer, see the documentation for
+		 * dsi_adjust_pclk_for_compression(). For CMD mode they are
+		 * unused anyway.
 		 */
 		h_total -= hdisplay;
 		if (wide_bus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
-- 
2.39.2


