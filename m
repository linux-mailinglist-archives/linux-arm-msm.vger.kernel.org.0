Return-Path: <linux-arm-msm+bounces-37771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A86119C6E7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B134CB29EC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 11:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E417206E66;
	Wed, 13 Nov 2024 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i3f+dFr2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF73206072;
	Wed, 13 Nov 2024 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731498824; cv=none; b=j3S3HhTbSlqySWTUXr1Zivab1Hn0j0jWIBC4VOzBLo0PMVacZmrlGqGk5wdEYLV5KaXD1WcUdDFgfcR6Pa+Svv2AZ+JeL9B//m60VM6PgkxPNNBvHsxxQHKY4r12tq1PBcQkQPmbqSRs1t4A9u9YJ2adOq2nUCQ/2No0TtFxTvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731498824; c=relaxed/simple;
	bh=qk7eEzzeMDyHMj4YsRGMbNZ9thaMSXYEaMsSvLlXmd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Mm7CUhlWPO/NWY1IPuQks2AtOnT+oX4Totfkv5/KwVKDhomTTuf7o9+l8gurvS0BmladT99vR7G171Z+L5Q8+xBpnvJSwrfTdYtQ8UwxVpLNCNxkN5Tuh3Aq400P37BlE7CRBMWIVgtoUEDb9MUw43EAJiZ7wPHijF7MSn68260=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i3f+dFr2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADApoPm004013;
	Wed, 13 Nov 2024 11:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iexITs/mJC6sdc9HjmF/GwlqMlB/DEzbljhXWlRyplg=; b=i3f+dFr2ydkuSI+Q
	qPjJD5+IBFlqFjBr8MPORQpzJCbzny3yCIyfVP89IRM/qzMioB5cmsiOqOQ+OL1t
	BHSMn+HMV05REDHuj8Wlj/t94w68wL/GDqwIPZ5OH1W1h5+rg0iBTWnH9dV6h3fy
	575JW41P+7vBNqsqXkvtpYsBIqOYqxV55sCFqQceWtfz9WXhN6fdK30sRnfRl7jB
	9pITIPxsNTkZABUzLEr5Jxx42DpxnruMUqIYmN9fjJSRnVfKZJp2G7ex73hxVxHf
	4+EQJ5U9n9juzLgwMuHcW2Zmc+1mcjhPQMtOeDn3ouiIz9m6RXGUNL9n5gUxMKxH
	tXjKDw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vtqwr4mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 11:53:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADBrRpW030357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 11:53:27 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 03:53:21 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Wed, 13 Nov 2024 19:51:48 +0800
Subject: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Fange Zhang <quic_fangez@quicinc.com>,
        "Xiangxu Yin" <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731498759; l=5501;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=9CssS6+QZCBjlwzEsmdG3+PJ6oJ8tZKt4K20fUCh5TY=;
 b=FPzWVZl/QEn96sRWkeGxSB02OwheEFeRod5mLNgomE1bzIoi5F5iSGCeQQUyP0aNgk66o5QkL
 aUQdLPRuZJXCV51Ulp9LPUp2hdmM1S0Y7K+LKrQGG5oOOJhxPPdCOFI
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rTEngjf8ihYUGcX-FCsMOAlW148MCmWB
X-Proofpoint-ORIG-GUID: rTEngjf8ihYUGcX-FCsMOAlW148MCmWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130102

From: Li Liu <quic_lliu6@quicinc.com>

Add support for DSI 2.3.1 (block used on QCS615).
Add phy configuration for QCS615

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	},
 };
 
+static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 21800 },
+};
+
+static const struct msm_dsi_config qcs615_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = qcs615_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(qcs615_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0xae94000 },
+	},
+};
+
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
 	.link_clk_enable = dsi_link_clk_enable_v2,
@@ -286,6 +301,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_1,
+		&qcs615_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 4c9b4b37681b066dbbc34876c38d99deee24fc82..120cb65164c1ba1deb9acb513e5f073bd560c496 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -23,6 +23,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
 #define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
+#define MSM_DSI_6G_VER_MINOR_V2_3_1	0x20030001
 #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index dd58bc0a49eb5ca96370f7832d9251609ac0c552..bc38fcd28e6778f5676983b78f7635ce619cd758 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -561,6 +561,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_14nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-2290",
 	  .data = &dsi_phy_14nm_2290_cfgs },
+	{ .compatible = "qcom,dsi-phy-14nm-615",
+	  .data = &dsi_phy_14nm_615_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-660",
 	  .data = &dsi_phy_14nm_660_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-8953",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 4953459edd636363614ecad85654614fc95cfa1d..5a2654a2e2814d21d24d0e6bd1e7811e7b537dfa 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -46,6 +46,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8937_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_615_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 1723f0e4faa4e4fd612d66f9976e80e045eafcc8..42a1c76a25f54be4c8fa799994901e7fd7cfb9d9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1032,6 +1032,10 @@ static const struct regulator_bulk_data dsi_phy_14nm_73p4mA_regulators[] = {
 	{ .supply = "vcca", .init_load_uA = 73400 },
 };
 
+static const struct regulator_bulk_data dsi_phy_14nm_36mA_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 36000 },
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_14nm_17mA_regulators,
@@ -1097,3 +1101,20 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
 	.io_start = { 0x5e94400 },
 	.num_dsi_phy = 1,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_615_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_14nm_36mA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_36mA_regulators),
+	.ops = {
+		.enable = dsi_14nm_phy_enable,
+		.disable = dsi_14nm_phy_disable,
+		.pll_init = dsi_pll_14nm_init,
+		.save_pll_state = dsi_14nm_pll_save_state,
+		.restore_pll_state = dsi_14nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0xae94400 },
+	.num_dsi_phy = 1,
+};

-- 
2.34.1


