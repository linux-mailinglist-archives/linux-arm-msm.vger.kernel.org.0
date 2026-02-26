Return-Path: <linux-arm-msm+bounces-94291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL5+Fuk8oGmrhAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:30:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 594321A5B4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DE4630185F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEDF3358DB;
	Thu, 26 Feb 2026 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLgeJIdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405337FF64
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109023; cv=none; b=XKLTbOVt/93wfZPzbs9mTiOtNaS52PLGHyCXYwFmM/SdcFN1RQtDvFINYAmZDxD2FX2ufcMAwc1+AaciB14nq8u88yUaKYPje4l1c1/dmrnYO/hSqbJu31hkM2Ub/ZpjpaK7h2pNU1/W5JoTjFA8/1wszM7FJI9Pz8I5Xn4RmsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109023; c=relaxed/simple;
	bh=ziIkw6+Dh61gA3SH6XJNAnST9i3wXX6JtJ3qCO5Q3hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ey7OuSr5DWg0sLkoK2C4FNGtokeYV/YhEL9vb98U2cLqBiMscSzYN1m0yZRLPbz3A0n59EplFozddWq9deDOh7bHJFdba5KpO7RbDaWsGWQjSd5ObBPOm1ouVtTs1rOE7kYHlx5bIXQ0BwqWBoFpfqpKsJQlMjRKmDygUvEp7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLgeJIdH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad9f316d68so3591965ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772109022; x=1772713822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX2tPF6zBIVyTh8hqIJIyXQIEwmjYpU6LNcfWWsSq80=;
        b=mLgeJIdHWm9ivOoBE/PQ7R4oxTDveIcPP9caInoy/Im/uQc8APYkFiUaOotzIHkYN0
         L9f5n5oo8xTzZa/gxGOTp8/EaN5dZFBPzJI14b4BcFy2C1XyHmT4O4vCMAnhYTtrRJAJ
         IMZtMDb8Ou6Ib2eJSKBgfJM2x2Ga3MGJvYIbJjE2opH3NOTqh41vVWBcMCQkKd6kgfj3
         njBJCDVnl8dYJ4UIi4S99eA6w8TVz7VnomUVNMbsHjhSXkBtBzx3hIcKNn0fgO3ojKdK
         7hxzEu0OYKztR9K8cPuqjByzznaTPn6crLipbTLWBjNoADhMJkBtbnU5I/ocwd9rGl4I
         0rNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109022; x=1772713822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vX2tPF6zBIVyTh8hqIJIyXQIEwmjYpU6LNcfWWsSq80=;
        b=X+GY1uVUAIytZRRZCwmWB9+3NK5kxGNjBFGVKnAZOx7J/9aC07IdBKN01vmX4FG3vx
         JF5Dwa6LpfyyxE9prSb843plS9zkCMJHNTJMEfzQR0bFwDXgMLaJeu8QuGc6MJOjLFwB
         uOuoDn6cgReOMeAPIqWN4BsgBhS3IH3jGTurAryEM2OP9q8Pi/bBRXV9m+daELFF8wW6
         yaDOFqq/20xvlxy3VIHrc75IspYrz5y1Vz7t1MnsChWtwc89jf23xk/PbFoQbcYq/JC9
         7IawfkaDn6ywIgyyKm5a9K3s3AEYksYD3iCewY1FDKMdSGGMBnnOGSYqyvgHT3MXPPwn
         LvFg==
X-Gm-Message-State: AOJu0YxSV94T6W9TR78CXt2yLOLF9n4zlvAPsK5lRZXwc0DcRYrwhxAL
	UQ+c1FrMvug+hAn/OEvwJ8Bj/z7AF6v4wVurRLaYHKH0BiUHIqkp1ykb
