Return-Path: <linux-arm-msm+bounces-10458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9E850205
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 02:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7FF1C21AC5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 01:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F4A3217;
	Sat, 10 Feb 2024 01:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AfsN3Sj0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6C7442C
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707529975; cv=none; b=HDd1F3+3G0QC7OL0p6ybbpchr1CJ55HVz7jrhmcLqcIgdVSOurYJwvk75DAcB/gcnick355bhDqeBQSRs+d7Umwy62luPU8zRZx/8UK43EIjsIfll2iqLcT+LEXEpsKBHi5h69T6OJGwBoNUaqjgBtp0ti56V08tgUlyrBoi/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707529975; c=relaxed/simple;
	bh=o8sDO4tOyDWPmhyTyPD2lWfHzoZgSESXNm0ZueHLju8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzqsaIDQlWhlsvbRFOroTenIZPeIUwAO7OZSp3pYNRSrYdA2W39QS3vclFYBZhi5kd3RlVCMipyprCRvbXCtZRSv1nu/TWRbPIgdKQt6X4AOVx/ZgkAydOz5C+0n1cogcmEvvnDEGig8ZgePYuLYRAGvdTSPQvE+LQjXRKaT7ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AfsN3Sj0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41A1pAFu029688;
	Sat, 10 Feb 2024 01:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=XoDfqPOEBy9pVam/iwE+ZtU0SpDkH1A8XN8pxxNyffM=; b=Af
	sN3Sj09Z0kcp+AvYN3bVArqrw3WommLnmXlIFSdV22awKR2rGZrnZEk/OWoNPlBS
	H2CJw7i2SpuZiHuStEkUYSwc70JWOBaLkg62qzJi/wNJunr6iWYpdHvjesWTehbY
	vZvEPSAUmfY/i7dG6400xw2A9fS/3oP1fFlmbhTMwwA25DvzvHQLBK+0OPUgnVMN
	Bumrxfj7hbcjeSoShJm42rqY1YF6cFtiDTCWbVxaIefVgkuJ0Xyce0b+ckX+90ls
	MhIQ/9OMugZW2cWLWoI4fW7IoWEk22APcsSS8IoLtdnoN+h/4nSvp9YvdIzXMRm5
	KfSTHHrCJU1G3OJxke9w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5gk2hxhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 01:52:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qmc1022591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 01:52:48 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:48 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush update
Date: Fri, 9 Feb 2024 17:52:06 -0800
Message-ID: <20240210015223.24670-16-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240210015223.24670-1-quic_parellan@quicinc.com>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 9qx_6N6O4AewhYlLiA6UBD3V_F7pHsK_
X-Proofpoint-GUID: 9qx_6N6O4AewhYlLiA6UBD3V_F7pHsK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=541 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402100012

DP controller can be setup to operate in either SDP update flush mode or
peripheral flush mode based on the DP controller hardware version.

Starting in DP v1.2, the hardware documents require the use of
peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.

In-line with this guidance, lets program the DP controller to use
peripheral flush mode starting DP v1.2

Changes in v2:
	- Use the original dp_catalog_hw_revision() function to
	  correctly check the DP HW version

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 0f28a4897b7b7..bc64dde5b7459 100644
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
index 5b3a7ba40d55f..9e2b05544f610 100644
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
index beef86b1aaf81..f1e7b0a5ee5d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -170,6 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
 
 	dp_catalog_ctrl_lane_mapping(ctrl->catalog);
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
+	dp_catalog_setup_peripheral_flush(ctrl->catalog);
 
 	dp_ctrl_config_ctrl(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 2983756c125cd..6ac66532b47a4 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -102,6 +102,8 @@
 #define DP_MAINLINK_CTRL_ENABLE			(0x00000001)
 #define DP_MAINLINK_CTRL_RESET			(0x00000002)
 #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER	(0x00000010)
+#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	(0x00800000)
+#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	(0x01800000)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
-- 
2.39.2


