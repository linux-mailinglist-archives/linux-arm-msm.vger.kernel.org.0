Return-Path: <linux-arm-msm+bounces-40668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854B9E65E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8493E1881700
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534FF1CF5DF;
	Fri,  6 Dec 2024 04:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OL7731OR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B986A195803;
	Fri,  6 Dec 2024 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459590; cv=none; b=EbxLEDbpLNqI+QWl8XRQ0oHWaRdKrZ1xONqwMq7mcVmcwmt/2h2yjsOR/j6LwHslrf7t38kUY5WGo211EfX+XCbAsrmOFo0f+tiqdMEbBqTKJRT37o8IlzPJ6ExnfWCNN16i51m6cJt583seZnRu+CdUG3Xp34mfOCisId6Oeic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459590; c=relaxed/simple;
	bh=9KLk+544O/3bV4KjALqN/xbTwPS+r5zHpCGcsu0weps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XRJ7trERKfMdxLnWbm0JGvdyyzBa/aSA/bbYkY+1KLa+Uagc/hxRVUOGtGVYonCfapOXvitXlWe+a68aNQ7xlgQFPPt8nYfZ3zNBaAZ1nSV3hyZltPzSI+SPcTls3HCORC3BG3JirSzjgSbm76Ptn5Z0Dwc4P6ZPBwPh/TPey0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OL7731OR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaRCx004903;
	Fri, 6 Dec 2024 04:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isLIFfKePohunYSVdwZQ6R9I4s0E3hwrlRALSA46ilE=; b=OL7731OR/ag74kTH
	9f6JmHSy71f2eToeWEH0Pvvtbvp5vAGz7VbIYG8/QQEeBPpi/syzQ+R9249JmuBG
	FskMyzpR0Rnymbkg7LB+HNYk+EgqSpsTTUXFv21NmM5pLwoe5HCqZ73Po/wTNUcR
	f+at/LFaX8Kimsq6ZR3nvHAQzFs4R6IPDwCdCgWhZvecix5J+STVUDdQ8CcKiVxk
	A8VSeEv0ar0zO1hrvLQVGhYqdX3KlSQjowJnf6X11vfjNMRKUD7Vmdd5Ky3hxG/g
	Gi5pt1gjr9LVYwtcFN3jFOCIBVPjWuVu2tJ0kTN9SwoDtr8sPIiX0EzU1kZ2KDW+
	6XiUGg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142k7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WZ9A016351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:35 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:34 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:50 -0800
Subject: [PATCH 19/45] drm/msm/dp: add support to program mst support in
 mainlink
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-19-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3002;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=9KLk+544O/3bV4KjALqN/xbTwPS+r5zHpCGcsu0weps=;
 b=GXx7yqK7P8j1e8dl9bwY/bmfgXEIEHIW6A46ala3ODDGFRlMiQgFzzp0JKm/71bbuvI+7OQxh
 24e0chZGwZVANmdP5XYaXdBMUuZ1I2ur/bm+7M9D6P7Yp2FTq/Lsczp
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0w7tLV-GcCSzasnkDUOl7UvkPXIrH-1M
X-Proofpoint-ORIG-GUID: 0w7tLV-GcCSzasnkDUOl7UvkPXIrH-1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=849 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030

Add support to program the MST enabled bit in the mainlink
control when a mst session is active and disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 88d6262a972ef2d30c467ef5ff5c58ef3299ae7d..bdc66e5cab640c351708ba1a1bc3bca21784df6e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -417,6 +417,23 @@ void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catal
 	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
 }
 
+void msm_dp_catalog_mst_config(struct msm_dp_catalog *msm_dp_catalog, bool enable)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+							      struct msm_dp_catalog_private,
+							      msm_dp_catalog);
+
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= (0x04000100);
+	else
+		mainlink_ctrl &= ~(0x04000100);
+
+	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index c91c52d40209b8bcb63db9c0256f6ef721dace8a..07284f484e2861aeae12b115cd05a94afed1c9cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -138,5 +138,6 @@ void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_
 /* DP MST APIs */
 void msm_dp_catalog_trigger_act(struct msm_dp_catalog *dp_catalog);
 bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *dp_catalog);
+void msm_dp_catalog_mst_config(struct msm_dp_catalog *dp_catalog, bool enable);
 
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 2bfe2aac3c02b02b12713dbd98e79ed4a75b85d0..3839f1e8e1aeb2a14a7f59c546693141a0df6323 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -186,6 +186,9 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
 	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
 
+	if (ctrl->mst_active)
+		msm_dp_catalog_mst_config(ctrl->catalog, true);
+
 	msm_dp_ctrl_config_ctrl(ctrl, msm_dp_panel);
 
 	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
@@ -2132,6 +2135,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy = ctrl->phy;
 
 	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_catalog_mst_config(ctrl->catalog, false);
 
 	ctrl->mst_active = false;
 

-- 
2.34.1


