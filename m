Return-Path: <linux-arm-msm+bounces-56181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D53AA3EE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 02:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3982985C5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 00:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C320A1EF09B;
	Wed, 30 Apr 2025 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyVgOAdS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625F1EB19E;
	Wed, 30 Apr 2025 00:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972030; cv=none; b=g9+xIBM3TCrerWi0uzQtzZoKH64jX17HymDEZHcsGNyNYxQXW60Cru9jD9m2mGUX6OnGGquiCfM4s4JLLLgpzA5JFi4S/BEFdtDweQFZLi3LA9Rd6EWZCxjAFNjeuE90Qfh39oO73CItS7tdn4+sn/lsRM3TD3VJt7ZODPzoEfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972030; c=relaxed/simple;
	bh=YZo3X7lFPCHO8uBKKczS1I4rHacQG5bGWHRVSN8JSow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgaIw1c3N+Rqz2xGWtaVGnQK21qgu5WxjvkdaPgg3n5aCp9CGI0wysbqjC156nnJu642Urjn8kpow8J6ETT7DH+cqfp0VcF/Q+jX7Ugrx7lNd7Hq5EEimUSOImMa4NqkXbCOhIyGAyWQiJIKayv4TbQv9CZ/pWHHXqM4yULlixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyVgOAdS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c14016868so6887006f8f.1;
        Tue, 29 Apr 2025 17:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745972027; x=1746576827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEB780BvllckSDDuGiIZTMDsI8i4DHX4hYOyJXmgN/o=;
        b=SyVgOAdS7EMvTJiDd7lkscrNan/Pra5mHqGT9TRSZOrWPeWLGFYZFTSvnRMBsJdj4u
         84CcH1GosxMFhaAYU9+w3T52t3uBk0O4SghiZBr1yj+Y6S3+ms+qbxriJ/Z8wxIVbENZ
         kzW405bGgUebAGo8fkr9rjK4lMphPWXR94tuhKJuVJwSxVT/tLsN7ixiuJWSPJwh8IdN
         FggS3bkqh+ckanquwrX3RT4G7Ss7BYbl+47XMjOiHEU9EO3c0VPMPhwQuSL3XPSItEQZ
         peUtTLoBxF9qQhxPnDaq0DcgvdAlc99FDkgEISsFaGiInCOfQrvPY7P/BHEJAdK624Ej
         PpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972027; x=1746576827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEB780BvllckSDDuGiIZTMDsI8i4DHX4hYOyJXmgN/o=;
        b=nNnir175QjQrW1A41lcuvLiWQThH5t0idxDffl25ifAyMffCidlBKEJeygx8PCupaP
         okqTbQX9gGza1ePcw3MUDF1Yy9S/RhaXKHVJfjP+h6vHjSgvjhfFHfyYBttg7uL5TXS0
         cy1T93q2a+v0hn8OXrTqe0Cv73G6pjuyfejIE3hDsx9aStKakiaIxs30/G38cklSRfE/
         s0rtiUwJi8l2caVKCMX7DR5SbMqmZX6UBR90MtwLQUxLcz0U/Dmh0o1AgcNbD2sDFKws
         PDlHzP2Wo6d/jQcBMcWvInZy+IeWV34ik/D2Qyw5R7A9A7SjUhD7BhJkDdwGc2h1OFEi
         XRWw==
X-Forwarded-Encrypted: i=1; AJvYcCXcFWIGLe//xakSg66ZmeMVtEAqinBNb0CKhyUpbyBjgm3jWNLFTkHi7cq40faboxJmju6dfVXXji5WaX7v@vger.kernel.org, AJvYcCXsbtSJpUqs2VA9jokJW0eoI2atb1yyeX3AZdnNYJXXrGozGZJ0Y7Yxq1LnlTuYTKCh9Oh5R78pb0MmRPUz@vger.kernel.org
X-Gm-Message-State: AOJu0YxvguPmp7dVargp/ATYyGeLD4YiSiisO/wxPTnurRvlo2zOvqyh
	HGylI0B1swMFhN3iYzO2Q+kzELDGyNxmGIGPGlYk2i6hWBXUGZo=
X-Gm-Gg: ASbGnctBb3hKF++vUvsKOp8oxxsQ0Dnuyr6D0Kq6AXYOOyF4/aZkTLinX9iUKNA3VBw
	Y3o+27rSF09XHh6h15vwwo0QflqoEbLgUxTFvfxxGrlS/YHxJY2uqyUBeSjlYzNgCKSqJcKXOcL
	0vMlKQp+8hyn6Dqu0VsXTn7dKvFjFgsW9oPKB4e9ssF+Mq2KjsT7RaRn79RWOmhiWLluV0ExNDG
	73zIfWOPFkJXTvzkzCHAzMSd1go7jQcPvDP2KeKJetxdkbthwPDOgYLhOdFjwc77V45o4OYPvgd
	VNUKqrtl/dHueEeM+sqZncTiyXm3fhuPik3c654Q4yDZkA==
X-Google-Smtp-Source: AGHT+IGyiSezCXDsWg2/kGxsNKzyHgKscgrko+ZyF3wR4mwxRBxDN49jMeBbkvKll6f3YqgfMMXJEg==
X-Received: by 2002:a05:6000:144c:b0:3a0:8598:8e7c with SMTP id ffacd0b85a97d-3a08f753961mr989554f8f.6.1745972027040;
        Tue, 29 Apr 2025 17:13:47 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da4dsm15574565f8f.99.2025.04.29.17.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:46 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v4 3/4] drm/msm/dp: Prepare for link training per-segment for LTTPRs
Date: Wed, 30 Apr 2025 02:09:46 +0200
Message-ID: <20250430001330.265970-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250430001330.265970-1-alex.vinarskis@gmail.com>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
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


