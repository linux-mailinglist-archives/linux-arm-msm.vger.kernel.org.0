Return-Path: <linux-arm-msm+bounces-54581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA2A9118A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 04:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BDA43B905C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 02:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F10A1C84C1;
	Thu, 17 Apr 2025 02:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsWncaH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE19747F;
	Thu, 17 Apr 2025 02:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856036; cv=none; b=AGOL5IXs6BLRpmxKXirpiTTS5xSLSf6VeDRO5BiRWIKBTejkKTbY54fy9TqF8zouUE0b1B88RPNOeHo8Rsko0IHh4rT0dg/rnFlLJZGciATB2w7QYjmQ7o2jgZcZ09LEqCQDprsThzVrKChahVZ1Fkl2hgtRvxvb4Uuyv8U4oIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856036; c=relaxed/simple;
	bh=LAS8y6RQEU7U5RNx9S5FJG3mhSf2SFRYYNWPG81rDKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBRB4GhKHn5q1q8Qkhgdbw8jma8aq5GVq0DgdT1R43/m0yjca55UCuIZ4yVumIFoO+M7i1SDgCJaUKBO+4iZE8rvoIy1DPBZgK8ftES8SwpaUVuk/KiiV8K/rDB+3dGgDFEgpHOPRStQOxCVbRaaSIkd76K6aIwKzZ6bJvxJ37w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsWncaH5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39bf44be22fso153497f8f.0;
        Wed, 16 Apr 2025 19:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744856033; x=1745460833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5DHHgrjGd2rCCjwjWpNQeDoT3BghQC1sBR2u4Y5ESY=;
        b=BsWncaH5q5xFTV7ig/zP3w8OTuVJ/SpF199GNs3vE7iErwhOBWEiGYjwN2VctR8xrv
         lQzuT1UDjLPo39MyxmKFLs9MZIb+IhtT66e17ix6Ne9QYiLSua6fMt8dqhVGLgar5Ttv
         f7BDUSP3LmVXbP7qD76oEwI9RbEa1pAsAYWPX4XoEwMf4ePT7fb24KhgMTnjVp6HChK9
         7i9fg6sXlnpKT82Sw0mlm1ocxhYw1DtdMtOAvv8zdZ1MO8oJcEzVoPMjGQuI9fv30e6r
         9PYTCbAxXb7gKIifziheZ8HAZQyZMVKa0PC0xqhcs2XObhH4Y6e5gPmHxT1sps8ND98f
         tLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744856033; x=1745460833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5DHHgrjGd2rCCjwjWpNQeDoT3BghQC1sBR2u4Y5ESY=;
        b=XsXFxblaC4gSnJ6SgYx801A4Cn+b6w8bZOga1jCUdBYGXmVzS89bkJhORwxmKfBDAE
         YMOrmc7f1b3viJLk6Of6flu9sjXdO7QZtoGW03Z8ADfYa/pDm351U2NxZLE20B2EvqgO
         hWsdZ0EuqR070fyP72u8XYj7lBPZZSBqLesvrh7DbWLudfET8b42JSFmqWJ2KhuNbfrj
         y6nBA7h9boULW+il/02CkGf/Lrl8rETiCi0LcizyUpxNPGN5WwntbRgcT//A37dRb+eU
         9C9/Mb986ZZcwHhiueZhMbh0Rjm6tNqPw2Zok3HFKWFM/DXgJWuHPNHJLMngBB/k60Tq
         OL5A==
X-Forwarded-Encrypted: i=1; AJvYcCV87EDbRwaoIHxWmFm6ZKAsfj0+xCjRRl5e2ll7tllzyWWbL3Fj3kTWgsH7YoQdCrU2Cu4Q7o2wI3z2wTYd@vger.kernel.org, AJvYcCWK9DaiHX0PO8Y7jk0bLPwBqENN3PN0rpMlkL2aYtvk8Wy5U85FJLkEGH+cTRDeplxKw8XCqphTuPviifa6@vger.kernel.org
X-Gm-Message-State: AOJu0YxNu4KrIpGesDcQi6sPDT5gvM2iDfaBZCwA5AiKhxGYaaw0h8d1
	Eh2vKiHi8E0XqatR1sxlyITnpOPbFtM5+M8cA5iX1WCMI65gGCYdGhX1LLg=
X-Gm-Gg: ASbGnctglqMasc6iR+fy2wEpfEyyTKgx7vbKa7JqAITdK08szhi3VmJp28so5VQeysx
	bFjAHv+6M7mOGTFz03NXUYILNuT7Y/sMRAbtcfgPfOLCji0yX7RRedqRM/hnKPV3F94kOi5UE4/
	sU3BVOYzpkOSzlqC2oWe8M8A4ja9qjXub2a5VRagqs6KYiH/dPFSFoX9SpM/hUk6aa/Boh6dU5+
	6JzQt8E0vg7Tii0QqYy4q+N05+G1yysW/tUx77HbxI8CodSO89N1EHryTo76A8kk7/mIlOmxbMI
	nTKZ+KAnRbffJpYDG4PO7ZS64OGIuE9A8Fs5yyFcoi+H1Q==
X-Google-Smtp-Source: AGHT+IGzrdbDSFpnoAxT/1N2SrlSqLje5cfHVitMqyyo32g8ydOGWS+ibmmSo/GsALjZ4OmYeGNfPg==
X-Received: by 2002:a05:6000:1acf:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-39ee5ba050emr3472141f8f.56.1744856032524;
        Wed, 16 Apr 2025 19:13:52 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 19:13:52 -0700 (PDT)
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
Subject: [PATCH v3 1/4] drm/msm/dp: Fix support of LTTPR initialization
Date: Thu, 17 Apr 2025 04:10:32 +0200
Message-ID: <20250417021349.148911-2-alex.vinarskis@gmail.com>
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

Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
(re)read DPRX caps after LTTPR detection, as required by DP 2.1,
Section 3.6.7.6.1.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e..fc07cce68382 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -367,12 +367,12 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
-static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
 	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
 	int rc;
 
-	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, lttpr_caps))
 		return;
 
 	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
@@ -385,12 +385,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
 		goto end;
 
-	msm_dp_display_lttpr_init(dp);
+	msm_dp_display_lttpr_init(dp, dpcd);
+
+	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	if (rc)
+		goto end;
 
 	msm_dp_link_process_request(dp->link);
 
-- 
2.45.2


