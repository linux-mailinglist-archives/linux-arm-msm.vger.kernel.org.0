Return-Path: <linux-arm-msm+bounces-22578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985F906AD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 13:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1D231F220D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 11:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAAC13D28D;
	Thu, 13 Jun 2024 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qclio1o2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C2013C9C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277438; cv=none; b=A+bo8vdUaLvNsLw/oT6wuNYGYbMi0Qx2kzyn/3f2v0ey1kyHDcNj8y4uWP27nuHlzckDdF0RzXEn8nPOkULQGP/C72AEptZ2viTfge7uoF9CykK6MYbc4RWVSq5th8LcKi2ICG/mh4cKrp6EIjOJv4OfYz7ys3ZHi5ptUSVZbqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277438; c=relaxed/simple;
	bh=zaLnXtjhSfMjwxXHUXTz+nqXne4h6uGPzcAAHGpZsK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=si0D6CYbrJWJZYJy0iIQwxCu8Za8skojcOsOeo7PUQuKGo8AgIEkzH5dRdZAmacnjx4SFJNwtX2ZEL6pYN86eRwesjmvT58GbKHFTmsD+UvmZkGyO5rGuLVghDZRTnBpR1ubYOe6PmlSbao52lAf8HZk8X5v2UaoJLfdhIZuG+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qclio1o2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe3fb5d4dso8215701fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718277435; x=1718882235; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRg9QU9KEyvIM7hg+h8JQRq1rNS69OHbVb2oGuE/2Vw=;
        b=Qclio1o2C9JP1GeDOzy9FRaZSRHsYoK3vJdPLQYKRdrdgKoxguaClz9At4WcGnLYUb
         m+0ilw3etZgd0YPJPFqt5/xRXzoxQvn8FAj4DpjopRsACgwJWGmAHGphNXctjq1qHYRt
         ZZhUhQO3jn0PWF1QG1JFR3J414HHpFVsc0e/RxN5wxjlv1GwszBuFF+g++qvg9YmeKs6
         oRublDQsw6NZhKHQeKEMwD871R3JV4tkIuTAcOzp4XtNE4JadbD8Aoa79mwDQ0lPpb4n
         VgeJoepzhprig2/xA6HwTbSdhLvBxm5usnxtSYKvqKo4a0eHV0N/gI3Hv8IIem5WMx6d
         WZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718277435; x=1718882235;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRg9QU9KEyvIM7hg+h8JQRq1rNS69OHbVb2oGuE/2Vw=;
        b=PNqpZ6ANc0VsX8MZ/PrATOCB0SFhth7lOPhPj/svvNxSJRrEBJmy8wVpFHbFagHl2B
         2xRa7CFzsa13Ri8ohNHrJCWovVjZyHZrX0O1E6fGd7qW6+mwCOa9A6p5+0qyJsNiZYD1
         UBHYyrGfSIaIMK3vVHi9OL4eQXjiJ+fybFrfRNPGBbyIT01ufwlZhjwHkITm+r+URo6P
         xEyOpKzxvxvlHedNNmMBnM+G1RtPa3/d3MK/+tMBT9FoepzH0kAx6l11c7SiYjdl+83y
         UqvEGGwzZ3etPT8h/yS+iWnEi9/I3hgIvpMNnKWApJDdFEW8bziEqumL3nA0AEY9hlZ5
         O4sw==
X-Forwarded-Encrypted: i=1; AJvYcCVn9vpOMWeMhsAc8HkWYP6uPxZyxEPv8ZDBzx6WdbFCm50voVU1ehEK+oKFdXRjq41A8+OKPSfQXszq1yrLytp3MW2b4RwDpzX5U3gfIA==
X-Gm-Message-State: AOJu0YwKlOSs7T2q6JEPu4qlthIrR6OTHg9cYrDvcklrMgNLt/e9eBBt
	djxIvdOg0GDeMguk37hsq+K63nsEFBOVnKfXSRTBQO6T0yk/9qLrdZAaR+0P91v0NQVITaMROTv
	9OPE=
