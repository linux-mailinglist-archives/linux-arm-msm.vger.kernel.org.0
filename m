Return-Path: <linux-arm-msm+bounces-85611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B53ACC9E0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 01:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 534763009569
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 00:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F05C1EBFE0;
	Thu, 18 Dec 2025 00:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1WjChcD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1847E1F4C8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766017185; cv=none; b=s5X03bgkc/teC/xLfHd3B0eUrPTsgAqatVnK/HgwhR7a9k0JuVKxZj+CO9HOa5qBkIzvULsRZLrBg9uYhjQxnwCcoIgPCn6WdG2U6oGEv4I0cKJ2WEry0enj3xTuTj7Q7xpdxny7FeFtXQbuLFyYknK6LdhmbR+AfsUYwfLf8yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766017185; c=relaxed/simple;
	bh=MWwdmCJQUimtCRSKhTPNjOdSH8ty9Q7hQ/j7WkOhuO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lZFH5/jU+KxnnS3HVcwnoKx8sF+BBdd/CeiRtLTqZTd1gvYWjmPS+oKXbVtcvMGzV8zxNKxerLRbWQUd/5Cuo04VwGpFiDLjY0vITHordJFSsnUL7EptoPfNt0TrGkr5rQXrUmlRRNp75Ksy763JBuaBzJm1qQjbfY/e2QD5AiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1WjChcD; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so37636f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766017181; x=1766621981; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kUVQaLKncxiRp/vqoDgQl5p2NRR1lum8QhNB8KPTe8=;
        b=N1WjChcD5JFPreyA8VCEkWh6Jz3zHBxr/fuzDvSvIg3G9BquHB8Qx7UC1W5URarAGb
         QT2e5xxC6WqfKiNajUXuA5gEz273dQyaEwIQz57SC46n1j28tHoTsKecHLTBT+ECpWLV
         9TB4SFkpqUJ9hrMqhFo0+J429BnEc8rbwL1bXuMJmWYwaeCqbGmTOGzDD+CLNWiCXFYt
         Mc8wkG/u64rqhb2/hrTCN8pL1as1hysJUAMYfxilrn/RUJxlJ7EGOPrsOeDZgPLZWnIo
         XDOiYCfr2ZnkBvGjzJXU7F0KPDuS3Npd0yb15HoSGTvpC8tDg7MhmTYB5KwgjwPkCIb6
         D0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766017181; x=1766621981;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kUVQaLKncxiRp/vqoDgQl5p2NRR1lum8QhNB8KPTe8=;
        b=B4Q7Q9EqmZp3N/yR+RutPF9tWmMYCEEO3ZcpMSEPlXG4RKRQ9c37w8jktlk/Ipy9Cy
         MwMybldmy1dT1ZA/vQ37NBkm7PG9yMssf5FUxVStPnF6x3I3mXktJYZ5UPhjv+MMEogU
         DQRbhFy6eb0NJEJ5uGhD68Z9Kh8CkJzM0VOIUCt2bn9AWKEsSu5IlPW5FV+A8cXgDGUG
         tRAB+NQZn1+j1monytEVLo/HzrIfohd0KaF7kTRk+YuGkggHuFkJkSvH++Rfgn3ACd2P
         A3LdPDY46t6CRA2gUi+jMEBr7aapGOOK2xZW9FgUcWW0XyGMMSTaG4mjMSC/QktDdJpv
         Kn1Q==
X-Gm-Message-State: AOJu0YxfF1Q6mLlVHKlPmKcwZl8xfbUqYM6i9AKAQiAGSwh7WwniZebu
	fgBD2ASfd3EmGCVpMzTxYh82PElVvsFPYvFYauIH6N+Q/Fyv4kCsAlvK
X-Gm-Gg: AY/fxX4NQTHHkMZzbnQGdlK41J8CzTHxaLYPm0EdO87xsObcCVqVSnGiRJHKcnQyFYH
	q0Wd5l4y1F3ZownRtyXv8Y9uD8F72EX5TqSF7y3ge44UvmYomBpTt49EPQ5GvJ9oeY/hSiUSBrx
	ruYCJb2knm0Owmx9yubdQLp+XSQ+AhmWzRkEcqfnNUl3+V6NHSLanMS54n+QiuBuUYMajG5kQLv
	lpZCvw0QrIGHMlNhczKEGSqqFerZogbgnu/NqXE8owPylLZ1xlM/fFWNQUiiv0SRY9usfFW6dlX
	SonPBTKxUXjH1Yf40NIWkGppMsN8sPVFodDVOOtEdiOUSKk88CVPl0JMhzmU0blqvoDUGb7dN5m
	XwgbZY3MXiPgNMUFtwaJMi3rRCXbypt/IKCkFXeL/LUCAtOcwxEkqutEbgC6XGjtDGkQv0UMTrE
	x1MIEnjSecE6Wyroe1HoVuPwJYDR52WLngejEIaFVY4EePgPy+Xe0db1BIh8xSWc4YJsnRog==
X-Google-Smtp-Source: AGHT+IHpXOK6G9ypAXb1YFAcTnbHKHq1QrwSCQMOelXbJG6LwWV50H/93CE5g/zG6iKkk+5NqSaRVQ==
X-Received: by 2002:a05:6000:144e:b0:431:66a:cbc3 with SMTP id ffacd0b85a97d-431066acfc6mr6234585f8f.6.1766017181032;
        Wed, 17 Dec 2025 16:19:41 -0800 (PST)
