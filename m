Return-Path: <linux-arm-msm+bounces-64660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D95BB02886
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 02:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47C627BF15D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 00:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964A114658D;
	Sat, 12 Jul 2025 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnCi+5Cw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1575D47F4A
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281912; cv=none; b=ViX78WVw/yLI0qTO43rkYLup0SZ6V9pMI1m8wmW3qFHScPMUycagZH/Cvcompv61+W8i9KuDTy3/G80U/9KwiBiPiQkSz9YovN6uA4SxfjRl+oMOlJXLFjiM+Y54zKGhC9rn0jf68SRoH4VoPAUdR+5m03PzOGkd4Gmt4qOLE60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281912; c=relaxed/simple;
	bh=bjSlnzJsU8vYNvjXm7NY70sSMmOsV/kR5hEvlzfFWqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlxfOqGXZFPvto1O7ShotBSb6hn+yGZOFPhSTrQwJEuE7z3KrhBAClx/4cAWArWRYBq0HYGIY/CELFko4/w7RQezyLcuPX69eKXWtic+IMMbNgP2pr5sZdPKkqa0ostl4150/8ZaRdFwtW1y5VzfCqETpfcSmreo7UDjjNQrnug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnCi+5Cw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMjplr003810
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALCjDWEkXO3cSVphqkkbiifG5d6oMqeh3cfLujT630s=; b=hnCi+5CwYmkRDAp9
	x+OJO75PiMywynQsp5kAiZNA+Gvp4/QIEkBT/E9D3PrkgZXiTVQ6NxDnp7YtIz/l
	4wpxRtUtmtzpYdcgFhx6dVcRIy2fcy3+sc9voR+yIfBhh+/W5F6NlkROkfey4Roz
	oBvlpoMvVMC+dwKzZjSeMtH5lBGiugRUBJkNio+JPpvkhoYYPcffWr/O3Amxe8Qs
	/6h75rbMfDaeh1/mMAtY67zsFcGxoeJHGalnG0oQlt5uSFF1uW9brJpDXxkBgKxG
	m06D5HkxlGJU+yDe2oBXQ1mL4SkVLyF9gJbXsHrAsvoLQBLwORroM2+sXcC7OZIv
	vMWiwQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp29w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31215090074so4466008a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281909; x=1752886709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALCjDWEkXO3cSVphqkkbiifG5d6oMqeh3cfLujT630s=;
        b=WH5Sm/0NOdduMrZnElwWec/LS0RS/CmX3Dq759+yn9Jg+lWO/tZNEw+0Yz4lx4n55e
         WW6T2LIIpI5eDsNG/kVk/Prd/1jVN09IZ4Egx59j5Ksff9F4YjC/c8P4HEySZeuED8IP
         aCV8yoaG4xjFAEtyvEAwruo2YK9MgJnhPM3+qbnYJfxY11Lh5KRgUdua28Sb3OWkYdFR
         xBDZNwTdo9ygGCMZK+9Td8oW0f9wQtoaPqEO2J1ZiTw6Vuyt+ibrGZS4Eov9p9qM7YMj
         n424WBgksZ2zHw567B9ZE15l2NjDsRgKqhQhTe2S20HxKbHukOh/Olf+81OJpMTCjlW8
         FGtw==
X-Gm-Message-State: AOJu0YwvbxZhykxm5Yve8KNrHwJSpoRNlPXnXXPs6jM44QtNu2uMvCtL
	58eJcn3uyF/lI9FfskmCzSg+Q7ASZ6JRemXZJg3OffqAP+IIrAgclJafkivSUahOPvicZJ/JtPF
	45k2ROCWV4I15yx2INze1wNxn4obhc7sL0APVV/UCYTj0wq+nVI5kvzgmJ+BeCDY8Nk8G4Ey/og
	oy
X-Gm-Gg: ASbGnctfyyI0NHhSR0CKkO5NnZC3gvPDJNi7WOckMLyKMxjIO3inuZ39zcECZ/uOp3B
	GBiAgkoRIcAtICbgjSYkh4IeKUdCjG/P2YFIkKdZXsrsgEJ97W4skLvU8t5lB6BJIpWdgumer8r
	SlJ+aywVSr0F27w7b4BG5Qx4F/xhZK6OyAmXcNqLtBcJrP6cd0Yq+pxY8qukrpt7URNevE/Myc2
	RRXLttHsM2+pO8qPFzxIwGq65zciUxJVMEFexp39ZzeRghJxBqggK8Uz4s/kBvZ+bwITObNU+rU
	mGYkVn2X8KkzcWF1okrcpqlEVQjgkMXEVAqUaWonhytg0B+b5kyYDLj3TP7aMVldeGW0dDBWtK1
	jjSTipwsFg6a56xkNPeVZgJnz
