Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7F7784894
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 19:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjHVRnF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 13:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjHVRnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 13:43:04 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEF23A84;
        Tue, 22 Aug 2023 10:43:02 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37MEMJA6017712;
        Tue, 22 Aug 2023 17:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=ANZ/5JO75v6RleqSRulh7VZmcQ9jzPREAfF247WfYYY=;
 b=eYc6xMZBqbdK6eyHH/1PR1LqmrygixSEIAbwc3kofYroTMNVT6NQ7XlOlH/v9ceJ2JcB
 YoPIMCWpytnk1GJTWrrvtrbI1p3SqqEpAzWg36OON5FMeaKxwShPFrNz5fJ4mUgTGori
 XsaZKe03XcZ0l0GmbsXtxjw21sFxbuNh4UJo+SJ20QGBqF58Gxz3aiiJVDzC6474LQt4
 0rtchAT5TCqOb/HQBh0bqkOP9bsyBfUtQc0m6jgLG4nmzgl58VIA8TGsOlgyAEe7JViV
 UJkF5P78VkXrWoIlqq0712e354N9eOSeksQtsWUkOQuveB+5sGGx+0RHeHEzEMgseWkt 1w== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smreu1fu0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Aug 2023 17:42:47 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37MHgkIC003050
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Aug 2023 17:42:46 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 22 Aug 2023 10:42:46 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Tue, 22 Aug 2023 10:42:07 -0700
Subject: [PATCH v4 4/4] drm/msm/dsi: Enable widebus for DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
In-Reply-To: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>
CC:     <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692726164; l=4272;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=11wAmANhEabHWMY3IbrT61xx3EGxeAL5CSIYq61dff4=;
 b=MqXuhgHJlwSqQ6A4OiyL+zYz+jviT+552gbjpCCoEYS3QOAUd4iOpMMUdD51vlTfG/UtJ5Rci
 gfUAe1tEusFBfufi6TfpK728LPVIxCsUd/1m/JYJnD0yT67Hszep4Zy
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BBBekK5OGg8jWAFSyf8GDqIkrrz7W_R0
X-Proofpoint-ORIG-GUID: BBBekK5OGg8jWAFSyf8GDqIkrrz7W_R0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_14,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=840
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220140
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
48 bits of compressed data instead of 24.

Enable this mode whenever DSC is enabled for supported chipsets.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi.c      |  2 +-
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++----
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 4cf424b3509f..7327bfc06a84 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -19,7 +19,7 @@ struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
 
 bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi)
 {
-	return false;
+	return msm_dsi_host_is_widebus_enabled(msm_dsi->host);
 }
 
 static int dsi_get_phy(struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index bd3763a5d723..a557d2c1aaff 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
 void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
 struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
+bool msm_dsi_host_is_widebus_enabled(struct mipi_dsi_host *host);
 
 /* dsi phy */
 struct msm_dsi_phy;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 645927214871..267c7fda8854 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -710,6 +710,15 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
 	dsi_write(msm_host, REG_DSI_CTRL, 0);
 }
 
+bool msm_dsi_host_is_widebus_enabled(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	return msm_host->dsc &&
+		(msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
+		 msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0);
+}
+
 static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
 {
@@ -753,10 +762,16 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_CMD_CFG1_INSERT_DCS_COMMAND;
 		dsi_write(msm_host, REG_DSI_CMD_CFG1, data);
 
-		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
-		    msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {
+		if (cfg_hnd->major == MSM_DSI_VER_MAJOR_6G) {
 			data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
-			data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
+
+			if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
+				data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
+
+			/* TODO: Allow for video-mode support once tested/fixed */
+			if (msm_dsi_host_is_widebus_enabled(&msm_host->base))
+				data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
+
 			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
 		}
 	}
@@ -894,6 +909,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	u32 hdisplay = mode->hdisplay;
 	u32 wc;
 	int ret;
+	bool widebus_enabled = msm_dsi_host_is_widebus_enabled(&msm_host->base);
 
 	DBG("");
 
@@ -914,6 +930,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	if (msm_host->dsc) {
 		struct drm_dsc_config *dsc = msm_host->dsc;
+		u32 bytes_per_pclk;
 
 		/* update dsc params with timing params */
 		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
@@ -937,7 +954,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * pulse width same
 		 */
 		h_total -= hdisplay;
-		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
+		if (widebus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
+			bytes_per_pclk = 6;
+		else
+			bytes_per_pclk = 3;
+
+		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
+
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
 	}

-- 
2.42.0

