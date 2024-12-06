Return-Path: <linux-arm-msm+bounces-40677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B5B9E65EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4468C283D97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6DD1DA0ED;
	Fri,  6 Dec 2024 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lzdyQqWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772E1CB51B;
	Fri,  6 Dec 2024 04:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459592; cv=none; b=mVIl99j3aEKH+sDu2QzeXbgGUkY3cNPieQwHZ0VkY80f3q4qB0x4HGb3dCQkgQ0fxOrsLWVT072YHGNMM7RMgtinuzPgwWeOQE5KKP1ChKY3yvh5wlCpVu3MMwX4ftjXwl7kKLSEL6dfOsDUyXzcY0j/W+tS2yxYtLBdkpa5I+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459592; c=relaxed/simple;
	bh=0n6EcyEcKSOeZYHhuhSWOrHJOMaLXphQBchGvdWgEJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dCLFo5MMwNHko81EdxCvjUr54QiuFT4ZJaWvC07x+uej9cTRlU9TeJy6F12IqxniLNXdeDF0YJqC2x/2FDm+Z/39s/OKrcw5qXYhSGGvkxZCu72q52KHAq0Wu1e1YHvQzSivbrwU1GZYvIfXo9bxRTIq8E7QjJRJjvEF6sgqiOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lzdyQqWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JiFwa018997;
	Fri, 6 Dec 2024 04:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPvnphi3IcGNgSr0pqQGwXOjRDM1PaubNjBWE2OSWrQ=; b=lzdyQqWHJfyvJDCz
	u9P/rbLwEZSbEdyeIhYBiaMjMDlJ99Yv6NEetZSoMT4Y4EGO5s9f6qhzBN9UGayg
	UkzxqMtmZsmPWzxGDsGhBFEsBX3udIvmMYarAWJDL+fbKjbBp/r8uUIsPsfg0nEW
	blqfIjYLsac0lJiv9yQARRs2Q2hwctIUodSvFB+evWnWsw/WRDJ4NEXaWwwicSOG
	8Cx3d29ceSZBvjLv8uaSCyJwHCGJewaF5p0o3MynjOcg3vya+UP0RBacUEG9kRR7
	CIMnSAsg6fBfmOFpSlp/Ab5MIqp8r4EUVWbUpMoESA099flrQ8J36EDYhK6gOeP+
	fHja+Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8s0u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wbos007178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:37 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:37 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:54 -0800
Subject: [PATCH 23/45] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
 for MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-23-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=2884;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=0n6EcyEcKSOeZYHhuhSWOrHJOMaLXphQBchGvdWgEJ8=;
 b=UscuzulyDd2LGhdQS6rROIaY9D86xcXWRdVbSJ893LGRyfVPtbK1gYmx8F2kedH6Kd3e4UI7t
 384hoRNlDt8DqYC6ETGIVgaeT5w/y8o/IA0hPJyGrixoVx1NHcA8MO5
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2Uf1hrrZTqMsH4hVOjEzKaO2ciKC6MhF
X-Proofpoint-GUID: 2Uf1hrrZTqMsH4hVOjEzKaO2ciKC6MhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060030

As required by the hardware programming guide, always program
the MST_FIFO_CONSTANT_FILL for MST use-cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4826a698979ce7c37112812299879411c5743fa9..3cfa9fd0c6f5e664a65e6d9b74e5c9f22ad711f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1009,6 +1009,30 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
 	return 0;
 }
 
+int msm_dp_catalog_mst_async_fifo(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+							      struct msm_dp_catalog_private,
+							      msm_dp_catalog);
+
+	u32 reg;
+
+	if (msm_dp_catalog->stream_id == DP_STREAM_0)
+		reg = msm_dp_read_p0(catalog, MMSS_DP_ASYNC_FIFO_CONFIG);
+	else
+		reg = msm_dp_read_p1(catalog, MMSS_DP_ASYNC_FIFO_CONFIG);
+
+	/* enable MST_FIFO_CONSTANT_FILL */
+	reg |= BIT(0);
+
+	if (msm_dp_catalog->stream_id == DP_STREAM_0)
+		msm_dp_write_p0(catalog, MMSS_DP_ASYNC_FIFO_CONFIG, reg);
+	else
+		msm_dp_write_p1(catalog, MMSS_DP_ASYNC_FIFO_CONFIG, reg);
+
+	return 0;
+}
+
 static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
 {
 	struct msm_dp_catalog_private *catalog;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 323858c587f85996d296156c7b8b201cdb7b7eb4..0025ecc0adb2f351c44f10af82332a6622749416 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -150,5 +150,6 @@ void msm_dp_catalog_mst_channel_alloc(struct msm_dp_catalog *ctrl,
 				      u32 ch, u32 ch_start_slot, u32 tot_slot_cnt);
 void msm_dp_catalog_ctrl_update_rg(struct msm_dp_catalog *ctrl, u32 stream,
 				   u32 x_int, u32 y_frac_enum);
+int msm_dp_catalog_mst_async_fifo(struct msm_dp_catalog *dp_catalog);
 
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 2288c379283c721a01c81302f8d307d0b3c76527..d4915a962f97b3d2a347456e197265a5dc043eb0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -236,6 +236,9 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
 	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
 	msm_dp_panel_timing_cfg(msm_dp_panel);
+
+	if (ctrl->mst_active)
+		msm_dp_catalog_mst_async_fifo(ctrl->catalog);
 }
 
 /*

-- 
2.34.1


