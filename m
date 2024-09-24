Return-Path: <linux-arm-msm+bounces-32362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42114984E8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F04AB28286B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D148618859C;
	Tue, 24 Sep 2024 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Li98d5Zt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C763187327;
	Tue, 24 Sep 2024 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218819; cv=none; b=eNR2+DDdZt5PKC7mILNf0sO3ds/GK7Ce/J8V/mLYMPiVLrJkP+IXpuyzqgddxbmcZiCGFvT5MR2TLeizqQYghybPLNFgFaEPQC5YfVntvay0HlzXIdj+3JPtXsvQUj2bKCQomi+WMntw9B5THIhrR0bFGb9Y8ka/mHmkCaj6P3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218819; c=relaxed/simple;
	bh=RL34XTU1nys9HPuVHL5WLNhPTb9MFDB9A7MxW9mXC2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YTVdNn3Bc4hG+CSK14u+hLjm6zLCBCxAkSqOUyu1Qa0e4yJpwDp/jM9MDvn6zVBed1XMvbqyyOkHX7COrRfq4rDbj9mgVsFNKDiiKmc/d1aninre/sH/CCzlTq8xTJ6mv+QRXbkeshIDgU3q47poCOGlUP31wCvgM5jscffsLD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Li98d5Zt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OINfri032473;
	Tue, 24 Sep 2024 22:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Snbk+VglU+r5GWiNP11i358oExa2J5dqnHoJhVK/YXY=; b=Li98d5ZtlDsPZWHX
	3nswCcAAVEg8zaq7iMxT/IbasyZZsjg8QJquOozgKrQxAU5F53X25ub2sl4K13nX
	F6hd6OvJLgEDsVHtQGcTHCSASpXZsnI9HDoGeiUJRbdp8So/I3RbRwce5ryH9aNY
	ovrpi9XEtsxiKqP0kqo/J/UFmsq6tqQUUPv+MI+FGbfuyyDcVdf5HyY1qRqWB/TW
	VHG8sctq5KIyrrO5ZXJvWhqbJedAl8vgYhhW33wR4aGki1B3ztOTXWNg++ABcRb4
	pA/KIH1y6xqXLd8juNWmxxLwINf51wjUrS0ALB1/reKvyImxB8lI4DZcKJKlKAnM
	JVQzTw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7ujbh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxue3007682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:56 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:56 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:26 -0700
Subject: [PATCH v2 10/22] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-10-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=5974;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=RL34XTU1nys9HPuVHL5WLNhPTb9MFDB9A7MxW9mXC2o=;
 b=eebz8f5SDNMO3XR2KjJQOMIkZtOi4V98N8F0G2bYt52IuqUuWvF1UoOif2Wb2uXellujx71l2
 v6FBwm2KBb6A8m5j9FalqHXFasM+VLDRnltZ6FeAmT/PQOLOaiyJFKH
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Dpb6Nu10YWZ1eWJQznPehzdv7gXT56Ok
X-Proofpoint-ORIG-GUID: Dpb6Nu10YWZ1eWJQznPehzdv7gXT56Ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409240159

The CWB mux has its own registers and set of operations. Add dpu_hw_cwb
abstraction to allow driver to configure the CWB mux.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile                |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c  | 73 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h  | 70 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 +-
 4 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 13110fcc46a8..e05bb740246b 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -77,6 +77,7 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_hw_catalog.o \
 	disp/dpu1/dpu_hw_cdm.o \
 	disp/dpu1/dpu_hw_ctl.o \
+	disp/dpu1/dpu_hw_cwb.o \
 	disp/dpu1/dpu_hw_dsc.o \
 	disp/dpu1/dpu_hw_dsc_1_2.o \
 	disp/dpu1/dpu_hw_interrupts.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
