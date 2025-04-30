Return-Path: <linux-arm-msm+bounces-56281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B7AA4CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881511881263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516752741BE;
	Wed, 30 Apr 2025 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZEE+FVc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92002274FE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018101; cv=none; b=K5cFqXvVrj9MV0fbO5KE2U/oBjZwUgtPmducE5J2M8hRJyQs9mXmtqpKG2jHWj1A8ixbAyvTc2amJusoIhMLCCq8CxDT+mf1o97AdQ19BlUjT1TLBiwNx6edyByOEpLs+y469wqSnu2NTANw15qeEE32s6RIDq94iuhGM4MPAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018101; c=relaxed/simple;
	bh=ie++luqCCOkUIqplEYfGoj3PyvDBiGZnnE2vPE0q2fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxQuZC8euaJoQ1FPFDnVnrpeLizFduMh+Hue6Eb1rIQFO6+l/ekciNcQv+hv4SZHG2ZOf6oAPcKBOuxBVRHGu24SN/dDaXbqjP8JvGCqUREP0HffXDbPfUMXtvk0Io32LEU2rdupbHAM3FYWSRSd0eaxODTjnxY9g46rrSqC27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZEE+FVc2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ab85402c9so244431f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018098; x=1746622898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlgW31bMSvJHQr/+7FLD6mAl+2mcjre5T4tLb0NZhIc=;
        b=ZEE+FVc26Hwn3/do/ggdV6DnpTay1/WsZPGygW+rNHtdo8iTC1egjhz2g/LlSb7rmT
         kXKkMQS1IDhGnkVAZSX4O1I1ol5ncnfi1TbrKTowLjEWU8wYS9f4iwa5bB6WQOwqtpHB
         +ZtEXssHGsezXWNNY5DEdBCcJGdXsIdnbAR+BxsIfTNroo+ePQT7WHAnP8lsj8y5UdFI
         QeI9AIfGB1OKgLj80L9EQ+S5nvNYBP1AcgQvPry+84P8YORSPQD4TDp4tCnBmknOQQSF
         LoOaPahmDiPdnP3orHpAskPWQbfEbIOH0tx3qB7bL+uoSJpyittiAL2ZwktfinBWtMIQ
         tLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018098; x=1746622898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlgW31bMSvJHQr/+7FLD6mAl+2mcjre5T4tLb0NZhIc=;
        b=LTrQv4Zv27J+CxTXgjQ+Xx557U/mCxLQZ8th6cvnIePL22/855+VCvk9xdPjGDCpAf
         /pT2ZidO3AmhAh9TWswDOTcCZHSH0vBeE2ZtKt+eZfrfcGdo8wxE/melVpaVfNuMEamY
         wJqYceVYwtPRDnZErbDoyNfJDLGR/hhMnjqDa6FtE0srJYOb2JPOEUM/fyW9IojB31Ct
         Qoijfmj83/4nzN2cXw84S1k7s0zUfV/GR7kQp1caGQyeINBdIq1OlA8IiLocFgiI6w06
         MmGpzj9xV24Sef/KbIhuukZzlFLKGcrOd7rajkfmUkZL6ivOCbJnSPoPRSXDVPDdFeR3
         alFA==
X-Gm-Message-State: AOJu0YwSIDBbdjAUbFXzuW3RMWwCZz6c3NtYl/+KrOG7cdu84WCyRFfa
	9VWmALLOJ0n3q3SPu2Q8OVsngFSf4DmVwbCqFmu92k5VJiosX8QwIb45BWjj5rg=
X-Gm-Gg: ASbGncvGcO0xe/z8391lZC6ENHPsGFsxBQ2ras6RiUVzq2o+YI/5R1YzxQGCjCxXvO5
	pns47l39Wwyyi+tliLaeQmwl9d4/t4tQwEWwI1PBYV+PY9dRq/vINwpmGFeZQ29yBTpxP3hQmFj
	63CrOYgt6pbD3GjivZElVRme0qeiaMGF8Yc0G6G1ACtGB200K26MpoDRgkn5DSc1OUMCD0olM5u
	jrs1ZDIyuIWPCFX/YsMrKo1Ca3Ys8EZBkMcRh30p5MLulFw40r0b0uB6WTZHsFTf0nFApq+QR1F
	xZHaS+W7zA46inMNmk9xb0o7ZJgIQQVpfVSW46tjygDgNNhN50/el13cqNk=
X-Google-Smtp-Source: AGHT+IHmxoUPURdmmgQHz7Jfj8+u8t0c/VIE/4vq98Yg1gd3UGcNqtyKVvz0Ufit6P2ua3jO7/u+tg==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a08ff35f51mr816557f8f.0.1746018097648;
        Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:44 +0200
Subject: [PATCH v5 14/24] drm/msm/dsi/phy: Toggle back buffer resync after
 preparing PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ie++luqCCOkUIqplEYfGoj3PyvDBiGZnnE2vPE0q2fs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8DPK+FwfYxZwhAaHV3AlW+BD3qudeCMCqz3
 OYe9MuARDeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfAwAKCRDBN2bmhouD
 1+V6D/48DkbGSx3PoiTDnUJsqlJggDdfcZuoUZnjxl4PJSz/rktRaRaay/hiT4JNAAsLHB+dC0S
 KJ7ZpYI4zG52UiNG7o7KJoPFFlH1SLeRgs0PuHfx58n+ZKbogI2WWIiQ++0CfuMm484s0F0E48a
 QU5wjbF0TuVEZ4gG3ud+8p7xPetF1YduSekNRPw2MRkOUV3+0857Z9eFfbVgaHPSEJNEA1rNO3K
 TmRs2D3EoX9qi+ZIvvDJ5BxYa9MjCAb39D/7XuVj3X20DYvTTyv3a46kEI08haCjxbkXFJj3axF
 MP6cXSL1fdt7Bo2TPFV0OBzPMI+AOmnwPdizhelzDbjd9vfwaUCqgeLYAWKKEjpDrrxUcGM3Gnx
 rvQ6lhr3SQjkbr6vdPkJ3VgBO2wdRLfkhvMn6UMY3j9znH0a9CX9AGKocVMq6YjqmG6ILiY/7jR
 QozLeOjqymN7TJzz1UCaCyHiPUHih5BxcO78BDTFScr40NLnLcl9zD4w/gJ6bCUi8ZGpBlB8ipk
 hx9yPNd//qGfUMCjhOrPakJ56GJOInTiey2NcrqoBCdEfROozCncSpMRDL8jADOn7U5ATEDtzmz
 PNfhEvYfXWo6F1cjAcoxwMYfZ7xPm34odoidWGhs6JERWO2+G0IdQQNy6RFaNNKflFC6SHjaROi
 zIojsRSRHDWoh0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

According to Hardware Programming Guide for DSI PHY, the retime buffer
resync should be done after PLL clock users (byte_clk and intf_byte_clk)
are enabled.  Downstream also does it as part of configuring the PLL.

Driver was only turning of the resync FIFO buffer, but never bringing it
on again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index a92decbee5b5433853ed973747f7705d9079068d..ca1a120f630a3650bf6d9f9d426cccea88c22e7f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -467,6 +467,10 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 	if (pll_7nm->slave)
 		dsi_pll_enable_global_clk(pll_7nm->slave);
 
+	writel(0x1, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+	if (pll_7nm->slave)
+		writel(0x1, pll_7nm->slave->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+
 error:
 	return rc;
 }

-- 
2.45.2


