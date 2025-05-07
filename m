Return-Path: <linux-arm-msm+bounces-57200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C60AAEEEF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 01:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65755169928
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 23:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EF5291899;
	Wed,  7 May 2025 23:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVwUwUJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C673291873;
	Wed,  7 May 2025 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658887; cv=none; b=TyvWTT3uQeo7UvT/5xLXe9n/FKY0n7fxrlkUFfh0/juljFIxRC7WlytwCh1aM+nzh/2ZgBteQlh8ty/pL2A7vB5Ir4+lQ/mmIz9lmIh/u4k/DkighyD7SghwNHe8mJrzvp6MUEHz/rexj4hpFR8a5xIbUgPQkku+SEaxAN1nF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658887; c=relaxed/simple;
	bh=5LWZAlBlmyrjEYNRJR31J7AejGgUYHx9K8u3TxXYFrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlK7R6TqjaJqSnUPydzHPjtkQ002YNDFYtGkSUveNQCK25RP+lNZxjeU4cbD694m+gRJn4tKp0O4UQajm8fElviVf9Bqqa8FKDLzAnpBRgowWygXLCIIm0zUoPAvCav5Yjz9yfZdnVrIi1vLk1+raQhUBOWnn7WvKJqephSA0Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVwUwUJy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso600160a12.3;
        Wed, 07 May 2025 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746658884; x=1747263684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxQS7tOaIlzd4BMqHG01qmudk8XV5+9z00a0W+A4Kng=;
        b=HVwUwUJyJXMMOVhpi8KnxdZgOTkkmyoiDTrrWe44mnQhN2Pk0HWuJ2BBgumcnGfEYa
         WtGh8xNr6ZCdzkwsXgiVjcdSllZnaNCAy0lYYA193A6gJD7AN2svF4aJ5LLpqhytdnOA
         BgPgZP5EIYfQw1Is5Uj1wGDeES223AnFuxqnPxUSVQ6W/TV4uL/wqQfsf//9vxaKY41f
         5f4yg6U9IvkYTygkaVWEfKt/QdACZ0PwoNwj2WD90KfQcN7OQIxIfse6Fcyp2T5i1bhs
         +FgUZ5fxpxxExSFsDPGaX7tQ62mD47QEX3mQaa+lP1RCm+Pz7xMJUAATU4Hs24f41Qp6
         92yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658884; x=1747263684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxQS7tOaIlzd4BMqHG01qmudk8XV5+9z00a0W+A4Kng=;
        b=CcmuJchqU8ssC8NRoPRWm36bmZ5Y0ro1/cJdg6DIj853YF27bHIfD33D9BQkrJujqO
         CDR6iBzh5ezo1gR2i0lfHlWLopsBiBKlge62pveEW5zqYbtU9gsTA9qoniIsPPCEaseu
         u42GAhYZ1oOUmeRb/Wq7DfcLPkSlqUAmlfowKnmhpefmeF5yxjO8cKPtsT/pAv2qxGSo
         4YFoNzSWTxj8hsgeCDdzyuraBmgP/kL3GV36Z9QmMCPj6aeMhiRqUb3qYUX6lJ53SuA4
         kgfakKTyf1O95OzCa7NJ0yICiTlhXJZsm9m9nIHiiEiIgx61cKlMp02MLus6gIyBox8X
         esew==
X-Forwarded-Encrypted: i=1; AJvYcCUbeROicxdbGKu3Kf6jTPKl/tH1QMDG5zLz68q1CqUGD5PWN5jB63jsLHrNdzxQin3qwhXs0PY+fZ94FE6r@vger.kernel.org, AJvYcCVF9GW4Bxuol1KRmFHGzq2lk5nXp9A7Ehsmt71X3vNaX8PxJh0pTBlhnDqW0EO6Gj88o7olnywfl+DzHYAs@vger.kernel.org
X-Gm-Message-State: AOJu0YypW0ifn/mcXj0NQvD77ExYx8KeRj/TGr3FSbJ7uNWBdndQANwu
	v3lBb9NMn9QJ+Xs1MzbIX8gU8lyXdSn6E3dF1ZU6IE1mQoXTQus=
X-Gm-Gg: ASbGncuFcORDeVJ3sxm4722NFHphki2m39n/uVvgYuWswSEw+6+jW4UBgLhz4Q/4Wpu
	MTcoRTr04uvE8A6U34LyO4rbbSMKI4etlevfyI3Uvr/7v0gEcIM/dGZC7SgtDhThVkJH/XiOVR2
	VsK0vIW0OqbvdzGplhE75KTrS8aAweMGKcM+vmuESQgTlwgY9L42v7yIWz9QxqxMtjp0ja4TY8l
	+ct0Jv06d5zsrKT7CbQREmtZ2eexBkUvgcJ1/tc8w9MzpehRAEdkvemkZa+LehrIxZWoA3oPFdh
	3zOcLXPECWNOHQuazJZ2xBxPmD87UA4cLV6jcuaZVhiESA==
X-Google-Smtp-Source: AGHT+IEyX/wcOP+2S5z9Ne55o2Yz4W9nj5lYP3VfA39BdFejfpDFFTAzXqQjqXit0YuAUi1TM0lHtw==
X-Received: by 2002:a05:6402:1e90:b0:5f8:357c:d58c with SMTP id 4fb4d7f45d1cf-5fbe9fde8d8mr4538375a12.34.1746658883762;
        Wed, 07 May 2025 16:01:23 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:01:23 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v5 3/4] drm/msm/dp: Prepare for link training per-segment for LTTPRs
Date: Thu,  8 May 2025 00:59:01 +0200
Message-ID: <20250507230113.14270-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507230113.14270-1-alex.vinarskis@gmail.com>
References: <20250507230113.14270-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per-segment link training requires knowing the number of LTTPRs
(if any) present. Store the count during LTTPRs' initialization.

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++------
 drivers/gpu/drm/msm/dp/dp_link.h    |  1 +
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5c57c1d7ac60..ab8c1f19dcb4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -367,16 +367,21 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
-static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
+static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
-	int rc;
+	int rc, lttpr_count;
 
 	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->link->lttpr_common_caps))
-		return;
+		return 0;
 
-	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->link->lttpr_common_caps));
-	if (rc)
+	lttpr_count = drm_dp_lttpr_count(dp->link->lttpr_common_caps);
+	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
+	if (rc) {
 		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+		return 0;
+	}
+
+	return lttpr_count;
 }
 
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
@@ -390,7 +395,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	msm_dp_display_lttpr_init(dp, dpcd);
+	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
 
 	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index c47d75cfc720..ba47c6d19fbf 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -62,6 +62,7 @@ struct msm_dp_link_phy_params {
 
 struct msm_dp_link {
 	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
+	int lttpr_count;
 
 	u32 sink_request;
 	u32 test_response;
-- 
2.45.2


