Return-Path: <linux-arm-msm+bounces-14207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961887C71D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 02:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF021C21AAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 01:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B238C13;
	Fri, 15 Mar 2024 01:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRTSu8Dt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AFD6FD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710465766; cv=none; b=kMQGyqsjCRCGlh5HYZQEb/roLOSkbJI75q95ZFfJLtTKrdlIY5nslnq/XTQbMqcIAUGVWbAIvmWrljIKZnuO396J0rW43OWQVuP4kaVUT4Zf69j3w8yEaqGbS+v7cSXXMlzHbx92eIvmpLlQwQxMBn67TbaREVf4eyYjOZf7FWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710465766; c=relaxed/simple;
	bh=gqKp1S6/zn30s6BNuSQoNE5FrMLSKTVvFXbaJQz/Q24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5UHjAoz8ZeFb8ks1VBRYFBaXgtyrXb3uDhsV02PFh8wHrojygQLFvVjVnYIyzKoN85UpNDtWFVcGn9jKM+mzhekzcMAvBXvPW3Aule1H6cHyrqd12iFs5/zJsX3gFEUmR6ajWbeQYTqsMwNH8ZAsgMqlwAK7QkWYahnxx1FKo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRTSu8Dt; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513cfd48224so2007008e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 18:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710465762; x=1711070562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbFUU4iMew5gCyNhy6Z/kEtYbNuf40upf3sZEP5LUHU=;
        b=yRTSu8Dt2oXgG5niszOwhUsZnmhA4Otaxdyu/eSIc4djEuqeZE1CXVEudVZfboKRxQ
         BYCGKCIY7/8WBwMmHKJDgbcdHUH6QYi2jOGLuhphGfxedU/RO8igdrvkTJ86/EVSvpDB
         SziOoAElXUfWeQUCDCi1QYumWlFQOxcz7zMCqOBnLxhZIR39Xy46K+gdJ0Y0vX9hTALs
         OZ3zAofZcrUs+TS7aqNS7jffb+GVXkqtINIJrUfuYmmPdQnKbwbVw/rp65uHVX2isoAP
         7E6bIVICeRUZi06bbW5R70F+k1Dnxhu8tqDcAy73ogNnV/7XMUSjXIqShN32ZOo3vj2z
         Bs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710465762; x=1711070562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbFUU4iMew5gCyNhy6Z/kEtYbNuf40upf3sZEP5LUHU=;
        b=Jq8KKCP7EQCVj+BfkZaSD9bW45pMgFUzedZKcH9RXeSx7hsi62r+FDIrvRR5tgcJUM
         VgX4PnliyudLgd1dZ5CJTwucspQwUCai7h8dLBH5eC7nxobD22U8YTCpX+ix0Crd+N4e
         jiSRGAaIHrdEfeTswENZ2xrwcDeIDmdZSm/zN+ytzYt0+c6brBmxko/5Uef4D2aNsG9m
         d2K7jl4N4A+x3hGMHe3dvCAoTt34kBHeLFcLAsgkwlNIdRWOs6V/EJLVf8kiWpJ9rLsH
         inbahzCOLPnxhmZzRP688mWFU2V+cb+5xp0fG6Yj7c3ac4s2OQ7YPMWXhseYRRvEbDFD
         fMiw==
X-Forwarded-Encrypted: i=1; AJvYcCVpEYQ3vRNnbCq6s/BvNBd4qSjePvPs9IWpORj8ay6ZG8EEaglrIBXoPn53wPAOKHB2Jwh5ZbsEPdYHjNNm+cITPsfC9Yf0eU40OE0Dxw==
X-Gm-Message-State: AOJu0Yz6/XWTFpkBur8+L0KnzwgIyGjoIiQowuYVSW9Z3p59Z2Jl0NdE
	HkZ46UP70w47iB9zhz1qwlXXTTA6G3fTgSfwz0jXRB+i/NOdg0f98tQFTU6+iNA=
X-Google-Smtp-Source: AGHT+IHtrzYxKTdhEJiCsYVbj5qQawMiDGqWZ9T4uQxxTyj3bC8QoP064yJq0ObTbOilGp1xTUnQaA==
X-Received: by 2002:a19:ca5b:0:b0:513:c1ab:89f0 with SMTP id h27-20020a19ca5b000000b00513c1ab89f0mr1252098lfj.22.1710465761862;
        Thu, 14 Mar 2024 18:22:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m11-20020a19434b000000b00513d6089dc7sm190559lfj.131.2024.03.14.18.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 18:22:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 03:22:36 +0200
Subject: [PATCH RFC v2 3/7] drm/msm/dsi: drop mmss_cc.xml.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v2-3-7cd68ecc4320@linaro.org>
References: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7249;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gqKp1S6/zn30s6BNuSQoNE5FrMLSKTVvFXbaJQz/Q24=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl86Lb6zx6vy+03xuQFsRV+cttJ8xY2+xiRmY7J
 voPRemwaoCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfOi2wAKCRCLPIo+Aiko
 1Up2CACgVvghB81j+9m7KRSYd6if0xCkEUBZUKuiH+eBnTOi3+a01b8PKLWLXdwp7qkE7bDN1YF
 WqndDxVyU/ZDHkwaiIQzcCili+7U49Wwh2vM+4Ulqj/GdY7T7jnVOAxRXhicLDIX9t2EnzTtDyD
 N5EvxINvgubzo+AqrR1of28ti9FKy6ZEKLCNA8Cq8PNDbkZpU/r1XcaGku1q3F5Ep2kDWp0FEGL
 +QOYILlaIrJ3RKaPfYvzXpvBbMqJvxJL+eJ0LvOsrpjZPmxHjKh9TvqCUgduHUBNPpM56q6pfQG
 FZ3/AKa5cd1E8deWeCC90TQWHZJAZ5bUxpXjvpLc1gk/CchZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mmss_cc.xml.h file describes bits of the MMSS clock controller on
