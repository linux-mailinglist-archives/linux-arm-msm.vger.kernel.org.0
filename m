Return-Path: <linux-arm-msm+bounces-43976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF59A02115
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29E133A38B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BF11D90C8;
	Mon,  6 Jan 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T2R+EdtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D771D63D7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 08:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153361; cv=none; b=Fpg8JGbD0RXVST+OniOqHxFhhivXqkk6LVZnidcI3kzkRnCKlX1rYH1N+TmzbouQ7i30Ug2rsb0nXOaMzzdcjJmylokwlKk8ugYK6uimLB3//onT7mQH88chuGakI+d5lAsDvg1zlQZDQ22jQC7sS0arChn0KcWPDvYg7sQi8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153361; c=relaxed/simple;
	bh=/a3blq7uTO7fUJvEaGIXSRTJ4dpfb7qJYZHpImk2dVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdxKBHD9B5g09xVktoBmhZ+6RUct1nD/fluq5ZPcKXmTOc/ZVZYJUYS/ztcS0Bkw7TsftiIrcmKgy9V+jslsAfIUigJjDwZbB5nmGCFpPfqBAMv6NpYKzytOXaN8FXw5DjStTGPID3iZojI6nVwHE3L/PlzDKkMGoDibfCWPADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T2R+EdtS; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa69599b4b0so219185166b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736153358; x=1736758158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqYqpE74NSCIuQ6we8Kew8vkG28Edsdn09mE/ypD+oI=;
        b=T2R+EdtS5kGyaR8h3RcUO97TJaL9fBZWekaZkPHz3z5s8aU2U58icTwfdw1d0+AP6w
         Vi4j5Kbd8i8wMtlt2tuQ6DUpTgqK04f3rT+QMK5LrR93DVNnrZUGxBm+BLuNsuhix33u
         QwLNCEb2M61nlQPEoBIeYQTG3db3Y8QDv6apnb/jjwyj3Kb8oWX+Rgcv6diJNU7K8qrt
         Qdk0AXqX3EyDGjKetu1ns5vREfmIGdH4awtBEBjJNiSo3Q0NCv3sgaVFoqLZ5z3oJSTK
         3FCEO2PqxbFx4QublRBbNtr/P7d6jMKsypVKH4DcNJ7OeS4Jl9H62KY7uvjsXP+0+yfi
         hC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736153358; x=1736758158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqYqpE74NSCIuQ6we8Kew8vkG28Edsdn09mE/ypD+oI=;
        b=pynrCBbsYR7dSoQP1dJB4rGvoh0C/gRvDuyETaylsjlUe2K0LDT7sbajQGIv7ravUx
         hL5H5S+aLb6lh0DubZPVEKdF/GxIyEeLiHovRpJhDDROELgBI4UFOCSZLXieu3XHOvlH
         AzVZMp7AOw7jfLwRGsUd0NGxI1Mk5Fo0XANMhK4+haxJR7/thK7NdghF9Slf1viPZ/T+
         7EnTX7upzy3TQI4AK7xjNytQO1V/v8k7qx2900hXBVy5FuwD4zPuNKncQyKDxCw3Mwy0
         CLB+gJE/xyv9IjtHva4mJ5m/BCg+GsA9FKa68yLattTa2cbbE0z48u2VgCwRmf6ITnZT
         URzQ==
X-Gm-Message-State: AOJu0Yy/BwhHKcUhJVVNGeznI/VlAKu22DX5/jmTdlHywvCB2ELvX2yQ
	WzM2TN25HdRWhoQaT9+Xhvci6k1o2XMlAPuH/qssikrmugUY8XMfzMpnToekbB0=
