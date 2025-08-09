Return-Path: <linux-arm-msm+bounces-68143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 424C5B1F1A0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167571AA7C2E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B248D246BA1;
	Sat,  9 Aug 2025 00:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQOW6Jk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330924290B
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699749; cv=none; b=AFbShY8S6nl/1Yz52NIHBRc1tnW4d0vXPkKghwQbVDPsPfrN9kyD5PIhiNzGwNzeMQ22ogdXifTRpZHflpcGJQpmhO94TiWb9XyZszQHeJL1UphUhnTw/MopgNQhIUX7LWadstTQ46SvPcGcCCgu4vj7x6XeHaJW8M6t0tJi/e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699749; c=relaxed/simple;
	bh=NtDdlTY6ajF5Cn/Kyk0d5E8/TBSy+P52roB0OK+a+7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDnrR8RAIY7DDOM2bgRYDYsvqjkyZAxPV2h6IsRmkXp8d0xGoljK2hNsLHU0ev0wrmuHYS9V5w02ziPgHCejLtCpg8WoMzj881REtfJ7I9y7pGsgWy50qweh5tj5GvKsYJqRSyFtoFtauPrehHsGD+TOCLzuFI4Hs2UBUHKUA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQOW6Jk5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NFHbm018828
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bu9JC9zHNP1OllCJIaZCuXVLfyKeem9bnATi8oCUDNY=; b=iQOW6Jk5GUU0bVVd
	I1yLLuufa0Dp0XT/yBvhy6m6tdQloQG8ZG6GODWIrpFUhQRotWzBRIK9fh/epbhj
	qbuy+htC/toDLwF3Ee6Qmjtay9yAs8tfQeYIuYJTDUn7AEBdpmxJZ//By1qvUURm
	XlQJkrTDQxY8OAsM5iSxv1xejiha0EEQq+bRdVUQzftoN5NCSebpefUpttDFzwdW
	XUShqAY8Um3sy1gOgHAtbsUu7V6Q7HNM1jiVj4o6OWAsDPzK3rYR+vp45n3+QeRw
	2Ob3aadfCaS3x3F47UP9hbpQbqlex52VVMVs5e9E1qT24pKd6u7A7cJIKm7j3QFd
	7PRcaQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1kbbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b42f03d50a9so800863a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699745; x=1755304545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bu9JC9zHNP1OllCJIaZCuXVLfyKeem9bnATi8oCUDNY=;
        b=guj6HKagFCOhYm6bO6WFKjmmNy71TQHD6mjJT5NFnlwLzNOH4jveORSXyj4Ia45u/c
         P80mR8KGZrIielF7GJsKRupnGrhFinG/ADsQwudNNKG34JQoax9117hQ6pqKrqVVgioG
         36YkQ9K1Wj1fzgWZZ6+0XKIbL1pVPLPOEtF6L6mN+F7vt2VGj5xCh9JFZibmUL0tfxBe
         6XfO0BeHzo0JpGO1yIFbgCMKjuwgmXAN4L2SL/3R9hW+/Ditf2rFlctX+M1M005fnAPe
         RBRPJYPGsMiQYb+D1LXy/p9AAuPg5bJkMJf+iM01DG7sQUKOuM5HMpEb8SbzW13e6rUN
         V1QA==
X-Gm-Message-State: AOJu0YzNh6aoT3VA1D2MmJjfrUnEaREO84c/2oS2tpkfkpe0HqMcZTJI
	njxfMxCxuBbc9OzhoGPbQHVpb05d690MGZSKvVCl07el+oCJruH9W9/9sNl2lc8bn4uvxh/UsrI
	5isXtqpYfSsqbeGR3gxju5/m+DxuSXjzdGg9/eHjJeLb6bsR0lmzETiyOPtg30oz4JAMecfvOoU
	+k
X-Gm-Gg: ASbGncsdoENNGcz3RfXsrp+9c4WnyU/zdVjZs7LwtcVT6VGEjMbDEb8h/s/jf4HJt7e
	vHMaw/7AjvSeO45dT4bltyq7SLQaudcDoM2f1cdS3Rh5szmaoF9cbVwl8u31IACs3z4C4Vq40PE
	C2csCUb/WK3KIHP/tFDflcE8JGj+/v0IMkPoPrZ+ZSSFqhR39A53336iKU599CZjsIYTCAmQ7NX
	B9nfhKx14aB+ZwFSfDbV9bl8HAQ+YVcIKUMfZXjSDxdGUk5S+TiVUj+bCSgmCRChmSNoOqdJJk6
	bpeooa3CVF/+ZBXRpGsAov2kKkmCBjNGaL48V1sa6nSco/KFapBjLyhfchuR0t9eW1s7llXRrh8
	WzbwBLyM13XVOZEdqqIK47dPn
