Return-Path: <linux-arm-msm+bounces-56286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33805AA4CE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB28A1891979
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284C427A474;
	Wed, 30 Apr 2025 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RervcQFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C8827A446
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018115; cv=none; b=Oxmi6n2FD/0PO4qdlIZ7RvzAGXSUA80nzCMVKNQigMmHH2E6KZ3rDOrJuF0NQNXeBZcZ5vdkAgGZ+yePMsjXJcRQwJwa461CQ8V2eSvvNplafqdCAGP0k/tOBf0N9jYJXfmGYil1gyGiOxs9ORQA1SbvB79iIqSBBTcHFGYvDOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018115; c=relaxed/simple;
	bh=LWKvFKR9QlB4OTW+91EARrqtQWYR6dhCSgt/uY9otco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KezcK3MKtlilGJWUvWxVLmLMl9VUyllyR9qtRN87JTbpUlIVO0VlkemMS9wAO45jB/KpH+a7btF6LqtJlg974bU/4k7ozqPJHqRMk1t/D3DzszlfSeDMNSwjBJJY+iVntGmEoOBQUU7PPEgx3yqnQ4bcowzexeGbvzq/RYmz48o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RervcQFC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee6260fc7so451050f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018110; x=1746622910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//xy9QvnyX1PGlT+X1puTcYwWLZzXpvuw0D5LtNENts=;
        b=RervcQFCQYRgKSbZe9tnMkvzW9fX3RNWtArc4hUxuQuMo2cdiDHJJebVhgR/cAsuHk
         ndALg3kUWBLAru2znul3AqsTTO489VrcZi39mly0akxUxi0Clhvi931WG2mGPiGDu/hz
         ax71geoRaDWHK/w4QhQq/rjThrz95KTkdnPAiHNdY8hhyYIhuEOdCiqjEz0pbKq6ZeTf
         f2HagGIQCjsgsQwdt0uUPKyZHo17r+cFKqTyLCsutNa4nSejawIw8BzJ9XXglFZ87M7F
         eQJEk0tSfjgOs3EePRDFPkTtIszfiA4dMcF1BWSIJm7OBDcOQqLS3t6tE4dKe8I10ZmS
         gL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018110; x=1746622910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//xy9QvnyX1PGlT+X1puTcYwWLZzXpvuw0D5LtNENts=;
        b=IyK/j4LWvkwFFwiioRyjZYugsMp+qLHk8QDXm0tMVAtl1Yn6Zkcm9XLqDTeZqu+XHs
         WwkGpODpR1v6BATPePqx2z9M7Vid0MDWi9X4OjjR2xBgRiqrhNt44OJJzVLgkOCbJ67i
         vtSlGyw3cuJt8myMHlvXLzJlwhDgHbIv94jpOzK1vtp/PBuNMuba/P06IfPh12Yg858J
         /Q9uyzq1pMRYJBZrM1F6M7yOUoan+G3f4FcREFbe9bqSOgTCqa2KUA978b7t3AGWpooD
         8fqFNqEYpCI3hZNElPT+bvt397v115MlD2LGXD8hZcjW2xXVjpw4ZeayWeoVdTFkQReI
         IdYQ==
X-Gm-Message-State: AOJu0YwOeRm3k9dcc9rPKJJjgNnreovhXqXwxyECCR4SOnzjoTwOMkFb
	1gLS6WDW93/rpABlTeRjPy8e67z24g61punQTy05mq9SeBCOl2GuPkvL9XFZC1Q=
X-Gm-Gg: ASbGncvC5hTEx7+h4n1ceLxPZAeawwSHBw142j3Re+P8bZvAgs4uscK8zlMg0m21OTn
	Cks/NL702QoxyRzIyZPzkG1fQst8YUU3ApHaR2QmldupF6rQffwsm92Z1QjPqXVCfP5BsLouhVN
	oOuBrdh+/f+JQ2Jl4FHqiZAYUsoIWLhOpGavA2I5oJEGeeCQ2c6yJhuUKzMHhCdo6mnbkB157JQ
	S0pWHs1v0JUSzXq160puE6BFg8wEdqFXsCZ3dkS0T9fRdMDMnQp65FRR23YTvrpx14zrhi/PLFt
	LqN6w14AL5GXmSPPFTwJGYt3hnq5amTY3Soe+bIXe61+HC7TYFIAewzCGn4=
X-Google-Smtp-Source: AGHT+IH8+72FvP1/XPS4IvjSawq2CiOZfJ5maP6pKNlkLjVD403H+B6cWb7fwPAzTvHtCjOIQ+FPkA==
X-Received: by 2002:a5d:64e2:0:b0:3a0:7e4a:f13a with SMTP id ffacd0b85a97d-3a091b56802mr123221f8f.6.1746018109373;
        Wed, 30 Apr 2025 06:01:49 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:49 +0200
