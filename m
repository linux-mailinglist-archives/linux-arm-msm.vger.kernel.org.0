Return-Path: <linux-arm-msm+bounces-8302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2684B83CCAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 20:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB4BD1F29B81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1173136664;
	Thu, 25 Jan 2024 19:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o3xVLWaM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD6136640
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 19:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211553; cv=none; b=Y/T0KrBycdRVqHVRCBhbUtHBLPrcx2Dj/rlN8so3hCECdZQKfYN+umirqu/x2mKPxBCjgynjvtEjI2Ov2EuGQYG2XY7nma2dBC6uZbFMwQET/J/vfzXb09QGYU5DLil9Eigs043mBlqPdmOAIXEjopjxXXmLKSv8IYYC+8F/QOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211553; c=relaxed/simple;
	bh=FMEL8JE1mEdn2HqvmhSblDf+Ix3BET1lok63ZgNe6p0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVffaTzWft7ZwCaKbhnMYrY2Ra0hGDSmbuni+hXx+o0qUvs6BAznan5rX9VpoYPe1QSG4toZ5t14NUYhkDycyTVJxrW+eJfNPjwfjIcz8++paND2f8uE1tMmp917Y5jV+4JlVMJHvQdFU7/CpE2D4liM3bfRAZH92/QlO1WVBcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o3xVLWaM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PGFLiE025976;
	Thu, 25 Jan 2024 19:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=SXa30mXPHkcdqnL5mPpqs0EQ8MxX+C9uDgSlrPdGw3I=; b=o3
	xVLWaM1FP8WXMUdLdiZbmd3ywyC0wi+MVO3hhGzmvNZ+/B/YLireLefks97QrNUV
	1YvPLGFn6q5+0BQQ6lvxJTqDBYWcjC6GAJFQlrybrtbgzcmgPq7WnxUqHB6iltVn
	48LXn0CeORqS24/NDdfJ9Ev5YmHIXhjitc+Z5CY9dcEhRaNtGRDkmkAVGwB5Lp97
	4Hs5JHA60wfcKzlMiOFWWm6bsb1ghzpNmC9RBRxuNl3mt/EYJlXORXdhvYvEaRfm
	YAEfP7/NCHu2JRBzy/qarN/knbLtpbFSsysaipQt2oW986pGi0BmVATwt6Bl00bW
	BTF+WC8FXmY2cLFN3pXg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vupy89b20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJd404027342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:04 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:04 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH 09/17] drm/msm/dp: move parity calculation to dp_catalog
Date: Thu, 25 Jan 2024 11:38:18 -0800
Message-ID: <20240125193834.7065-10-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
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
X-Proofpoint-GUID: d235FseX2rHqV2VvKZt-r0VETnoABwDj
X-Proofpoint-ORIG-GUID: d235FseX2rHqV2VvKZt-r0VETnoABwDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401250142

Parity calculation is necessary for VSC SDP implementation, therefore
move it to dp_catalog so it usable by both SDP programming and
dp_audio.c

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 100 ++++------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  72 ++++++++++++++++++++
 2 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 4a2e479723a85..7aa785018155a 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -16,13 +16,6 @@
 #include "dp_panel.h"
 #include "dp_display.h"
 