X-Received: by 2002:a17:903:46cb:b0:242:9bbc:3647 with SMTP id d9443c01a7336-242c225d0a3mr72360915ad.57.1754699745398;
        Fri, 08 Aug 2025 17:35:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5oheQKh0vVLh3BuayrDEhBZWfIYUi6SiluwbsB/hAdJ7WViVAEgmlUVSgsmClxqPvza/2KA==
X-Received: by 2002:a17:903:46cb:b0:242:9bbc:3647 with SMTP id d9443c01a7336-242c225d0a3mr72360555ad.57.1754699744953;
        Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:19 -0700
Subject: [PATCH v2 07/12] drm/msm/dp: Handle internal HPD IRQ in
 hpd_notify()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-7-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=8145;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=NtDdlTY6ajF5Cn/Kyk0d5E8/TBSy+P52roB0OK+a+7s=;
 b=64v9EwkavX5hcUROjX+cegb6NBCEoeYw/F/oKT/Tc6EqSzROzgIrBsc2z38w2ux/J6JTTHum6
 sAUi7lWbSrFCV+iW5DyNMJjgX2bi90kVLqy/my+e8KKkhgiY9sKxEnJ
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX50r4Q2ANYGAG
 iEJxxQ08iIMj9lKS5knL3b8lWvTlOk+ogkoBZWPzPOMmULjq106twI+UT6QIsMJ/UJiOa0jjefp
 fkgIyByTnA2vprJVIsWJx6z9t7u2Yz+gOxQyDPNW/Kf7U3pSWudSvOWPGoOhgcrc7EybAnOp1X7
 YTAP/eDZJAhHHIaeSo7xY+vuiFNnoLM31kPh+7na4yHdCd4EgHzDSrKtPFPk1/MnKFJCaShIxgw
 WM77VZBky9yh+th6ynqpWUbWBGAqz4msEZ5i0773zNGdmoZg259MwdnW+iojt6pgYEn9Alhd1SE
 AEraSiaSCG1MKCbUFbvmWpgEt/RITH5GyNksDH00CBbjnoQmI6BycampGecdYLxPKUznTtEAb5l
 E0VLDnH0
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=689697e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Wiw9OC-66MpX0Jk431gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: AhQZFZQPaqmBfL4AaJjhCGcR-b5hkcC3
X-Proofpoint-GUID: AhQZFZQPaqmBfL4AaJjhCGcR-b5hkcC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Switch to using a threaded IRQ to handle HPD IRQ events and moving
handling of internal HPD IRQ events to hpd_notify().

This will simplify the handling of HPD events by unifying the handling
of both external and internal HPD events in hpd_notify(). Also, having
internal HPD IRQ use the DRM framework calls removes the need for msm_dp
to track the HPD state internally.

Note: The setting of linked ready is moved out of
*_send_hpd_notification() as it should only be set after the plug/unplug
handling has been completed.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 127 +++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8779bcd1b27c..b9e2e368c4a8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -96,6 +96,10 @@ struct msm_dp_display_private {
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
+	/* HPD IRQ handling */
+	spinlock_t irq_thread_lock;
+	u32 hpd_isr_status;
+
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
@@ -345,14 +349,8 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	/* reset video pattern flag on disconnect */
 	if (!hpd) {
 		dp->panel->video_test = false;
-		if (!dp->msm_dp_display.is_edp)
-			drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
-							 connector_status_disconnected,
-							 dp->panel->dpcd,
-							 dp->panel->downstream_ports);
 	}
 
