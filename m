Return-Path: <linux-arm-msm+bounces-94292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEBOCEY9oGmrhAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:32:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0941A5B83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8426A30F6CF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F45D3358DB;
	Thu, 26 Feb 2026 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnSUlEiI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC073815F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109031; cv=none; b=YXq3NtRmjNht4x8PxSgSPCwVldIjsj+5n9aXihQAMkoXmhdbK9d2NCmqELwtAH5RrRChan5h5dO+scQMBOt9zF9z/gj8KLLm0am1ltTlZ6eI8R475oJ4DpCYhBu58OFICWs9hGLgoY+uSj1qt34PryUhJboJ3VmisE6GUtDzGAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109031; c=relaxed/simple;
	bh=3TtWod8ad+IXXfySR6qlnoejtl9Z6bqhrFU7mzUN1sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggCa4dyoFnOwf1qFTAdDNW/ED1eU9G7R03Jrlr7VgW302+C/DJw1weLoeN1Uss/39224zqJalp5DVd69SqndxwlzUJCZKqT7pft6DtfuRYRKtIC7VSceXZkkAidoPjN3kjfTaz4GBpGH6fMmc/n15T5f8vM2DjJD5REDBy7s8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnSUlEiI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aae4816912so5089655ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772109029; x=1772713829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8bAx33DCcpAj247sU4+Wz28zAQ8myXVbly7seQhZNI=;
        b=KnSUlEiI5SKqOrqLQLPvTUGHgZb+2OCgnAelzQIjRjf2vP/TE5GAHYENblPB7rE6ut
         pBx/je01qrv0XoIhTA1zxl+1/i3nMl947VM+YNVyWUdpqiMsbVvin62LgLXoAnDCKoYn
         vuHrIQnDGUJZ045q9mAfsdMeHGnoRa1FZrfYBM0BPlx46njYajLr2G3VP+CUmsKuqkKR
         pLBWvPvRxA2ipS7q6uaYPOEK3BiFYn/r6hpO8/xBBwerGRgIa+tkrABqlBfagTkWJzht
         1nKziGbjHxHrzNemZgBwLj7LU1LpZyTqmSER/LJIdau0VdQmYJgnzHfiLKUS4w1+H3Ru
         wR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109029; x=1772713829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8bAx33DCcpAj247sU4+Wz28zAQ8myXVbly7seQhZNI=;
        b=OpQalluQk8ZZ0KbKJOgpWNm37M8H7g23iIGNJw2cmBcvXqgoo+Xg+j47O/iLDKQ/CB
         yHjQpCRRVPIiIdWyNDmLkYnD8j5PT+FqvvmdNKzvgW6juYPDsUmsGyO6clzZweWefMDG
         ntCv9WXAyiJeHfITwQvjQx827gH2MdgIuBAi+Df06R7HFgXDsLxBzsurAggRCR+jiI8j
         6V4F+ctDLq8WsoT64ebCXkQOnmuH6WMq0z3sLsQz+GIVeDEDxHwCCcjEro8nH23K4ycN
         XVghBF4LKITnBmrv+7E3Mg6o7J53An9xesnIYv03CnTink2ebF8Y3TA3u62ZplqkqEG7
         gxJg==
X-Gm-Message-State: AOJu0YyancV/+aptibtz4OyMfXWmI0DTnDQ/lLbXy/F5U78SwBn6alan
	i1vfKi3iCSfuZv9RzU3kbLtO+nTVpyfJeUMf8IyyrNOwwnJC5QUbPXYz
X-Gm-Gg: ATEYQzz46XpioTHpW3MrPSOWIJab13oF8v+z+rwG+LlFPchLD3E+mNNGd9t1UFs8GXH
	0SwLzq1Rpn9p/Gieo32CL3Ykij4H9Ajh7nbdOJbwArzLi/LKpaDDe+78sbd/7FB6fJpPQphP0/e
	9znreuvIsJ9k3wk5iaAr6esm/kN7LilavOIJMJM9B7V6JcSVaHbSTfqWHECY7d3Kcyb6QASe5VP
	vX/PUDnNPgsMf/P5J6CjnJOPcGhAYPkz32qc7UnUFnj6W6LIT9Q7jdRcEQhVDyEkSeWtGBBR6EE
	hwdYp9RW2mYH5AKX6N8P5pYO+yS2RlztHrKYLNrYIPpnkGZVreMeTmITKU1oxLZpgTcRckF7nVk
	JK1YA960R9i2OcaXhFqC9YELg++MA8V31Plb7hy6TpGh3mYdL09ZnCyd94ahCiFIlpbpng0+7b5
	I6EzmumO9N9y2uWUQm
X-Received: by 2002:a17:902:f68c:b0:2a0:c35c:572e with SMTP id d9443c01a7336-2ade9a3783dmr44069415ad.30.1772109028595;
        Thu, 26 Feb 2026 04:30:28 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22e7sm25504125ad.3.2026.02.26.04.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:30:28 -0800 (PST)
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
Subject: [PATCH 2/2] drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1 to DSI_PHY_7NM_QUIRK_V4_0
Date: Thu, 26 Feb 2026 20:29:58 +0800
Message-ID: <20260226122958.22555-3-mitltlatltl@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94292-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E0941A5B83
X-Rspamd-Action: no action

The quirk flag DSI_PHY_7NM_QUIRK_PRE_V4_1 is renamed to
DSI_PHY_7NM_QUIRK_V4_0 to better reflect the actual hardware revision
it applies to. (Only SM8150 uses it, its hardware revision is 4.0)

No functional change.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 01182442d..8f4b03713 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -41,8 +41,8 @@
 #define VCO_REF_CLK_RATE		19200000
 #define FRAC_BITS 18
 
-/* Hardware is pre V4.1 */
-#define DSI_PHY_7NM_QUIRK_PRE_V4_1	BIT(0)
+/* Hardware is V4.0 */
+#define DSI_PHY_7NM_QUIRK_V4_0		BIT(0)
 /* Hardware is V4.1 */
 #define DSI_PHY_7NM_QUIRK_V4_1		BIT(1)
 /* Hardware is V4.2 */
@@ -141,7 +141,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	dec = div_u64_rem(dec_multiple, multiplier, &frac);
 
-	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) {
+	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0) {
 		config->pll_clock_inverters = 0x28;
 	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		if (pll_freq < 163000000ULL)
@@ -264,7 +264,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	void __iomem *base = pll->phy->pll_base;
 	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
 
-	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
+	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0))
 		if (pll->vco_current_rate >= 3100000000ULL)
 			analog_controls_five_1 = 0x03;
 
@@ -313,10 +313,10 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	writel(0x29, base + REG_DSI_7nm_PHY_PLL_PFILT);
 	writel(0x2f, base + REG_DSI_7nm_PHY_PLL_PFILT);
 	writel(0x2a, base + REG_DSI_7nm_PHY_PLL_IFILT);
-	writel(!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 0x3f : 0x22,
+	writel(!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0) ? 0x3f : 0x22,
 	       base + REG_DSI_7nm_PHY_PLL_IFILT);
 
-	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)) {
+	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0)) {
 		writel(0x22, base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE);
 		if (pll->slave)
 			writel(0x22, pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE);
@@ -928,7 +928,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	const u8 *tx_dctrl = tx_dctrl_0;
 	void __iomem *lane_base = phy->lane_base;
 
-	if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
+	if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0))
 		tx_dctrl = tx_dctrl_1;
 
 	/* Strength ctrl settings */
@@ -1319,7 +1319,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
-	.quirks = DSI_PHY_7NM_QUIRK_PRE_V4_1,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_0,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
-- 
2.53.0