X-Gm-Gg: ASbGncuvI1KXLLjZa6F42xOhAgUm2THF66D8Jn7ELOZ7x03ZD//VOrs6LCQ89X9Gz5h
	UsjM3IG53YUwx/2+GpB6n7Y3ysKFMUd9jFYwjxYt3t6Bmj8mrkvNxSOq4VtPGoxKzK+6rKCapIH
	vkncNBvcIu5biNMiR+DZYi40dWfxMAb4XL9MgBW4Lei4Hs633nsOoFbcD4We4IfEB2EHZXCCw+4
	YdZTQ+GwrDEg+HuHOMvhoXgyH13OgtnWvQAN/44ZPraYIbV6ax64FoAMGtURk6MamxS0auE
X-Google-Smtp-Source: AGHT+IH+pwK330xaahhvQucFSZxUuXVT0b0dCvqw2hihR/wXtnoUMiZ/CIdtEfAi9ckdZ9cr0u7txw==
X-Received: by 2002:a17:907:3d86:b0:aa5:3e81:5abc with SMTP id a640c23a62f3a-aac2714ad32mr2069989566b.1.1736153357678;
        Mon, 06 Jan 2025 00:49:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:49:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:06 +0100
Subject: [PATCH 3/4] drm/msm/dsi: Minor whitespace and style cleanup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-3-271ff1c00795@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4972;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/a3blq7uTO7fUJvEaGIXSRTJ4dpfb7qJYZHpImk2dVY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kGPLcMDXTAFLB7FrGzq2KBwobfDoM2Axvrj
 aejM+xFPaCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBgAKCRDBN2bmhouD
 12suD/9plZkSR1GSSGcpRhCfw5+T70v5pcFayEvEVJBIDykDJm8lIN92LDQE5NBumEO11lwWxPC
 CZ4f/waCUhmh3Loap2GjCt4/4TxZBM1+aMK0//cTiLj7LoTR0mYfUSIjZ11gIsOPOaQwsh1CeXC
 yUvvzhwKVTJCm+oHioyAbm3GexCFBEn7GRx6yLHqtto5VOgMlaFh0GsUry3e6LIpIkevjZmCpGz
 cS+TaFatdkNFN77I2PGoi1aw3iIR82bKz7Aeu+K09XcJuNuCDZbTcgZlyRae6i4lveD+Pl7U5ir
 jiulukBPI60UsavcKrcTuTLAk4HCe5/t7gkYg1vhOV5ZoCe1xpxZEr15oMtZki6S9y9bSpjycyG
 ha3tev3HEVuUFIQhikzEOfOHkrCu0k9LgY+UZ77Lv5alOKdF6SIVlWICmhlhe5oOZTLKZPJKYlJ
 byShuxZrJF71LQzuuRgkWc4rr2CCgNVIdhSDA45ohfZCR98soas9LngZ/suxJdM19rW8C4tzeR7
 pdkdcCPWQH3djhjBFye1+bjsiynZ/HPhGOijgIGeDZxLiFnTM0m0lmZmlWsbRANHQ//cOXMvMhu
 i3mvlotSNMgX/cEKm8c19rqHws8FkfadXTX6VfvoaxLTQMTwRGHBmpF/j3HxbxwdRoWxLoXOvfO
 bpSXOzVQ17OSjcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Cleanup few obvious kernel coding style violations: missing or
unnecessary braces in 'if-else', unnecessary break lines, incorrect
breaking of long function declarations, unnecessary 'else' after a
'return'.  No functional impact expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 51 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4a2ad04eea7359545a088bdc63907f6b3e5615bd..a3c344b75fc2e90923cd6d26df87b7c05208f736 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -179,18 +179,18 @@ struct msm_dsi_host {
 	int irq;
 };
 
-
 static inline u32 dsi_read(struct msm_dsi_host *msm_host, u32 reg)
 {
 	return readl(msm_host->ctrl_base + reg);
 }
+
 static inline void dsi_write(struct msm_dsi_host *msm_host, u32 reg, u32 data)
 {
 	writel(data, msm_host->ctrl_base + reg);
 }
 
