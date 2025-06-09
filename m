Return-Path: <linux-arm-msm+bounces-60624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37595AD1DBD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0E3D3AE0DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D092E262FD9;
	Mon,  9 Jun 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iycJzOm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F02627E7;
	Mon,  9 Jun 2025 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471893; cv=none; b=WAWwtm0nGVbKdxVt6Qpckb6YyL4MoD/wyJQz9geRzZsPSFUU0D74dOAVT4K/vG3UThzjU0KsnO935vO3QHCyu34s7Zoj/uUojpCKCt9sj47rXTiUb1fAXeTLiUqIJ7nkU8hcfuqdMjTUUScPhWF7kuP2opalo8dt6bVFAR0of6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471893; c=relaxed/simple;
	bh=X+PkF01PobxwCaxkoYe5wtN6YAfuwvKTEb3iHNLnww8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RYUzgiexabMV6J9i1iGCOpZnndqZHTz7oSG3VKYp8RH1A57hDYhP8oh8q6CO/kU1a2wfncIL5RmSsYPtacfuF9k7jUiG0ERo9jZhMMg3WhCWUCaxuNI770IkuEaktesz2YObI6/AJgDiN8UDFf7MSdkp9mJ18WoC44T07TnaOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iycJzOm0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599UUJM032491;
	Mon, 9 Jun 2025 12:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPQeka4yWcYcMJxMhpDgSeA+G5bMi+LyP2duTd5lKvU=; b=iycJzOm01X9UrVLq
	MbxRuB3fmw8ooAGLzeoiS9HYil8R1pvDtNAuWJXRHh1rrHkYTj3IlT6wtCqn4VDK
	2PIrJNK9c4K3WechCVG3pVXhV2Gs8Ou9p80EIzK9cc8CWlth6RgexPRRbIqOaiZG
	YRTO1/0FHfVi9PcRAV6Kh4dEpvLH9JCDCFXq/MYVEmU6gno/oBYG7JmG8wl+qpLU
	T89Pv8pxJ7wTve8+c/17olo3yxLKSOWNh3kmJmOHq2FU7Q9czfsKeNznxOnqYYh2
	rgaJnz01AFDmwInu2w//99Oy8R808wIZZddrCSEPZmge3pI604rnQ4zlcCQukKeR
	TjpXBg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75t8e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 12:24:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COhN9001949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 12:24:43 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:39 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:49 +0800
Subject: [PATCH v2 30/38] drm/msm/dp: add HPD callback for dp MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Yongxing
 Mou" <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471762; l=4581;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=19ovVtCn5YnlcUUj++/itA3pzDL7CU1jEbgRsegr9CQ=;
 b=Y2wbIsEkGqU5Fr++t6Fxx5mC0znnHwNhgb8wyDkvLGO3XIPEGeyn9TO+eiD7CqC1zhdX2gF92
 NXFDRM7CZddDDeWHC0uKXAEcpQ/dmR+exa7o1M2Pxb4vldUD33iHChD
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uSGss72-bWiKX_hdeotTLplMy19F6STR
X-Proofpoint-ORIG-GUID: uSGss72-bWiKX_hdeotTLplMy19F6STR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MiBTYWx0ZWRfX6q7rzHpClg5F
 K7g/JmduxMTcJFdtLx/74SV7e/oP/9AHSBWl7Xujj6lwqx5vpeL1S/AKf5Lcbv9muzjlZ8pbPcC
 ng9HKsaZyhyF1ncOZNxYVveagr/q5m0ae2eBHH57HpYj9s6mMJRHcN31Oh9aCA5qDVnwQDpZj37
 pKBPqioily+xpPcfNVpN4AhQ51pQtuUxf9gOyKm4ZcOXxocPkwaprnFb8V7Ckc1sOLGQLNkeeg/
 DaWjf78mEM9abB0WlJ/aTcYbP5YyCTBxcPGMPlfTG8lzp24vfiArBOOzE3vO16LFE3q49FRDDDg
 lDRMvFnxLng3cRpqr1xOiWS9QJRuWa+XJwxU+KPoTFXhbNn1Gmksqc609e/5fLdZ3svFstq90au
 Vjcv9o/bKiinNBESCqERM9jlbKBKoKZyBoOvnNiFkNrthWYCXEZO5mD02pGhHoDD0fidRqyz
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846d28c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=EulU2RYtZUHqnRkH09YA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090092

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
 3 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8ac1215d8a635bc5477e79e08264c344ed1b27ac..323d1c0a9efa4fa30ce97317e873607c54409a11 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -599,9 +599,10 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 
 static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 {
-	int rc = 0;
-	u32 sink_request;
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	u32 sink_request;
+	int rc = 0;
 
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
@@ -609,12 +610,18 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 		sink_request = dp->link->sink_request;
 		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
 					dp->hpd_state, sink_request);
-		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = msm_dp_display_handle_port_status_changed(dp);
-		else
+		if (sink_request & DS_PORT_STATUS_CHANGED) {
+			if (!msm_dp_display->mst_active)
+				rc = msm_dp_display_handle_port_status_changed(dp);
+		} else {
 			rc = msm_dp_display_handle_irq_hpd(dp);
+		}
 	}
 
+	/* let MST specific IRQ events be handled by its callback */
+	if (msm_dp_display->mst_active)
+		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+
 	return rc;
 }
 
@@ -754,7 +761,8 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
+	if ((state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) &&
+	    !dp->msm_dp_display.mst_active) {
 		/* wait until ST_CONNECTED */
 		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
 		mutex_unlock(&dp->event_mutex);
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 489fa46aa518ff1cc5f4769b2153fc5153c4cb41..5f00ec2f83ad09b94fd6b602fc37f91cb55acf71 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -570,6 +570,40 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
 										&bridge->obj));
 }
 
+/* DP MST HPD IRQ callback */
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	u8 ack[8] = {};
+	u8 esi[4];
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	bool handled;
+
+	rc = drm_dp_dpcd_read(mst->dp_aux, DP_SINK_COUNT_ESI,
+			      esi, 4);
+	if (rc != 4) {
+		DRM_ERROR("dpcd sink status read failed, rlen=%d\n", rc);
+		return;
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "mst irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
+		   esi[1], esi[2], esi[3]);
+
+	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+
+	/* ack the request */
+	if (handled) {
+		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
+
+		if (rc != 1)
+			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+	drm_dbg_dp(dp_display->drm_dev, "mst display hpd_irq handled:%d rc:%d\n", handled, rc);
+}
+
 /* DP MST Connector OPs */
 static int
 msm_dp_mst_connector_detect(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 7b08346e0bb9189009c02745c243722c01d79493..d40cb8483f971b1331172b4e5da2c8f67e55e119 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -100,4 +100,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
+
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1


