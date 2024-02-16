Return-Path: <linux-arm-msm+bounces-11436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6B8589B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 00:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2EA5B22D93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 23:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CAA148307;
	Fri, 16 Feb 2024 23:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LR1eClzu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA5D1487D7
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708124586; cv=none; b=OamqBndfyYnk2t9FmPJWDQG2JU94p6NgrwZcsz3whq08QcwEaZPweHqvKWYns9t27W+8E+RJVAidHQ/bKzQFSIZziVz+BbZDnzfpwRTVO6Cb6R/BPc2s5bq6F26sCqmuFBQ3XQSIZ1RGB4/TMGSYYw+3UHGrIvGWrUi0Frre6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708124586; c=relaxed/simple;
	bh=SHHeK3LAiZDUGsm7xDRBqidVEf2gSgSZBwmwgVzIwCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LL2X4mxxIUaGk8ayGVXni9v88f1rUba0fRDH5hpgTlEKgFFmf5G5uWfHPJIEnl0mSgpQ1JC8UCSE2yASbqmL0oCneFcWv9URbihVrmOY6gNhajYB8DYT3G3A9Ts58whb+wJEau+7n3PoLi8xl3A6+6wSpb/5g5GldlH3bwLxZ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LR1eClzu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GJo7RD019931;
	Fri, 16 Feb 2024 23:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=85IAUtYF42P553jD2yDS4mQdIRyIFmxchzCmhFHZPjc=; b=LR
	1eClzucFzGRT7bPqIRlAWuJyuN+eD96uH7Q0Hna9p75cczP43dwGwMCqoSQSNx8c
	HdrKL1FFpoCHhXF5H/Zje9SQQZL5h8YqNU18bnm5wcsh/9a31Orv7yQIso5KaNui
	79pWoXH0gC2An6rkvfwE9fPt2zOlJUVBwd/gCX126KGCcwBs5Z/rjD97M+u2QrN9
	CY0kanfrIzWOKGLsL+/rRHN6rgYl65o0T0VxEa5J/UbZp0GT1RA04pS3xFkEDsWt
	JGYPiRXrm76lhU8CgvXM+uYOXGcw9IoWGvtyBAkx6/wrN/xJ3N0OsnIB7Ebrc0SV
	Zxy2uevATLtlqXa9P6Hg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wa6nk9axu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 23:02:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2vGd032723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 23:02:57 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:57 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 15/19] drm/msm/dp: enable SDP and SDE periph flush update
Date: Fri, 16 Feb 2024 15:02:03 -0800
Message-ID: <20240216230228.26713-16-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216230228.26713-1-quic_parellan@quicinc.com>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mmHMTflQi5kUAGAUmpGfge770VtiLgtb
X-Proofpoint-ORIG-GUID: mmHMTflQi5kUAGAUmpGfge770VtiLgtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=706 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402160182

DP controller can be setup to operate in either SDP update flush mode or
peripheral flush mode based on the DP controller hardware version.

Starting in DP v1.2, the hardware documents require the use of
peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.

In-line with this guidance, lets program the DP controller to use
peripheral flush mode starting DP v1.2

Changes in v4:
	- Clear up that DP_MAINLINK_CTRL_FLUSH_MODE register requires
	  the use of bits [24:23]
	- Modify macros DP_MAINLINK_FLUSH_MODE_UPDATE_SDP and
	  DP_MAINLINK_FLUSH_MODE_SDP_PERIPH_UPDATE to explicitly set
	  their values in the bits of DP_MAINLINK_CTRL_FLUSH_MODE_MASK

Changes in v3:
	- Clear up that the DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE
	  macro is setting bits [24:23] to a value of 3

Changes in v2:
	- Use the original dp_catalog_hw_revision() function to
	  correctly check the DP HW version

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  6 ++++++
 4 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index c6e57812a239e..6619a20ffa923 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -440,6 +440,23 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
 	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
 }
 
+void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
+{
+	u32 mainlink_ctrl, hw_revision;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+
+	hw_revision = dp_catalog_hw_revision(dp_catalog);
+	if (hw_revision >= DP_HW_VERSION_1_2)
+		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
+	else
+		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
+
+	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 					u32 rate, u32 stream_rate_khz,
 					bool fixed_nvid, bool is_ycbcr_420)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 4bdc087410a68..8ad0672157df8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -98,6 +98,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
 void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a42b29f9902c1..a17b9a22858da 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -165,6 +165,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
 
 	dp_catalog_ctrl_lane_mapping(ctrl->catalog);
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
+	dp_catalog_setup_peripheral_flush(ctrl->catalog);
 
 	dp_ctrl_config_ctrl(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index aa9f6c3e4ddeb..3835c7f5cb984 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -6,6 +6,9 @@
 #ifndef _DP_REG_H_
 #define _DP_REG_H_
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
 /* DP_TX Registers */
 #define REG_DP_HW_VERSION			(0x00000000)
 
@@ -102,6 +105,9 @@
 #define DP_MAINLINK_CTRL_ENABLE			(0x00000001)
 #define DP_MAINLINK_CTRL_RESET			(0x00000002)
 #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER	(0x00000010)
+#define DP_MAINLINK_CTRL_FLUSH_MODE_MASK	GENMASK(24, 23)
+#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
+#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
-- 
2.39.2


