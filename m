Return-Path: <linux-arm-msm+bounces-4305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A3180E012
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 01:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5711A1C208F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 00:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6808C635;
	Tue, 12 Dec 2023 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mrBN8C3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DAB182;
	Mon, 11 Dec 2023 16:23:19 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBNnaB2003841;
	Tue, 12 Dec 2023 00:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=MdVdTqm2SnjeHGf+wBOunjuqwixx0LwrCBV+TNRYjYk=; b=mr
	BN8C3CWZAZEFPo5x0rB2TFfoS2yh11DRFqJ8nwh+hsFeuvrEyE9dN4NQcAh+8152
	grJIjDVHUzOU0y/PsQZ5N9Ajkg/sesVcNOwOwEZPuG4so55V0jwbauQXpDyd5S8F
	iVj9UFOBIpqwD33DuCNG2A48THt4mKYPurZ7KhyEh5fmJAEmngbHDkkH7LjLkuB1
	U4iTi3eDURRwwx1uIr1VIQEgFD7EHZ0HyFALPJKS1UwSU+pL/SBgM0nGlFXPSnj/
	TffEfzsFuvlJSV4IABaiqk+f0Y9haogvbJEW/4UsDj5Ix4wTbDI6cBhRtAJ6LB0d
	6YVrocBkMNuvFgSEzTZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvney4t9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 00:23:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC0NATF027452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 00:23:10 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 16:23:10 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 08/15] drm/msm/dpu: add cdm blocks to RM
Date: Mon, 11 Dec 2023 16:22:38 -0800
Message-ID: <20231212002245.23715-9-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kDo4pKRYPa4tqMC2aKRfedUsLsiNsy1L
X-Proofpoint-ORIG-GUID: kDo4pKRYPa4tqMC2aKRfedUsLsiNsy1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=906 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120001

Add the RM APIs necessary to initialize and allocate CDM
blocks to be used by the rest of the DPU pipeline.

changes in v2:
	- treat cdm_init() failure as fatal
	- fixed the commit text

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 0bb28cf4a6cb..7ed476b96304 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -8,6 +8,7 @@
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
+#include "dpu_hw_cdm.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_hw_intf.h"
@@ -176,6 +177,18 @@ int dpu_rm_init(struct drm_device *dev,
 		rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
 	}
 
+	if (cat->cdm) {
+		struct dpu_hw_cdm *hw;
+
+		hw = dpu_hw_cdm_init(dev, cat->cdm, mmio, cat->mdss_ver);
+		if (IS_ERR(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed cdm object creation: err %d\n", rc);
+			goto fail;
+		}
+		rm->cdm_blk = &hw->base;
+	}
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 36752d837be4..e3f83ebc656b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -22,6 +22,7 @@ struct dpu_global_state;
  * @hw_wb: array of wb hardware resources
  * @dspp_blks: array of dspp hardware resources
  * @hw_sspp: array of sspp hardware resources
+ * @cdm_blk: cdm hardware resource
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -33,6 +34,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
 	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
+	struct dpu_hw_blk *cdm_blk;
 };
 
 /**
-- 
2.40.1