new file mode 100644
index 000000000000..5fbf52906ea9
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#include <drm/drm_managed.h>
+#include "dpu_hw_cwb.h"
+
+#define CWB_MUX              0x000
+#define CWB_MODE             0x004
+
+/* CWB mux block bit definitions */
+#define CWB_MUX_MASK         GENMASK(3, 0)
+#define CWB_MODE_MASK        GENMASK(2, 0)
+
+static void dpu_hw_cwb_config(struct dpu_hw_cwb *ctx,
+			      struct dpu_hw_cwb_setup_cfg *cwb_cfg)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int cwb_mux_cfg = 0xF;
+	enum dpu_pingpong pp;
+	enum cwb_mode_input input;
+
+	if (!cwb_cfg)
+		return;
+
+	input = cwb_cfg->input;
+	pp = cwb_cfg->pp_idx;
+
+	if (input >= INPUT_MODE_MAX)
+		return;
+
+	/*
+	 * The CWB_MUX register takes the pingpong index for the real-time
+	 * display
+	 */
+	if ((pp != PINGPONG_NONE) && (pp < PINGPONG_MAX))
+		cwb_mux_cfg = FIELD_PREP(CWB_MUX_MASK, pp - PINGPONG_0);
+
+	input = FIELD_PREP(CWB_MODE_MASK, input);
+
+	DPU_REG_WRITE(c, CWB_MUX, cwb_mux_cfg);
+	DPU_REG_WRITE(c, CWB_MODE, input);
+}
+
+/**
+ * dpu_hw_cwb_init() - Initializes the writeback hw driver object with cwb.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  wb_path catalog entry for which driver object is required
+ * @addr: mapped register io address of MDP
+ * Return: Error code or allocated dpu_hw_wb context
+ */
+struct dpu_hw_cwb *dpu_hw_cwb_init(struct drm_device *dev,
+				   const struct dpu_cwb_cfg *cfg,
+				   void __iomem *addr)
+{
+	struct dpu_hw_cwb *c;
+
+	if (!addr)
+		return ERR_PTR(-EINVAL);
+
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return ERR_PTR(-ENOMEM);
+
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_CWB;
+
+	c->idx = cfg->id;
+	c->ops.config_cwb = dpu_hw_cwb_config;
+
+	return c;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
new file mode 100644
index 000000000000..96b6edf6b2bb
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#ifndef _DPU_HW_CWB_H
+#define _DPU_HW_CWB_H
+
+#include "dpu_hw_util.h"
+
+struct dpu_hw_cwb;
+
+enum cwb_mode_input {
+	INPUT_MODE_LM_OUT,
+	INPUT_MODE_DSPP_OUT,
+	INPUT_MODE_MAX
+};
+
+/**
+ * struct dpu_hw_cwb_setup_cfg : Describes configuration for CWB mux
+ * @pp_idx:        Index of the real-time pinpong that the CWB mux will
+ *                 feed the CWB mux
+ * @input:         Input tap point
+ */
+struct dpu_hw_cwb_setup_cfg {
+	enum dpu_pingpong pp_idx;
+	enum cwb_mode_input input;
+};
+
+/**
+ *
+ * struct dpu_hw_cwb_ops : Interface to the cwb hw driver functions
+ * @config_cwb: configure CWB mux
+ */
+struct dpu_hw_cwb_ops {
+	void (*config_cwb)(struct dpu_hw_cwb *ctx,
+			   struct dpu_hw_cwb_setup_cfg *cwb_cfg);
+};
+
+/**
+ * struct dpu_hw_cwb : CWB mux driver object
+ * @base: Hardware block base structure
+ * @hw: Block hardware details
+ * @idx: CWB index
+ * @ops: handle to operations possible for this CWB
+ */
+struct dpu_hw_cwb {
+	struct dpu_hw_blk base;
+	struct dpu_hw_blk_reg_map hw;
+
+	enum dpu_cwb idx;
+
+	struct dpu_hw_cwb_ops ops;
+};
+
+/**
+ * dpu_hw_cwb - convert base object dpu_hw_base to container
+ * @hw: Pointer to base hardware block
+ * return: Pointer to hardware block container
+ */
+static inline struct dpu_hw_cwb *to_dpu_hw_cwb(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_cwb, base);
+}
+
+struct dpu_hw_cwb *dpu_hw_cwb_init(struct drm_device *dev,
+				   const struct dpu_cwb_cfg *cfg,
+				   void __iomem *addr);
+
+#endif /*_DPU_HW_CWB_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index c17d2d356f7a..c43cb55fe1d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -1,5 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_MDSS_H
@@ -352,6 +354,7 @@ struct dpu_mdss_color {
 #define DPU_DBG_MASK_DSPP     (1 << 10)
 #define DPU_DBG_MASK_DSC      (1 << 11)
 #define DPU_DBG_MASK_CDM      (1 << 12)
+#define DPU_DBG_MASK_CWB      (1 << 13)
 
 /**
  * struct dpu_hw_tear_check - Struct contains parameters to configure

-- 
2.34.1