-#define HEADER_BYTE_2_BIT	 0
-#define PARITY_BYTE_2_BIT	 8
-#define HEADER_BYTE_1_BIT	16
-#define PARITY_BYTE_1_BIT	24
-#define HEADER_BYTE_3_BIT	16
-#define PARITY_BYTE_3_BIT	24
-
 struct dp_audio_private {
 	struct platform_device *audio_pdev;
 	struct platform_device *pdev;
@@ -36,71 +29,6 @@ struct dp_audio_private {
 	struct dp_audio dp_audio;
 };
 
-static u8 dp_audio_get_g0_value(u8 data)
-{
-	u8 c[4];
-	u8 g[4];
-	u8 ret_data = 0;
-	u8 i;
-
-	for (i = 0; i < 4; i++)
-		c[i] = (data >> i) & 0x01;
-
-	g[0] = c[3];
-	g[1] = c[0] ^ c[3];
-	g[2] = c[1];
-	g[3] = c[2];
-
-	for (i = 0; i < 4; i++)
-		ret_data = ((g[i] & 0x01) << i) | ret_data;
-
-	return ret_data;
-}
-
-static u8 dp_audio_get_g1_value(u8 data)
-{
-	u8 c[4];
-	u8 g[4];
-	u8 ret_data = 0;
-	u8 i;
-
-	for (i = 0; i < 4; i++)
-		c[i] = (data >> i) & 0x01;
-
-	g[0] = c[0] ^ c[3];
-	g[1] = c[0] ^ c[1] ^ c[3];
-	g[2] = c[1] ^ c[2];
-	g[3] = c[2] ^ c[3];
-
-	for (i = 0; i < 4; i++)
-		ret_data = ((g[i] & 0x01) << i) | ret_data;
-
-	return ret_data;
-}
-
-static u8 dp_audio_calculate_parity(u32 data)
-{
-	u8 x0 = 0;
-	u8 x1 = 0;
-	u8 ci = 0;
-	u8 iData = 0;
-	u8 i = 0;
-	u8 parity_byte;
-	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
-
-	for (i = 0; i < num_byte; i++) {
-		iData = (data >> i*4) & 0xF;
-
-		ci = iData ^ x1;
-		x1 = x0 ^ dp_audio_get_g1_value(ci);
-		x0 = dp_audio_get_g0_value(ci);
-	}
-
-	parity_byte = x1 | (x0 << 4);
-
-	return parity_byte;
-}
-
 static u32 dp_audio_get_header(struct dp_catalog *catalog,
 		enum dp_catalog_audio_sdp_type sdp,
 		enum dp_catalog_audio_header_type header)
@@ -134,7 +62,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x02;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -147,7 +75,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
 	value = dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
 	new_value = value;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -162,7 +90,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = audio->channels - 1;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -184,7 +112,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x1;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -198,7 +126,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x17;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -212,7 +140,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = (0x0 | (0x11 << 2));
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -233,7 +161,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x84;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -247,7 +175,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x1b;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -261,7 +189,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = (0x0 | (0x11 << 2));
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -282,7 +210,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x05;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -296,7 +224,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x0F;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -310,7 +238,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = 0x0;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -331,7 +259,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x06;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -345,7 +273,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x0F;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_catalog_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6cb5e2a243de2..563903605b3a7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -45,6 +45,13 @@ enum dp_phy_aux_config_type {
 	PHY_AUX_CFG_MAX,
 };
 
+#define HEADER_BYTE_2_BIT	 0
+#define PARITY_BYTE_2_BIT	 8
+#define HEADER_BYTE_1_BIT	16
+#define PARITY_BYTE_1_BIT	24
+#define HEADER_BYTE_3_BIT	16
+#define PARITY_BYTE_3_BIT	24
+
 enum dp_catalog_audio_sdp_type {
 	DP_AUDIO_SDP_STREAM,
 	DP_AUDIO_SDP_TIMESTAMP,
@@ -73,6 +80,71 @@ struct dp_catalog {
 	bool wide_bus_en;
 };
 
+static inline u8 dp_catalog_get_g0_value(u8 data)
+{
+	u8 c[4];
+	u8 g[4];
+	u8 ret_data = 0;
+	u8 i;
+
+	for (i = 0; i < 4; i++)
+		c[i] = (data >> i) & 0x01;
+
+	g[0] = c[3];
+	g[1] = c[0] ^ c[3];
+	g[2] = c[1];
+	g[3] = c[2];
+
+	for (i = 0; i < 4; i++)
+		ret_data = ((g[i] & 0x01) << i) | ret_data;
+
+	return ret_data;
+}
+
+static inline u8 dp_catalog_get_g1_value(u8 data)
+{
+	u8 c[4];
+	u8 g[4];
+	u8 ret_data = 0;
+	u8 i;
+
+	for (i = 0; i < 4; i++)
+		c[i] = (data >> i) & 0x01;
+
+	g[0] = c[0] ^ c[3];
+	g[1] = c[0] ^ c[1] ^ c[3];
+	g[2] = c[1] ^ c[2];
+	g[3] = c[2] ^ c[3];
+
+	for (i = 0; i < 4; i++)
+		ret_data = ((g[i] & 0x01) << i) | ret_data;
+
+	return ret_data;
+}
+
+static inline u8 dp_catalog_calculate_parity(u32 data)
+{
+	u8 x0 = 0;
+	u8 x1 = 0;
+	u8 ci = 0;
+	u8 iData = 0;
+	u8 i = 0;
+	u8 parity_byte;
+	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
+
+	for (i = 0; i < num_byte; i++) {
+		iData = (data >> i * 4) & 0xF;
+
+		ci = iData ^ x1;
+		x1 = x0 ^ dp_catalog_get_g1_value(ci);
+		x0 = dp_catalog_get_g0_value(ci);
+	}
+
+	parity_byte = x1 | (x0 << 4);
+
+	return parity_byte;
+}
+
 /* Debug module */
 void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state);
 
-- 
2.39.2


