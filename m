Return-Path: <linux-arm-msm+bounces-12235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D53D860315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 20:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B66E9283537
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 19:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CF46AFA1;
	Thu, 22 Feb 2024 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RpWa1w3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643E548E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630861; cv=none; b=SXwGopJ2CuOpCqp6PidwZ5WUJXMI8O1tcPqZdvV1ap1YxoboNvvFZWfO3pa7B5clhAnpIl8eWSMFLoDIvPD6QyOPyIS+lHjezyd8OAlHIMIvO1yhjYaywsxIir0Ry2j0p9nZbZb6ezR6w/rY/kHSS8oi1aU943X6Yer4JOIj5kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630861; c=relaxed/simple;
	bh=3Sh+ZbyVtiQXxLMPUYcjGu099JPMEbKm73LX034zgmk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CuQcdt0ej4+V/PC1IFKj3NX7wYzkyWIWFmfKe2KdwrpDGtvmpq2BPSsC6Vn5ihZTQCgW8Fvv86oJ1s+Da2Ko4v3PdfSXFj2jlj2s0nS4t3B2a9cAit5XYgVUQwoQyeCmbSSEXjnH9u6mqqWdrerwUvYetcKw8zGC3T/CN9lb25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RpWa1w3D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MGtKkZ005497;
	Thu, 22 Feb 2024 19:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=3NLGh+PlLpHnJmnoC/KrdCEc34AIogLRiMfhN2q8JcU=; b=Rp
	Wa1w3Dcmwk76viaB0TUKCtzOD8nGzVlAGgwkqnwSQRfh2t00GNZF++PfewD8peeN
	us054EjLPJNdMJNBUcWqaQ0w6bZErGsqNwf8yrZiw90AaiwrQ/orJWVTSODrWiAM
	3Cp+3Wcd4Ld/qm3G4D+NMb7KAbDuZ/Eg++G8iC0caYBNT3l3p+nuwNBxAkgN1ICs
	POdEsq0nn3nkrIMvVeDf9b8tRyVrqQr/1BJWmLkFIyooN1S0QAS6UcrnVh8VLO2k
	F4oMd6pip9ppD5Jvqtk68euuJKwzaOAoGQfvWyCahefufjN1NH7gjtRlja5c3EVO
	PoX9k+LqOFt/7jaKnj9g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wea7crt7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJervx007241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:53 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:53 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 15/19] drm/msm/dp: enable SDP and SDE periph flush update
Date: Thu, 22 Feb 2024 11:40:00 -0800
Message-ID: <20240222194025.25329-16-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H9cuf8vSvbdCorwCo0B0R8yK7iJqsh77
X-Proofpoint-GUID: H9cuf8vSvbdCorwCo0B0R8yK7iJqsh77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=742 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220154

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  6 ++++++
 4 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index bfc6f53ae167f..e5e7c04557707 100644
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
index 3605252effb59..47f80bb39ccd3 100644
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


