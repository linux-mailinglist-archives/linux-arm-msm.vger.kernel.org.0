Return-Path: <linux-arm-msm+bounces-42275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0919F26CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 23:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71CCA7A1440
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 22:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28581CDA13;
	Sun, 15 Dec 2024 22:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lihQ5OME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2E1CCB4B
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 22:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734302666; cv=none; b=PLfRKOBsykiUPBDc7uKpCedfndAWWSJmgyRsemeHgXNeeuRM6pG46WxiyvNdlZiwJekbyDG7jPUmCgzFgHVrJ5Ze3QByV8Jo60EVLQCVe6dNYSZRaIoWBfH0aHgW52c9cwXVp8wjSFIs1vScU6WyPzLQZgmMuHIo9D0bYhEkDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734302666; c=relaxed/simple;
	bh=3MyLXDCoSNMrI8TDXI5uVPWdVRPsKv8qwhJVKH5nFNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pl29sUP13f2Q04LoUsog18daprTOvcdtfRMvQhMoZm5kmpBo1ALhKU4/mwfwpcaKprGdPQBGx4YlOzpuDfDJ5I75lTqObYVT45djSvC3nEo/71P8ap4ij6xBBiSLJEL2TvnH8Sul1c7qbKs62IgBsMnwHxL7uz+P11hIa4WtBRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lihQ5OME; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30227c56b11so34855521fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 14:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734302663; x=1734907463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWnfiMNCi4KOmkp+j4DHxRsO+TL+A0SocC5CU/IrvPE=;
        b=lihQ5OMEwBCzT7H422MOGtMJxUIZWNTyjRBdV1sT+TH3wMDjVVuSo0mTcvKUVPOVXN
         PHS6lqZE/iWkRMZO+JXo37MbGyoWGi1O8pC1FxcaTf+ubZuXJY8mNcIhK9pTki3qsjz3
         6C84xw/II8b+Xn1/5iN5wGwvW2IDCia18lZ1MKEM/hXHe7W25bKAxZ/AgYfuQ97aAlMm
         AHwGABVo8Z/Xx9ve+Z9EHpw5Ac4+cjyg4wN8/2jfaRz0v9zCVbzRi5aGoJDDtlvUe76B
         tpYAkIq+KilD6HRK/rrqV+cFtFfkdpudSWIfL45dpKMWavhunstKk6Re5UV5mQ6FTkfD
         mi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734302663; x=1734907463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWnfiMNCi4KOmkp+j4DHxRsO+TL+A0SocC5CU/IrvPE=;
        b=k7ppWFUFlR7n5MumaMcD1+2M6qy6Zospw+9L4zMBBcLUoY/D3KHvOsBohU+/kJTBzx
         sziZnz7l+2hW/W2394yH7VJC5vAUEJT7WjaK5Ilb9ZsGO+Yv5zJfmElH0XeoNIDQ6iv9
         aQ4neJYvacwmp8KuxwpBdQrfNcyhSpgGvlzCjwPGxaxUThwUqvd+yG1s3QAEiHOavz2t
         N2Jf//2bMxts2WASH4AvOxfwClV/My8Gbte4sXbd3MHq1Mz1xEROTp+9hr8r8PAwPYPY
         hrF4P3skTRNIS+OTOBbmoaaJn6fPs32++zuXgzS8OKPfk4PE5sIXQfMjTYqDWNvM60qm
         +3cg==
X-Forwarded-Encrypted: i=1; AJvYcCV4qSaVKHaNUvM2fhae7l55QiiL/cQlLZuek5iqi/JypKoCffWkttc447Du+rlh9GDmJwnNeSMbOJftBd4A@vger.kernel.org
X-Gm-Message-State: AOJu0YyzUpWqFHdYDM0v0Oq7fu+L/W9uItlqCjLJxXqiiZn+EKbEVQoi
	hQG+EiDCmBEnlCx5ry0CoXqcAF1cddkFlvPg/foa6YtGwr76kbCgW8L3g+QlZpU=