APQ8064 / MSM8960 platforms. They are not used by the driver and do not
belong to the DRM MSM driver. Drop the file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h | 131 ----------------------------------
 1 file changed, 131 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h b/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
deleted file mode 100644
index 7062f7164216..000000000000
--- a/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
+++ /dev/null
@@ -1,131 +0,0 @@
-#ifndef MMSS_CC_XML
-#define MMSS_CC_XML
-
-/* Autogenerated file, DO NOT EDIT manually!
-
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
-
-The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of this software and associated documentation files (the
-"Software"), to deal in the Software without restriction, including
-without limitation the rights to use, copy, modify, merge, publish,
-distribute, sublicense, and/or sell copies of the Software, and to
-permit persons to whom the Software is furnished to do so, subject to
-the following conditions:
-
-The above copyright notice and this permission notice (including the
-next paragraph) shall be included in all copies or substantial
-portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-*/
-
-
-enum mmss_cc_clk {
-	CLK = 0,
-	PCLK = 1,
-};
-
-#define REG_MMSS_CC_AHB						0x00000008
-
-static inline uint32_t __offset_CLK(enum mmss_cc_clk idx)
-{
-	switch (idx) {
-		case CLK: return 0x0000004c;
-		case PCLK: return 0x00000130;
-		default: return INVALID_IDX(idx);
-	}
-}
-static inline uint32_t REG_MMSS_CC_CLK(enum mmss_cc_clk i0) { return 0x00000000 + __offset_CLK(i0); }
-
-static inline uint32_t REG_MMSS_CC_CLK_CC(enum mmss_cc_clk i0) { return 0x00000000 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_CC_CLK_EN					0x00000001
-#define MMSS_CC_CLK_CC_ROOT_EN					0x00000004
-#define MMSS_CC_CLK_CC_MND_EN					0x00000020
-#define MMSS_CC_CLK_CC_MND_MODE__MASK				0x000000c0
-#define MMSS_CC_CLK_CC_MND_MODE__SHIFT				6
-static inline uint32_t MMSS_CC_CLK_CC_MND_MODE(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_CC_MND_MODE__SHIFT) & MMSS_CC_CLK_CC_MND_MODE__MASK;
-}
-#define MMSS_CC_CLK_CC_PMXO_SEL__MASK				0x00000300
-#define MMSS_CC_CLK_CC_PMXO_SEL__SHIFT				8
-static inline uint32_t MMSS_CC_CLK_CC_PMXO_SEL(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_CC_PMXO_SEL__SHIFT) & MMSS_CC_CLK_CC_PMXO_SEL__MASK;
-}
-
-static inline uint32_t REG_MMSS_CC_CLK_MD(enum mmss_cc_clk i0) { return 0x00000004 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_MD_D__MASK					0x000000ff
-#define MMSS_CC_CLK_MD_D__SHIFT					0
-static inline uint32_t MMSS_CC_CLK_MD_D(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_MD_D__SHIFT) & MMSS_CC_CLK_MD_D__MASK;
-}
-#define MMSS_CC_CLK_MD_M__MASK					0x0000ff00
-#define MMSS_CC_CLK_MD_M__SHIFT					8
-static inline uint32_t MMSS_CC_CLK_MD_M(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_MD_M__SHIFT) & MMSS_CC_CLK_MD_M__MASK;
-}
-
-static inline uint32_t REG_MMSS_CC_CLK_NS(enum mmss_cc_clk i0) { return 0x00000008 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_NS_SRC__MASK				0x0000000f
-#define MMSS_CC_CLK_NS_SRC__SHIFT				0
-static inline uint32_t MMSS_CC_CLK_NS_SRC(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_SRC__SHIFT) & MMSS_CC_CLK_NS_SRC__MASK;
-}
-#define MMSS_CC_CLK_NS_PRE_DIV_FUNC__MASK			0x00fff000
-#define MMSS_CC_CLK_NS_PRE_DIV_FUNC__SHIFT			12
-static inline uint32_t MMSS_CC_CLK_NS_PRE_DIV_FUNC(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_PRE_DIV_FUNC__SHIFT) & MMSS_CC_CLK_NS_PRE_DIV_FUNC__MASK;
-}
-#define MMSS_CC_CLK_NS_VAL__MASK				0xff000000
-#define MMSS_CC_CLK_NS_VAL__SHIFT				24
-static inline uint32_t MMSS_CC_CLK_NS_VAL(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_VAL__SHIFT) & MMSS_CC_CLK_NS_VAL__MASK;
-}
-
-#define REG_MMSS_CC_DSI2_PIXEL_CC				0x00000094
-
-#define REG_MMSS_CC_DSI2_PIXEL_NS				0x000000e4
-
-#define REG_MMSS_CC_DSI2_PIXEL_CC2				0x00000264
-
-
-#endif /* MMSS_CC_XML */

-- 
2.39.2


