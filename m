Return-Path: <linux-arm-msm+bounces-39830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E4C9DFE57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F651643A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8733A202F72;
	Mon,  2 Dec 2024 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtPEpeeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745A4201039
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134033; cv=none; b=E1VPMXnOc5m+/L8tqgmZ0FErO7roQysv5c/a9cWlth85W/vXI0+91lTIPJSKfL1VS4AL9pJI2qKUUG2Y3gs2vy6r8o9BGa9N2EtImW89yqn0k6PaKbaRqSggknaxxPzAioTYDMCJDpp5BphwRnciNbh6z9hoSX3jXXNkkr9d/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134033; c=relaxed/simple;
	bh=hDpj7vY5jvimaiQwwIUKclDnHIm8+qEsXCeipWGCjes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I62X2yVirzOe/mfe7YS43H1i1+4F1rYGPS/GYeo8+pQ8piHmdXBv+O8Ca/AvSa94D24LTVnMJ/lc+uAo3MkIjHS1SxyFtcLhrtDTfyJc3Fq6Jam2d1aoftSXDjn4EOlU0BS7NZ2YV38ZkBcwgUx4KorSYHy0gt4TneOo2D1GFqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtPEpeeL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso3933761e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733134028; x=1733738828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHRYPd5A4NgreKRdZCJAPxaFkFBdQ1h5Bfa5TPxM+bk=;
        b=WtPEpeeL7oR2A/Fb6C5yemRrm7mqYzNfG++2g5xquUHGKqghrje6zuZ/tGsMmisjpU
         e+J79MMhhnaRnUwuAgQk55LCGDzHhDy7pRsg+Cu8LVi7X7o/UnsGixLutbpK0A+K4R+5
         hRgM94xlGwyZiKeEKSAXfvT3s7c42rPiGaHLujMZ6F6Az7bbGzERGfRZg5rz90Xh5yVE
         JR2pTUQWB+2Dp5jJr3ssNOO9L83Og4HeFYAU+5qJUFXVKUY0zY5qBzsBFi4RfXyomdZn
         PZp81fV2+VcGy0W3D9g6qrAC7edJ1vNOLxVW13x1jr44oIwF6M2PUG3eSPI/DvGZY+WW
         tqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134028; x=1733738828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHRYPd5A4NgreKRdZCJAPxaFkFBdQ1h5Bfa5TPxM+bk=;
        b=LHrvI/aeQXKVqF4eRYOLG0DJ0HIETnM2Cw+iJjHyq6+kMvsDDlWO70iWzvXoI1+ux9
         CUeLLxBTa8g1II8DO0dbO1IRYdnKwJ+iNRuQbcXmbMzt0FbQ6PmKiLAZuPw3d7l8tWb8
         L7KBiSy9hQmLpTiLVcyQhz5hd9C9C14xCLsc8+o5Yn4p74RapOS7XUIQvcySCCIBylfA
         f0ewPmbWwCF//N+ak90qtkyoCqBrM3h7Vic3vIPKtZL7e0nflN/SozdgCxCJu2EeI4BV
         inQ3piWFZAL+e2dPSk+IYiklZ82PfBsI88PvOtLgb8XuGhzn4IfFB2gCeG2z5eyoaqMi
         UXCg==
X-Forwarded-Encrypted: i=1; AJvYcCWNUgKbO+0KpBInOxC4XDGNBjzFHiLDo9WnGzhAL3mhwEf+ojgb7n4OLM1rxRi/oCSgZMTScySC4j5KyKl/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7I1RYAvChUkLCX5DnSScZYBa38NaG+N9furlqCVhrDZ+YqaQn
	n+yJvUU//TwWSE6i0EQ40nMjh947sZbA9wPEHMB5tSiuLTBP9Jc37j+MYr67+pU=
X-Gm-Gg: ASbGncudOR/txu6lfVvHpDAdM2o+a/cTe5UVZFREdbK2+itWRtRLch7oDpBfyeT6tPa
	RyzENbLqYNLigwWYWqCDoGQ5POl+/FNh49PplAiiUwq6EBSwZzu+yNQ2oVP0BsAiUjENMY17l3c
	fjCe6pv2YsWIJsCLNVK2KSKAkwef8cRlCIIIB/BgHYQlHP7Qs3AAGJVhn6bo1zma3AYn1VNIcMj
	zhGiQ0v2S1tBFAPOrHeEMnPSp0v+ABTafMYjtfuLBDKLEzAlx0YoSQFkA==
X-Google-Smtp-Source: AGHT+IGFQ+tjS81xvDFCKlpDg7emgbUGZasiElTcowgmlaHXlpKkPeHfN+l6U0RcX0Ld8NISce3YVg==
X-Received: by 2002:a05:6512:b97:b0:53d:e8ed:2172 with SMTP id 2adb3069b0e04-53df00d71cfmr10971553e87.14.1733134028463;
        Mon, 02 Dec 2024 02:07:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:07:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:43 +0200
Subject: [PATCH v2 13/14] drm/msm/dp: drop struct msm_dp_panel_in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-13-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3781;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hDpj7vY5jvimaiQwwIUKclDnHIm8+qEsXCeipWGCjes=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYauBZKl5PS9wkKoW5I8AIY3aHaHU+G9eAu+W
 LM9zxVyQ4iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrgAKCRCLPIo+Aiko
 1bQAB/4r8Xx7b3LO9yJdmYhEu3ZSMxV4udShpzlyquTlR2vuGRZ5CTPvU+xdQk5ct3kltbDKu/+
 2TmaBmGoqi0VrY25UN2hEmswOtlee1YBEobixLUfiA+64jAW4nd4i+Lje5xb9bYSFKD0Ev14FrM
 xevfNYGI7cfizQJLkXWPS08yBiZVFCwLfmRpBgEGH5r4iFJOBinDOzxO25FPe/a06YirWC8vPWk
 epnRzKXHU667G3MbKzmU/Wpa6es5ggieU4JHv0LHQJI6r8kQRLcHthmF6MnjnWKXMLkxb21OHds
 KauNIYCeU85JsYPuWYaZwiMVy+6TPgpbNgEI8EJ/l5rIt2LI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All other submodules pass arguments directly. Drop struct
msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
all data to msm_dp_panel_get() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 72a46e9e319486bc4ec1f5c842d733bd55ce0a67..8f8fa0cb8af67383ecfce026ee8840f70b82e6da 100644
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
index 25869e2ac93aba0bffeddae9f95917d81870d8cb..49bbcde8cf60ac1b297310a50191135d79b092fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -659,25 +659,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
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
index f305b1151118b53762368905b70d951a366ba1a8..a4719a3bbbddd18304227a006e82a5ce9ad7bbf3 100644
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
@@ -94,6 +87,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in);
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
 void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.39.5


