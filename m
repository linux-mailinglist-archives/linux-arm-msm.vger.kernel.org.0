Return-Path: <linux-arm-msm+bounces-64666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B291EB028AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56A95A6083D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 00:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BF61DB92E;
	Sat, 12 Jul 2025 00:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElWNkyCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF5F1C07F6
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281921; cv=none; b=TgRLqa1cznPmtCPJ+ZnDFPjb9jQKE7ulGBsv2nDswLt63jKxMdu6mNsKTd9cEUScHl9vML/Lw4v0Byv2SlEaISAlT7QtDZKbUmSj/PLrN/QDOYO/o/ymEe+xoap11nOC2XnzEr6IhobEIgvsF/BKSR9tXuR9ohhkUftl+IUtl0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281921; c=relaxed/simple;
	bh=A6qHQe23MoIl3Lo+738gYkpwWYMBFzzH7/YAXqyjDXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuH7d3V7Y3rv47y2hn5UWfY6618eAEFZ0EHHcsoeG+iNzqjYk5n4lNqKCmluzrLHugG9o6zUeop7LP5b40osvly+KkV0FdHhH1mW1b6QHC8svb6ogRbU3mdaiRBaw5rCJclmR5m9D5T3Ygno0tyZb7KFPX4+4YvJ+hP/7HEIxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElWNkyCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BNKd6F029941
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sfyzKfbfll0Y6pC9wYmMCCUExx6sAsV9HVVdHNnnk8=; b=ElWNkyCkiT3wToln
	LVY4Npk6MdtzRAiDDoCttMqcCnZYHShCoNI0ukYB8dujUV66yRaFPc/iansUYcE4
	fUCAm0nGO5L2tDCiA1fXzatyYbeSt7lhLoIChlRl98nCJEmLdZ5goy1+yJeQYLEV
	Dajdi8VIY/fa1S4ppLcEAYPvkxrAT0pqhzGdOJivjEL6eDPSpfByJiRXzJR6kDqw
	u4riPtQJCRHVQZk+aPoBMOLLlP8sBzBNTMww+qU0fb5dwIa0ZZ1Y1RP7zZZ1z1Ui
	SNEIl0T+hejtu3YdapNcO8vYp6+TGLTRCqzgwSbX+6prXkrhjYZxFvTHrhoyiQlS
	246vbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbet97x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313d346dc8dso4112938a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281918; x=1752886718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sfyzKfbfll0Y6pC9wYmMCCUExx6sAsV9HVVdHNnnk8=;
        b=vG2ijFSbmNoJMQZ8xrL1L6e3FxH/OsbmNE0fw+Vg7qXu/UCqaH1nGW71NzhwDBOs9S
         cLbHsVR+c47cYX5At8+LRbz+i5qY217VoxLRpCU7bFcNMvSjf7BIQJmVC3qEv8Bu1ANA
         +09Y87KV24/JBvAWGGWeJ65XvlDStAVrD23ND8ruE5nblQZ5gzW3kMI56vrYmyEB3hVH
         bcI738OyCewU9MSXnvUqZvfHV2qgo5cWt24nf5JAgFl5oOhZRvNfZ8gbSL2Sr64xY7ta
         AFxmmRY2QAxdkyTahr+JURmgSSDLuUODk88nxupfYI5qK91m19RoB2AaQqI6LmRyzHV9
         Tx+A==
X-Gm-Message-State: AOJu0YznmnHKsMqqVe30DsitFaqucC4fWjaVWfNIQEyznrC1815S34JO
	/Lrt9AsLKPg+HdxDzbDAtf5S2cHCcDoZl8+qSgAN6w2eTNfi+TsWO38mcIc3SwKfqIGy0XltlWB
	+8PE01cVdT/8oeTsT5indaaJwR7cez56PXU6+u8yKrHWSXngNc3++dr4+hIg9FWcJcd+r/MVDKe
	xu
X-Gm-Gg: ASbGncvyklKcOm8fQswJSfrbaiaFUcml9L998B1WZHxULQmRnJoxAprsSSOwSfFRP5J
	uzzU6L4kFeEXtz9q1knphen8FRuigpF3qui8yt1pHZFKD5bzG+NcPGSKuEP88P95ooCrR8uqT3/
	SeOUIV9EJZEkWgnVvU0mys82SQNNxvZRcEZzqqeTU7chEPhK5WB3EKGJnwisqTWMq69fNHFeC/h
	03kA3WMispV5itD1cyQD4xrjJ9JsaqmKsxyTCH4oP9shkbP/BDW+bvE71pjTu1BXpEZduj9q6aH
	CROs1vdWyWsZyd5fS+r7eHPp5KXE6yG/8lQDyk8Mnbfsv7aM5bLggQXjiKbpwrWzIDrL3CXToTt
	DvyQAL8POuWkTChdXb0+jS4+c
