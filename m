Return-Path: <linux-arm-msm+bounces-43975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D84A02114
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECD1E1883CCF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DC91D90C5;
	Mon,  6 Jan 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBDWUndT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5571D8A08
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 08:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153361; cv=none; b=Fi1qvzp2aVIFnTEKJp11wShAUoKHGCjNFK9W/giiz0q1zrajxuS2kWejNvV7WoWwBTDpkv0lBSb/K6JlzXi75b2nndWVuKgNck9LlKyoW7ftQfv7EEvXC08Amaz1tlgKhSIgKnwc9eYn3ZExXv0ETfm6wcl7bvuwXUeSd+4LYIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153361; c=relaxed/simple;
	bh=lYvt5NktykrU4G4k710RiF9T2No7atg8/NYgEiARUDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jd+IoZqMu7iqLv+H0KtwsQ1t6mT2/7bffWcnxqhAhOXpG21E64NBGASa/8zY5uu3471eSEqQYQm6io55yNXuSUVS241yWmTBO5zByKakkCdDJQkx2wITY6W++uWnM12Ne4SfrsqSdfpHCmW7zmjrU5C60aV1hW1bCnH7pdmQluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBDWUndT; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6a47a3da3so229084366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736153358; x=1736758158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TdAMmMa/36NEGjSEYdL3bgt28g6gvQSvEW+I+wH1Zw=;
        b=RBDWUndT+3v9QjeAw6uYWxcHppOnTGKjL9PrKO7FLUKD+WI9BPpZGtI11Rc63AdKp6
         pe99aSUqcTVByK0M7zHZyJLgDU24dWbLkudWgOc6gb4nmXFU32LUiUpF+ZX5M4sGZ+kl
         J61uNCkxfakwJR8rnxwrXviyVwG2SexdMHvEv2T7jZQ/RNaDIiKobHF7YL3ClEtDV0t+
         XtaL1zFevkc+26xDq53KcP8q75y2NrCCINKa74bXAcMhrSTYGN47VRunhdZkYBMd50jx
         cCgT0g6ZAAH6gyBbIksE5dgefwUUgJ9zNgXwZSy7b7SPQ6HpQFImv6d6/dyOtmigq9qH
         CDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736153358; x=1736758158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TdAMmMa/36NEGjSEYdL3bgt28g6gvQSvEW+I+wH1Zw=;
        b=iUNrh6WjkaepFt8pF1i9rPcGT/oUx+ggNUaR3+r3y79/ChXfsQaOmx5OSZwEwaoTL1
         qjCC24WFSxhsDNvlBpqH4oPmYff9tOvhBXSsAfuMtJgry/CmQMkk/ZBZ+HLuh7TvIw50
         CsI58YxKxaLOyWmoQ7f4z4m77xNZq+/6dg+AcdfNZB7W2SbGQNtHHbSAGzCFndf4fVwn
         Rl0ZgniwmNw0iD1rSoB5JG+kdDkwR5Mznap7c1GA/AfQKg5H5LwfewDi3vfIlxywcoFH
         PDOOfba5SihUNL+vhs/0oASfM80j/ZnxkTFaTvFskd1DEW0cWoLaAkj2I+G9m/Lv5D0I
         5tXg==
X-Gm-Message-State: AOJu0Yzlw/2o3gkmU6dDR+BjjPteCW091LGXbHLU+BffKbrdV+toZohV
	tsxmxW40TPveP+a9qgjUVPFnVkdnp/F9xjTWZM1LeMvQA9Ko/nIPU0yQhSfeZZM=
X-Gm-Gg: ASbGncsYnpDmWQiOd4etfXIZdNjYsPJGSGOJtz7NM2YnQ1upwmpMKs+JtR4TpMzD/4l
	7cIq/FjDkHz6YMdd5oS2DxdT8SDUwhFx0Zw1Xb+YnfdgRowzAEs+HQvU44ZvT9D1caZd6PYH9ub
	Ly4lMrKg7IyUidVFisql98TC/bEQ6Uqeuqs5Ka/pdDBJfD9n8jRTFrvK9MrCMMIokbcvBPmrOZa
	G16I+/uLBW6rBdPIq81PJnVP9QLPNmQFJnfry9E8aSNpp54yScvDuWuJqVop35Jd67udGTS
