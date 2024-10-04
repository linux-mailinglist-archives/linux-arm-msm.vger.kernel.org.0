Return-Path: <linux-arm-msm+bounces-33111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72599015B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 12:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2BD11F20FF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 10:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A35E171E7C;
	Fri,  4 Oct 2024 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bvfvx73r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0912415CD79;
	Fri,  4 Oct 2024 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728037893; cv=none; b=mUlL+2Gpst9CkiAelm+4lrNkFqPx+HsSj1mbgQz9cTTqTMDiyIDahdPtjtE0tTgDUrZtfZwdWyiWMpI+wjw1LgOg5/E/WoFibF7YNFyYze1d+z8MoS3735516oOjBKGhWlzKIK7Eb+4q/CQPwRagSYcniAaVpnQEGDqbhl+Sbps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728037893; c=relaxed/simple;
	bh=qh1dJmz9Niyfu2oHwfupkB8xyeHzIoyc1Tg7CLZqXg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KBYAEDUfv6zvT/IOi+0GcQbHOL347JLbzODb33q7oPySJrRGy4+jk2i9JikOAwCzrjvDP4vEPPXp6vPDtp5kk97Yf12lN4vYWv8BVeI+nU5/mkxseexsA2ZZRmDWFT9ApZgktiUE0e+WKYh3OfbKNMiAtS6Q2huDBmU+IUO8XOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bvfvx73r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I04U2019310;
	Fri, 4 Oct 2024 10:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=ZrRGGH8wPdT3FVfI0KiGv6u4QRqtiYJOLJYc2CPf60I=; b=Bv
	fvx73rtYCvPVN5woRaSaS3NLylv9Dzagg5LkFGGS4qI0tE5TUIx7Evma7NFc3PPS
	M5ZUrub6YWkFqroLvzLq68D9B14HiXSP1pOE5rdDGLIRotmv940kd8PPOaTrCBiq
	oH6dyetVSJcMnWhmUF1gijUHKjX0PiUyk/H9r67R6owUz6faxQkIGX8ZBPOVumlQ
	Hf4dx2n+dSXpJpyxzXrGgEnq4/e1OMtjY3AbNXl/PLjHEm98QJ99pQ+OpXag4JN8
	ClcPxp+yQbG12K3oL2YD503RrxFdI3EYdCF0lWjHNUKCbXyfSDmQI3qFTM3I5d3f
	m6LaNuGHVdqANqnUqShw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205n1t0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 10:30:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 494AUoPp005782;
	Fri, 4 Oct 2024 10:30:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41xavmrk0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 04 Oct 2024 10:30:51 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 494AUbuP005260;
	Fri, 4 Oct 2024 10:30:51 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 494AUo4i005788;
	Fri, 04 Oct 2024 10:30:50 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id CE2FE5009EF; Fri,  4 Oct 2024 16:00:48 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org,
        abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
        quic_parellan@quicinc.com, quic_bjorande@quicinc.com
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: [PATCH v4 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
Date: Fri,  4 Oct 2024 16:00:46 +0530
Message-Id: <20241004103046.22209-6-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0U8tKL-V8NF6DtQG7pdjq1yc3iy9PwvH
X-Proofpoint-GUID: 0U8tKL-V8NF6DtQG7pdjq1yc3iy9PwvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040076
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
for each mdss, having different base offsets than the previous
SoCs. The support for all 4 DPTX have been added here, and
validation of only MDSS0 DPTX0 and DPTX1 have been conducted.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
v2: No change

v3: Fixed review comments from Konrad and Bjorn
	-Added all the necessary DPTX controllers for this platform.

v4: Updated commit message

---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e1228fb093ee..2195779584dc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -118,6 +118,14 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
+static const struct msm_dp_desc sa8775p_dp_descs[] = {
+	{ .io_start = 0xaf54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0xaf5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
+	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc sc7180_dp_descs[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
@@ -162,6 +170,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
 };
 
 static const struct of_device_id dp_dt_match[] = {
+	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
 	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
-- 
2.17.1


