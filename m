Return-Path: <linux-arm-msm+bounces-46422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76245A214EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FB097A339A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C3D1E98E7;
	Tue, 28 Jan 2025 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oO3xkces"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB2193402;
	Tue, 28 Jan 2025 23:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738105855; cv=none; b=lMbqAwM+pxeIVBFlkHHOHSI+dYJYP17vpG8BvesK5Z2/EePIhZb0xp9dwY3hsYm4rN2screjZSvKLCb6MuaHuVVd+yWcjbyIcYaliNhYlmMEAlo9gL5TlDLrqavx2be4BYaWCfme5nP5Azd8KR231KF9UPX09r1bxCg89Z18zyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738105855; c=relaxed/simple;
	bh=bNhJM9Dz+pFtEkrdraJnL0ogylvmTs5Iev48h4gj8Ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=M/2xlKiuyer00BSAxANYuAwguP5BTLS+0Gg8p6IENVAZcNsx07nNWYQqmYqt74/fxK8+Swmegi1iSdP3FQ+O5lfTFlpzEGCKLfVwp0BLctFM+61DCKPZdurOQLal3Rfh8U2CJoIy53N3tcS3vHWXzodULLKPHBHe8+96tsx9Als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oO3xkces; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SAD43Z026568;
	Tue, 28 Jan 2025 23:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yefMpW1C2aGI8kXUMOsgFx
	+l8rC9VdtWe1kZ0PAixY4=; b=oO3xkcesNOb3pBCrnfnRe5Hl/nl8POcSMzCpFc
	Skcj7pu19W5bXDwYWWyJJReSaNERC/nTsz2iFEmree7OM7ZWNHEHD05KcoSzByRe
	w6Uk/L2l2ZUmE5wM+YT2gOHkmwpFEw5UVn/o8XN00bhkz3YuC52C/D1FOw14IYDV
	88GKc5AoqSctwa3QRqpVHX0NJ1nFT6ckqkJ9hD2EloWim+d61GNt9PiHoDxws+qD
	iNme3OyvE4rfVv6unvhJ7MmdBtzCY1lmK3YEP9Ncw2vxYPfHQjV0zLL/mhbTAQUA
	fXvUXsBcu6l8Oy7PixwThmFPyeeAnM5m5eH1ioUXbYJrJR/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ew9n9r2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 23:10:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50SNAiK9009833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 23:10:44 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 15:10:43 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 28 Jan 2025 15:10:27 -0800
Subject: [PATCH] drm/msm/dp: account for widebus and yuv420 during mode
 validation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOJjmWcC/x2MSQqAMAwAvyI5G6hBqfgV8WBtqrlUaXGB4t8NH
 mdgpkDmJJxhqAokviTLHhWauoJlm+PKKF4ZyFBnGrLoD7zFszszBnkwuNn2zjG15EGjI7Hqfzh
 O7/sB3RRV3WAAAAA=
X-Change-ID: 20250127-dp-widebus-fix-fba78bbe242d
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Stephen
 Boyd" <swboyd@chromium.org>,
        Paloma Arellano <quic_parellan@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738105843; l=2709;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=bNhJM9Dz+pFtEkrdraJnL0ogylvmTs5Iev48h4gj8Ck=;
 b=TSoIccbmYsisZ1vIphsvo9JGUt0NI2VguFVr0fxMABvrV4Im28gKY3qf6zdfOzhRitFo8IOrj
 dOvV1RD2QrXCHRtWijAiTWDFnLq1fXryacsh/OCvr4sp+iSs7EtM0oR
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bRgq6rU025BvzHJqCCvMavao45LlY_Uu
X-Proofpoint-ORIG-GUID: bRgq6rU025BvzHJqCCvMavao45LlY_Uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=861 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280169

Widebus allows the DP controller to operate in 2 pixel per clock mode.
The mode validation logic validates the mode->clock against the max
DP pixel clock. However the max DP pixel clock limit assumes widebus
is already enabled. Adjust the mode validation logic to only compare
the adjusted pixel clock which accounts for widebus against the max DP
pixel clock. Also fix the mode validation logic for YUV420 modes as in
that case as well, only half the pixel clock is needed.

Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682bf5016bb0efbeb44489061deff060..a4b420a2d9eb7f084194f443e84a4013c9b4ef0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -930,16 +930,16 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
-		return MODE_CLOCK_HIGH;
-
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 	link_info = &msm_dp_display->panel->link_info;
 
-	if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
-	    msm_dp_display->panel->vsc_sdp_supported)
+	if ((drm_mode_is_420_only(&dp->connector->display_info, mode) &&
+	     msm_dp_display->panel->vsc_sdp_supported) || msm_dp_wide_bus_available(dp))
 		mode_pclk_khz /= 2;
 
+	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
+		return MODE_CLOCK_HIGH;
+
 	mode_bpp = dp->connector->display_info.bpc * num_components;
 	if (!mode_bpp)
 		mode_bpp = default_bpp;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d3e241ea6941615b8e274dd17426c2f8557f09b5..16b7913d1eefa8c2deb44df201a1977db23f4531 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -257,7 +257,10 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
+	if (msm_dp_wide_bus_available(dp))
+		mode_pclk_khz /= 2;
+
+	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
 		return MODE_CLOCK_HIGH;
 
 	/*

---
base-commit: 2bd7708f11777d4fd436fcba62b57cff6a92e389
change-id: 20250127-dp-widebus-fix-fba78bbe242d

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>