X-Google-Smtp-Source: AGHT+IGuPEKa7Y8wn+0uOc+1jJboUlCaDTd8y6XllLGlDHCj5Ga52ftDkrVG81dndBjt+D74ERoj/g==
X-Received: by 2002:a17:907:7e92:b0:aa6:a674:be3c with SMTP id a640c23a62f3a-aac2adb56d7mr2031661366b.5.1736153356335;
        Mon, 06 Jan 2025 00:49:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:49:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:05 +0100
Subject: [PATCH 2/4] drm/msm/dsi: Simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-2-271ff1c00795@linaro.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lYvt5NktykrU4G4k710RiF9T2No7atg8/NYgEiARUDI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kFeF66qxefqCkeKAcrKm6G/RWzKa1Lo5O6x
 9gKuZfWWj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBQAKCRDBN2bmhouD
 13A/EACCArEJHarifsC36OvyaQw2iWP5JpsdZKyCO79MFzugRGcxQEyzTiD76HWcoC2bprBXWcV
 mC0MtsPseAqH8bFRdpYIBGM7Y4Gf47s2G7MRykpCTKhr9LcSYj2IxGGsnGCziJG5v7T5iemwMAj
 uYvAFEnrvcS4mkVUxOzB6aJpEL+DbC3XXtRtx7rdH0/15gEPtcq11hJaxmzSeZ5QJPXnQEqc+Xb
 NBKKOsaO+nafD0HpK3UhrlpuSP8T6TNcuz3k1VO4RxYHAmUmcwYhChjpt/3IstlyS8RG79pNfXV
 jRYO9X2LnBPaa4QgNLk2FwUsKZyieP5oKqpc043UtKAyUrnqEP7JI3dvhnjt9AlgKKaDM410eO/
 wEAzzv67SOIy1MwMh5N68UjcjM6ukxTOnhHw/SUuGPs9LT958aaavKh6vWif7xZWbzWl154Td72
 qbm6cvOdJnltxlMSbzrw/R3OjcgUuwiSO92rmaFCXSPUUHgLmHyHxrpFwdHbCD/TYtki7Kuh00L
 EOAa5y4hs1Sth9fQ59nLsuEz4VEEG/HutyLPpsBNDuoxCdqFQs5R1ek7df1WcGBynYvKkOMpFJs
 QkIo8A83bTFKTMrh2plnrqA4ecPm+yTmDArVLXlrz1bvCXWrslhUr+1g52EsmMbbccfH/OO6Yj8
 W5cpQ0NNLsNjBUQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

dsi_clk_init() and msm_dsi_host_init() are called only from platform
driver probe function, so using dev_err_probe is both appropriate and
beneficial:
 - Properly marks device deferred probe status,
 - Avoids dmesg flood on probe deferrals,
 - Already incorporates printing ERR value,
 - Shows device name (in contrast to pr_err()),
 - Makes code smaller and simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 100 +++++++++++++++----------------------
 1 file changed, 41 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 86ac145076416fa7651d18820266a00d28e44b6f..4a2ad04eea7359545a088bdc63907f6b3e5615bd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -200,7 +200,8 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
-		pr_err("%s: cannot get interface clock\n", __func__);
+		dev_err_probe(dev, PTR_ERR(ahb_clk), "%s: cannot get interface clock\n",
+			      __func__);
 		goto exit;
 	}
 
@@ -208,13 +209,13 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 	ret = clk_prepare_enable(ahb_clk);
 	if (ret) {
-		pr_err("%s: unable to enable ahb_clk\n", __func__);
+		dev_err_probe(dev, ret, "%s: unable to enable ahb_clk\n", __func__);
 		goto runtime_put;
 	}
 
 	ret = dsi_get_version(msm_host->ctrl_base, &major, &minor);
 	if (ret) {
-		pr_err("%s: Invalid version\n", __func__);
+		dev_err_probe(dev, ret, "%s: Invalid version\n", __func__);
 		goto disable_clks;
 	}
 
