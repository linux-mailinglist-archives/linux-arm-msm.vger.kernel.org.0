Return-Path: <linux-arm-msm+bounces-70682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B19B34312
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0649E203BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328912FABFD;
	Mon, 25 Aug 2025 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKCBr9Zl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A222F9C29
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131440; cv=none; b=P8NEBqgf0quYx1bVS7WOZPgcc+rSOToR97pQnXlhOL2xhHu7QTRF1uMG0RUCv/edi1Tg9ex8YyTrh3JDotTsbIw7vJnVi0NCzPv2VVv3tLJp2BBbglL4AectQUSgz2eJx0fdl3InnLzBHrxEd0ZN6yFU4oshSiKF0/MtgKqLIVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131440; c=relaxed/simple;
	bh=pW1C/FAkrELsv2lywujfPr2WEDZOqzKrkIRTRgn3JOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=il9zUEgWeoH63B8WLZTH8qU6XG8scPGpGCzmRFWBxyi85rdHGuNJ0YZ6rNtGFFzKE3dRlWX3D5roE6QrnibBrj1C7JrTmb6rS+5Y8sR3srgpqEPk8l9vaw7rWPXmG08PtKuVHSac0XjW4V0DHwdqSlAQG/odM1YBTtR3JKqm3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKCBr9Zl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8WS1W031759
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF5yCUUH2ecWswuPj5GpyGQVGYbV11ScW7MQA2xB7KU=; b=cKCBr9ZlXIiWuDdq
	qFY/lXEKg91mzFZwvxbCesSI4AEmgmaCFBUet8IuLU9N5Fz7uVd3vcJ09eDojlzB
	ZQNV/XO1NNVGl0l0NYeA+miD0SbKOMR/cgLInESweg+XoepEKXev0akQWXcFNSxI
	j0fZdnzFmLKcx2rD2fSfax9ztd8rt89Usconxf6MCPPOnj2WSW7BAYxP0rrhh/sF
	2dtBmFuZCLVaEjJ8Zugd+HDSay4TYAGBn0Kvkkn4ViKS8U1ZaH9SqKTP7DtV1/89
	1u52y0U6xfsR3Qq/0nfO041Kwo0a5y62tt6RAvspzoQ/98nVwqzTzzYtDHX6F4I6
	/mkhng==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc57d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e364afb44so3428833b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131434; x=1756736234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF5yCUUH2ecWswuPj5GpyGQVGYbV11ScW7MQA2xB7KU=;
        b=fjqcfqkmpZoWX6h1EpXOblCVvpIC5HtS0UkRhMJu7sP2MIL4cLca2v83AnjZm61+Pq
         +1M/Xy+qTQ1Wr29Xx6NMI04Jf3scyHxWmWOvqe1F3nH8X3sArtgib+ykzsRc54NGfVSb
         +rz7FX0ZL3UkUgp3fvDF1ZoE5G1Xj5YRn6l528hfyM07b22pvQcA7t8Eh9H+dOPcLZAM
         wSsvHxXngTGshncviCzg+oc4foP88VfTDO3SzzJjwtTouz9qdZNSRL/wUaKEjAU86pMa
         Dsndj1Zjm8A3iyAXnE99Jp9egBYs7DYFY2TT37PviyIxL0iBNrcdQvM6IDDDWqq1Fs6s
         h7ig==
X-Gm-Message-State: AOJu0Yx90a77eQ6RiB2kjF9y3gbBEyH3wWB1EZ+zKWJ9ZHJg8G3MrEtQ
	EYbfLLfAAH/ckC50Cp6pyZWsa2I+aoqoNnuPhYLVX1VeitWfBGFC2nVevAEyhVL7D1049B8icdJ
	MGZnbv8K3xhcPYCezP9VLZeBfK2VLQUfLanGld9SEjrJcO3Fz5GqDd9xLaXIzmc7giRYgnF6OhD
	Nd
X-Gm-Gg: ASbGncteauucAGJeh4kVUfMAUVHepzWBLWU7JTjxUZ509xcUKj52NRSBjiGgDNFqd9n
	RKnOsEYVrLU7pDp0ade0tptWnOD8J4oCmpmc/hTKnYJf2ydJZ7VX5WTa4Wa9D/g3PIlGS6ZAw48
	Bw7X8Z+RaytDijfwrZhCiuKWYy6iExx4Fik3vn3UqGrKiJlRGJ1wSrMRvnIHHJBFmC65elfWurU
	gsnin+pGX/jh8QMJ2AdA0jrxXoqYaDUxhKdX1lmPk6jhm5dpQPDlBWgHPBOub5PyMkE09SPf/eE
	q2WMqDJkZkZz5oFKQudnsB3UQ27vDm6tl27V38sl0s5Q6GrLkmM1Fov9kEurZw98Lh9PclY=
X-Received: by 2002:a05:6a00:3c91:b0:771:ec42:1c1e with SMTP id d2e1a72fcca58-771ec421dd4mr2014393b3a.16.1756131433717;
        Mon, 25 Aug 2025 07:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUAVQwRsD6uoLSRc7oJUF4l2nyWeHZUOOMxA2rFcFQFlR3MacYGjd7QW9iFJRXZHPfxb9v+w==
X-Received: by 2002:a05:6a00:3c91:b0:771:ec42:1c1e with SMTP id d2e1a72fcca58-771ec421dd4mr2014371b3a.16.1756131433196;
        Mon, 25 Aug 2025 07:17:13 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:12 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:47 +0800