Received: from [192.168.1.5] (92.40.201.212.threembb.co.uk. [92.40.201.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324498f8fcsm1736920f8f.24.2025.12.17.16.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:19:40 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
Date: Thu, 18 Dec 2025 00:19:32 +0000
Subject: [PATCH v2] drm/msm/dp: Enable support for eDP v1.4+ link rates
 table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJNIQ2kC/3XMQQrCMBCF4auUWRtxYlKCK+8hXYTJtB0wbUkkK
 CV3N3bv8nvw/h0yJ+EMt26HxEWyrEuDPnVAs18mVhKaQV+0RY1GhRRVzFFx2JrcaAL1NtDVeGi
 fLfEo76P3GJpnya81fY58wd/6r1RQoTI2sCPsHTHdp+jleaY1wlBr/QIThsWHqgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766017179; l=8706;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=MWwdmCJQUimtCRSKhTPNjOdSH8ty9Q7hQ/j7WkOhuO0=;
 b=f0edPEKpkgbHI5mZQN3mY3VQIh3N25NN+HNlwzJPp1EwfvqNNICpubZI6gIYXI0B4H6wcA3qU
 PWh8iNH82egB+ECHp4FI7Ui56p7Cu9wvDUkHJlex/eoWq8ag3L9+Yye
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
Changes in v2:
- Re-ordered writing of LANE_COUNT_SET/LINK_BW_SET registers to match i915 [Dmitry]
- Fix detection of eDP by reading EDP_CONFIGURATION_CAP and EDP_REV (in v1 we were mistakenly checking DPCD_REV) [Dmitry]
- Link to v1: https://lore.kernel.org/r/20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  | 56 ++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_link.h  |  3 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 93 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 120 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cbcc7c2f0ffc..aa2303d0e148 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -175,20 +175,28 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
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
 
-	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
+	err = drm_dp_dpcd_writeb(aux, DP_LANE_COUNT_SET, lane_count);
 	if (err < 0)
 		return err;
 
-	return 0;
+	if (link->use_rate_set) {
+		DRM_DEBUG_DP("using LINK_RATE_SET: 0x%02x", link->rate_set);
+		err = drm_dp_dpcd_writeb(aux, DP_LINK_RATE_SET, link->rate_set);
+	} else {
+		bw_code = drm_dp_link_rate_to_bw_code(link->rate);
+		DRM_DEBUG_DP("using LINK_BW_SET: 0x%02x", bw_code);
+		err = drm_dp_dpcd_writeb(aux, DP_LINK_BW_SET, bw_code);
+	}
+
+	return err;
 }
 
 /*
@@ -1474,26 +1482,32 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
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
index ad5d55bf009d..891211b23202 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -13,6 +13,8 @@
 #include <drm/drm_print.h>
 
 #include <linux/io.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
 
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
@@ -107,29 +109,98 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
 		   link->max_dp_lanes, link->max_dp_link_rate);
 
-	link_info->rate = drm_dp_max_link_rate(dpcd);
+	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(link->lttpr_common_caps);
+	max_lttpr_rate = drm_dp_lttpr_max_link_rate(link->lttpr_common_caps);
+
+	/* eDP sink */
+	if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
+		u8 edp_rev;
+
+		rc = drm_dp_dpcd_read_byte(panel->aux, DP_EDP_DPCD_REV, &edp_rev);
+		if (rc)
+			return rc;
+
+		drm_dbg_dp(panel->drm_dev, "edp_rev=0x%x\n", edp_rev);
+
+		/* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
+		if (edp_rev >= DP_EDP_14) {
+			__le16 rates[DP_MAX_SUPPORTED_RATES];
+			u8 bw_set;
+			int i;
+
+			rc = drm_dp_dpcd_read_data(panel->aux, DP_SUPPORTED_LINK_RATES,
+						   rates, sizeof(rates));
+			if (rc)
+				return rc;
+
+			rc = drm_dp_dpcd_read_byte(panel->aux, DP_LINK_BW_SET, &bw_set);
+			if (rc)
+				return rc;
+
+			/* Find index of max supported link rate that does not exceed dtsi limits */
+			for (i = 0; i < ARRAY_SIZE(rates); i++) {
+				/*
+				 * The value from the DPCD multiplied by 200 gives
+				 * the link rate in kHz. Divide by 10 to convert to
+				 * symbol rate, accounting for 8b/10b encoding.
+				 */
+				u32 rate = (le16_to_cpu(rates[i]) * 200) / 10;
+
+				if (!rate)
+					break;
+
+				drm_dbg_dp(panel->drm_dev,
+					   "SUPPORTED_LINK_RATES[%d]: %d\n", i, rate);
+
+				/*
+				 * Limit link rate from link-frequencies of endpoint
+				 * property of dtsi
+				 */
+				if (rate > link->max_dp_link_rate)
+					break;
+
+				/* Limit link rate from LTTPR capabilities, if any */
+				if (max_lttpr_rate && rate > max_lttpr_rate)
+					break;
+
+				link_info->rate = rate;
+				link_info->supported_rates[i] = rate;
+				link_info->rate_set = i;
+			}
+
+			/* Only use LINK_RATE_SET if LINK_BW_SET hasn't already been written to */
+			if (!bw_set && link_info->rate)
+				link_info->use_rate_set = true;
+		}
+	}
+
+	/* Fall back on MAX_LINK_RATE/LINK_BW_SET (DP, eDP <= v1.3) */
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


