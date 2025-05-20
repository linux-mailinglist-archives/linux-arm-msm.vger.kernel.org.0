Return-Path: <linux-arm-msm+bounces-58711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C314ABD688
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C5827B4987
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD93B272E5C;
	Tue, 20 May 2025 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7oJTeUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73CE276034
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739617; cv=none; b=oxSuPKVljDbn1Sbhn0bL6KUSjXMipEuROB2VHFsc5xjw4sSmTUUQRDQJ5x8K3UMJ4N0G4TvVFtlK4h9twGhLQTWviHxuAQj1rBVVFHVDQ1KY9v2mlf7uVrqwSyStQKdswMYrwIQk5dCHeTy5ErEJdDDZHcFily9VzHpGY30HjSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739617; c=relaxed/simple;
	bh=exVZFWCvYTW3X5Aq8gygTLrHXFVVVXwyjtGZsGCFRu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vD4yp2N7bK66C8Zp5saknKOk02zdK6ooXluQGo6YFZzqR9SO3wvDtg9zy07IwHJs0lYliXxXGGHvXJN5BN1Pv4y1Hc4QYK5ZN0/E+8x9DfjnpGfcEQ6o4Vx7pP0vr5JLJGIPzczOUb5vhJEyhGm+KLr2eG6RLG/KVmJavgy4PwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7oJTeUX; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad56886dedbso21829366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747739614; x=1748344414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RRlboOLx+lZB7I+Un/8mETz9yhVxKhkELAyD1TFnFzc=;
        b=y7oJTeUX8dZ1zGGLPG38SWW+mw6sJQ/TMzTCBJSlWHwfrJyI2RbFXJxxhYb3agbmHA
         MvorxyXOn2Mx4eLXuaaJP3lLmOmy3GeQviI+e/xmUXZzzp6rCzQGrfUhm1Je1wHBIxDQ
         60eElrpc4jWbsCxClLyf5agjq/cTsPXtFcJlnNehd2odGM94vZ6ZE2dCKn5VGgQZsY9S
         N2kNlSoG3Oi1e2aZtb0mVYC8AjgObXHy6XKm44GKOq5HC0pBuLFn8kbJmhVCg1I/rjgS
         SHdYKKkHQxUl/N9aXX4F5vAQkCilbSyoO+m3mPKswcDkSvPeIeDWzu6UJ5wbj3tdHqeA
         K+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739614; x=1748344414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRlboOLx+lZB7I+Un/8mETz9yhVxKhkELAyD1TFnFzc=;
        b=fqYyU120Z+uZqsq1cPcUUXEAQEAsDy/11Ui9qdVM/Ds9klNw55RCowKDehJEUJkX5K
         5utgOGtIIWqSiCJ68bPi/sP/GptXxtFPPSoWXcuqh8NQK866fCNBO5LWRW4xoJZL6v7s
         E4M5a8tLXwDHg19uJPc1GbFifDOvOEk+n+U35OhCTbO7TRzyNdMIsgoirWtZteu8zla9
         APK3Fe2bFRQsC0cMIvK0wG281aXZewmFIIYYHXAKR/GPAKAzwhCLeKqs+lDrkHgPvG8t
         w0bgeQCKw4oey/VQENKZ6VhwQRDP+8IwAa04tXeKYSJ5UiaLGjDFBRfHu1cPTn2q/uYK
         ugFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnHvvD95YAl/VLBUvOXZfe11ObwNi9cIuBhEruMQ/a/5/cd/8zIi8oDcqmvGs8esFz6rttItcWusUbMsDB@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/0oa5wMf/7D+Kypcx2DGkU6PHgzWYok7r8jZrc7wGq+W4pAV
	hCp0UjFR66e8P1OYPbx4xR4erKvL9hL9eFLnqO+bvpBFW+wUrpGjeNDG3EXuaoilRPNNwlGuu5z
	CNwco
