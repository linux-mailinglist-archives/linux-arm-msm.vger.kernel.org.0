Return-Path: <linux-arm-msm+bounces-11062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEE8551A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D15AF1F22626
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D81412C814;
	Wed, 14 Feb 2024 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BpX7ysnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87712CD93
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933863; cv=none; b=RuAI2Hbo+wLo6uXy3Tl/DJzvZZB01BpiMDx/IaOB3i0WLBA4QMjaexuamvtjpJTlsucAsvQQTTj2512wW21/5rin+BYVKQshSUelkB/Jy+wh+0tXUE7qQ3aMTw1aU1+FfXFU3WAUEmgRbaAoQq5Zbv7xJP56xDqvdZXHNpe5qaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933863; c=relaxed/simple;
	bh=nAe+XOjNagRypBJSk82D7Yq+ZkykaxgNMZCgfyUeLAY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7VqLo+/okbWos5DWZkO4JFXlpDhJ0IKq9MLStK/w9qn4fIAJ2feJIBYNM3OJTY2FDtv1ky61sBCHeVBKqiP9BayVVaRog5khoMI8QgySq/tIkLOC17/SV7Cl+Mmv0ffEqfXOJ9e69sNdI1KXEAmUJ/lUDMI08zlt7B/3igpcaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BpX7ysnj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EAvfqh018076;
	Wed, 14 Feb 2024 18:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=vrKW4NqsY+kPFIgdwQXbpNBqd5goMpP30q45xMFOG88=; b=Bp
	X7ysnjN2Pt1Sbxztgj1A1XNPBLt3O83m4j0INgUDOJMYGHZ1fh0YVmC2PYVseVkT
	1msYgz5VXBpIuVGdQc7k4WHjJrgXOlC77jACiB5VWUVDqD7xPXynrRvPscaPGiMT
	MH1XMXFwcMfw9Si/fcd4/3bmsR9SC1B1+QZIDr37VkXCdr8vg/kj6s33NfXq7fSz
	XyVwOoK+vjJhWp+3xjKhKUSB1H9C7C8Vz2GDHYmQDFnBNr5EfqJOuVR0IxlR0Gre
	WQF4/mzVIlcCCW6XvT43izD3KgkgkGkX05wf80rdGy5zsJ3QoYaEHjmZXZyRCHO9
	9hao6D+pyW04XMJi57ZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8jrj9y9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI4FsE011754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:15 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:14 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 15/19] drm/msm/dp: enable SDP and SDE periph flush update
Date: Wed, 14 Feb 2024 10:03:37 -0800
Message-ID: <20240214180347.1399-16-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240214180347.1399-1-quic_parellan@quicinc.com>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u_b7O5t-5USzHqwcQ-9dX6vj8X78Ow_E
X-Proofpoint-ORIG-GUID: u_b7O5t-5USzHqwcQ-9dX6vj8X78Ow_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=606 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402140141

DP controller can be setup to operate in either SDP update flush mode or
peripheral flush mode based on the DP controller hardware version.

Starting in DP v1.2, the hardware documents require the use of
peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.

In-line with this guidance, lets program the DP controller to use
peripheral flush mode starting DP v1.2

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
 drivers/gpu/drm/msm/dp/dp_reg.h     |  5 +++++
 4 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 61d5317efe683..823eeba7e71d3 100644
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
index 4bf08c27a9bf3..eb05a37837beb 100644
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
index 2983756c125cd..d4fb8572cd1e4 100644
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
 
@@ -102,6 +105,8 @@
 #define DP_MAINLINK_CTRL_ENABLE			(0x00000001)
 #define DP_MAINLINK_CTRL_RESET			(0x00000002)
 #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER	(0x00000010)
+#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	(0x00800000)
+#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(GENMASK(24, 23), 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
-- 
2.39.2