-static const struct msm_dsi_cfg_handler *dsi_get_config(
-						struct msm_dsi_host *msm_host)
+static const struct msm_dsi_cfg_handler *
+dsi_get_config(struct msm_dsi_host *msm_host)
 {
 	const struct msm_dsi_cfg_handler *cfg_hnd = NULL;
 	struct device *dev = &msm_host->pdev->dev;
@@ -370,7 +370,6 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	return 0;
 }
 
-
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 {
 	int ret;
@@ -588,7 +587,6 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
 				msm_host->byte_clk_rate);
-
 }
 
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
@@ -677,8 +675,8 @@ static inline enum dsi_traffic_mode dsi_get_traffic_mode(const u32 mode_flags)
 	return NON_BURST_SYNCH_EVENT;
 }
 
-static inline enum dsi_vid_dst_format dsi_get_vid_fmt(
-				const enum mipi_dsi_pixel_format mipi_fmt)
+static inline enum dsi_vid_dst_format
+dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 	switch (mipi_fmt) {
 	case MIPI_DSI_FMT_RGB888:	return VID_DST_FORMAT_RGB888;
@@ -689,8 +687,8 @@ static inline enum dsi_vid_dst_format dsi_get_vid_fmt(
 	}
 }
 
-static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
-				const enum mipi_dsi_pixel_format mipi_fmt)
+static inline enum dsi_cmd_dst_format
+dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 	switch (mipi_fmt) {
 	case MIPI_DSI_FMT_RGB888:	return CMD_DST_FORMAT_RGB888;
@@ -1282,14 +1280,15 @@ static int dsi_cmd_dma_add(struct msm_dsi_host *msm_host,
 static int dsi_short_read1_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 {
 	u8 *data = msg->rx_buf;
+
 	if (data && (msg->rx_len >= 1)) {
 		*data = buf[1]; /* strip out dcs type */
 		return 1;
-	} else {
-		pr_err("%s: read data does not match with rx_buf len %zu\n",
-			__func__, msg->rx_len);
-		return -EINVAL;
 	}
+
+	pr_err("%s: read data does not match with rx_buf len %zu\n",
+		__func__, msg->rx_len);
+	return -EINVAL;
 }
 
 /*
@@ -1298,15 +1297,16 @@ static int dsi_short_read1_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 static int dsi_short_read2_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 {
 	u8 *data = msg->rx_buf;
+
 	if (data && (msg->rx_len >= 2)) {
 		data[0] = buf[1]; /* strip out dcs type */
 		data[1] = buf[2];
 		return 2;
-	} else {
-		pr_err("%s: read data does not match with rx_buf len %zu\n",
-			__func__, msg->rx_len);
-		return -EINVAL;
 	}
+
+	pr_err("%s: read data does not match with rx_buf len %zu\n",
+		__func__, msg->rx_len);
+	return -EINVAL;
 }
 
 static int dsi_long_read_resp(u8 *buf, const struct mipi_dsi_msg *msg)
@@ -1366,8 +1366,9 @@ static int dsi_cmd_dma_tx(struct msm_dsi_host *msm_host, int len)
 			ret = -ETIMEDOUT;
 		else
 			ret = len;
-	} else
+	} else {
 		ret = len;
+	}
 
 	return ret;
 }
@@ -1435,11 +1436,12 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 		return len;
 	}
 
-	/* for video mode, do not send cmds more than
-	* one pixel line, since it only transmit it
-	* during BLLP.
-	*/
-	/* TODO: if the command is sent in LP mode, the bit rate is only
+	/*
+	 * for video mode, do not send cmds more than
+	 * one pixel line, since it only transmit it
+	 * during BLLP.
+	 *
+	 * TODO: if the command is sent in LP mode, the bit rate is only
 	 * half of esc clk rate. In this case, if the video is already
 	 * actively streaming, we need to check more carefully if the
 	 * command can be fit into one BLLP.
@@ -1864,9 +1866,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	int ret;
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
-	if (!msm_host) {
+	if (!msm_host)
 		return -ENOMEM;
-	}
 
 	msm_host->pdev = pdev;
 	msm_dsi->host = &msm_host->base;

-- 
2.43.0


