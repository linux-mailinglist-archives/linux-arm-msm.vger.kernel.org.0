Return-Path: <linux-arm-msm+bounces-105444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iACaFHBT9Gm6AgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:17:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7184AAE85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC5A63038A7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F917363C57;
	Fri,  1 May 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ybt+hLTy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABAF35A383
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619738; cv=none; b=EtH+Q9u5anJUGuy0ieVhzJnXswpbdmrRDOjgP7XJ+wt/ibSJgccXO5ajGRhmZ1XkTRBrEfgfBvnIkf+aPcHloQCmUknW+Po8l68lo75HlyLB++DnpR8v2RoIWQCswaS3t2Mek+sNlF2VGlrnS+UD3dcOaQCSz4LUoaJoiUaeL/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619738; c=relaxed/simple;
	bh=+OinyCwXS4Y2vYMDBUiIEDzwsNrg9k3i/PQu3jWxkfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjVC13Nwwc0s58j9AWJQ35fuQC920qX/JbDpatxYAqCIa8T12AQIkhN8+TOvXZg4vpT0tZp03PmLpVPwWKZgt/KR9KJvFoshQ4as1edPasb62WSiBVu9xUaIUqmCwNbly5SX4YDxH59XCASD5Lg+gvzkT0cZDYFR8M2LjBGYZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ybt+hLTy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so9514135e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619735; x=1778224535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcRaxEDDkb3JD3v/suj0HVGZb78w7Xi1M1DpP43HiY4=;
        b=ybt+hLTy3nA9dLJAnFQWM+tQ/HSgP95TwFDTB+/8ngaBlbLznTw1HFrWP7QiXSHjNp
         g0PR9yDXJ/RjGAw/1gIJpMoGY95AUJkhg1iLt8EsQQtBI/dQp7kHLQK3EYqViHj/nkfa
         zaBKTJbd58Dpjn0kTaVbwnSXMsjkcxmQ55VSvBv0hezPUiQ6X5DeF+dJa0142Jzt4wYu
         pupwU7iX8M1AdgUFZDfulu9b4fSFXxSBtIP+R1Y5EYtZDCUFDJwv3WnnOBNUfJ0CBjrX
         0PQ67u4OzSBGN5p0fhhsCFYeRsalKJsgkmDqKdBwDKKnCOC+/+UHDaxYOQZukaQEj5+7
         dhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619735; x=1778224535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcRaxEDDkb3JD3v/suj0HVGZb78w7Xi1M1DpP43HiY4=;
        b=sR59VZYhF/FaFi4NVbEiOVV1jckbduBMYJ6dyr5BKTHDQE2y7vU7QcWnLhFv+bqXg8
         LHdSoDcKb+5/lo43XkMFj0ZbhUToROnRF062OznfrR/N3IV6zsWazvKYyWEoN8ByGtOG
         sYWwGAX+9CuYNyRepglhpJO0Kg2hTqYEK+NnXyvHRMgf0d58GgbupyA5R4VkfDWeBYrD
         BeCxPAIcdSPyOn09fcMnlRE4InryatkADBvbyiuPtnMe46fEge2BvFoPNI/Op4gUwsxd
         aS33qaB1NxZ9GXAtjwcumvdFNS/l0q8drsLzxMAiU9zPPmCPqKatliEa70c/f+VXCVWG
         5aWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vJBOm4yT5od3koVau3kAe2IYuglofZAlteEq27+EBgwAqxc7tESeokMbxwFYk4qRSrw0Oy06ozXauSVPT@vger.kernel.org
X-Gm-Message-State: AOJu0YxkELW8BG+SC91W1na3oZqTJDwx3gzq+z7C+65d+vIzMwAUwKFQ
	vsmTik49a+QR6fd0NHKhK4jNmHNBhSzCFgnZojdw72LTS87ipWAXYDtRh04cnoApSr0=
X-Gm-Gg: AeBDietytkd6mn/S4ag19bRORiR3UL8Q56n/GCotemITKbFbda00djhbz9CFKjo0SWR
	cS80rRDPcRsPMgCR6dbDNEsAh41LMNb6eB30486ixAvtYCVxHrZ9uAuYqLShoF+LTBoRX1Z0jlb
	ueqcYRLpQrCOZ2U3cTJbq9GxR/OfNnA3tpKW7ZsM++j+CvNCPl/3kxIgUw4sv2J7pt82LmMGb61
	Uf0lDp1CZfljNrwN3BNNMRC3WPKrsCUT+bZO9179md1hYcaA59ngaD7q5HIEmg3hEv5Woud7LPt
	9LgV+kehzwv2KRyyKI2htvzukWeuDGwH7QxeCnMAPkgK2Ruc3N3YR1bUrr8R8uXgyZhVUoYQZ//
	H7SrnKUdg/1deMBSd8dO27e3svU4vvZD1HLtuGYUiGpaVRnmJw/7lPL0q5/qUClycQHWkbedZ4+
	8qVOQqn0U7xfb4cy48ZVW6m9k4I9jkL5xXxwTbg0+X2oPD+Lq3GVBIFdDGno6QhhdgxyfYrl5EX
	e0OjvsvJZJb1hSXlxY=
X-Received: by 2002:a05:600c:c049:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48a844683edmr73734095e9.15.1777619735065;
        Fri, 01 May 2026 00:15:35 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:48 +0200
Subject: [PATCH v3 6/9] drm/msm/dsi: add support for DSI-PHY on Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-6-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=2987;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+OinyCwXS4Y2vYMDBUiIEDzwsNrg9k3i/PQu3jWxkfU=;
 b=SiQkl681uapJJ+uqBxGlRfO5q1AtnuHZPJC8JzrYe8Fk7kRLJyIsRWb0JSIR4rjf1Jv9SL4hj
 nPMtRiI/fR2DJlUQXHXfyEcjYDMgmdMJtNxhlZFToLqesXQZfRTZIrJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 9F7184AAE85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105444-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
2.54.0


