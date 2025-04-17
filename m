Return-Path: <linux-arm-msm+bounces-54583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D6A91192
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 04:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9404E177CB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 02:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB67F1DB361;
	Thu, 17 Apr 2025 02:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA7ZzGf4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A141CC8B0;
	Thu, 17 Apr 2025 02:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856038; cv=none; b=XZaOykQP1vTS3IKHvc7Q1trGvJuWEgUm+soq8CXtjsUG5YNSYotdEGco4qiFSTxNF3c3bfQaJWhyZ/Q20Qk+ErltKH3J/Kywo94m8Aj35sRHyZZ8MEnhr22MnluPYxulPepIot4oXcIRyw9x0WjEjpanvlMrRH6wd75EOdN8Xnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856038; c=relaxed/simple;
	bh=7/ib5tCCZMeV+YTJlKqRwyUC+aTwtRQ6VJFeiDg5W5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=maTjeMcEObmPNIK8U6OgL55uoRfqnG/PNkIwYOg8fS5dtBe7BK27cOaOpURSozvci059h08T70PODMhwHYxhjdXy5NmoEMX4TAXB68StDvJC123Sm3ZykMvULs8yxyuMfPWozqQj1MnCpNZ0rilTyH8hGp1S3J1DUSOaNZBl9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA7ZzGf4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edb40f357so1742375e9.0;
        Wed, 16 Apr 2025 19:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744856035; x=1745460835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pjqs00K/es5vuuaBVD8LAsqW6UPYNiv4vD65jbm2oo8=;
        b=VA7ZzGf4cIK3VJLxoNnJf17uzJc5uxw1BXPc7TOgwp6jR+nb7infsxmIp0kJw5S1HL
         UomawTdg7EzxJKZNQm3bNSpHAsmgqaxDn07rPpXaT15cb3jW+8bOVWZNFgbelV9F+x0G
         3vXpzm17TWFxdrQ46JXvCRXD66br6GWVjtTDNbPqjAKMuHFXFHbkSOBcYctgnh8aqx27
         hsuR40BBPvdRWlfVOBreocKsYP+hbrK2pJWKJJ8iiID4h9HhCcPfpimp3ebmgtrfyj9S
         Sb86KQiBcCBeLoDis6eI+VwfNVGYREKMpven5/keVD4puacSN7QbBi98vAjCSYBhsjfp
         wx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744856035; x=1745460835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pjqs00K/es5vuuaBVD8LAsqW6UPYNiv4vD65jbm2oo8=;
        b=l+7gfBU2TP7x7bSc9RADYOpu/BwcOpKJT5VCYn+ePY3u7P3tFv38uy28BYS1P5ReEZ
         HEdI+ehwa23QBjwfDzsiJcYmr8jFzshKIXJ0Jq4eTGJrxy4XbKEblw1wtEMKTTcUO0Er
         FnGwAzj0vdln16NtH8BqupLMnulhioKulik+tirFZZmxORhqWcUTwMuYVxvheqUqTnDZ
         Tz/tcfcKVj21HidNM6UNaWY5+D0kULb42XLD7ejILyGSzdg/sUzVUbO693jndZFbUgbs
         RlgE2tVAO8r3ITOkPRIM/yJctQlg6FvmyLwXwZ9ZR/gqs1QnRxG3YmbNiTVC2LqPPsxz
         ywSA==
X-Forwarded-Encrypted: i=1; AJvYcCV6nunkWcVGk/Q0mUTUN5jAgiUyS1WunBkeNxC/5hqwQJKWb2Qf7AmB3QccxnFGO5wqYXW4MJLv4MU4sHML@vger.kernel.org, AJvYcCWc9+tm52jMNJLAIolHn4cQiKGBiWJSB/e4uvoeeKZy1zMsKwGaXfRpTLd0NZuJZiPBlEXLdCwMHl9iial6@vger.kernel.org
X-Gm-Message-State: AOJu0YxiF/yKDhlM92Ih5mkoVdaRULOVZ6R45FKmpdVEIEDg0SLqJgws
	q3ZMF4T3r3wFxPIW4nQMUyO5N+5hmBrnND4j3rNyXGmvYh2LNyk=
X-Gm-Gg: ASbGncthsL3gcXOanqCiihP9U4RMAslwI5H4VrPDpLl44w2pP0XVMppFa451oX+Bqsv
	eVrbYWfp1j5yItGgl7Xac1yJolPFAUwxCx/kw74wE1Q1X4mYPezsu/ncQ1WHAcA3NOCFHWdDx9M
	NkHquijxP19EdgLt3H1LXyLVAlSPAyDQ22KI+eecTxQHPR6u87X7RJzvAzjkxNYhNHDPl0e4HAR
	lC9tuyZJVATIUj540Cz57UnYJ//DmUdL3L9XINV1A/+WqF7EctS8MDP572vxL9uKlwTB3T93/If
	nFCq0GD73aBp1V8msKhAJ4zjcpvEU6Ugl6E5Wz+7D/rUl5crQA8yy1It
X-Google-Smtp-Source: AGHT+IEr39c8D55+uEn9FSHRIQHSmdOqsYNb7pAPfA4vFCRFkBK/jkVX9f8a5d30XVrtd+wA46b93g==
X-Received: by 2002:a05:600c:4e45:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-4405d616b5amr38046265e9.11.1744856034620;
        Wed, 16 Apr 2025 19:13:54 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 19:13:54 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment for LTTPRs
Date: Thu, 17 Apr 2025 04:10:34 +0200
Message-ID: <20250417021349.148911-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per-segment link training requires knowing the number of LTTPRs
(if any) present. Store the count during LTTPRs' initialization.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
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


