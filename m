Return-Path: <linux-arm-msm+bounces-56178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F32AA3EE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 02:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC056926F1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 00:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603711EA7CF;
	Wed, 30 Apr 2025 00:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koGuSrxO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E81E9B29;
	Wed, 30 Apr 2025 00:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972028; cv=none; b=dCZreAvZvP2Oq7ZuobeC/1RjOBQO5DVGEikERO1TdJDjjQaFYPLTB0vOEePadVDvKYiyaAIBwyanuhPegpfBT7+BSCE025hxM4yzExFS14hAFqkZXiaZbKv6AlwWx+xgm084VkeCtMtD2XVGA45l3RysA7JqPIu8sRnj0vaJuNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972028; c=relaxed/simple;
	bh=cMW/d5zwmtbymssSMD/70ErBzn6h68efLwDo+MGZpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q600PwHSfJ1OYHEerTtCPU82/J6pBSvMWXOl1AUVX6Z5dMYnANloT/H6u215QA33EJuP+ofbvmRAI/O7W3QP947+0zjr8aEwk1XgDgec27jGPc16VdjruZBXGCgFrVMlq8VTbYH362kAn4XeciQ/k9eSsVki9mHp+2vw2cXWako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koGuSrxO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so6099628f8f.0;
        Tue, 29 Apr 2025 17:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745972025; x=1746576825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogvjWHhGPza1oW9RrxL7y1JXsXzcr7Hp6fzi/vCOoIs=;
        b=koGuSrxO3bg3WtMwWoqaUL5SNOih4zuK7M2jaIduHWf5aA3wni+5JhCXZs6Ta/W2HL
         xr0fZfQbG/vP0nOMPGx2R0GzmA1vmCzBrFjrL2S54KI/Zap1AWbM1Q+Gat7fOM/au4Do
         rptiC3y27myYhjwvqlkfmFPTNTZqgdwzeDTXUzQFpg9lRO9OI3ps2smsaPAnvU+B/ZxC
         dYbxPQkpy3KAP3tSVB7X3NbbRzETqm7pVpnPs3Ga+SVjM5hWsNUHYvttSB6DUiot+7zW
         lIpjQHEhZsPqazcFBf/8ChPkzXXtSPHGYowpi3eq41fgX8o+Vhd9/3gZMNNVY9kNmso1
         ymaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972025; x=1746576825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogvjWHhGPza1oW9RrxL7y1JXsXzcr7Hp6fzi/vCOoIs=;
        b=RK4DOS8GEDqq21LsZh7T+W+UEqk1KcPLxqjhXk5grOcfmqZvz/Pb6lW23ilansWqgp
         pRS0U/L6Wg8u81K6lYvus3Lfbqs8eWwmcJdU+c9LxogooIcnpPYcrvGhp1CKc+foe3L7
         eYpAKYc+yleEql04O37cjuclLKnhKUqGqwH8ZAURyV70SN6xbHaOc9XPhzsdZ1vNKpV1
         /S/cTehHF6kziVisWI67HXPQa/+b5tCyQHXdnUwUn41wGj1FfjCVdtsXwIMQ5VH9nj0z
         2Gj8TiXqDTQoRfoSA44ShV08nQ6Ml8tODpc1hzQrUhK17B2wGcWthY2B4I085BG+w6TM
         9Vsg==
X-Forwarded-Encrypted: i=1; AJvYcCUkh7XpLYsi020tR2UxWudK4W+xpLEMzQ96QYaqSl1njK2ZubjOWLoYd4RUhxK9j8ar/aovvoUpLoRr05j/@vger.kernel.org, AJvYcCXzRRL82/fgOmttEu6p5TRaUOcnH1KfKNm/79f2xnTkuJZ38NsKEAFB1+7u9uF8pZ331UKFsp1eOhby319Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzEm2d1BoQ8BIAetXSHDU5mXukjSkqOmvm4s0/PsbDOyKl/Y2gi
	xSNEN6iOgbE2FxvLhVV+i6VNWT34/7cJTCU3YB6qvmEkggN7Picz/xeZwXm7OA==
X-Gm-Gg: ASbGncsC9xIFHatQLsdl7PiRX87IxsdnCGWx4ZJu9FPklODNENcn81AYeYszxWocDlL
	Oo8PFV/qMhNLAnFa5fPjyE5gCKwa+SBnehL90GVLlfT5HNDgL5GkN2vZXJ/YIDE8M9V8FprfYxL
	QsHq6/zyMlbXnObaJFXkL+rVeKLcLOFEPsUv4hHJ4O+5A1qk55Nhp/zKqsut8KFdGg0FAiyDXKW
	PB2BdrFd3wllCA7jWaMBLoakF797vPoINucb+wK8Hu4kWLQCloRJk4UBI8598mfiAV+lJIh8MV1
	r5gjujdM603g05AU0171v2YyhcJe7EAz1qP4p6bW3TOjjQ==
X-Google-Smtp-Source: AGHT+IFbQKEZ1AFrLLICetRLwpCJ3U1F+Y6rOZ+74zS0wzfxC/yOFpgNCU3Mxk3Pm3a0L+3jljE4mg==
X-Received: by 2002:a05:6000:40e1:b0:3a0:82d4:ba90 with SMTP id ffacd0b85a97d-3a08ff377d4mr346265f8f.21.1745972024700;
        Tue, 29 Apr 2025 17:13:44 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da4dsm15574565f8f.99.2025.04.29.17.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:44 -0700 (PDT)
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
Subject: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
Date: Wed, 30 Apr 2025 02:09:44 +0200
Message-ID: <20250430001330.265970-2-alex.vinarskis@gmail.com>
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

Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
(re)read DPRX caps after LTTPR detection, as required by DP 2.1,
Section 3.6.7.6.1.

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
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


