Return-Path: <linux-arm-msm+bounces-50612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47427A560CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80645176307
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886441A0BCD;
	Fri,  7 Mar 2025 06:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvcUzVA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B11A08A4;
	Fri,  7 Mar 2025 06:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328702; cv=none; b=b4OczUpe97pSlaMNPxMCbT9Y3wBBqShCa/Qjf6UwymTxhxgwrP2+LtjKkcbu8Eht6avGcxQVummzOcy9HsczzRsJ86DDwN1JrSyfnmyBj7/7YNX83Tl2SCHTgSs0nYIGWuIrbjCRqQDUBt6WXewgx+FIWWpXApbfcs9wx8YI0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328702; c=relaxed/simple;
	bh=KIrLiVVV+Sg6qS5vZTvod7Ag60TPe5TFBv3IR6bpDp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6esEVOW3/2xQ/CFSBo5UjU8DC6BhPa+ZPHn1m7L5bpli+qD/dYQZzu6TUDjSO9m4iXf2V1D2JYkzXKDXypr1ympXnLBjExskg6yBj6L7SahIOSYpWugtWFwHgnUhmDnCTpXA6n+P87VXujz3ob1aKz1UDh1Wl814VbfT1dnKxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvcUzVA2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8698CC4CEE3;
	Fri,  7 Mar 2025 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741328701;
	bh=KIrLiVVV+Sg6qS5vZTvod7Ag60TPe5TFBv3IR6bpDp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tvcUzVA2JwK+BWrilnd687P+qeZ3WOf5gBcYovkkwo/YPYBug9hUqS/Y7GnIcqTuK
	 X8+UKuS4X8l35qfPCTZZ74Ip2OqtKXsbNULqbNCuHW8NguWe4Jd6YnZ+Iu3S08Qf3h
	 uTT1dUKR3Sb2IFo11fmLpwXBzd23FMWo60/4K2jA3bFglYrAWmh7EDEtIvEF7Ygs7Z
	 3Im8P8iXpTSbDWkdsgsXXgbEeSRbmS5AfCWvt/3ngk1/D+HIj46oOv9l+okBGZ0MmW
	 6bQl6oOJx/oxNvzTTkHi33EmfF/P81p5KNTxjTzCtKHVgX7Op1RAofhWnCymugTrik
	 hfgP0SNXu+UFw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:50 +0200
Subject: [PATCH v3 2/8] drm/msm/dpu: program master INTF value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-2-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3072;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dsl/X85JqKMZkF2z4Sv0M7PrYvyUxVb/hggIB5gpXcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE078sE/9nDleFsg2P+nLw45LzbbxfzZgU2a
 QyPZSFBQnKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1enqB/9OeHWTOscaVgJ9CA+NyrsxvNeH+TJ9+iXiCKIS9IMQmn/evjMsHeQ07iZk+9ZgSNo++Qg
 9sv2esq9PAow9R/jvh2uTJncKsusILEy+JZ2UNSQaee6BFP133WxCtyYjnmSVsS9mMEWwFQ0hZc
 38R47AEx37GBlVA/nYZqxEBC2RyJLlZrw8ph91FZsqrsPuQ0PuiOn+YbDBDrVDQ4Medfeknd6t5
 852aFO0bgLmMmVr3OKIGVJpPS21Ny09Cc5hdHBo+57okip/4m4ZLJduyzh1x6/rskXpgwFFKwox
 Bmb8lSJZLHEa6HtdJsOjcw1c3mnZEXlPycpVOYrsEAg2Np7v
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If several interfaces are being handled through a single CTL, a main
('master') INTF needs to be programmed into a separate register. Write
corresponding value into that register.

Co-developed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index cef3bfaa4af82ebc55fb8cf76adef3075c7d73e3..21f4d403e3c278d83d7eaa6a7dd53f471d9e296d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -603,6 +603,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
+	if (cfg->intf_master)
+		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
+
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
 }
@@ -645,6 +648,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_active = 0;
+	u32 intf_master = 0;
 	u32 wb_active = 0;
 	u32 cwb_active = 0;
 	u32 merge3d_active = 0;
@@ -672,6 +676,14 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);
 		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+
+		intf_master = DPU_REG_READ(c, CTL_INTF_MASTER);
+
+		/* Unset this intf as master, if it is the current master */
+		if (intf_master == BIT(cfg->intf - INTF_0)) {
+			DPU_DEBUG_DRIVER("Unsetting INTF_%d master\n", cfg->intf - INTF_0);
+			DPU_REG_WRITE(c, CTL_INTF_MASTER, 0);
+		}
 	}
 
 	if (cfg->cwb) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 080a9550a0cc6530b4115165dd737857b6213d15..cea23436fc80a17a679363a47f9f287b72623a1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -36,6 +36,7 @@ struct dpu_hw_stage_cfg {
 /**
  * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output interface
  * @intf :                 Interface id
+ * @intf_master:           Master interface id in the dual pipe topology
  * @mode_3d:               3d mux configuration
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
@@ -46,6 +47,7 @@ struct dpu_hw_stage_cfg {
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
+	enum dpu_intf intf_master;
 	enum dpu_wb wb;
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;

-- 
2.39.5


