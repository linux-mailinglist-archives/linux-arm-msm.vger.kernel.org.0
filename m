Return-Path: <linux-arm-msm+bounces-100372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HWcJtquxmnpNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:22:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9873475DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2947D30F0141
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D613502AC;
	Fri, 27 Mar 2026 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yxkqqcFt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA5634AB05
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627961; cv=none; b=HNL/SRMa71yQNJuM55ZO1PPXzt3MNRzwtQHV3fNxFQCT1rBT5CijxCab7hZY+Bx8/d86dIitBM660DFtTP8fFNirdHbbrsc/lHGEPxDgnkyChoPS+oGQC1epdXg6D2pOAvkxlxuDiN2ic6WNNoybUZeQRUug9vMCKTRWF/tNuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627961; c=relaxed/simple;
	bh=MNrAIbdMcQ69eUABsCEhZ1TvMsJSWiKNRpYtVmTWOy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RI9ovgdUGzML/FrdbIId7RMZX+sWIPiuxDSiILJiJNnfSLI2Kst5fJUeS0t0zUT3lGllGXHFgTh8mGjTmWoupTO6XXQ9lAmPXoBzyrL9LJ66cJh2BQtQGKFXj6brizhN2ahmKw/A4X1Ck+RgEQB/VI0/uOJsahzNWtDs6m7Xj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yxkqqcFt; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso285979166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627957; x=1775232757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2+QJfKRcmrV5A3/+Pu8IIk900YGksP7rXJkNHvnm5M=;
        b=yxkqqcFtkVnIE7yUtU9TeoTOn4a/BDIAqeE0eeysU5YmP3eAMs3pzVvQWA91+HlzJ4
         LO/xEATw0q4h9J53k3XsTDKVKd9WC/vvVvIvnPUkFfz6R6/5hyq67BvkHOOUxnBuvNvt
         LzFswgiNe5BJLKrj+BSiYthXwBkWnLfb4sO8wWiiBLOi381j9a16kcgQz7JZk3Kd8tOS
         Qjn5sW+Spt+J3PWBa0HbKTwYeexu9doECP9oCYIGOEe/44n5dtnYWTbCVKXsV5KTJy3W
         +0XMrSB/jRkSCsb0dJ9I+TtCX5nx4xi8y0iFXsV5tJMPwYhC134HDnVkgDskG0A80IO3
         uzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627957; x=1775232757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w2+QJfKRcmrV5A3/+Pu8IIk900YGksP7rXJkNHvnm5M=;
        b=X+E8uL2gUYaB/to/0ZgZTbYIOc6XLU/B//K3M80xmgsCeITfWQuJGgLKLfumSnHKrN
         wpP66ukkbk5Rs3C4uyxAGzTmijQhwNRafiUf1uHdi+ofnLEVc28PZMxzsBOmkhl0a/km
         iEHxqn5Ofl0+cg17By78HCw5AXxhCi4bQLr+2x0mp92bj5ewg6PGDZNqRdxMGj0l2ZRC
         TsEUu+0Hl/tpoHbHreO7WDBP9ZmV4A+1YugeJs5nIR1npuAFSjlEj5j+n8z0yXkhliG3
         eiFsMfJkB+oDVWsxm2ovoQtxP70mpWrvmcE2/Uo909oPs+I8HK9D4rWRs3C87j3Vz66Y
         FByQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXJSGgmDqsbVnvYQSIbG0hSJGkOgCHmp+MYlLlmAGdmCPM1EYdCh/5HCQe51DIWVnP5tAs4AHpXy4g8m23@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+Koem6JlMTjhjhH8qBzotTKFB169sB+2iQlQ/WSk49W4UCuV
	5sAK4Gjzb8thU6LI3CV3dRfjnILxPXCc94raCm1fsJu8XCqk+8VGDJXC9JPqhEqtqj0=
X-Gm-Gg: ATEYQzwHfMlS5LdiwoeUzUKdVB1LzcCA6D7s1avZp6/yEQt5LOarMId6NpIRD5rXWzm
	ugYlwf4XP+eH5dX5hdsLV2BbwGlb2u4jt1GAdkKgbD44mlmIWGp82MWr05j2gJGjDLgpgTvNIak
	3xNvJIVCLGuRa7BlQ7UCTsMLUqw1UuSJvbHUnO0I2vV0Vmy+q+HFmvtco3JzXQ3tLYfvR5UeRId
	YuSrtQU6lycSmDyJqfiNLdAfgQx4O7cSxu++ITLsu4Z2dekCLghqAUC/aEwyQHsqCCYs8eJ/pr/
	ygHPITMkm3IXHFOeRMRwZXcVAh72SpwzEaBmX9JV90og/5ROi3juF88wlaZeEpmAtAiwbbLDJlu
	xXVSIuvjwCgdAupztU6RkXSkh9Mybz+WuyvxLI00cbKN0nDfdgy8hKahfh28at8qaJJeGucxR0w
	liJzYlx+NkdE8/AnxThgmMvKtkXT4Gznr3j3JAo/l5N5FcgiVEnoBsF7Tx6D4WTPiimJnmGJfq9
	4AYPPH+Di2n50Z6
X-Received: by 2002:a17:907:388b:b0:b98:4850:3b89 with SMTP id a640c23a62f3a-b9b508fb15bmr201044366b.37.1774627957321;
        Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:25 +0100
Subject: [PATCH v2 6/9] drm/msm/dsi: add support for DSI-PHY on Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-6-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=2987;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MNrAIbdMcQ69eUABsCEhZ1TvMsJSWiKNRpYtVmTWOy8=;
 b=5SR/5qTBYNIDCGL8cuTNXwvhzYkYevnNbG5tqBVj6DaWvC5VwQFqUBefrvK3PQwf37OLko88/
 49lWJuZx0jPD32kD0ipHchOJxdTUSFwUd9ONcju8pYJK36i70aOoZXK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100372-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 2D9873475DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DSI PHY support for the Milos platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c59375aaae19..1fb3899b88bf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -571,6 +571,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_5nm_8350_cfgs },
 	{ .compatible = "qcom,sm8450-dsi-phy-5nm",
 	  .data = &dsi_phy_5nm_8450_cfgs },
+	{ .compatible = "qcom,milos-dsi-phy-4nm",
+	  .data = &dsi_phy_4nm_milos_cfgs },
 	{ .compatible = "qcom,sm8550-dsi-phy-4nm",
 	  .data = &dsi_phy_4nm_8550_cfgs },
 	{ .compatible = "qcom,sm8650-dsi-phy-4nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index c01784ca38ed..21a59d66e8dc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -61,6 +61,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8775p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_4nm_milos_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8f4b03713f25..984a66085dfb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1436,6 +1436,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_4nm_milos_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000 },
+	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_98400uA_regulators,

-- 
2.53.0


