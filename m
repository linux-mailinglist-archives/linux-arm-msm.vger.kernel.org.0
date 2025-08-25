Return-Path: <linux-arm-msm+bounces-70704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCBB3438C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91444202489
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6872301038;
	Mon, 25 Aug 2025 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPLsRsHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4D301471
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131531; cv=none; b=ENZGDitBkCgrVTWstx0+Ev96m1a/qre4uLEcDt6OLC3ZqGN7XKCvOGLxLixpYKJGb76Ld8VwJjTOlJPDl6BFIKD74kmVitvk9mh034+ExI4/Bgg6xx5s/VAoF/4IeUV+nFntIDKHcgHPSpen3oQB+YJB2KWXQ1e/4OCH/15oQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131531; c=relaxed/simple;
	bh=0dVgSe5fQEEQGHa6kdSslP0Jcv6Y5YOGhBcw8A8Rzco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDm3sbhpGBj7gvmUDyxIpjBwx/LepPCfDlNLo+srhh33yA4AJrEbO+qBbusopzdoGr3dCWx0ZCm5pojqzFWRrPBk9IcPUnEoWT2uTjPkhQWgm0csVzf0TySFdTWquuvxNNZdaleq6EGbjbYrmgD/jxtuM5kwIxeXHQpjPnownn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPLsRsHO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8gMNU021029
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqs4drWBCBDE/z99SLo96bvGZA4vxD+HYpYQntA66ng=; b=pPLsRsHOQBBorqrf
	yLZgUCnp08l4FUDPIYKO4KfqnDaKQXZdIgdgiz/Bg1wmweAGxszhe0bEAZ4Z8kwp
	zq02JPA5SBfkMjpKk4mzNlNyX9LvWtWCxn+a2KMCPvlm+4+A1vnSNXMGiYOnUzw0
	P26OkfdYmZtJ5cDpzGRNpSwTrNB1k3e0qtcnyQpAS15i+k/HwlLtObv2rM0N0Zd+
	46fc0AIJLvh4AdufEz380Xx7ab97iIOezNdj4f500ciMB0TcgT/ZRxp3mtmQ5i/w
	GFvvaw1z40CnJGmuPf9JND5SOnR8hBJHDCFE1subpnesQ0QYwtkLBDGKT/RHjOBP
	yo1whQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85bdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e92b3dde9so3907484b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131526; x=1756736326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqs4drWBCBDE/z99SLo96bvGZA4vxD+HYpYQntA66ng=;
        b=jWbpaAr7LcTkwDuUnmdQ+940jGOv+dH6uB3gByZizc135pswU6xdlMbodD5Cj9bBId
         m3yh5jcidLobE4mwZ9x6/j+z+n8DhJ/0DcDR7Pp2WAUmeUB/XRAK+o/M1AMVsntiM6xO
         u9Yfg/DOgDPgQ08uej3Urr+KgXH0npWhjqxGvTastujdmWEie+he4soR6lwhTcG7NGKx
         1wc/oUGA3vtOglg2wmAXp71ie6qF7TTcrnykFGAIi3rS+xK78JtfsvsuwoUjRU5BlxIo
         kLd+bcqrd9SCeosKJAxaXc+LYvNtvh/t6oJbRuU5uPimbfnRFXDYIkwzs+aJ14xh+0mj
         dzHQ==
X-Gm-Message-State: AOJu0YwDBQPemVMpSp6RhXbM+9er/mV2EaLHDkxZ+FNaYqEHYTuJ+4wb
	Dev7YrPG7c1S5Jm93f7DtZPY3uQpBNDkzPXCiai9LBxdHj1x+sDWejrNKFDVQA0ifvpwFPfMEAt
	IlN9SkqmbUoK3RwwhqrNvYlemwvfVlJIF5q+1TrwCw9qItvs0PHqCafw7KO9ihKAULBbo
X-Gm-Gg: ASbGncv7CmdYQZjGSkU5ChHlIeFN/1rpUfM/dgsTJCfJSbzQ1RkEZ6r8TrVMq2FC2Iz
	mLpRcXcUfg0mI4teZW8BeJhMPu+GAYnusFA9Jy3ORetkcZNg4Gubj9p0V4Gdcey1iAuVNU84stf
	gPeRpZdzGLnY6JXW+5ZKqs8W5rt2KcUfoqostf6dEAvkEgOkK+rQybVteuXiHkDvZMHGWeoHJbs
	tmSz/fh1PyzUTeCoeTz+GfNVEdR2B9SOdpgqrrWr3gwG0RI9jBlguBHBdVDIhP33Fj7KdN9n8Bu
	6e5EkSy8Ph52sNRsDbB5veboMxlHiH994xoOZf9c0FJIXwJEZfegaHEeWPjeLZoy7C6IyUs=
X-Received: by 2002:a05:6a00:3a21:b0:76b:f73a:4457 with SMTP id d2e1a72fcca58-7702fa091b6mr19270895b3a.6.1756131525853;
        Mon, 25 Aug 2025 07:18:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnx6G6tAHpjDS4MqzBazF5doCSc2hewG21dNNgf2eTmCEsSlaRSXM1VDpwNzfGlbfdFEMRXA==
X-Received: by 2002:a05:6a00:3a21:b0:76b:f73a:4457 with SMTP id d2e1a72fcca58-7702fa091b6mr19270831b3a.6.1756131525178;
        Mon, 25 Aug 2025 07:18:45 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:44 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:09 +0800
