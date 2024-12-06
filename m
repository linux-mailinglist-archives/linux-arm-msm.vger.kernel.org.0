Return-Path: <linux-arm-msm+bounces-40702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 280209E6648
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D76FD284BD8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F2C2066E3;
	Fri,  6 Dec 2024 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EPyXmB8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E3202C26;
	Fri,  6 Dec 2024 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459610; cv=none; b=H9sMRiqgf7ZqNW2ffKr9cI/Z84TE4luL6G7dwSYGSC/LpsvX6lqBw5alklwVUnRx2NTjr4JE4E7AIfXe9ueSi3X5R2gwpbxrNdYb1GOy1BqFFK2PsASF+EoXqKzDIyHF9Zvn0wKbp0iTm/ubunfDVVijmU488YZRpuoIOtXOGDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459610; c=relaxed/simple;
	bh=UXvLqpP1miYIcZPJmJC5CfdBehGHsWlAfCLokcCHVVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a9kODVAwijwS2wq1u0Pgp35Z8op4yzu8k0Ra9eKtu2C5+a8TYtmmQKz+9S6jgIkbAHRszwi6Woi4AAfkoVom2JD7h/KIvVerM6GRXTn4W4kT6qn7i5WX2/b5MnJExovv5IPqLfgMrTjn68vsrQO+AS81xcoR2/3v08DNvKSxbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EPyXmB8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNle020816;
	Fri, 6 Dec 2024 04:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eekxlus1pUNCyMRI0ii3qIXo9NBboAgOSMiOnrYL/10=; b=EPyXmB8mpvm06TcX
	ze0lnLyezvP/bJHfzFj2Ir0jjUXi7xsiJbcFNjWTZT2BQ0BIPNkRaNiJTqDplsN8
	wWqhCPBWtzdQmvUJJdimvNfuYCs0/umctnQ9GMhVVgXi81Q36/TY3/8KmhhjO+Xi
	e1OJNu+NNG/IWSu+Y6wJNgJqvapTk4LcNvLReCGgb+PbJ0j1IetrMgN7DNWuIh0K
	7eE4VQpw7V1XCc7froNNerF4EEGJSHnxnJ/IHuW+HaxzkjLvkemkV0NZZeupVQAM
	vdD75svvu+88zuu1ECaNiCBMd7ZecvY3TuWxM1Nxhtew9tecLEy92XKlJf6zmxmi
	GBPu6g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v801wbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WkYW007213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:46 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:46 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:10 -0800
Subject: [PATCH 39/45] drm/msm/dp: initialize dp_mst module for each DP MST
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-39-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3133;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=UXvLqpP1miYIcZPJmJC5CfdBehGHsWlAfCLokcCHVVM=;
 b=hIdljKwhUn7Lai2LkHT2IZYIV0FAyXGOvJKOSzGnDk2JYdC4DqJtQMIFkSjfp0lzsU9lp+gHj
 QDCP7l7cuutBIjUFJLZ9s/y+q2r53Iv866r3MMLJf6OOtWdgndekVB+
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gwl9uJfkpdLHqXoC73_BOGpFml317G2u
X-Proofpoint-GUID: Gwl9uJfkpdLHqXoC73_BOGpFml317G2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030

For each MST capable DP controller, initialize a dp_mst module to
manage its DP MST operations. The DP MST module for each controller
is the central entity to manage its topology related operations as
well as interfacing with the rest of the DP driver.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  6 ++++++
 drivers/gpu/drm/msm/dp/dp_display.c     | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_drv.h           |  7 +++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 359de04abf4bbead3daa5e8b357a3c34216e3e65..734d8972bbd65153778d5d70a55ac09dfc693ac9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -664,6 +664,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
 
 		if (stream_cnt > 1) {
+			rc = msm_dp_mst_register(priv->dp[i]);
+			if (rc) {
+				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
+				return rc;
+			}
+
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
 				info.stream_id = stream_id;
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index eafec9ab4f83cb44e861687e7550748b4d9b7ece..7f2eace17c126e3758c68bb0dee67662463a6e05 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -69,6 +69,8 @@ enum {
 
 #define WAIT_FOR_RESUME_TIMEOUT_JIFFIES (HZ / 2)
 
+#define MAX_DPCD_TRANSACTION_BYTES 16
+
 struct msm_dp_event {
 	u32 event_id;
 	u32 data;
@@ -1689,6 +1691,16 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
+int msm_dp_mst_register(struct msm_dp *dp)
+{
+	struct msm_dp_display_private *dp_display;
+
+	dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_mst_init(dp, dp_display->max_stream,
+			   MAX_DPCD_TRANSACTION_BYTES, dp_display->aux);
+}
+
 void msm_dp_display_atomic_prepare(struct msm_dp *dp)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 12b50a797772f574122481cd8a1c7c88aacb8250..7ed0e25d6c2bc9e4e3d78895742226d22d103e4c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -376,6 +376,8 @@ int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display);
 
 int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
 
+int msm_dp_mst_register(struct msm_dp *dp_display);
+
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -397,6 +399,11 @@ static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_register(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
 {
 	return -EINVAL;

-- 
2.34.1