X-Google-Smtp-Source: AGHT+IH4B65GpoKnV2+iqbQRge/DOF9VS0xG4DmrQy0bcpXk4rksSN3R9r+SKa/I+WNnGRzCuubh3A==
X-Received: by 2002:a2e:2e18:0:b0:2ea:8d49:c063 with SMTP id 38308e7fff4ca-2ec02b833a9mr7435201fa.13.1718277434685;
        Thu, 13 Jun 2024 04:17:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c8ad55sm1777841fa.127.2024.06.13.04.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 04:17:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 14:17:10 +0300
Subject: [PATCH RFC v2] drm/msm/dpu: Configure DP INTF/PHY selector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dp-phy-sel-v2-1-99af348c9bae@linaro.org>
X-B4-Tracking: v=1; b=H4sIADXVamYC/x2NwQ6CMBBEf4Xs2SVtIQU9mZj4AV4NMdCuskZbb
 JVICP9u5fhmMm9miBSYIuyyGQKNHNm7BGqTgelbdyNkmxiUUKXQskA74NBPGOmBshPamrImWxW
 QBkOgK39X2RlOxwM0Kew5vn2Y1oNRrlVyFcmllJKirHJZ17oSW5T4+rC5dHcfWmdp/yd2Jjf+C
 c2yLD/JjptWrAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7931;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hMo4/f/X4bTvPKBSY1eiPzqCzsv0HlfgBHiWpPsAB+A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmatU5p8Vmt1ZBzaa2WuGh6VVAHU4Zc48m3ZwjO
 X5UV1r1hW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmrVOQAKCRCLPIo+Aiko
 1ahOCACMePI9NdSjS7z9SGdbjxqBdBYT6C5PN6TLg2aam5taE06jX+6+I87P8FQucTTyHcz03eu
 /3orohBbVWvzPl0lDT08/7Cq3GPnJxSyOYAm+plYxE8BHiMixTqgnu4/J06gn3vM5XdoLPgZVeI
 tp16EvEcTBvP5tkSIs8CoVCx5figzwRMDibOVcUcYSLv9wMRUDvhhgJx3UkNy2t7eNvr8YCkmKW
 1GLD1VgoCvuquVCBJR+UGPjc/QB7k1LZ8m9XF5sZzqx5U6xiQqdVRIX5tD5xrWKdQUBUBpQPyub
 WQWyI+kLD+22VArXFBfqSTDVNf2h8Dgj84iBO+L35btfv6kb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Bjorn Andersson <andersson@kernel.org>

Some platforms provides a mechanism for configuring the mapping between
(one or two) DisplayPort intfs and their PHYs.

In particular SC8180X provides this functionality, without a default
configuration, resulting in no connection between its two external
DisplayPort controllers and any PHYs.

The change implements the logic for optionally configuring which PHY
each of the DP INTFs should be connected to and marks the SC8180X DPU to
program 2 entries.

For now the request is simply to program the mapping 1:1, any support
for alternative mappings is left until the use case arrise.

Note that e.g. msm-4.14 unconditionally maps INTF 0 to PHY 0 on all
rlatforms, so perhaps this is needed in order to get DisplayPort working
on some other platforms as well.

Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Co-developed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Removed entry from the catalog.
- Reworked the interface of dpu_hw_dp_phy_intf_sel(). Pass two entries
  for the PHYs instead of three entries.
- It seems the register isn't present on sdm845, enabled the callback
  only for DPU >= 5.x
- Added a comment regarding the data being platform-specific.
- Link to v1: https://lore.kernel.org/r/20230612221047.1886709-1-quic_bjorande@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 39 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h | 18 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h   |  7 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 11 ++++++++-
 4 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 05e48cf4ec1d..a11fdbefc8d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -231,8 +231,38 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
 	DPU_REG_WRITE(c, HDMI_DP_CORE_SELECT, 0x1);
 }
 
+static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
+				   enum dpu_dp_phy_sel phys[2])
+{
+	struct dpu_hw_blk_reg_map *c = &mdp->hw;
+	unsigned int intf;
+	u32 sel = 0;
+
+	sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF0, phys[0]);
+	sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF1, phys[1]);
+
+	for (intf = 0; intf < 2; intf++) {
+		switch (phys[intf]) {
+		case DPU_DP_PHY_0:
+			sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY0, intf + 1);
+			break;
+		case DPU_DP_PHY_1:
+			sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY1, intf + 1);
+			break;
+		case DPU_DP_PHY_2:
+			sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY2, intf + 1);
+			break;
+		default:
+			/* ignore */
+			break;
+		}
+	}
+
+	DPU_REG_WRITE(c, MDP_DP_PHY_INTF_SEL, sel);
+}
+
 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-		unsigned long cap)