-	dp->msm_dp_display.link_ready = hpd;
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
@@ -407,6 +405,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	dp->msm_dp_display.link_ready = true;
+
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
@@ -420,7 +420,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_display_send_hpd_notification(dp, true);
+	if (!dp->msm_dp_display.internal_hpd)
+		msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -489,7 +490,16 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_display_send_hpd_notification(dp, false);
+	if (!dp->msm_dp_display.is_edp)
+		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
+						 connector_status_disconnected,
+						 dp->panel->dpcd,
+						 dp->panel->downstream_ports);
+
+	dp->msm_dp_display.link_ready = false;
+
+	if (!dp->msm_dp_display.internal_hpd)
+		msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -1182,40 +1192,56 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
-	irqreturn_t ret = IRQ_NONE;
 	u32 hpd_isr_status;
-
-	if (!dp) {
-		DRM_ERROR("invalid data\n");
-		return IRQ_NONE;
-	}
+	unsigned long flags;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
 
 	if (hpd_isr_status & 0x0F) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
 			dp->msm_dp_display.connector_type, hpd_isr_status);
-		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 
-		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
-		}
+		spin_lock_irqsave(&dp->irq_thread_lock, flags);
+		dp->hpd_isr_status |= hpd_isr_status;
+		ret = IRQ_WAKE_THREAD;
+		spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
+	}
 
-		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
-		}
+	/* DP controller isr */
+	ret |= msm_dp_ctrl_isr(dp->ctrl);
 
-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+	return ret;
+}
 
-		ret = IRQ_HANDLED;
+static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
+{
+	struct msm_dp_display_private *dp = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
+	u32 hpd_isr_status;
+
+	if (!dp) {
+		DRM_ERROR("invalid data\n");
+		return IRQ_NONE;
 	}
 
-	/* DP controller isr */
-	ret |= msm_dp_ctrl_isr(dp->ctrl);
+	spin_lock_irqsave(&dp->irq_thread_lock, flags);
+	hpd_isr_status = dp->hpd_isr_status;
+	dp->hpd_isr_status = 0;
+	spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
+
+	/* hpd related interrupts */
+	if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
+		msm_dp_display_send_hpd_notification(dp, true);
+
+	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+		msm_dp_display_send_hpd_notification(dp, false);
+
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+		msm_dp_display_send_hpd_notification(dp, true);
+
+	ret = IRQ_HANDLED;
 
 	return ret;
 }
@@ -1231,9 +1257,13 @@ static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
 		return dp->irq;
 	}
 
-	rc = devm_request_irq(&pdev->dev, dp->irq, msm_dp_display_irq_handler,
-			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
-			      "dp_display_isr", dp);
+	spin_lock_init(&dp->irq_thread_lock);
+	irq_set_status_flags(dp->irq, IRQ_NOAUTOEN);
+	rc = devm_request_threaded_irq(&pdev->dev, dp->irq,
+				       msm_dp_display_irq_handler,
+				       msm_dp_display_irq_thread,
+				       IRQ_TYPE_LEVEL_HIGH,
+				       "dp_display_isr", dp);
 
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
@@ -1413,6 +1443,7 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
+	dp->hpd_isr_status = 0;
 
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
@@ -1822,13 +1853,35 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	u32 hpd_link_status = 0;
 
-	/* Without next_bridge interrupts are handled by the DP core directly */
-	if (msm_dp_display->internal_hpd)
-		return;
+	if (msm_dp_display->internal_hpd) {
+		if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
+			DRM_ERROR("failed to pm_runtime_resume\n");
+			return;
+		}
+
+		hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
+	}
 
-	if (!msm_dp_display->link_ready && status == connector_status_connected)
+	drm_dbg_dp(dp->drm_dev, "type=%d link connected=0x%x, link_ready=%d, status=%d\n",
+		   msm_dp_display->connector_type, hpd_link_status,
+		   msm_dp_display->link_ready, status);
+
+	if ((!msm_dp_display->internal_hpd || hpd_link_status == ISR_CONNECTED) &&
+	    status == connector_status_connected)
+		msm_dp_hpd_plug_handle(dp, 0);
+	else if ((hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) &&
+	    status == connector_status_connected)
+		msm_dp_irq_hpd_handle(dp, 0);
+	else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 		msm_dp_hpd_plug_handle(dp, 0);
-	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_hpd_unplug_handle(dp, 0);
+	} else if ((!msm_dp_display->internal_hpd ||
+		    hpd_link_status == ISR_DISCONNECTED) &&
+		 status == connector_status_disconnected)
+		msm_dp_hpd_unplug_handle(dp, 0);
+
+	if (msm_dp_display->internal_hpd)
+		pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 }

-- 
2.50.1


