Return-Path: <linux-arm-msm+bounces-85179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40395CBC00C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 21:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7087B300A727
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 20:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6C1275AE8;
	Sun, 14 Dec 2025 20:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXEspm8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F52CCC0
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745311; cv=none; b=iuzxEEnFFpx/8EH+9fo2fT3g/yOSf9FT7XcOOiEL9M+ZY2MkKqhtUm68Frx07DS8Ec20oR3um7FrbP/JTorM3yaRjVUGyjL0nKSdIDiCGvMl2mbR/eab03Flj1pKKoQGJrBwSSFCJJ/wW/cIiVNofYq2Dus5TSTEb6anXFM02Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745311; c=relaxed/simple;
	bh=TcwMHoDEwaiNpVVENgTmjk5JwGFt7zB3QOd1uIX5JT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ISIqFZvRzgt+3o6WqNUYSMFc7zXO4lcRQ//w2pcuB0myau5NuypBnOtWOEDd9WSOBXUoZ+MrqpqgXxVoOveCeSTjhnVsvm9OHHsDPqA+9zNcpbjlbRu1qgygw9nZpoAfCpcNa5EGpsGmddR/z1Q6gviyNleuvxRSUDRbQ/KmBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXEspm8L; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso12207795e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 12:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765745308; x=1766350108; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNonSz/psu7LwKVFUVtvRRDRx4rkVmD2CMw/UAxEWwM=;
        b=OXEspm8LsVZghnxaLNr/tMHObtV7E+Dghloyae6U1I+1jHAw1LdnR3aF6f6osDT9bT
         DLR3aE+WCvnqQNAYoSKFKYe/zX653X/hDFWdvrZR0YD1/be3rqnW5BbX7ZWUHDwMgnID
         3qIz19R8OUJdTI9z8Rv3kQKtoRXZqXnTQkHUHo0ejzZbmlmHuPhNIg2EPyhhZBh3/sAD
         vW+csGhGvYE7kHOaBydMBeDGyovO4RzS9U3YX4fuofQSy9vpPzMGMy1Ij1n3jDC+ErOa
         nlfPP88I1CHMd1ltrJ/2e623xmxQ92TR2vXCjfUFBAjdwrkCfYWLIG4EYT93HATRA5dS
         4Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765745308; x=1766350108;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNonSz/psu7LwKVFUVtvRRDRx4rkVmD2CMw/UAxEWwM=;
        b=GAmEDyDtxQQiCsGJ/Lip81P3MV4jaqSXOJaBm6YwdAYUbFjJ2Y3bjqoEzrP96f2up8
         pTjXys688KYKy93EntHN/JkkxeWPktfzHpBUlj5/+q0kbVKy+hMhprJBbe3alVxpSHVU
         h/FUdR0AwvDUFfh/+t6/ymNmjrUTV29TB1MTuLke0zKd4iz7l+dQj5pLoBzR9JncycwQ
         hTFlwd7KaueSNw1u0x04qHtru6/QRanRxJyZUZb/FgJZoLUqcyvSi+b4U+1BhUf8pi28
         a/2ogoWhIFX4hoRYgybYxgXd3S0Gdfgh+jj5xIgcsyfnpuP2San6oImfbICJkPKsmUlN
         I6Fg==
X-Gm-Message-State: AOJu0YzlZB60VmDoH4BlDkaV+46SC7jVQUtXmUJSb+K5k1jbsQ8EQPdw
	H4BvuVeWvkuqVl97tBVolM4Py+0qXLKJ3mtfdO5F2YAsRKzMBjgazYcY
X-Gm-Gg: AY/fxX6J008IusAuaqRq6OnzFBX2H9Rbq2UDGCOPKpmAtL/B6iEBwH89uu4WPNHvNPc
	IqdPZIb/VQx4C9MLo4N4HSBSY3ntqKWdcMQULnrgPemCQ1q5E+1GemZMS4XD5jE7uLUwtv1ar7M
	m1GD/E5VfcRK9T64+DepnW/fb8GFCiX3SFxy6wWAIJHdxDs8nhY5uOtVCEglnfytYtdOZ4KHW7h
	Schyv19svsaCmUBrSN2qmgkHDkCsEuuyd3SwNAQAtWSLamZHOEWLKbAhdwBr8GP8rkYRbNjs+9b
	z3xDfcNi7OxPaEWmiuIDtoEDBa21UsBY+eg4JaIb1CvVuh2pvsmxO+wPm/+blei8KjUReZOUTxu
	w2Ntd4gYN/ntv1B9+bwURM/+GJYk001uKha5YY9aKRaZ89tb4nJEJjrQQM3vISWN64qydBawhRh
	yL5oN0NxqDVFP7PGH7NBI7WJAwOmEGvfP1J/m5+No4e3UGm3fGd634tn8a+KPj5ncI2gI=
