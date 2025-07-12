Return-Path: <linux-arm-msm+bounces-64675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1DDB028C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FEC23B64FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5CB2236E1;
	Sat, 12 Jul 2025 00:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTP6A9el"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A26B15D5B6
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281935; cv=none; b=uo6e5+uk01Bm7PV3EuNN9lcidezNHoXIC7nxMRE5ULle7iY5QPzYx5Ha4vG9COfaTEbaxgVfvDnzB8ij7uRNkWM0GWmlyYTfhfuqVcLN7KNRHntZQP8sY1silTM5MM7dw80CjxOopIEPN1xEQrhQbUxRAZRyUTSqaF7eoF20+oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281935; c=relaxed/simple;
	bh=xkdTJkD4WZOtCIaP3g0FoYgCz7GOS4niggFgMMcqAvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzXmgFY0cCCCH/Mm1P5gFHMRyNZyohAHStOFxnMxNvqK8MJyLcaBxB52yDE3/VSFOA/5A896hex9TxquLpp9cvk7EwmbhgpcEelUE9dgi3UxmDnbI7U3SS7QhiLX5UMkJfkZC1jjCXiCEi9e21Aay3X2zZIEWkvwNtiA5alMG80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTP6A9el; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BNKFnZ008152
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6MX/4UQ3wXDdbyTB76Y7TSV5eGjDBlTaDUHvPE6J1c=; b=TTP6A9elD9VKFH3z
	MW6ZqLWWpCOtNVM/lZGaP+imvfgkJQviwT9nsNOQydy3FqkcT9EkNXm6DNyz7L3M
	G68rge6s9mOpkSDQOETMrgPmaPmHVzIoFtP9KfdKDQkjYrbhW6omuvXG9epL1Vtg
	pFm3gIHkN70hyhtjju9bpQk7rqMV73eFCADzP1d9JncK6kdnNC9EwQnDqPhOggVj
	qbHiy2EKjXEO/a//o/4HcWxzPt7C21UqvtIJW2/AMsXBwcHVEgyIf9gYIkaBMnOd
	gEsGyOseGjYXKntrHr+24qj36W0SSC13aaZe1QCTMyAoxL/n9VLMq1q81wBakVof
	ASuf/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcga6tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so2940888a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281932; x=1752886732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6MX/4UQ3wXDdbyTB76Y7TSV5eGjDBlTaDUHvPE6J1c=;
        b=myVQ9JRTRYkHBEBJPqc5YqUcDrz2JxP9d8iixLualBe3DxYVYAeAd0f7mJaRFzrNsr
         t6D+EsHGC5pAjWyUnpxHRGFIjNk/pih7pa2+nBO9E+QJxnLHIAWTdOp4+N7M7GsUhZjN
         29hXKU04FkkMWf0014etmgxPE/Qc+7NFf/L/g4oNzQW04gINmITASbFxrTDLNgvsHGk6
         3n/O29OvuKOeS50GG0Jpdb+nUpz7vy7uqSPUXscZ/gEZHpTbJfq+Af+g1q/p1FT4re1T
         eiXG+OLsvrx1N6LEQ0rYFt0oGbmP7sv4QEQ75byTD74B3xNDZuJy7dz+EwcxNnOpVyhM
         d1dg==
X-Gm-Message-State: AOJu0Yy05uTSQjHepT1OttZ7xlE0Qfnell5/ZQURcY6Zbdsk5T6BWA6Z
	aLEhgvUKNnQUC0TWwnjzYOeSJVpZptHxi3CNDGOdMqkxyOxfpEaqzmvIPAAfDCF9zRwJ+lcLECj
	FvQO5fF7xYFEOWLqZSyxLVwvyNmKht9oxWLjLxS/tqMGoKGshWWpT8NoZ1C1A6KZqm0eV42946e
	H5
X-Gm-Gg: ASbGncv/MDNu9hQJ8PiswRRsPzB9fcEAM7qqDg4pOkSnQ0Ru8YcPuOp2/zuB/BIlWBV
	gdfCLUf5BEVLh5F3w65/x+x7FNuE1rxyTRHxvd07rnoL6UqkEwmCG4skJchX/WtGAMyZJ4LPoIT
	JhRdd+mxyzyzyit1em0pmyE2r7lA1zyz4Ao0+uRc5aWHjBbdBwk6W0k8tHyRAw/G9CruhWqkMYe
	Z0Wn0p+W/uxv/m2ZQcKuLOLwZ9F8+FKJmzXRNrcIn6wUom9lmDT+VPG0NWNYbMStyFeqHBvcSO+
	U8NJiLpcfi3k3tGrT/rRI8GzSabp6C2ryjj1wGZY5TlUxgnoomE4jkS8NSL4w7we82rw0Kq7jVr
	5hys/2kdjCyhs72UEpxJo2vNc
