Return-Path: <linux-arm-msm+bounces-50611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20906A560BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA8633ACEFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D2519DF4F;
	Fri,  7 Mar 2025 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJPMy9RR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D819D8B2;
	Fri,  7 Mar 2025 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328699; cv=none; b=UWnmctCMBjgU3rJYMi2fCgy08WzhISou+Uzl/7Hxx4w9EolZwsk7KnAXt8rTgcUIfXRGliZmEAQcaAm2YbWRrm/mdw68G7RbZdW0rVuxl9kU30E19QJeqNogw+b0f1zS6K3PtaJv1rH8ES5DFP6EL45b8QKuzX92ltVwi99eXMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328699; c=relaxed/simple;
	bh=COTJmpehTL1rqBWLaVLmBcx2Zd3PWSVerAn8AjypONM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7Ypm290YQ2KDingHRuOTqab9vw/XPqSNa3Sp97xWR4zsFfAGLSk/JvOgFuehC2luJq+g6LxE0sllGyYgoYRJiWexEHAFfe+x3I9k2Al0vj64k5p9vi92y7C+SEAUE6IUG12uGSCAvC+db5qO8jr/KAqJfDFHFIdYbV84kySc1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJPMy9RR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07E0C4CEE2;
	Fri,  7 Mar 2025 06:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741328699;
	bh=COTJmpehTL1rqBWLaVLmBcx2Zd3PWSVerAn8AjypONM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OJPMy9RRuc15yTXeaDIXMlcBmsMiYWthl95EEE4OgCVVg0kecIMH3O55WlZ89ZR/t
	 N00HP6G2OufyJ/CfbIlcuv9tgGLFYayUQZudq0ZwVQ+KNKdP4LZASeWYIi/XNyPQ0O
	 NUtfBlYyuLPQ5wA2fDSRZVELCG03NcDeKTLJRp/Q4w1dUkriMzpL4NyVwZFXewof7d
	 ulX35x2GkOs/0xgVJCzILEGQGS1u9Uz9gR57SP/+4LZoCD6JuWlZFYx5oDOk6nvbF3
	 s2P2z4VuK9CUktWBiuHikrRPNa4WadS5K2CkduxX4pBg8+yW4gnhLu2fUtmMuHU6mW
	 Sh27Yeu0Gf4QQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:49 +0200
Subject: [PATCH v3 1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE
 register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-1-5d20655f10ca@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2KzB7MVrQ8mNDqcSYg/PvE6Eo4cj8//gOCiAAUaKJMo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE0JQvGutc5vQq/Ou3ybCX2LmPVTfF5kvXuO
 X/Dk2t4bkiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1bbtCACyYtt6J5w986FPN7Shvzr9Obvzi4JrxZSdc1xN0ecpCRIZlQMAFrKsCv637NzRPBZVwrG
 F9XIkU62uQTGiz5Fh05bnaBT5+Agmo+Q47tWbCEhNtZxeh38T/8uiUpf42ZO8uSwFUM/LrMivJP
 DqGGWcBZlEEnGYsMkua8OgvUYYgTAVldgAfZdYVUHNNdgPujdEQo8iJtsSjfzElcXbdEdp2z5QX
 IQYsVdJS9SNTPu/0Sc3x/kYsMsZqxYKeQ7VMh9YeBikMJEKXPKl1Iv7soZa7jT5P93h3M8dWqhL
 epyvKAI0QDzcLCAa66nYBVLzCCD6H+yQsfMJVmFmMEmnvrba
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

In case of complex pipelines (e.g. the forthcoming quad-pipe) the DPU
might use more that one MERGE_3D block for a single output.  Follow the
pattern and extend the CTL_MERGE_3D_ACTIVE active register instead of
simply writing new value there. Currently at most one MERGE_3D block is
being used, so this has no impact on existing targets.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 411a7cf088eb72f856940c09b0af9e108ccade4b..cef3bfaa4af82ebc55fb8cf76adef3075c7d73e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -563,6 +563,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 wb_active = 0;
 	u32 cwb_active = 0;
 	u32 mode_sel = 0;
+	u32 merge_3d_active = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
 	 * per VM. Explicitly disable it until VM support is
@@ -578,6 +579,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
 	cwb_active = DPU_REG_READ(c, CTL_CWB_ACTIVE);
 	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
+	merge_3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
 
 	if (cfg->intf)
 		intf_active |= BIT(cfg->intf - INTF_0);
@@ -591,15 +593,15 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->dsc)
 		dsc_active |= cfg->dsc;
 
+	if (cfg->merge_3d)
+		merge_3d_active |= BIT(cfg->merge_3d - MERGE_3D_0);
+
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
 	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
 	DPU_REG_WRITE(c, CTL_CWB_ACTIVE, cwb_active);
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
-
-	if (cfg->merge_3d)
-		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
-			      BIT(cfg->merge_3d - MERGE_3D_0));
+	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);

-- 
2.39.5


