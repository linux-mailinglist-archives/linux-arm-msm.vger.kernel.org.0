Return-Path: <linux-arm-msm+bounces-83915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C6BC957D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 02:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9FAE84E167A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 01:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F821DB13A;
	Mon,  1 Dec 2025 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGMkj8DI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35514F9FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 01:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764551762; cv=none; b=TGR80gnOWTklsFQ4pQ97QYrWQBr1tTl1OiBQeKM6J2tVFqr4XF2+ywNmExF/Br5FO0KWTTsiMLU2BNfgEDlv2LnePdbvTO7xogG1i/TdrpspHa+bVf2sPUQZ8vRm+SNyCGux95yWmW7024b7m844fJMalU6QUIlBS+X/FmCGeTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764551762; c=relaxed/simple;
	bh=WpXEEsGtOokvuvQlhuEmKMzc+nHK2ks6LTfaSKXNgvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngJkut1vyVplgHEyHckp3w6Cur5E2JykCdg1b/f5nURau7K9fNZ6Vs1SvHPD2jK4FFgsupKj3kIo5wLqjuU9xSraWzEJ7aZhBdU+H2UPGT/nI4Kd8FLYSr5XyI0CG9Em+LV0sbdhmOX647PHqtXGTmfE0BKYMA9kC/O2rYx4sm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGMkj8DI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so42481335e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 17:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551757; x=1765156557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+Y5hX1CqH3Pzk70YwUH5BikC9q1gOEENG1USkXY4XU=;
        b=FGMkj8DI3Q83wjp0741Qpe4hVMi+8FjRKWi8jms5YBlALLFDDgpRict9RYl2l0hsOm
         IvIsjUBOqtU5OXUAnJuByOB3lH3PsCvRhq5f7+tRsNFNHldMYs2CU0/qR2ywCSnaR+Yp
         b4V53JL/dF08kTEGdCaM4Xs26YDgJtj2t68prHllFdZ1slenQXH13dk9TV3lfcU2rN3h
         7GbxY5jOC9BrDayZ6U5e51a+kIfu0VYrV+xl8kQ9B57Ukzc/GW5vRUUo1to5p29NIbBV
         xlGNf8Xdwvoni9OZgY1e+k0yj7P0TutfFulTQ8G9fbsD0xCkVj2PgLB2YGHJEt5PyLKF
         Ek0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551757; x=1765156557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+Y5hX1CqH3Pzk70YwUH5BikC9q1gOEENG1USkXY4XU=;
        b=V2iOfvs5z/vOlI2M4fIWIRe2vqO9O5kkpJoJde2MIg9P8//ncc+23RRXu4yjw+HUUi
         gWkXSjqic7Tx5gPGYCew4O6AsS6Ih3cz3bXDWhv0UqFlYTIGKFlMcooGsubUOnJZnh4e
         lcIdobEHf1nNWnTQjYWlmY6QO+mvFUiSlNBNyppVyzL7TnmDoWskODy07spHAjklHqJE
         CAr9MTSgL4ZPnDAHMB5aWRvT29I7EkpQ7ylHge0IivKFhDMN6YIG33lvUt41IFtBJZZy
         NtMO6t8HY7KINhKX1ABihbM31HkdgwDiLwXD0MsFa0CT4H2lHREc2VsSjuVjg5oAZYrD
         kTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4aBemcTuuUdWDCyT1Yu8pmoDp3x+0KMl1MTP+CN41BxnxviU4aWJtveD2zarbM7SmGZDiM9EVTRF+DF9t@vger.kernel.org
X-Gm-Message-State: AOJu0YwbeaymGGs72ggMe8LMXZwHqeGYHI5kYKwfw+fghvTnYVHFBi5p
	kcL2kbdJdCCVZb9RfQrsAnF7QpkuGjlK7LoNR2NCVUmdRi4KxCiQzyK2
