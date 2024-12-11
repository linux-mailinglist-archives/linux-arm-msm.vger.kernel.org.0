Return-Path: <linux-arm-msm+bounces-41605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794DB9EDC22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DC1D164A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29385203D78;
	Wed, 11 Dec 2024 23:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQV0vO0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665F203D70
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 23:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960544; cv=none; b=XGyEs801Sxd2fVhVE9pEdJWSqmn2WfnINrbsyyFB78uxE6OZxDGl6uDkmz1Zppm4H6dHV43dq+Q57JRT86olApD2xCdw2xADVHmS3qOLhGwPfJZCWGhGKA+/UvkZLdWWwKjqk9uLEA4HJjd+g0JpRBF2Zu4S7SfThj+ej2H00jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960544; c=relaxed/simple;
	bh=MMvFCqfALU6wJGnue5h/pJv8DRZdW1yevlezkUKG1JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vw1F7UtBx+wBHsoroV1xdbmz3K30zvZjUlvRBC7hYcg5i29Hs3FGNP2x1leGtifcF1JZNa0m5bEPw/z6463soE99ubC/sEj+rDuZF4FD639tFVK692UKNi2TET7o3W/CLmuqItCdT/grQLO4TJC2b6TLCcsC9P0isZduOqI5tew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQV0vO0G; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so5137e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733960540; x=1734565340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qE7GDtRTStTKn7zTKbCKRrNoh4JnzGeSHWe+F3Oy/c4=;
        b=TQV0vO0GgXCHh0mDYr22WPDwb9A/RzJs2aAem9lPuMchrUr6IGMhhZkNMyXamzPDGL
         tgqNmU3OfyLjxZEwDJ5+eec6/yghKa7JgPZcUKXQYHXV9KFX4RzNLPCd9H0rGhiylHPb
         bzOcfPYSis5NDJGsu40t4hY8vOWNHJp2UcdXvcL0su63sQ5MeYZzHZJusaYAXm6YJAC1
         WXHmDFqFhIZbp3fFLsU1T6cm3yVE7jRXp/wvShsIS/TXEeEI7PKJiQSjK5sneBJyL/7b
         Hbap+hFfWf989+ecQLxEruGVFVQKpz3/K2XbXxvDF2wGiolrkm8PSNDM5z5ZEZN0xJHc
         JaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960540; x=1734565340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qE7GDtRTStTKn7zTKbCKRrNoh4JnzGeSHWe+F3Oy/c4=;
        b=SohDwu0uk+1ZwbdmBgJP/W5ADtxbkFtl6VL6ungkT7CGaOzasP0zIXK2FeaRUyOwp1
         pupbZqw1Ssh9fUfWxTB5TZpr81KNbTCwg/BrCfaGnfez0GdZoEhG8/feSwOYUb9O1pDG
         h7anyWz/CbTt4Uao2Gyw1EfKaDIboBdv+PN1LaTi1rHTjec1bsclXIFseDQSZ5BbBGpt
         t0iir0v6eB7V6o/jTpKARkmUfnSvMYPbZkHVTuUjpaKANK2PwRLOgFX9gOJr5xNWyOAf
         5TcJyeL9OpSwh0s6jYRQ5sUICZctJd3K3QMP3tYRrlt4lMUyFIrKIT7f8PzXKjrTAdMW
         ARpA==
X-Forwarded-Encrypted: i=1; AJvYcCX8B2jrcHO1akgAdUqCH/vZKcHYqfMo7GVCkm5YKJyDI+GD6UJdA5lVhuHrY3NkUR0IPOt/1kguo1x1ivEj@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2cfIaaBfK1MwI+jtE77g9AcGcjggQztJt5cuCQlyyDZSmcKQ
	mHmxxdLI00a/UdDGKo/4+2Ubeih5gNqnjAb6FXWCqie7Z2dhZCaBafJY7glCHFw=
X-Gm-Gg: ASbGncvhRAy6XpTj6GAbB9dj43lz/mUmczRwZjDshfbb6FctU+Ff95CjdpZA6M9obDA
	3KpEYyEAZW3As+wYxy6e70XUN/7Wm4W3YTfXkir4tfnAoR6cOAn/Pok7QblBhfp3DmDQqjnw2XN
	VoFAlc00g4VohGyJbazAQjapHTmdvIwCZZ8oEt0E8JCUU1hzSgViDXjPk9hqqFXTPehxFAyyRep
	RnJccBnUOOWMMi7WHQFoEdx7ol2fzAaOlqel3V0xsLYzs2HdwBKGdNU6UNLCw==
X-Google-Smtp-Source: AGHT+IHV/gS244rNWMbZoF7ZJs+GMe2+NwsjTqUbRwLIukPaiz09y59qS8DRvo52E+Lvw8sNNYtzgw==
X-Received: by 2002:a05:6512:b23:b0:540:1d0a:57f5 with SMTP id 2adb3069b0e04-5402f00b8dfmr475551e87.22.1733960539965;
        Wed, 11 Dec 2024 15:42:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:42:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:48 +0200
Subject: [PATCH v3 13/14] drm/msm/dp: drop struct msm_dp_panel_in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-13-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3830;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MMvFCqfALU6wJGnue5h/pJv8DRZdW1yevlezkUKG1JM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM5JfTAka5yOe8WD4DIrb4G1HNDkAAKSav7k
 WeZp3UjeNaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojOQAKCRCLPIo+Aiko
 1YRMCACWvpBhLFtz3kgiXuXfdW5Vh8vyZyOPtkS+ev+stKCA26jNaowHDR7ccgmYyhCsV5k36Nh
 W5KSKNDGUa06xBZkdMoUuUi96CHTTJSgZC++C3O85o5TxznHG1E7ynlDkn5sPXan5I9JxOnwLcD
 KibsKIQz70ufHCaBFA80+OEZPrS1Sbs+j+N0LLVSPGOnibc1K+U3QOqS5YvytUwUmg0saa2zvlL
 USzFu3om+M5Vi9HLlj92q8RkKH4V9CEU+2yWSAYNa/SFgruzOkmFvx89uquBF/yslrl0C11Qvij
 VroT01XOwxDNY/xU4MUo31anFZFGe+PX1Auw4uJq4BmAq5Tf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All other submodules pass arguments directly. Drop struct
msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
all data to msm_dp_panel_get() directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cb02d5d5b404925707c737ed75e9e83fbec34f83..a2cdcdac042d63a59ff71aefcecb7f8b22f01167 100644
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


