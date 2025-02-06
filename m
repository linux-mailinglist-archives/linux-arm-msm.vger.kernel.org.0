Return-Path: <linux-arm-msm+bounces-47050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B5DA2B28F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 20:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9781B16AC1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 19:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A2319F13B;
	Thu,  6 Feb 2025 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XQGp3DZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62221A9B23;
	Thu,  6 Feb 2025 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871221; cv=none; b=rxfdiGtbsg43bqfNgEnw9nGbiPAAf+FtIpkxlHLu6KLYQGwcqfa6oPBa7OB/DTm6ZnbVBrMqri8xuXAFqpcIDqjkT5Cz25/KwUvaRSKjVS/WVZaolRWKpKPUPQc9V21D/M3k0bNS8ziAPDhhfftE5bu04n6yly0G3JYyY0gtJyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871221; c=relaxed/simple;
	bh=RoTJBLUmCZznZlIN87HyUv2pCJM7GP1ktF6AXOFoNe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ilKaQcYc6awq+7TbMiT0pNWGknN6sTZfdic0Rza/uSBo7DJvj5+7Gfs36YsUK5o1PDmrI68ojWh4Cvo1ZAAXYyoO/Gcf5YCD/qeA4ZLaNr96cIbcPHa1HV/iapOr+LXIKmzkgYAOVzChnyg6C/XRuS0uZ2yfK+hI0wZohl+fqlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XQGp3DZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516GdNqc003344;
	Thu, 6 Feb 2025 19:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oNGugbAHnmXqtkdwjUCdSC
	Q/kxmMbftpw2Ct6FLIufk=; b=XQGp3DZZKyZ4rrhwog0EZOiJxzvIqhWeRZfYlw
	ZwkhUIgrFxhy7dNGgLnxM+Gsppftja5BwgXf7pBD7MOvblHQ3NgiGx30haGqQey0
	8XVGBV2ttR3zgex13LlAy8Vuw7d02fc0iWpDMXg/zsg9NVVYb8O1eTp/MF+PcUPQ
	HZxrgJSkImSBRzC+i0cxetPPps4oXEUd7VkgFznqXJxEiXlheDCiZGzdzWvd0VVr
	Kz5d4P5fCEosq5DB21QLGdnqP3gYzaBDhSEs4yTcvZ91IddQz7ItZZ7H1NCMVBvW
	rfRkQC8CzHe86asy+aZ9Huka3Ck8ZumtfGKP/TqtixjBE7mg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n0sj0f5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 19:46:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516Jko5W013459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 19:46:50 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 11:46:49 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 6 Feb 2025 11:46:36 -0800
Subject: [PATCH v2] drm/msm/dp: account for widebus and yuv420 during mode
 validation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJsRpWcC/13MQQ6CMBCF4auQWTuGTqSgK+9hWNB2kFlYsJWqI
 dzdSuLG5f+S9y0QOQhHOBULBE4SZfQ5aFeAHTp/ZRSXG6ikqlRUo5vwKY7NHLGXF/amqxtjmA7
 kIJ+mwHnewEube5D4GMN785P6rj+q+aeSQoVGa0ekq+qozfk+ixVv93a8Qbuu6wdb7+phrgAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738871209; l=2949;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=RoTJBLUmCZznZlIN87HyUv2pCJM7GP1ktF6AXOFoNe4=;
 b=knDL7+TbMcuDVfdalbfUEr2tvpon0ieGdB/S1ADb1UjPhpGX/QVeUoF+NUXwwAr1edBO4rX3Y
 H+LuNfI9DXKD3Q7tGjSD7HH1PKaPBmMNOWHryDhlaPjlJWvxwIHT0fu
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kdQKtCZxVLi-KzdttD1AmWFMHiNkXGa1
X-Proofpoint-ORIG-GUID: kdQKtCZxVLi-KzdttD1AmWFMHiNkXGa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=901 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060157

Widebus allows the DP controller to operate in 2 pixel per clock mode.
The mode validation logic validates the mode->clock against the max
DP pixel clock. However the max DP pixel clock limit assumes widebus
is already enabled. Adjust the mode validation logic to only compare
the adjusted pixel clock which accounts for widebus against the max DP
pixel clock. Also fix the mode validation logic for YUV420 modes as in
that case as well, only half the pixel clock is needed.

Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Changes in v2:
- move msm_dp_wide_bus_available() to the next line
- Link to v1: https://lore.kernel.org/r/20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
 drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682bf5016bb0efbeb44489061deff060..3898850739abb90a777bc94ede0fb0ceef5e5162 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -930,16 +930,17 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
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
+	     msm_dp_display->panel->vsc_sdp_supported) ||
+	     msm_dp_wide_bus_available(dp))
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