X-Received: by 2002:a17:90b:5445:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-31c4cd542d1mr7102538a91.30.1752281917573;
        Fri, 11 Jul 2025 17:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG88ipsfGCVjYqYZ9GRyykBzdr8Y1eqpIyUUX2i5znBDnxgzgMI8LINqhKf5XOyh1wG4OdyZQ==
X-Received: by 2002:a17:90b:5445:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-31c4cd542d1mr7102502a91.30.1752281917135;
        Fri, 11 Jul 2025 17:58:37 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:36 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:12 -0700
Subject: [PATCH 07/19] drm/msm/dp: Rework unplug handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-7-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=3891;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=A6qHQe23MoIl3Lo+738gYkpwWYMBFzzH7/YAXqyjDXc=;
 b=qFKTKln9ZXCepyzqJoVFRVR9U8ih8agkhM9UBkPU07pTQJRSMBW5iAO6L26B8U13RCmmdqSNl
 0HOeAZDhO53AYTRwHx2HuWbuUBJMnRkPE4pduUu+Ddkws8LUkPuphWa
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX0TuK7ABWhkdg
 Pz4h9t8hqcLnUok7rZ4u9kBqZQujKn6Zy2hFfOrWDINazE3OkSf+FnBiGtWW2pNYsX98B24Xy+f
 91tBv1PIKpxYzVShY5O2oRkslHEHGQYpKTwqqXf1tnlc7xkZzxwRrNc8gX9LeA/ihfO6Y4WFuwt
 92kR46D+je1rJovkfSf4N71g+k90WpZjoRnwEMuXeogRvfVDqh3iTt8S0c034w0s8Z5KASwmWnC
 AOWS3dosMHWrtxHxOHmP7nImuIAmJPv5C2cM3WGLtkCQaAdG6UCMvmGvpV9fzNQ3EfpzF0oDRmc
 c3byL0ZgZt9Nb33TLq4VrStoBIz/vuLg/DzWg1GRckF2BYxahKDDK08AMBYiPx2c3OOu4Gzk6yh
 sE+xpiXGhSZ84NRaYhOU2MbmwYkcEA+IsryJBsHUT0nDPpdGdnf4uU0nGbMZz0RB1TpAtkQq
X-Proofpoint-GUID: BST6tHHORVLitQ7TmbwV7ozOEQ6Sui4G
X-Proofpoint-ORIG-GUID: BST6tHHORVLitQ7TmbwV7ozOEQ6Sui4G
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6871b33e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4KM1mOPumagNCLxjdSoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005

Simplify the unplug event handling by dropping the link teardown (as it
is already handled as part of the atomic post_disable()).

With the link teardown removed, we can also drop hpd_state-specific
handling to minimize redundant code

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 22 ----------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++--------------------
 3 files changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c42fd2c17a32..4cf269b98029 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2567,28 +2567,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
-{
-	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-
-	phy_power_off(phy);
-
-	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-}
-
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 124b9b21bb7f..f68bee62713f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
-void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0f1c1fd2b1b7..1ce8051b116a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -661,32 +661,19 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
+	if (!dp->msm_dp_display.link_ready) {
+		mutex_unlock(&dp->event_mutex);
+		return 0;
+	}
+
 	dp->msm_dp_display.connected = false;
 
 	/* unplugged, no more irq_hpd handle */
 	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
 
-	if (!dp->msm_dp_display.connected) {
-		/* triggered by irq_hdp with sink_count = 0 */
-		if (dp->link->sink_count == 0) {
-			msm_dp_display_host_phy_exit(dp);
-		}
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	} else if (state == ST_DISCONNECT_PENDING) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	} else if (state != ST_CONNECTED && dp->msm_dp_display.link_ready) {
-		msm_dp_ctrl_off_link(dp->ctrl);
+	/* triggered by irq_hdp with sink_count = 0 */
+	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
-		dp->hpd_state = ST_DISCONNECTED;
-		dp->msm_dp_display.connected = false;
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		pm_runtime_put_sync(&pdev->dev);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
 
 	/*
 	 * We don't need separate work for disconnect as

-- 
2.50.1