X-Gm-Gg: ASbGncu6if/tXMMcIFTtu9PBwlryGemGJMq1D11qZDlHnm5tNSb478bxb99GOM6YqYa
	OpuShjyZkZZZpA4bXBXhQZqw3IHbs1Nyp/LqqTrXZUpUmyE3haklU1jIe5OaVI52O+RBE10ids4
	hhLMiVvvCssWV+NX/i6Y1r9yzwl10l7nvM14gMyhz2amR0JLXnnMTWBuYBjSnBXZO3DbKmpVjxh
	DiScm4DviTBhMVmDUCaGckIEoQynkjUnfL2r2oKcFoe/D5Epzgm4Yt5KlxyTshJXnyLV5wSNj4s
	GNNRpraVOrUom9RWYYmJML2NM0+K//qORZQ3T8yqnKjql7u6z49S0uVfWyLanMDRoA2p+e0HmqU
	+URj12flQ/+ec6w3tKKsHFE0PwBHFv5ez8ofibFF1aVaInoitOXgwPfqNh8xWvFISBGqxc0e3kY
	KWHMRl1sBJovbzUaIbwMctzDYZsPjWLZCY46HliQD8Lwc51G6bAuigpg==
X-Google-Smtp-Source: AGHT+IHVL/BEiWldm0y8g1R198i5I9jbvyca4K2bOXMaJ5CPndp+saFe0w/sAbEG0HAV5P3htWvg4A==
X-Received: by 2002:a05:600c:3b0a:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-47904b1b2ecmr214675995e9.22.1764551756984;
        Sun, 30 Nov 2025 17:15:56 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:56 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/msm/dp: Add dpcd link_rate quirk for Surface Pro 11 OLED
Date: Mon,  1 Dec 2025 01:14:46 +0000
Message-ID: <20251201011457.17422-6-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

The Samsung ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11 (Denali)
reports a max link rate value of 0 in the DPCD register, causing the
panel to fail to probe.

Add a quirk for this panel during DPCD read to set the max link rate
to 8.1Gbps (HBR3), which is the expected value as reported by the
"EDPOverrideDPCDCaps" block found in the DSDT (0x1E).

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c       | 14 ++++++++++++++
 include/drm/display/drm_dp_helper.h     |  7 +++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 4aaeae4fa03c..a533fbb2988d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2543,6 +2543,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* Samsung ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11 reports a DP_MAX_LINK_RATE of 0 */
+	{ OUI(0xBA, 0x41, 0x59), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS) },
 };
 
 #undef OUI
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 15b7f6c7146e..6bcfefd457c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -91,6 +91,7 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	int rc, max_lttpr_lanes, max_lttpr_rate;
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_link_info *link_info;
+	struct drm_dp_desc desc;
 	u8 *dpcd, major, minor;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
@@ -99,6 +100,19 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (rc)
 		return rc;
 
+	rc = drm_dp_read_desc(panel->aux, &desc, drm_dp_is_branch(dpcd));
+	if (rc)
+		return rc;
+
+	/*
+	 * for some reason the ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11
+	 * reports a max link rate of 0 in the DPCD register. Fix this to match the
+	 * EDPOverrideDPCDCaps value (0x1E) found in the ACPI DSDT
+	 */
+	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS)) {
+		dpcd[1] = DP_LINK_BW_8_1;
+	}
+
 	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &msm_dp_panel->link_info;
 	link_info->revision = dpcd[DP_DPCD_REV];
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 87caa4f1fdb8..737ec5317666 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -820,6 +820,13 @@ enum drm_dp_quirk {
 	 * requires enabling DSC.
 	 */
 	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
+	/**
+	 * @DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS:
+	 *
+	 * The device supports a link rate of 8.1 Gbps / HBR3 (0x1e) despite
+	 * the DP_MAX_LINK_RATE register reporting a lower max multiplier.
+	 */
+	DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS,
 };
 
 /**
-- 
2.52.0


