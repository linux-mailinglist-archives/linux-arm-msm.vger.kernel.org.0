Return-Path: <linux-arm-msm+bounces-75998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D91BBCF47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 03:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6CF81893403
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 01:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEC81D95A3;
	Mon,  6 Oct 2025 01:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b3BJdAzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFD91917D6;
	Mon,  6 Oct 2025 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759714789; cv=none; b=pKkqc/miJxwHeTVWeoBOEdoqGqhUxPyYx0dY55Yupk8JD3o3L9h8J9nCoNQ3FGQV1jr04gyHFr7K1vdhwWMmEq0KjD8+kfISJDPTrtR6LU1s7fjJ9zmsh39ci8k19AMZaPWve/jReGrvbtnLSQS+nVvbcqJB5tjqeq+du4LgWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759714789; c=relaxed/simple;
	bh=c+1G++Jv6+ePn3sNbsIMlEeLBezrdQcIVweyNq5MqvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IHC+/7h1aot9BDZXOZzivaZkFDxRNGRG5DJTdiqqjVXgTGKnGg7W3u3uQKojDo81MhFO+f2V3jhnCy7xTIpnWoh0RGZyQYrpV3LkjgaSbiSN5CjcnQJ3eFHFDnjBCTpmBlZPhWbldFI4wmzPUEUkbI3tLHb+x28ltUg0E7gvt+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b3BJdAzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NJbt0018627;
	Mon, 6 Oct 2025 01:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X/LiJ6fR+Sw
	LXZON2pgJwdO2z4vNAz2v5nWhEUgSx64=; b=b3BJdAzfo4xvfIMbwR3W1MmQGX3
	L1cZ2IZit/c2y+e1XUGvF13iCjkrmZ5j2AHyvB0GuWUsLi0nEHnlsFx98XKnv1kx
	CLOvc5eg3ygHAkkMtpO9UniFqFf6TjwHRZv32XUyOnA1Fr591mEYf8XcAw6pjxPa
	eWwTk2dph6ZUkYLfLWp3KMO/zW/YXIqODvLP+bMy2RWMos7cYir/NHc7bbc8v3Cj
	bvXD1W548esoaZL3+8+T97GB/87b87b7t9LbSSbqyh24oukDk4KXm3mGr9BZFWJN
	Qs7tfflqm2Wov9FVS65G1vtkyMluNkFRXlJi6j1ay8K6uouOy2ljKKfxp0A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ju5xardp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5961dR6f003770;
	Mon, 6 Oct 2025 01:39:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnkybta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5961dRtr003738;
	Mon, 6 Oct 2025 01:39:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5961dQc2003737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 52E2159D; Mon,  6 Oct 2025 07:09:26 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v2 4/7] drm/msm/dsi: add DSI PHY configuration on QCS8300
Date: Mon,  6 Oct 2025 07:09:21 +0530
Message-Id: <20251006013924.1114833-5-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FooIPmrq c=1 sm=1 tr=0 ts=68e31dd3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=s5Sty1vKxVvqCl9zFGcA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: LMNMP0b0u_84tP61b9EXDOXRGkJU4Kxj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX9idbyfykG5u4
 sKZZogAI85Rx8vCJPGDkFEblDvEvQ6ra2bif83Ta6EvQS4omvGlX4ciIcTIV4A3XzLmNeAEwjlC
 OKiKa6lpPLE14NUK/y82Ra5sBXYGYGRZtF2n9gz9qInBNGvuLMYNA/EcYSUw+2EO0UpiOnoPKI8
 zepJuSLctbRrDqnb0OLGDwMQlfqSamCBsHtmKGJniwOHiS7dGFLBBSAEtXmj8p0yaEpIXuRCgmy
 sMjivhCqUFi25fo4GdBLtDiLtx7dyLculrklbQ6xbilpJ/JiHIaSu9rDmEL5rFRh9MmcjtKNMzo
 31DxSQMPX22ubFKMUIzyS3bjwK30iNCNqxYF0Ok5j8FRFKA2pR/7/sxx7eSiMnpTunEcIZDCDSU
 QnTbpD/X3Ne7kt7/ZGjzUrIOFNmVSQ==
X-Proofpoint-GUID: LMNMP0b0u_84tP61b9EXDOXRGkJU4Kxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040022

The QCS8300 SoC uses the 5nm (v4.2) DSI PHY driver.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..7b6e30580463 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -559,6 +559,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_7nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-7nm-8150",
 	  .data = &dsi_phy_7nm_8150_cfgs },
+	{ .compatible = "qcom,qcs8300-dsi-phy-5nm",
+	  .data = &dsi_phy_5nm_8300_cfgs },
 	{ .compatible = "qcom,sa8775p-dsi-phy-5nm",
 	  .data = &dsi_phy_5nm_8775p_cfgs },
 	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index e391505fdaf0..8cb95b9d62a3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -57,6 +57,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_6375_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8300_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8775p_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 32f06edd21a9..28a5d6a2e04e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1358,6 +1358,29 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_5nm_8300_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_48000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_48000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+		},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae94400 },
+	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_37750uA_regulators,
-- 
2.34.1


