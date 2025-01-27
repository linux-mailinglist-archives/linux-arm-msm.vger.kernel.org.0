Return-Path: <linux-arm-msm+bounces-46234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B820A1D681
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90C803A2201
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D621FF7DE;
	Mon, 27 Jan 2025 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQbHqjSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484E1FF7A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984075; cv=none; b=VZ59Ff/WquykcleSW1XHQ71o8e/zmNWepCJKBsA0FaHfgVtQSIa/+fuAkP/bqA1jgqjdspoGB4aev+uvpVGHuyp4DZiEfjlwaIXZZFkZoIPR0ZXgz+lUuewTq844oVMINrOJ1k2xLq9yRnfcNN42Ze94BzMWlrZqjkTtwSEsPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984075; c=relaxed/simple;
	bh=IUbaxPS+HQnJ43himjlEznUpNzuts8QFvAEId8JRW6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAO94S6vsAkIIbpdaA45ah4JshA4l8e8Wueq0rCZgUzKx2jPxWFWKE4MrMKX96ZNzSSVGRNRb//hLJPMDRFEGqDLfu5kCEwobVieP9yMiID3w8Ga7x28yeD6sAqd+Y9pbeVah2/WpPxIEabt1qsOPon3Mrwh64fZMbYoJ9gqlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQbHqjSm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436381876e2so2767675e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737984071; x=1738588871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lrk19+x0xCyWtNAM9zqIl3MR0fAbQ4p3LHFnpdDhys=;
        b=uQbHqjSmL3xY6zOmgponX/GjfcHJVTbPqMZ3SXL4jNsl238sUGEDNNS9etdIemPEqk
         fu9g279Ktu7veueqXUM7YmwotHehJgfSL43vMD7czk4ox7B5Clo4CovdpnxPDrrL+Cvh
         vEKgwLn/zDNs+a/n19P+/zSU0aou247ln6Sbeuqqp38OVklvCJaFmAhRYZEMpr9Ejmh4
         evSeeHWffJIKHjg7YXfgCNX5fyr2ODPEmLsVX8NKElrbBL2uk1JD6zuRePd3OBuQTzQF
         P7wAnrtvr2yzoiGGIizlAVRndxyaFia4VFoS4YcI0FdnnesOHVwdKQB3s6BtbIzPac3R
         xAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984071; x=1738588871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lrk19+x0xCyWtNAM9zqIl3MR0fAbQ4p3LHFnpdDhys=;
        b=ZyYpnkKxUAvQfQQa+EdSoYMmgBtCfAt0j+TNM6CIXX8uLKOGRngj0XVudo3j7VWpzF
         pYEOVdftkYqMaa0MUxofD06gc+8IjlKV8Jf2eWLjLuU6ezho+bD+RMk5zziccH0sP9p0
         P+OLYoBaHpOgxWc8Ju0NPUjNpitL+DNJjuWwSGgO0JVCquICiNlWjeZkPuFJNlJfW9a1
         TJDw7x/mcqj1zWAAI5FmqWrxl1sqtaeB30rxub5TqRZB0U1bkgUFl6Rvt9+ftdG3sV5Q
         BnUX6BM9frXxirNWoA/owJA3MLFWFFCuRH+TvfJOb0/MMFBNGsTjxOAGuxNZnxUF5OzP
         Km1A==
X-Forwarded-Encrypted: i=1; AJvYcCXk7vD3iMdbyI8HXoVv4JPZiyY1rQ0D6zCmEmZFATPcuxFKRWvd0HfyxeoXuyGDuvVonyn7lfgqU9xSoLEX@vger.kernel.org
X-Gm-Message-State: AOJu0YxJg3ncefPpYA2hCqxChFPPkRGuSI/pKMmQrhsMvtTH/EMhfW+S
	zx3dO6Mtfwk87VO7z+yo6+Blssa2pbkdZ75lmTonnNZJ7NdwUTf1bScL69hWiTQ=
X-Gm-Gg: ASbGnctTD1cCldYfjgkcVhU3dr8qpjbXjAARIBJV/6RtwSO1wdyCE72bNUS77D6d7gU
	+KBBcD2kTUtRSoP9HydZYpXuaL008I+Nsq12Da0lzYStoNbfRBbsdirQOQZcv/Iaa2qt5DmSkFg
	alJSup76Eg7HhUb988RsH4ilmiH9nvfNSHMi6pTUeCgsrPnEeHkhZGAOk+YlImAGuVM2jppvSre
	CjS51GeSIDiFqu9HPrWLLq/hIuBBUGE41tyqK54lSb5q7f5AigXI3jPJpKimOWOm/V/un67fdGn
	X0PJW3w/r+5D8+DGEw==
X-Google-Smtp-Source: AGHT+IFQ3yteVkt9TcZzs8X17uQXuOmJxl9Leoqq2TKqJE6nDiurSR7kDwbdcXBuU+CbDYLyoR4UeQ==
X-Received: by 2002:a05:600c:1f10:b0:436:fb10:d595 with SMTP id 5b1f17b1804b1-438b1763eeemr80946485e9.1.1737984070644;
        Mon, 27 Jan 2025 05:21:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b9977sm132386105e9.25.2025.01.27.05.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:21:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] drm/msm/dsi/phy: Use the header with clock IDs
Date: Mon, 27 Jan 2025 14:21:05 +0100
Message-ID: <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the header with clock IDs to bind the interface between driver and
DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 5 ++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 1 +
 6 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index fdb6c648e16f..7541ffde6521 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -6,6 +6,7 @@
 #ifndef __DSI_PHY_H__
 #define __DSI_PHY_H__
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
@@ -85,9 +86,7 @@ struct msm_dsi_dphy_timing {
 	u8 hs_halfbyte_en_ckln;
 };
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-#define NUM_PROVIDED_CLKS		2
+#define NUM_PROVIDED_CLKS		(DSI_PIXEL_PLL_CLK + 1)
 
 #define DSI_LANE_MAX			5
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 677c62571811..9812b4d69197 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 2c3cbe0f2870..3a1c8ece6657 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 1383e3a4e050..90348a2af3e9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 5311ab7f3c70..f3643320ff2f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ed8192d56b06..305042c29b2b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
-- 
2.43.0