X-Google-Smtp-Source: AGHT+IFBCVvj6+os8tE0zn7I5CZGv9VZPVSZHJMl/dseBhLP5fj10TprRwFuaFPRpuk7nw+hKEUczA==
X-Received: by 2002:a05:600c:3104:b0:477:af07:dd17 with SMTP id 5b1f17b1804b1-47a8f90634fmr86748335e9.24.1765745307477;
        Sun, 14 Dec 2025 12:48:27 -0800 (PST)
Received: from [192.168.1.6] (92.40.201.95.threembb.co.uk. [92.40.201.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f768936sm151673595e9.6.2025.12.14.12.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 12:48:27 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
Date: Sun, 14 Dec 2025 20:48:12 +0000
Subject: [PATCH] drm/msm/dp: Enable support for eDP v1.4+ link rates table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIsiP2kC/x3MQQqAIBBA0avIrBPSNKKrRAtxxpqFJgoRSHdPW
 r7F/w0qFaYKq2hQ6ObKV+pQgwB/unSQZOwGPWqrtDISS5SxRkmYu5Zg0M8W/WQc9CYXCvz8v21
 /3w+xqy7RXwAAAA==
X-Change-ID: 20251214-drm-msm-edp14-8f4dc65dc34a
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dale Whinham <daleyo@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Steev Klimaszewski <threeway@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765745306; l=8083;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=TcwMHoDEwaiNpVVENgTmjk5JwGFt7zB3QOd1uIX5JT8=;
 b=RnEdCGQ3MrJHIIbU35i5I0o3JLkQeHea3CMb/A3VD3uiOO0lL//YVE9vp0JMeb3O4NuwM4iRT
 MBAlvTWA7FiDQdWKuDO6ZNWqHK94C6Z0yslSnm+shkx4SWrUzUHxF98
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The MSM DRM driver currently does not support panels which report their
supported link rates via the SUPPORTED_LINK_RATES table.

For panels which do not offer the optional eDP v1.3 fallback via
MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
ATNA30DW01-1 as found in Microsoft Surface Pro 11).

Detect eDP v1.4 panels and parse the SUPPORTED_LINK_RATES table when
present.

Additionally, set the rate using LINK_RATE_SET instead of LINK_BW_SET,
but only if LINK_BW_SET hasn't already been written to.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Tested-by: Steev Klimaszewski <threeway@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  | 57 +++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_link.h  |  3 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 79 +++++++++++++++++++++++++++++++++------
 3 files changed, 107 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cbcc7c2f0ffc..f00456902c10 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -175,20 +175,29 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct msm_dp_link_info *link)
 {
-	u8 values[2];
+	u8 lane_count, bw_code;
 	int err;
 
-	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
-	values[1] = link->num_lanes;
+	lane_count = link->num_lanes;
 
 	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
-		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
+		lane_count |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
+
+	if (link->use_rate_set) {
+		DRM_DEBUG_DP("using LINK_RATE_SET: 0x%02x", link->rate_set);
+		err = drm_dp_dpcd_writeb(aux, DP_LINK_RATE_SET, link->rate_set);
+	} else {
+		bw_code = drm_dp_link_rate_to_bw_code(link->rate);
+		DRM_DEBUG_DP("using LINK_BW_SET: 0x%02x", bw_code);
+		err = drm_dp_dpcd_writeb(aux, DP_LINK_BW_SET, bw_code);
+	}
 
-	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
 	if (err < 0)
 		return err;
 
-	return 0;
+	err = drm_dp_dpcd_writeb(aux, DP_LANE_COUNT_SET, lane_count);
+
+	return err;
 }
 
 /*
@@ -1474,26 +1483,32 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret = 0;
+	struct msm_dp_link_info *link_params = &ctrl->link->link_params;
 
-	switch (ctrl->link->link_params.rate) {
-	case 810000:
-		ctrl->link->link_params.rate = 540000;
-		break;
-	case 540000:
-		ctrl->link->link_params.rate = 270000;
-		break;
-	case 270000:
-		ctrl->link->link_params.rate = 162000;
-		break;
-	case 162000:
-	default:
-		ret = -EINVAL;
-		break;
+	if (link_params->rate_set) {
+		--link_params->rate_set;
+		link_params->rate = link_params->supported_rates[link_params->rate_set];
+	} else {
+		switch (link_params->rate) {
+		case 810000:
+			link_params->rate = 540000;
+			break;
+		case 540000:
+			link_params->rate = 270000;
+			break;
+		case 270000:
+			link_params->rate = 162000;
+			break;
+		case 162000:
+		default:
+			ret = -EINVAL;
+			break;
+		}
 	}
 
 	if (!ret) {
 		drm_dbg_dp(ctrl->drm_dev, "new rate=0x%x\n",
-				ctrl->link->link_params.rate);
+				link_params->rate);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index b1eb2de6d2a7..725e08f75574 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -17,6 +17,9 @@
 struct msm_dp_link_info {
 	unsigned char revision;
 	unsigned int rate;
+	unsigned int supported_rates[DP_MAX_SUPPORTED_RATES];
+	unsigned int rate_set;
+	bool use_rate_set;
 	unsigned int num_lanes;
 	unsigned long capabilities;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index ad5d55bf009d..5f9ccc48ee6c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -13,6 +13,8 @@
 #include <drm/drm_print.h>
 
 #include <linux/io.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
 
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
@@ -107,29 +109,84 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
 		   link->max_dp_lanes, link->max_dp_link_rate);
 
-	link_info->rate = drm_dp_max_link_rate(dpcd);
+	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(link->lttpr_common_caps);
+	max_lttpr_rate = drm_dp_lttpr_max_link_rate(link->lttpr_common_caps);
+
+	/* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
+	if (link_info->revision >= DP_DPCD_REV_14) {
+		__le16 rates[DP_MAX_SUPPORTED_RATES];
+		u8 bw_set;
+		int i;
+
+		rc = drm_dp_dpcd_read_data(panel->aux, DP_SUPPORTED_LINK_RATES,
+					   rates, sizeof(rates));
+		if (rc)
+			return rc;
+
+		rc = drm_dp_dpcd_read_byte(panel->aux, DP_LINK_BW_SET, &bw_set);
+		if (rc)
+			return rc;
+
+		/* Find index of maximum supported link rate that does not exceed dtsi limits */
+		for (i = 0; i < ARRAY_SIZE(rates); i++) {
+			/*
+			 * The value from the DPCD multiplied by 200 gives
+			 * the link rate in kHz. Divide by 10 to convert to
+			 * symbol rate, accounting for 8b/10b encoding.
+			 */
+			u32 rate = (le16_to_cpu(rates[i]) * 200) / 10;
+
+			if (!rate)
+				break;
+
+			drm_dbg_dp(panel->drm_dev,
+				   "SUPPORTED_LINK_RATES[%d]: %d\n", i, rate);
+
+			/* Limit link rate from link-frequencies of endpoint property of dtsi */
+			if (rate > link->max_dp_link_rate)
+				break;
+
+			/* Limit link rate from LTTPR capabilities, if any */
+			if (max_lttpr_rate && rate > max_lttpr_rate)
+				break;
+
+			link_info->rate = rate;
+			link_info->supported_rates[i] = rate;
+			link_info->rate_set = i;
+		}
+
+		/* Only use LINK_RATE_SET if LINK_BW_SET hasn't already been written to */
+		if (!bw_set && link_info->rate)
+			link_info->use_rate_set = true;
+	}
+
+	/* Fall back on MAX_LINK_RATE/LINK_BW_SET (eDP v1.3) */
+	if (!link_info->rate) {
+		link_info->rate = drm_dp_max_link_rate(dpcd);
+
+		/* Limit link rate from link-frequencies of endpoint property of dtsi */
+		if (link_info->rate > link->max_dp_link_rate)
+			link_info->rate = link->max_dp_link_rate;
+
+		/* Limit link rate from LTTPR capabilities, if any */
+		if (max_lttpr_rate && max_lttpr_rate < link_info->rate)
+			link_info->rate = max_lttpr_rate;
+	}
+
 	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
 
 	/* Limit data lanes from data-lanes of endpoint property of dtsi */
 	if (link_info->num_lanes > link->max_dp_lanes)
 		link_info->num_lanes = link->max_dp_lanes;
 
-	/* Limit link rate from link-frequencies of endpoint property of dtsi */
-	if (link_info->rate > link->max_dp_link_rate)
-		link_info->rate = link->max_dp_link_rate;
-
 	/* Limit data lanes from LTTPR capabilities, if any */
-	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(panel->link->lttpr_common_caps);
 	if (max_lttpr_lanes && max_lttpr_lanes < link_info->num_lanes)
 		link_info->num_lanes = max_lttpr_lanes;
 
-	/* Limit link rate from LTTPR capabilities, if any */
-	max_lttpr_rate = drm_dp_lttpr_max_link_rate(panel->link->lttpr_common_caps);
-	if (max_lttpr_rate && max_lttpr_rate < link_info->rate)
-		link_info->rate = max_lttpr_rate;
-
 	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
+	drm_dbg_dp(panel->drm_dev, "link_rate_set=%d\n", link_info->rate_set);
+	drm_dbg_dp(panel->drm_dev, "use_rate_set=%d\n", link_info->use_rate_set);
 	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
 
 	if (drm_dp_enhanced_frame_cap(dpcd))

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251214-drm-msm-edp14-8f4dc65dc34a

Best regards,
-- 
Dale Whinham <daleyo@gmail.com>