Subject: [PATCH v5 19/24] drm/msm/dsi: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7864;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LWKvFKR9QlB4OTW+91EARrqtQWYR6dhCSgt/uY9otco=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8JqjCa0FC+DMNBUp4CJXo2eN0CyVUqdUjT/
 n5cLnaSGTGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfCQAKCRDBN2bmhouD
 18e2D/9QFJpWj/iQGjt7z2MYXmLMZmy2GW93XQ04QuxBKRZWuuI2zOuFNXChRCZmDayusFyQl6b
 F6OAanEoie6Id4cuxb7D5JGCC4qVpwZn+FfY71BYOuYPwHKRQt0YcK8HJrqHy075JVjaZ4BvIg1
 5kLBAcjHZeCObu/2/zVPZMLqKU5jhzjooNMG993IsMjWd80anBZux6wtLlGyztSLjN2ZdnPSv+j
 2UMcgwaCzkpcOpQAASar3o/wUTpB76/G9Lhn9TOBq6vF51znTUbRtQH3xL7b0qWBo2ljGFzklta
 yKhbk/JsqNr9XDYAL3tQ7tnm8JlT6kAMrfK15rH2meBWwR4dK5Z2CWaj8JOaqboopdtFAFYZr6D
 eKAh3jVWRS63XyN5kDzpS2nbUVqeGym8wQ1YsNKNPe7tnjv8KQqSHoo/8F6hAHQ5Aznr6q0gYWR
 p6Au4bHfyOfQytIgARC3FUvhHarbnCbO+qygIzETb455eUDJhVpPEGoHdgK1ze/zKg/94qb3StI
 nLZ/vPqL99UMhgN6FENnV0U+9G49Vqzo+HAytsf37dQafQ0aTCXbrMMYuGHSA0oCdswDrscSN1y
 GBktGdpj+P5ariBvxGOZBjBj+ZHEe0A3hdUZAsJTgrINMT8GG1XuQspBgm3BzwE2Kkq9fZPeKfs
 RGZPmiwQw9zJQ9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for DSI on Qualcomm SM8750 SoC with notable difference:

DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
parents before DSI PHY is configured, the PLLs are prepared and their
initial rate is set.  Therefore assigned-clock-parents are not working
here and driver is responsible for reparenting clocks with proper
procedure: see dsi_clk_init_6g_v2_9().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v5:
1. Only reparent byte and pixel clocks while PLLs is prepared. Setting
   rate works fine with earlier DISP CC patch for enabling their parents
   during rate change.

Changes in v3:
1. Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.

SM8750 DSI PHY also needs Dmitry's patch:
https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
(or some other way of correct early setting of the DSI PHY PLL rate)
---
 drivers/gpu/drm/msm/dsi/dsi.h      |  2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 14 +++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 81 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 87496db203d6c7582eadcb74e94eb56a219df292..93c028a122f3a59b1632da76472e0a3e781c6ae8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -98,6 +98,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi);
 int msm_dsi_runtime_suspend(struct device *dev);
 int msm_dsi_runtime_resume(struct device *dev);
 int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
+int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host);
 int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
@@ -115,6 +116,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
+int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..7f8a8de0897a579a525b466fd01bbcd95454c614 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -257,6 +257,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
 	.calc_clk_rate = dsi_calc_clk_rate_6g,
 };
 
+static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
+	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
+	.link_clk_enable = dsi_link_clk_enable_6g,
+	.link_clk_disable = dsi_link_clk_disable_6g,
+	.clk_init_ver = dsi_clk_init_6g_v2_9,
+	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
+	.tx_buf_get = dsi_tx_buf_get_6g,
+	.tx_buf_put = dsi_tx_buf_put_6g,
+	.dma_base_get = dsi_dma_base_get_6g,
+	.calc_clk_rate = dsi_calc_clk_rate_6g,
+};
+
 static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
 		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
@@ -300,6 +312,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
+		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -30,6 +30,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
+#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4d75529c0e858160761f5eb55db65e5d7565c27b..694ed95897d49c477726a2b0bec1099e75a3ce21 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -119,6 +119,15 @@ struct msm_dsi_host {
 	struct clk *pixel_clk;
 	struct clk *byte_intf_clk;
 
+	/*
+	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
+	 * PLL:
+	 */
+	struct clk *byte_src_clk;
+	struct clk *pixel_src_clk;
+	struct clk *dsi_pll_byte_clk;
+	struct clk *dsi_pll_pixel_clk;
+
 	unsigned long byte_clk_rate;
 	unsigned long byte_intf_clk_rate;
 	unsigned long pixel_clk_rate;
@@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
 	return ret;
 }
 
+int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	int ret;
+
+	ret = dsi_clk_init_6g_v2(msm_host);
+	if (ret)
+		return ret;
+
+	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
+	if (IS_ERR(msm_host->byte_src_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
+				     "can't get byte_src clock\n");
+
+	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
+	if (IS_ERR(msm_host->dsi_pll_byte_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
+				     "can't get dsi_pll_byte clock\n");
+
+	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
+	if (IS_ERR(msm_host->pixel_src_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
+				     "can't get pixel_src clock\n");
+
+	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
+	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
+				     "can't get dsi_pll_pixel clock\n");
+
+	return 0;
+}
+
 static int dsi_clk_init(struct msm_dsi_host *msm_host)
 {
 	struct platform_device *pdev = msm_host->pdev;
@@ -370,6 +411,46 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	return 0;
 }
 
+int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	int ret;
+
+	/*
+	 * DSI PHY PLLs have to be enabled to allow reparenting to them and
+	 * setting the rates of pixel/byte clocks.
+	 */
+	ret = clk_prepare_enable(msm_host->dsi_pll_byte_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(msm_host->dsi_pll_pixel_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
+		goto out_disable_byte_clk;
+	}
+
+	ret = clk_set_parent(msm_host->byte_src_clk, msm_host->dsi_pll_byte_clk);
+	if (ret)
+		dev_err(dev, "Failed to parent byte_src -> dsi_pll_byte: %d\n", ret);
+
+	ret = clk_set_parent(msm_host->pixel_src_clk, msm_host->dsi_pll_pixel_clk);
+	if (ret)
+		dev_err(dev, "Failed to parent pixel_src -> dsi_pll_pixel: %d\n", ret);
+
+	clk_disable_unprepare(msm_host->dsi_pll_pixel_clk);
+	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
+
+	return dsi_link_clk_set_rate_6g(msm_host);
+
+out_disable_byte_clk:
+	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
+
+	return ret;
+}
+
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 {
 	int ret;

-- 
2.45.2