X-Gm-Gg: ASbGncunoGIqwIouZmyLSApEtKUvdGQzdNqGwPoSNdvH8lPlMiMcRXpeBKWI0fGSBxP
	VcR7frgLbUcWyvlm7MCcsEWQzDGgy2PFCHqJSyKE2uqE914nT2ZADBVLXz0OkHalspPDUXg9tmo
	ciCgSV8nPyKmv55wuhFDxdzd44TaJcczq1D3oG/spdlhb7PPba1BP/N2eL3G0gkt6/oKF/fdLV0
	fuSywX5e1qlZCiz9FGFCtYYWo6ODvtGot2WLhm8CEDqecxup0Q4zRoOeCNFLkZ9
X-Google-Smtp-Source: AGHT+IHLBFoByH+x3/+UFbGTSbk4/0Y+TqebI1uovZeS9UilX2qFVz7bVp+R474fEQmn407fUfgEjg==
X-Received: by 2002:a2e:a583:0:b0:2ff:a7c1:8c55 with SMTP id 38308e7fff4ca-302544ab007mr40923311fa.28.1734302662760;
        Sun, 15 Dec 2024 14:44:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 14:44:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:09 +0200
Subject: [PATCH v4 04/16] drm/msm/dp: drop struct msm_dp_panel_in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-4-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3950;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3MyLXDCoSNMrI8TDXI5uVPWdVRPsKv8qwhJVKH5nFNw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3p89M6Ju2veFlZ/qIvxPMR2hbNqtXHs3ikz/x1i9Fa0e
 q6SsWdxJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8qmTg2G5KktT4K9NZ6/f
 ez+tc0vT17pXKtLmhsY8d3jfn9FXEmvhbpR+/EjmywTRb/nLjN/8EIp6r2mt4Lxxg4so18/uKcW
 Xsm7eW9poKCzYcvgwo8nH+dpaOa8K5QR03I/URydns0VqOfJb+ff0LDjfZ+Hy9W954rv9GTl/05
 m33zLd/CNi5YZHG7ZFM1UJTzv+WHOxkm3+LSX5MMl9399XOtWkKPPMds2aaya8uX1rusp+B0+Z7
 i1VXPKeXAtEE36m6t/3PKSQV+uZo3T1ZGPirGXL/e8mGr7OXq5xNEouRKr+8y6XQ2pyGm39vPk2
 GcscN7G39zLsWnhKb6ngNLeJsbIMs28//sLSJ2/HyZUMAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All other submodules pass arguments directly. Drop struct
msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
all data to msm_dp_panel_get() directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973ebe0835c96420d16547ebae0c6c0f2..8d428bc633a9f2165651194797b027dbe8655e06 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -722,9 +722,6 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct device *dev = &dp->msm_dp_display.pdev->dev;
-	struct msm_dp_panel_in panel_in = {
-		.dev = dev,
-	};
 	struct phy *phy;
 
 	phy = devm_phy_get(dev, "dp");
@@ -765,11 +762,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	panel_in.aux = dp->aux;
-	panel_in.catalog = dp->catalog;
-	panel_in.link = dp->link;
-
-	dp->panel = msm_dp_panel_get(&panel_in);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7d122496723a32fd591d094269397a9fdd51fe44..92415bf8aa16655a6cf4f7d6f8a5896275edf001 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -475,25 +475,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog)
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
 	int ret;
 
-	if (!in->dev || !in->catalog || !in->aux || !in->link) {
+	if (!dev || !catalog || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	panel = devm_kzalloc(in->dev, sizeof(*panel), GFP_KERNEL);
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
 	if (!panel)
 		return ERR_PTR(-ENOMEM);
 
-	panel->dev = in->dev;
-	panel->aux = in->aux;
-	panel->catalog = in->catalog;
-	panel->link = in->link;
+	panel->dev = dev;
+	panel->aux = aux;
+	panel->catalog = catalog;
+	panel->link = link;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 47c1d349be470b60596b64a7bc8c7c39d2e8fdd1..4906f4f09f2451cfed3c1007f38b4db7dfdb1d90 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -21,13 +21,6 @@ struct msm_dp_display_mode {
 	bool out_fmt_is_yuv_420;
 };
 
-struct msm_dp_panel_in {
-	struct device *dev;
-	struct drm_dp_aux *aux;
-	struct msm_dp_link *link;
-	struct msm_dp_catalog *catalog;
-};
-
 struct msm_dp_panel_psr {
 	u8 version;
 	u8 capabilities;
@@ -91,6 +84,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in);
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
 void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.39.5


