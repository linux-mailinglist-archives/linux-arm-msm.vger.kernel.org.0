Return-Path: <linux-arm-msm+bounces-49787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE86A49028
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2944D1892B89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED721B4148;
	Fri, 28 Feb 2025 04:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPO7JSdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283EE1B041F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716059; cv=none; b=QHppMxBMn5e4mT3Tfjv5NsWl55TqXxi9HAaPhuOIrjL3P05lYUT15kK5fu8c+womRcqwKTKC46rYBZULUGrUB9GSXYNDHRNmVRkcAcRY9JsNxW5aFZFXxTRO0QFlgGCI9zgDDt/IeJpRxlswSx+eHjVfUOQNKFkdW61GfYpAXcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716059; c=relaxed/simple;
	bh=AoDhO2t+dIdRoZkxxXCA28rPq8VTkQxMjsmlolETDOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PcD36gyGkymoe7ULa9Y89jsXMee75JTz8pgLhmz673/DGS+bN27zR6ZvwhN3P74weSX+glV69eNxTdKLpWO1Ye/R9W6mCF3XZZyJNRvK9Vuw8IW5swlzVPAUu7qv6CWafj/SJL7sS9/o2oiOcaEti9c6FyW+ToSFOOFu9WtiXyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPO7JSdl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5495078cd59so191093e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740716055; x=1741320855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=229LaQQs3AtVYpVY7CYXwuqYuFTusa/OnRSCiJVHHMQ=;
        b=JPO7JSdlglpxMeiGfDKfk+kHDTYiQ6sTFYELLEe625gQqXEEGaWVcCfUG8GbPM7805
         SnxiP38GEQeUHIsnR1bRu3KBC4NEWyVagFixxDsVJohczSu0lYA385ZHNbmz6T78g4m5
         prhR00uLd7B/n1E1pMENNdDyp+JzGCH5uoer45fI5l3wIOCLXd8VQezQ3lx3lnFIzgy/
         zTN1epPmlsQEL7xJ09MRRxii9aY4Hyv9LuD8z6xPXmbHmdN4cLF9AFcSUStx/VBkWxHK
         86NPkxSH45lVvTpWjTsAOlvSRu2+p1sB7ezSefF6FvSb/vwaZcXe226yFw7g3/4btNw7
         IOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716055; x=1741320855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=229LaQQs3AtVYpVY7CYXwuqYuFTusa/OnRSCiJVHHMQ=;
        b=sU2Fk5stKWEaivsqy77ttw/tgJ6Z8ApwdjZf0qqgM89eGPqAT0cTJ9EcVRztLfLyp4
         fTEt9CylRKpZU0gyDmZLWCq7AIO1oGs3PURTCxCgBYZcQhsOudbfOhgkWvNECHlW688p
         KJEGCdHDMR22wOkZDgs9BJZCxFbdFlxWVaAV3/Bcxocsppimqa2FwJ+y0bdkg2b2VS/w
         Q37Sd6+8XcHg0CnieKTYdIH/phyzOQ4+UqoWBwPqHXDCCVnaDygm6/uEAXde3xu/8+KZ
         AjUcjnxB2jJ5lOgP/ZyOWoiyThDR7KOYKt8NfammxQOQ8gHHpX5iqFWmNekvtsFiNisj
         8ojw==
X-Gm-Message-State: AOJu0YzeHn/NyuJY+hgYc3TEiWEGgyEGTQkY0v9JSWWyKiDBZG9sOZhd
	FRCENlM7X/TdlW7qipFZJ7aCpypi+xH1FVTodKW+DhmYIw5UBJNKvMAS2n4CFAA=
X-Gm-Gg: ASbGncvv91Qga71+i9YosG+FZ5iWGufxqVOlS5cJ71stWDpL4gA3K/MydLhyWwm9Kl4
	NimXLi63x1YIic3SVKfVCvqeLICBIUpQy5LLKk6+mmaiCdsHN2FetsPStbJ8QQrRItj8c5EwGKg
	KSVXL85BVq7cjqz7u3uLpBXJfMpbZlvfHrAadBkhzVcUWTtyfm45zvvc/hUBhxHT8QBPsqgnIkk
	fx4HGofgmT8tz3+OGSP/kz/P/mGtyYw1/wiasnb+piGHnk3t4dSP/0wWcvKlU63/ZwyNjENlDPM
	QYO2SsIutQtX7lngS4kYrk6ho9qxEDUTIg==
X-Google-Smtp-Source: AGHT+IESa8qolAMTFNqWbMDxjYResyR5kPLAkWzhjfwsqrBTG4hn9eOwmrwmXsP01jgv8LizRkO9Kw==
X-Received: by 2002:a05:6512:3ca8:b0:545:1dea:7b2f with SMTP id 2adb3069b0e04-5494c38bd76mr634215e87.45.1740716055177;
        Thu, 27 Feb 2025 20:14:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:14:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:06 +0200
Subject: [PATCH v2 2/8] drm/msm/dpu: program master INTF value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-2-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2935;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AoDhO2t+dIdRoZkxxXCA28rPq8VTkQxMjsmlolETDOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgOI2a12c5nnpkFzuRBe/F8av9QAf5AGQdLt
 PAmBneIexiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1c/NB/4ld7gG0gXOmNt1fY0qrRWkykgxbJC059ytvMKjIFROSR3D9yGOy2W6VW5i3SVUU4RWYD5
 4HDjTvWuaP9iBjO/AqntSMDzuAS3xupXntxShitM4JcZDrRSXk2Gdy8C1B3TYfnArBSQOJOTyA7
 R3krlOq4v3n9me4V0BBsdQMbYzpTZIm11r6T2diA9NLtyXPoTPL3K8qj704t2d3ngq6hXjV7+et
 c6g/uznC+99Z8AbvtxmJ8ZciTFk5CaZofU4sqSOvoMUH5jVzkFiVesvv2oA4lT5zfv9L8uNxRca
 I1ELPXN4oFJVMUE30IPHTEP9+NYsOocTtEOF5QBMAOJKmTUa
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If several interfaces are being handled through a single CTL, a main
('master') INTF needs to be programmed into a separate register. Write
corresponding value into that register.

Co-developed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 32ab33b314fc44e12ccb935c1695d2eea5c7d9b2..ffff60c4206c6f2833293fdcc56b653f7d3124a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -583,6 +583,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
+	if (cfg->intf_master)
+		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
+
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
 }
@@ -625,6 +628,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_active = 0;
+	u32 intf_master = 0;
 	u32 wb_active = 0;
 	u32 merge3d_active = 0;
 	u32 dsc_active;
@@ -651,6 +655,14 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
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
 
 	if (cfg->wb) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 85c6c835cc8780e6cb66f3a262d9897c91962935..e95989a2fdda6344d0cb9d3036e6ed22a0458675 100644
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
@@ -45,6 +46,7 @@ struct dpu_hw_stage_cfg {
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
+	enum dpu_intf intf_master;
 	enum dpu_wb wb;
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;

-- 
2.39.5