X-Received: by 2002:a17:90b:3a8a:b0:313:28e7:af14 with SMTP id 98e67ed59e1d1-31c4cd65a3bmr7425880a91.19.1752281931701;
        Fri, 11 Jul 2025 17:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+tFLKCiCnmepc6qucz0dfVj1tK+bY/9vBdgkeSkt43kwJGfNiJkqRtZ8IG3Tjs+Uvv+NhcQ==
X-Received: by 2002:a17:90b:3a8a:b0:313:28e7:af14 with SMTP id 98e67ed59e1d1-31c4cd65a3bmr7425849a91.19.1752281931257;
        Fri, 11 Jul 2025 17:58:51 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:50 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:21 -0700
Subject: [PATCH 16/19] drm/msm/dp: Drop hpd_state from msm_dp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-16-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=4635;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=xkdTJkD4WZOtCIaP3g0FoYgCz7GOS4niggFgMMcqAvE=;
 b=+E6l2V/nDb8KhG3CAAg7+kJnHr+MlfA6ctlX5ccgh5qrgoS8D0zCCOUNf12CexedtRsn0uiDv
 Dck1hnnKBUFCogGlFKtRqE0GtzIvTBqejdEVsAUDMO/2tI5UjOGKZ95
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6871b34c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=K4C07s3wgbYD0KnbiqQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: dBKJf8jr9GcllIQ-jWNtHqkiTe5AG7ua
X-Proofpoint-GUID: dBKJf8jr9GcllIQ-jWNtHqkiTe5AG7ua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfXzbHrYWLM37UU
 8OZ2D8mJ2AWCB+aIu7CSjlFGKw6YbGJLIIbUrMk59wZnH8lnwjRPjHflzL52x1bzebOpscLduRM
 skAVtRAhWTc7YrrlRI6vrMBI3eTt5e2EQprrQjUifJ6mgeMm62QwtMC5dr5giFTudmXY3m1fwqe
 tsXe1ApmFrmyjMXtuvdTlZ+ohtqt4Q5GJP+baQQIZs2JM0l0oKJKIGuaRuChTrHneFgnYGjQ6zw
 vbfrs4tDuY5wgcmlxStg3Ds7UVBoAUrIx8Zb4+gXB/4nmNZfLv4vp4T2c2cyGSGiyqwEg5u7VfF
 HiGAZz5qyQdEqmCOdjnr1O2B3iRoKu9Zm8dYXhJoSbJMvBqaQJOzv9X7eRDcvZzfKiAKaRyB5q2
 hzNlj+fcMVe/GWFNAmA0VAvf0XjqYr+U1dQK4npYk19tN5nTVWN8TDojL6biNJDRuhVmLeO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

Drop the now unused hpd_state field from msm_dp and adjust debug logs
accordingly

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 529e30193168..3aaa603da4f9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -91,7 +91,6 @@ struct msm_dp_display_private {
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
-	u32 hpd_state;
 	u32 event_pndx;
 	u32 event_gndx;
 	struct task_struct *ev_tsk;
@@ -556,8 +555,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
-		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
-					dp->hpd_state, sink_request);
+		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
 			rc = msm_dp_display_handle_port_status_changed(dp);
 		else
@@ -569,7 +567,6 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
@@ -577,9 +574,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	if (dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
@@ -601,8 +597,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -625,17 +621,14 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
 	mutex_lock(&dp->event_mutex);
 
-	state = dp->hpd_state;
-
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	if (!dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
@@ -660,8 +653,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -671,14 +664,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
-
 	mutex_lock(&dp->event_mutex);
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	if (dp->msm_dp_display.link_ready != dp->msm_dp_display.connected) {
 		/* wait until connect/disconnect handling is completed */
@@ -689,8 +679,8 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	mutex_unlock(&dp->event_mutex);
 

-- 
2.50.1