X-Received: by 2002:a17:90b:278c:b0:313:5d2f:5505 with SMTP id 98e67ed59e1d1-31c4f57241dmr6755767a91.16.1752281909008;
        Fri, 11 Jul 2025 17:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTjTzAf3W6aYWioBrfWiPpQYRHzCr2mBxDHLXuoKrspgu/JdV7ywhFPxy5/WNMhxgRvWfITg==
X-Received: by 2002:a17:90b:278c:b0:313:5d2f:5505 with SMTP id 98e67ed59e1d1-31c4f57241dmr6755742a91.16.1752281908505;
        Fri, 11 Jul 2025 17:58:28 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:28 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:06 -0700
Subject: [PATCH 01/19] drm/msm/dp: Track when DP is physically plugged in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-1-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2952;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=bjSlnzJsU8vYNvjXm7NY70sSMmOsV/kR5hEvlzfFWqE=;
 b=fGd0JKsAxwpnFjGlCPM8DT0L2cnVp4gMuVcB1Edo1LJxe3zWfpxwDElkztOq0ic23zZXz6T6R
 8QFOhmLTZ/bDTKmrdcnhAFmUyXCMi/ITBan1A5/bQ/LqH32Hsop5OGz
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfXxkQpO/3pCtJ6
 XWr1gBb8GS9PxnpF5lx9jkbzZvFebT+FKPwZb0sd59USmRrT+aMKGbv+r3mkJbg58D+3xVmhab9
 fpieLWt9xSIxIaiZ75UhvVAJ6S9MifAXTQPmT+JG/S7z/oCbUIepmji2cCLU6/cO9jM176EuWpS
 Tnpw8Wz5q9j4Zhx4JbsjIpWNeX773S5r5ZlOhlKmswwrA1cZxSsUzuPNBGYOJDrbuMnSFTBDeLo
 iljA4dFABfz/JmQel7jF8Dp6r6ux+/UJuDEENl4HvT1kWMMO7Nnux9XIkbL9zhgLglpfO95YxbG
 6r9NJdzkMNvv9RrqjQCRFNhtwFIqM+zYv84PBPDMqS4yVgDUIwnYMSArUdCOqR2D7iU9K5zuu3b
 HEIkMk+PIGLpi8+kxY2cdsDCV6p92fIPzDmRpeSHxfff+Eqtfbf0jdZEQ/FQ8u3X6SbeTNai
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6871b336 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dpF7G2_Zdg4AieafSv4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 8FwATf4q9teEi1C_Y8adwTRtl77jhvH0
X-Proofpoint-GUID: 8FwATf4q9teEi1C_Y8adwTRtl77jhvH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005

Add a boolean to track whether the DP cable is physically plugged in.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3..6945df782f7b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -531,6 +531,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
 				dp->hpd_state = ST_DISCONNECTED;
+			dp->msm_dp_display.connected = true;
 		}
 	}
 
@@ -604,6 +605,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		return 0;
 	}
 
+	dp->msm_dp_display.connected = true;
+
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
@@ -621,6 +624,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
+		dp->msm_dp_display.connected = false;
 		pm_runtime_put_sync(&pdev->dev);
 	} else {
 		dp->hpd_state = ST_MAINLINK_READY;
@@ -662,6 +666,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
+	dp->msm_dp_display.connected = false;
+
 	/* unplugged, no more irq_hpd handle */
 	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
 
@@ -680,6 +686,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 		msm_dp_ctrl_off_link(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
+		dp->msm_dp_display.connected = false;
 		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 		pm_runtime_put_sync(&pdev->dev);
 		mutex_unlock(&dp->event_mutex);
@@ -1596,8 +1603,10 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	if (dp->is_edp)
+	if (dp->is_edp) {
 		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+		dp->connected = true;
+	}
 
 	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..68bd8be19463 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	bool connected;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;

-- 
2.50.1


