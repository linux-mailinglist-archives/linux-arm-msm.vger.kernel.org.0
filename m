Return-Path: <linux-arm-msm+bounces-42432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E639F3F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F9AF16E4F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCED14AD29;
	Tue, 17 Dec 2024 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E/MmHapn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E8142E9F;
	Tue, 17 Dec 2024 00:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396225; cv=none; b=qSvvZ5xij09YzFZ8Ii5NhNXlaeU1PjI971lzQwCT17lkkUG0g54C4I600HyJBUJPfiM6QlK+msolkylIZuLmhzsz3F3nxllmXpt9DCAXV04bCmo8YCzwD/524SUvs4TOfqHUHTYFFofc+h4bSLYln6PGAp0iepnzpPOX+Qv4b+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396225; c=relaxed/simple;
	bh=gMsF1fvfZ6J+dREoTirediU1MJAIXvUM5HbDWgdWP3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tOM26uOiBRTb1BDyjYN2G3CGUi7Tq2Crb7p1pQjY2KA2aNVUDRw4Wbh39j7DswMUxUccd9zkiFHAmGBnfc5m6vljBSwIR0a3o1PPK5/DhpYIUHc58u7lOUP6oebC01ULf2s6LJIDI4QNwqDtJyEzyhPza6Kvz9ucgLKZLuhDt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E/MmHapn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKtPQg012689;
	Tue, 17 Dec 2024 00:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+d0OLk8lL9+21x5Wp5tf71MP+ljdFidXqxHl/06soyI=; b=E/MmHapnjXPVG7In
	M19V3wX+rb9xyOdQ/2h7K80z2I+ZOPBw1DJK2HCj6SdmONnmrCC7DrAaqDCMwIuP
	TIuA03JSrc2Jz7rKeg+JYHdjdZajPlNLuOVwIdJfteJakkdzL0GikhHxPnC0LIdW
	Spwc3zJb0uFGNvztLmn3hAhmj43r2Clpt95bYDrNBHWhHLZBce1veD7fTbDQnDzW
	2JrexA8zzLxn80DL5xV43XqZwFlC2MKwNKJzcMmc2pZRS2BYrIkUOWJWVtOrz0UK
	oe1+aE1Q1r7fi1uVJP69VK+liv6OJv5N9e7e3J/CIQH0gitcmT2AeV5xYO4wbpsP
	9SC8fQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43junjgcqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hTeP010627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:29 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:29 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:25 -0800
Subject: [PATCH v4 14/25] drm/msm/dpu: Add RM support for allocating CWB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-14-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=2849;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=gMsF1fvfZ6J+dREoTirediU1MJAIXvUM5HbDWgdWP3A=;
 b=m4ZAVM7B1qDS9fuNnmi6usa8A036LCmdpAelm3khpnE9qLIhIWkNKnMzdtIvGH1uM9a5rFUtk
 N3L1lwjCqJbCAGLFPcbOfAtYpEtfLvwXnFSicA7Rjxf0ZJ8KkT9KsNl
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -dcRBZ6wvQEZn1dE4cPi0dJHPkqHfHBD
X-Proofpoint-GUID: -dcRBZ6wvQEZn1dE4cPi0dJHPkqHfHBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170004

Add support for allocating the concurrent writeback mux as part of the
WB allocation

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 16 +++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2f227e6826b5f90bdab508bd1e87075d8b4274fd..b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
@@ -10,6 +10,7 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_cdm.h"
+#include "dpu_hw_cwb.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_hw_intf.h"
@@ -123,6 +124,19 @@ int dpu_rm_init(struct drm_device *dev,
 		rm->hw_wb[wb->id - WB_0] = hw;
 	}
 
+	for (i = 0; i < cat->cwb_count; i++) {
+		struct dpu_hw_cwb *hw;
+		const struct dpu_cwb_cfg *cwb = &cat->cwb[i];
+
+		hw = dpu_hw_cwb_init(dev, cwb, mmio);
+		if (IS_ERR(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed cwb object creation: err %d\n", rc);
+			goto fail;
+		}
+		rm->cwb_blks[cwb->id - CWB_0] = &hw->base;
+	}
+
 	for (i = 0; i < cat->ctl_count; i++) {
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 893344bf1141046a45f32a1834f857a56aa2b9b6..b061dfdab52e04ab7d777e912a30173273cb3db7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -20,6 +20,7 @@ struct dpu_global_state;
  * @ctl_blks: array of ctl hardware resources
  * @hw_intf: array of intf hardware resources
  * @hw_wb: array of wb hardware resources
+ * @hw_cwb: array of cwb hardware resources
  * @dspp_blks: array of dspp hardware resources
  * @hw_sspp: array of sspp hardware resources
  * @cdm_blk: cdm hardware resource
@@ -30,6 +31,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
 	struct dpu_hw_wb *hw_wb[WB_MAX - WB_0];
+	struct dpu_hw_blk *cwb_blks[CWB_MAX - CWB_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];

-- 
2.34.1