+		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
 {
 	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
@@ -245,6 +275,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
 
+	if (mdss_rev->core_major_ver >= 5)
+		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
+
 	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
@@ -252,7 +285,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 				      const struct dpu_mdp_cfg *cfg,
 				      void __iomem *addr,
-				      const struct dpu_mdss_cfg *m)
+				      const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_mdp *mdp;
 
@@ -270,7 +303,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 	 * Assign ops
 	 */
 	mdp->caps = cfg;
-	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
+	_setup_mdp_ops(&mdp->ops, mdp->caps->features, mdss_rev);
 
 	return mdp;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 6f3dc98087df..3a17e63b851c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -67,6 +67,13 @@ struct dpu_vsync_source_cfg {
 	u32 vsync_source;
 };
 
+enum dpu_dp_phy_sel {
+	DPU_DP_PHY_NONE,
+	DPU_DP_PHY_0,
+	DPU_DP_PHY_1,
+	DPU_DP_PHY_2,
+};
+
 /**
  * struct dpu_hw_mdp_ops - interface to the MDP TOP Hw driver functions
  * Assumption is these functions will be called after clocks are enabled.
@@ -125,6 +132,13 @@ struct dpu_hw_mdp_ops {
 	void (*get_safe_status)(struct dpu_hw_mdp *mdp,
 			struct dpu_danger_safe_status *status);
 
+	/**
+	 * dp_phy_intf_sel - configure intf to phy mapping
+	 * @mdp: mdp top context driver
+	 * @phys: list of phys the DP interfaces should be connected to. 0 disables the INTF.
+	 */
+	void (*dp_phy_intf_sel)(struct dpu_hw_mdp *mdp, enum dpu_dp_phy_sel phys[2]);
+
 	/**
 	 * intf_audio_select - select the external interface for audio
 	 * @mdp: mdp top context driver
@@ -148,12 +162,12 @@ struct dpu_hw_mdp {
  * @dev:  Corresponding device for devres management
  * @cfg:  MDP TOP configuration from catalog
  * @addr: Mapped register io address of MDP
- * @m:    Pointer to mdss catalog data
+ * @mdss_rev: dpu core's major and minor versions
  */
 struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 				      const struct dpu_mdp_cfg *cfg,
 				      void __iomem *addr,
-				      const struct dpu_mdss_cfg *m);
+				      const struct dpu_mdss_version *mdss_rev);
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
index 5acd5683d25a..f1acc04089af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
@@ -60,6 +60,13 @@
 #define MDP_WD_TIMER_4_LOAD_VALUE       0x448
 #define DCE_SEL                         0x450
 
+#define MDP_DP_PHY_INTF_SEL             0x460
+#define MDP_DP_PHY_INTF_SEL_INTF0		GENMASK(3, 0)
+#define MDP_DP_PHY_INTF_SEL_INTF1		GENMASK(6, 3)
+#define MDP_DP_PHY_INTF_SEL_PHY0		GENMASK(9, 6)
+#define MDP_DP_PHY_INTF_SEL_PHY1		GENMASK(12, 9)
+#define MDP_DP_PHY_INTF_SEL_PHY2		GENMASK(15, 12)
+
 #define MDP_PERIPH_TOP0			MDP_WD_TIMER_0_CTL
 #define MDP_PERIPH_TOP0_END		CLK_CTRL3
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1955848b1b78..9db5a784c92f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1102,7 +1102,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
 					     dpu_kms->catalog->mdp,
 					     dpu_kms->mmio,
-					     dpu_kms->catalog);
+					     dpu_kms->catalog->mdss_ver);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
@@ -1137,6 +1137,15 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
+	/*
+	 * We need to program DP <-> PHY relationship only for SC8180X.  If any
+	 * other platform requires the same kind of programming, or if the INTF
+	 * <->DP relationship isn't static anymore, this needs to be configured
+	 * through the DT.
+	 */
+	if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,sc8180x-dpu"))
+		dpu_kms->hw_mdp->ops.dp_phy_intf_sel(dpu_kms->hw_mdp, (unsigned int[]){ 1, 2, });
+
 	dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);

---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240613-dp-phy-sel-1b06dc48ed73

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