@@ -281,39 +282,31 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 	msm_host->num_bus_clks = cfg->num_bus_clks;
 
 	ret = devm_clk_bulk_get(&pdev->dev, msm_host->num_bus_clks, msm_host->bus_clks);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Unable to get clocks, ret = %d\n", ret);
-		goto exit;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Unable to get clocks\n");
 
 	/* get link and source clocks */
 	msm_host->byte_clk = msm_clk_get(pdev, "byte");
-	if (IS_ERR(msm_host->byte_clk)) {
-		ret = PTR_ERR(msm_host->byte_clk);
-		pr_err("%s: can't find dsi_byte clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->byte_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->byte_clk),
+				     "%s: can't find dsi_byte clock\n",
+				     __func__);
 
 	msm_host->pixel_clk = msm_clk_get(pdev, "pixel");
-	if (IS_ERR(msm_host->pixel_clk)) {
-		ret = PTR_ERR(msm_host->pixel_clk);
-		pr_err("%s: can't find dsi_pixel clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->pixel_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->pixel_clk),
+				     "%s: can't find dsi_pixel clock\n",
+				     __func__);
 
 	msm_host->esc_clk = msm_clk_get(pdev, "core");
-	if (IS_ERR(msm_host->esc_clk)) {
-		ret = PTR_ERR(msm_host->esc_clk);
-		pr_err("%s: can't find dsi_esc clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->esc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->esc_clk),
+				     "%s: can't find dsi_esc clock\n",
+				     __func__);
 
 	if (cfg_hnd->ops->clk_init_ver)
 		ret = cfg_hnd->ops->clk_init_ver(msm_host);
-exit:
+
 	return ret;
 }
 
@@ -1879,31 +1872,28 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	msm_dsi->host = &msm_host->base;
 
 	ret = dsi_host_parse_dt(msm_host);
-	if (ret) {
-		pr_err("%s: failed to parse dt\n", __func__);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "%s: failed to parse dt\n",
+				     __func__);
 
 	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
-	if (IS_ERR(msm_host->ctrl_base)) {
-		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
-		return PTR_ERR(msm_host->ctrl_base);
-	}
+	if (IS_ERR(msm_host->ctrl_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->ctrl_base),
+				     "%s: unable to map Dsi ctrl base\n", __func__);
 
 	pm_runtime_enable(&pdev->dev);
 
 	msm_host->cfg_hnd = dsi_get_config(msm_host);
-	if (!msm_host->cfg_hnd) {
-		pr_err("%s: get config failed\n", __func__);
-		return -EINVAL;
-	}
+	if (!msm_host->cfg_hnd)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "%s: get config failed\n", __func__);
 	cfg = msm_host->cfg_hnd->cfg;
 
 	msm_host->id = dsi_host_get_id(msm_host);
-	if (msm_host->id < 0) {
-		pr_err("%s: unable to identify DSI host index\n", __func__);
-		return msm_host->id;
-	}
+	if (msm_host->id < 0)
+		return dev_err_probe(&pdev->dev, msm_host->id,
+				     "%s: unable to identify DSI host index\n",
+				     __func__);
 
 	/* fixup base address by io offset */
 	msm_host->ctrl_base += cfg->io_offset;
@@ -1915,10 +1905,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 
 	ret = dsi_clk_init(msm_host);
-	if (ret) {
-		pr_err("%s: unable to initialize dsi clks\n", __func__);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "%s: unable to initialize dsi clks\n", __func__);
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
 	if (!msm_host->rx_buf) {
@@ -1931,26 +1919,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 	/* OPP table is optional */
 	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(&pdev->dev, ret, "invalid OPP table in device tree\n");
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!msm_host->irq) {
-		dev_err(&pdev->dev, "failed to get irq\n");
-		return -EINVAL;
-	}
+	if (!msm_host->irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get irq\n");
 
 	/* do not autoenable, will be enabled later */
 	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
 			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			"dsi_isr", msm_host);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
-				msm_host->irq, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to request IRQ%u\n",
+				     msm_host->irq);
 
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);

-- 
2.43.0