X-Gm-Gg: ATEYQzxXUC8SIVNSUb4p5zbaITdWBQwDrCXOW/rpJcxdMGTB8r6aRRVASLr61VcleBq
	eE9MHstahLBnLCkeLVO56JO4QgjIBBCAr5pCQRVRe4zHw3gQzIcDmG/LU/DdKMsQiRE0T9nvf1X
	9ygGwzQPevfc6fH2pPRtyXj/acd7bRWz0r1bCklFCCGbObe/zYvxgG0ydoe9uhJtUAukgUA4Vm1
	eLlOI3m5lA4gHS3q/MSTVr0twUgL7WR/+DsQYjoxEGQQI9PJLjStblAZX8CfjYstSMRv+lSUVMw
	PnsRwtb+ecmO4yWLjg+zVdR7fEz3ebNyqbqVnSLiFY3Js+0ZLO+mQizfaVp5Yo4tk0nUyQ0ifIP
	DfpC+zIEqxPBWFAonR7PSRQMHOESEZ4lb2bwCp+y6q/x1z1wf/pDMWBIQQzJ8hM1X0sWgVxJ6OA
	0WSMM5Jg==
X-Received: by 2002:a17:903:94b:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2ae02e49483mr17925415ad.13.1772109021776;
        Thu, 26 Feb 2026 04:30:21 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22e7sm25504125ad.3.2026.02.26.04.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:30:21 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 1/2] drm/msm/dsi/phy: fix hardware revision
Date: Thu, 26 Feb 2026 20:29:57 +0800
Message-ID: <20260226122958.22555-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226122958.22555-1-mitltlatltl@gmail.com>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94291-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 594321A5B4C
X-Rspamd-Action: no action

The hardware revision for TSMC 3nm-based Qualcomm SOCs should be 7.2,
this can be confirmed from REG_DSI_7nm_PHY_CMN_REVISION_ID0, the value
is 0x27, which means hardware revision is 7.2

No functional change.

Fixes: 1337d7ebfb6d ("drm/msm/dsi/phy: Add support for SM8750")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8cb0db3a9..01182442d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -51,8 +51,8 @@
 #define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)
 /* Hardware is V5.2 */
 #define DSI_PHY_7NM_QUIRK_V5_2		BIT(4)
-/* Hardware is V7.0 */
-#define DSI_PHY_7NM_QUIRK_V7_0		BIT(5)
+/* Hardware is V7.2 */
+#define DSI_PHY_7NM_QUIRK_V7_2		BIT(5)
 
 struct dsi_pll_config {
 	bool enable_ssc;
@@ -143,7 +143,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 
 	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) {
 		config->pll_clock_inverters = 0x28;
-	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		if (pll_freq < 163000000ULL)
 			config->pll_clock_inverters = 0xa0;
 		else if (pll_freq < 175000000ULL)
@@ -284,7 +284,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	}
 
 	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		if (pll->vco_current_rate < 1557000000ULL)
 			vco_config_1 = 0x08;
 		else
@@ -699,7 +699,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	case MSM_DSI_PHY_MASTER:
 		pll_7nm->slave = pll_7nm_list[(pll_7nm->phy->id + 1) % DSI_MAX];
 		/* v7.0: Enable ATB_EN0 and alternate clock output to external phy */
-		if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)
+		if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)
 			writel(0x07, base + REG_DSI_7nm_PHY_CMN_CTRL_5);
 		break;
 	case MSM_DSI_PHY_SLAVE:
@@ -987,7 +987,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Request for REFGEN READY */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
 	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		writel(0x1, phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		udelay(500);
 	}
@@ -1021,7 +1021,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		lane_ctrl0 = 0x1f;
 	}
 
-	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		if (phy->cphy_mode) {
 			/* TODO: different for second phy */
 			vreg_ctrl_0 = 0x57;
@@ -1097,7 +1097,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* program CMN_CTRL_4 for minor_ver 2 chipsets*/
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2) ||
 	    (readl(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
 		writel(0x04, base + REG_DSI_7nm_PHY_CMN_CTRL_4);
 
@@ -1213,7 +1213,7 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 	/* Turn off REFGEN Vote */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
 	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		writel(0x0, base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		wmb();
 		/* Delay to ensure HW removes vote before PHY shut down */
@@ -1502,7 +1502,7 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
 #endif
 	.io_start = { 0xae95000, 0xae97000 },
 	.num_dsi_phy = 2,
-	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_2,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
@@ -1525,5 +1525,5 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
 #endif
 	.io_start = { 0x9ac1000, 0x9ac4000 },
 	.num_dsi_phy = 2,
-	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_2,
 };
-- 
2.53.0