Subject: [PATCH v3 23/38] drm/msm/dp: abstract out the dp_display stream
 helpers to accept a panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-23-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=10076;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=4zTlJidWLy0E1z5hm9dMFBWxogdjL3DqQF+QPgx0sPY=;
 b=XR8ZVcA1AMtLseYTQpeNsBV/hrKD78YfXLQW2+f9M6Id7jht1CFhGO1eR0yX4Q00OSKRywfRT
 /u4k8E9i8yTBVWmn72x5kweW4Ljkze6gt73nwCC35BqjGEIZvWO5IjH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: 43lV7L-OZCyO-1iIKFn1qM6PR189wpDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX9y6GuShDsjzk
 m0nXQI4jpacbSg+k+qfLodmyQpemjlEQVdIvRvgKQzY4GwMQBZIUX8yQiv10lJl3eOeXukdebZ9
 jXKP7F+9tfmwXc2psR+JNajlatpXIJb4um9Hg6lhQdfDQhmlvO750TjydGh5badqgXpaUhmu0xA
 qJd1OAzsPrj/dyEeLXceZXJpFFvpz4Y+isnct8fwBaIH4yrkObgBU24dP3wMqP2iIYXzGgYCg4/
 89m0fo2sF9ssyCw46fUjNNla75aRhTH0e5ioE9S2H+IlJ9yJgq569vejH0pQRt7bOxq2AWEMLiG
 iWikJj+3z/r4C+iG0BoPXIZst+xZef0bMu1C2UPn5dq5prMggXZhN69SeXiY15DU4Ks8yzO8z5g
 Ruw1VHwT
X-Proofpoint-GUID: 43lV7L-OZCyO-1iIKFn1qM6PR189wpDY
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac70c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=8K8LDW8wUMBAfiAu:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=6JW8Usl2KB0McxKAiHkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Currently the dp_display bridge helpers, in particular the
dp_display_enable()/dp_display_disable() use the cached panel.
To be able to re-use these helpers for MST use-case abstract the
helpers to use the panel which is passed in to them.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 138 +++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  12 ++++
 2 files changed, 102 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e02ada7a3dc3b89618aeadd998e9a41236ee6bbf..0815973e6597492e09f33359d9777c0e8ce31e0d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -695,6 +695,11 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
+	if (msm_dp_display->prepared) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return 0;
+	}
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -722,7 +727,8 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 	return rc;
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp,
+				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -733,7 +739,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel, dp->max_stream);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -779,37 +785,17 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 	msm_dp_display->audio_enabled = false;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp,
+				  struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	if (!msm_dp_display->power_on)
 		return 0;
 
-	msm_dp_panel_disable_vsc_sdp(dp->panel);
+	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
-
-		/* set dongle to D3 (power off) mode */
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
-		msm_dp_ctrl_off_link(dp->ctrl);
-		/* re-init the PHY so that we can listen to Dongle disconnect */
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
-		msm_dp_ctrl_off_link(dp->ctrl);
-		msm_dp_display_host_phy_exit(dp);
-	}
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
 	msm_dp_display->power_on = false;
 
@@ -1538,52 +1524,90 @@ void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
 	return;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *dp;
 	int rc = 0;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0, 0);
-
 	if (msm_dp_display->prepared) {
-		rc = msm_dp_display_enable(dp);
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
 		if (rc)
 			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 		rc = msm_dp_display_post_enable(msm_dp_display);
 		if (rc) {
 			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-			msm_dp_display_disable(dp);
+			msm_dp_display_disable(dp, msm_dp_panel);
 		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 {
 	struct msm_dp_display_private *dp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(dp->ctrl, dp->panel);
+	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0, 0);
+
+	msm_dp_display_enable_helper(msm_dp_display, dp->panel);
+}
+
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl,
 		dp->max_stream);
 	msm_dp_ctrl_mst_send_act(dp->ctrl);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_disable_helper(msm_dp_display, dp->panel);
+}
+
+void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (!msm_dp_display->prepared) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+
+	msm_dp_ctrl_off_link(dp->ctrl);
+
+	/* re-init the PHY so that we can listen to Dongle disconnect */
+	if (dp->link->sink_count == 0)
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
+	else
+		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	msm_dp_display->prepared = false;
 }
 
-void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
@@ -1597,28 +1621,46 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+}
+
+void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_atomic_post_disable_helper(msm_dp_display, dp->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
+}
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adjusted_mode,
+				    struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_set_mode(msm_dp, adjusted_mode, msm_dp_panel);
+	/* populate wide_bus_support to different layers */
+	dp->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
+		false : dp->wide_bus_supported;
 }
 
-void msm_dp_display_mode_set(struct msm_dp *dp,
+void msm_dp_display_mode_set(struct msm_dp *msm_dp,
 			     const struct drm_display_mode *mode,
 			     const struct drm_display_mode *adjusted_mode)
 {
-	struct msm_dp_display_private *msm_dp_display;
-	struct msm_dp_panel *msm_dp_panel;
-
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_panel = msm_dp_display->panel;
+	struct msm_dp_display_private *dp;
 
-	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
+	dp = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
 
-	/* populate wide_bus_support to different layers */
-	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
-		false : msm_dp_display->wide_bus_supported;
+	msm_dp_display_mode_set_helper(msm_dp, mode, adjusted_mode, dp->panel);
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index fa92f763d2304f15af7c4e1e7e8aab5a6ffd3459..20b7ed735b3f428e894b82ae2756d0efcfa47624 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -51,5 +51,17 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 int msm_dp_display_set_stream_info(struct msm_dp *dp_display, struct msm_dp_panel *panel,
 				   enum msm_dp_stream_id stream_id,
 				   u32 start_slot, u32 num_slots, u32 pbn, int vcpi);
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
+				  struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp_display,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adjusted_mode,
+				    struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
+					       struct msm_dp_panel *msm_dp_panel);
+
+void msm_dp_display_unprepare(struct msm_dp *dp);
 
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1