X-Gm-Gg: ASbGncvepj9JpMKCY4Vt9uXtewUznvAjQEgkcfT2AEOhUHM1SODAqcTuY0bPY+8yiIg
	EzMVw8S3LiB8O4pmmHgRD0Ndr/wmq7DvNtKmxpPEpuUpax2EMtODzHI3pnBtX79fhNCu8E99esp
	y224xHm7J79/wvNBd8lhsMSYwQPjHIZtdaANRISkUdC8X/Ojnn0c81ng7ZiWYWsy2aRWsRJA12m
	AJbEkav6Gps8vq1VwtU/GPggQCZUAmqFn+eGgcCcXWohzwkaL77fb4kyrfttGRLdG7fZdxdtalZ
	Pvyn+WPV+7yPB+Arf84cGkU+mOFe+GUxH1hibf7dTQIVOc57FPUixuLxtqja7w==
X-Google-Smtp-Source: AGHT+IFFcBDcparokAPL5zf+2MVmyXm6MMa40X1yEJQwnjwLJ2/1hy2g6L0BYpZ3G9y+lJt2xMiYYg==
X-Received: by 2002:a17:907:2ce7:b0:ad5:28f5:fe2b with SMTP id a640c23a62f3a-ad52d4ce281mr470163266b.8.1747739614072;
        Tue, 20 May 2025 04:13:34 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06dcafsm729676766b.54.2025.05.20.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:13:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Date: Tue, 20 May 2025 13:13:26 +0200
Message-ID: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=exVZFWCvYTW3X5Aq8gygTLrHXFVVVXwyjtGZsGCFRu4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoLGPVUPKROx0QJfCbeV9e4WfBu8DXgXuh8g72/
 jKif7Qo68CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCxj1QAKCRDBN2bmhouD
 10/kD/9jtNDXdVvPG/epppsydCeNKKYkfy5GiosLMLkTw2AlTI+faS7MwaR/KH12qRYSn9JpZ3S
 vhFnGpBmA0ZAKfCYKRFc6pCmbdvAVp4oc9I3PQSbUrgUJDMbVclf9wZu8QC7QdrYJaJjhhI6Fyy
 95I96JTEEIlHZ++cJCGIm3N3rCw45GJaUlaIIIvfV7mzU0906I2WR+vJPpJ/5V9LhufwDtdMAJG
 rZdiO976aT+nt5kaN5gkaux274MOL9WVK2wNfHpVd3BmoE9f7ktSQgcuX1dzcDcNu0bMLvcDuki
 DjS4XAwZcVRH86XSeoLxEKwySguj5fZeSvMtlk9ZqfPXWzgr/Q4RTRlwI5/q9pPL/bNK2b8Glp+
 O22ndNnkmA6wfpyCKxkliWxS+RBI8RBF8M1Wtu0Qu+BP6P2+GhVKsODGFPFPTX7+PXFi25vvxWU
 lnFxnZ4D1+5E/1UPmEiZcx001aLXa6e48MwkWCVGB8C9yuHEONKd19pyRv4ytTqnpS1RPe4awgR
 9+k5aNcBvgDyc8rnjaXWfUV3sqVIeM7NYHOt1q+03j4FNY0f9yjoGVnDWk4IymXQAtTcXVEsoff
 W3QVUZk9QlqM05zZyWOlsR2Sgt8cf36zRZpq4Hz8s9/IMk5x+QjW7dk8KVB5igadGjjLJXRQPZS 2T9qrqXbYy3b7SA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver unconditionally saves current state on first init in
dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
divider registers.  The state is then restored during probe/enable via
msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
dsi_10nm_pll_restore_state().

Restoring calls dsi_pll_10nm_vco_set_rate() with
pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
VCO and messes with clock hierarchy, by setting frequency to 0 to clock
tree.  This makes anyway little sense - VCO rate was not saved, so
should not be restored.

If PLL was not configured configure it to minimum rate to avoid glitches
and configuring entire in clock hierarchy to 0 Hz.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 9812b4d69197..af2e30f3f842 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -704,6 +704,13 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	/* TODO: Remove this when we have proper display handover support */
 	msm_dsi_phy_pll_save_state(phy);
 
+	/*
+	 * Store also proper vco_current_rate, because its value will be used in
+	 * dsi_10nm_pll_restore_state().
+	 */
+	if (!dsi_pll_10nm_vco_recalc_rate(&pll_10nm->clk_hw, VCO_REF_CLK_RATE))
+		pll_10nm->vco_current_rate = pll_10nm->phy->cfg->min_pll_rate;
+
 	return 0;
 }
 
-- 
2.45.2