Subject: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131418; l=8479;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=pW1C/FAkrELsv2lywujfPr2WEDZOqzKrkIRTRgn3JOM=;
 b=Ia/lzZCIgQkRmB3T8DJay/JEg5rDHt/HDMS4jdDjAYuIMpU3DmbMpB68swR6oxY4h2hftlCb5
 0qRF/LIxER/D25ZS3c90EB5PHZjBHIiIdU0liObXziKmAzkQ2YWv6Oz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX5iy4T6g/eQdo
 lUQS10WTRkcRTtE1by3wf9RlztupKj5zsEWSFyFZrqoXTyu2JDPD4hKq8O/AfziddnrWORAF1MP
 3wNLghc+1Hovw2wv7MRd+rXwefMnKvHruvL/hA1FmVm33xKfX8D91JU5cc636Q44uuYgpWeQDbS
 UWcHnFY915Yf62JeUW7q8D7Dl8ehyMY89tXW2zBf+0VDbdAuuBy92lR3R5QIHkTnpN8d/+F+hLd
 bzVrhKkgriY62qE8Pjaz5EuHbOdKgL9yPrnsu5BuOuxNTP+jj/3poFZ+l0728eUD8UJ27veJ1Uz
 To839Xc708b+kS08l7Go4Bgi4JYNoT36s2TXvgD8pEpsKL3aD4xLhZJ/GNXuePwVAUDIujqJ67G
 mPVszdzG
X-Proofpoint-ORIG-GUID: -XQSKsgvCC_vhAZuM8cBet4bxia3kAVn
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac706c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=s5ODlx4LKU-xjoPD000A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: -XQSKsgvCC_vhAZuM8cBet4bxia3kAVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
state management complexity. This change removes the drm_edid member from
the panel structure and refactors related functions to use locally read
EDID data instead.

- Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
- Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
- Removes msm_dp_panel_get_modes() and drm_edid caching logic
- Cleans up unused drm_edid_free() calls

This simplifies EDID handling and avoids stale data issues.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
 3 files changed, 26 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6d81950627a073baca9809690134a711e965035f..dadf31bc37763c4f07f68b76fbbe33fb77b20850 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -282,6 +282,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	const struct drm_edid *drm_edid;
 
 	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
@@ -289,7 +290,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
+	if (rc)
+		goto end;
+
+	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		DRM_ERROR("panel edid read failed\n");
+		/* check edid read fail is due to unplug */
+		if (!msm_dp_aux_is_link_connected(dp->aux))
+			return -ETIMEDOUT;
+	}
+
 	if (rc)
 		goto end;
 
@@ -306,7 +320,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
-	msm_dp_panel_handle_sink_request(dp->panel);
+	msm_dp_panel_handle_sink_request(dp->panel, drm_edid);
 
 	/*
 	 * set sink to normal operation mode -- D0
@@ -565,7 +579,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
-	msm_dp_panel_put(dp->panel);
 	msm_dp_aux_put(dp->aux);
 }
 
@@ -616,7 +629,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
 		dp->ctrl = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
@@ -624,13 +637,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
 		dp->audio = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	return rc;
 
-error_ctrl:
-	msm_dp_panel_put(dp->panel);
 error_link:
 	msm_dp_aux_put(dp->aux);
 error:
@@ -794,8 +805,7 @@ int msm_dp_display_get_modes(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return msm_dp_panel_get_modes(msm_dp_display->panel,
-		dp->connector);
+	return drm_edid_connector_add_modes(msm_dp_display->panel->connector);
 }
 
 bool msm_dp_display_check_video_test(struct msm_dp *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 15b7f6c7146e1176a80b5c9d25896b1c8ede3aed..eae125972934bb2fb3b716dc47ae71cd0421bd1a 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -159,7 +159,7 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 	return min_supported_bpp;
 }
 
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 	struct drm_connector *connector)
 {
 	int rc, bw_code;
@@ -201,25 +201,6 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 
 	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
 					 msm_dp_panel->downstream_ports);
-	if (rc)
-		return rc;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-
-	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
-
-	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
-
-	if (!msm_dp_panel->drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(panel->aux)) {
-			rc = -ETIMEDOUT;
-			goto end;
-		}
-	}
-
-end:
 	return rc;
 }
 
@@ -246,20 +227,6 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 	return bpp;
 }
 
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
-{
-	if (!msm_dp_panel) {
-		DRM_ERROR("invalid input\n");
-		return -EINVAL;
-	}
-
-	if (msm_dp_panel->drm_edid)
-		return drm_edid_connector_add_modes(connector);
-
-	return 0;
-}
-
 static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 {
 	edid += edid->extensions;
@@ -267,7 +234,8 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 	return edid->checksum;
 }
 
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid)
 {
 	struct msm_dp_panel_private *panel;
 
@@ -280,7 +248,7 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 
 	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
 		/* FIXME: get rid of drm_edid_raw() */
-		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
+		const struct edid *edid = drm_edid_raw(drm_edid);
 		u8 checksum;
 
 		if (edid)
@@ -736,10 +704,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	return msm_dp_panel;
 }
 
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
-{
-	if (!msm_dp_panel)
-		return;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index d2cf401506dcbaf553192d5e18c87207337664ab..618d0253b525308b392b9282098e8ca78bf32f1c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -33,7 +33,6 @@ struct msm_dp_panel {
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct msm_dp_link_info link_info;
-	const struct drm_edid *drm_edid;
 	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
@@ -50,13 +49,12 @@ struct msm_dp_panel {
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-		struct drm_connector *connector);
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid);
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
 void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
@@ -95,5 +93,4 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
 			      void __iomem *p0_base);
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.34.1


