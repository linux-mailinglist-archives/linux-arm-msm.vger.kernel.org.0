Return-Path: <linux-arm-msm+bounces-64664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F0B028B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37E6A7BF64F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 00:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B231C07C3;
	Sat, 12 Jul 2025 00:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ln+md+AC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DE1A0731
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281919; cv=none; b=nICKe/76fI9ERGyjN4oI6RyVjIPCdA7GVaWLNrRjd/Tl59cU9u+7IQsCAD8CTRGBecChgeiSRTQ+cEHqlUdKQkYvz5CFF4S4Tc2+6Pj8LfgvP3DOuwvpN3xo/7kXtMeDGcVpfGRKOZf0YRh6WFTwGiIdgCY6jwGtqZdPLGDNQkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281919; c=relaxed/simple;
	bh=gq9e9YDqbV92vcamNHfqZWNsHHp6f5oF2jcxHG6pcRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPG1+wssk7bg/9bMklkWJgoR2xjmw7T+pJns0i3+A29IZUIUgChkidc0BWRm5CO7fk0fw6mGndSGxQ+rCHWrQIP457jjcRoe+28yovPnizzkHf25ehQ/iGK8dc8fsEqZNacZmr+ZCBQRXoFvhs0z3pXeEyTwBqmnngP1iT5sNhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ln+md+AC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C07oxg003869
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ryoqGXtctirqyVRL8pk0u/4G7vhZPMGpaQDhA5RozeA=; b=ln+md+ACLNbx7tt8
	wl+q6ie2LL5PSy+d8lnu92wvI7JGlTo4MnSkiUW1g5yyG0uNhGfpV5A/JQL2C119
	0xFYSgiOAxK3s22rdnEYP28TrO3ghZd4tbt8pXqy65sCzBTXnFCBVucoQoIsybin
	OQD9g6FrzsC+QAiPkykk3j5ew4o7ykyqCvLWFatoZEH8UChrnO3/uRVO96vWRW83
	ckbqR5s/ZVBSQBiSFCfKlga4X1Kdz8N98avMCItZ9yT3C/GcaC+oX4zU2WIrya4f
	RXoO0r7UGfDH9dRkC6WAq7Mh+YMGGg56nRDNxAh1YM9kJpCtmOfJ8V3iw+EbybGT
	qOE7gw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp29wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso4011126a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281915; x=1752886715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryoqGXtctirqyVRL8pk0u/4G7vhZPMGpaQDhA5RozeA=;
        b=HAKTqCxD+VClFSlIbdLyz6kFJ3I29+KKtYw2QQom7WM8QW61EWf0K6XxzFi8u4H/wA
         Zd6gylC9HZVqf88AMg1ComDB1C/FVAusbBsV6V8KzqtPWWT5ZKg0ienp7wVLVvf3PMk9
         qbvNZr8A3Yda1EgiHgX++bCzg1ARdz2Kkg3qc5ngVleLNTY8YB8UwLpHpQNrGx2Va+Wq
         FIXlDfC++mG/QwJElW9CwM/9TtBs/E6z00Anm1L4Rl+mh8wYClPN5N35pqf+FlrxeQQM
         oqe/uA9EGBkjMeRby8xaydGkBMlD+xl7PYPjlzWOWPTL94WpXXnVxnXvVYE1N5D6RPop
         L9fg==
X-Gm-Message-State: AOJu0YyzXyKjot9brLYvITXSHD07tRK7oELXyLVsmtZB3yGdUmC3wDGL
	5ITg8UwtnIFwFMOXrU4htRumDGh5xDBNyUazlQ70CycZS4nVgFc37gJYzG5NynErDqqehvkLKty
	bkGnlffgWukasnL1QAf+/w5BsDR+yoYvQ8n4kQyfCbOGUWtNuoJqj50WegJJH8n/ggSBx1SFKqD
	Fd
X-Gm-Gg: ASbGncu5IjVMaJssH2n/tXfTe2Og3BcuoAuC9TZMjXCebxYV5ZZn2VJ8gUWg0l5yWLd
	yInbvwt5f+VHst4dd+paNRHD0qUVqVUJNaaem9VNhOlPLZETR2h7NrbLUtlVdJe27cI7E0kgxXY
	x2gbgAQhldSIkAE++JkbHfcTwphWCAk+M3Lu4KbpbuGYQMcmFwoFtrMxbQS0q7U5rEn8k467O/n
	RBdntmx5bKKa99G8/tbiyZRSwzjc/MZtbUEqiaep5vN6gaQAyMHFmPXj/rPAoydoqWz+OW+3BF4
	jPokJA/r43o/CfZCZEjKZIkZ8ge5ncshE8JLTIv/xAF8NAs4ADNFOCowXgWNg3b0qoHFfadtpa+
	9VjBP/ctRH1Yf47rY2+jbjEhB
X-Received: by 2002:a17:90b:33c8:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-31c4ca84837mr8607947a91.12.1752281914623;
        Fri, 11 Jul 2025 17:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHplGFsynCElwr1NRtQ/5QvHwKSH99tFLnrjAvvHtqqe/8u//qvLOUQmeienuhgOnqOhkIqZQ==
X-Received: by 2002:a17:90b:33c8:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-31c4ca84837mr8607907a91.12.1752281914132;
        Fri, 11 Jul 2025 17:58:34 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:33 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:10 -0700
Subject: [PATCH 05/19] drm/msm/dp: Replace ST_MAINLINK_READY with
 link_ready in plug/hpd_irq handlers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-5-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1996;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=gq9e9YDqbV92vcamNHfqZWNsHHp6f5oF2jcxHG6pcRo=;
 b=o2J1CD/iJYB4JR8o4EtmsYoQnGxEJLKpSW1vYKOK4BgQyaSffbEkHRlL2017e/6EEIfJ6IANW
 u3JAechQ4iUClFgYrrrkrDHKDZa/pwyOZR09x0M0YAwc3yd0UZfWGJx
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX/3Jpt8hMeBPk
 B0YFmM37/ufHdJ7/A/Pj8kFRUAht0RK/yrLnS7uBZe8O7L1KCjYGjPqNbi4WLl8ymd8IuFh76jD
 nKdIHp98IPHxpFhlqzqfbzLneX4Y3x5ujSKLNcKTufxLTZIDPFDzQsOcq6xXqay/It+B3W0MVat
 QdnWQYreQ3lg1jYDa7lmyzqljGjj2c5GIOh6BX0lGxB3yG44PQT+ei/rebs6Wea9KaZTg5Mm0u9
 0hjOwkLXH6V8IqnoO26M40HB7t5QE+7zjdHVCumX7LfS9nhJfvTAmRH54Tk9PBVuN5PquzeKgGo
 a+COEgq+aClpZk3WqB9MTEyZzDfBQhE3YOjY3okV9arw3BUr0i70mC+8DZG4ly9oLD4azW7G6fH
 zamNYKZbZrObqBsdroyPoYdCSCdd+RrIOhPALnRw0AfxTeDPpgkqCTV+7xp2BU28hq1s0nSP
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6871b33b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=woXWnDdVNuNVtG6xiacA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 1B9JvgTMtcv5QdoNXO9qRe7Dhu7ANotA
X-Proofpoint-GUID: 1B9JvgTMtcv5QdoNXO9qRe7Dhu7ANotA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=851 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005

The ST_MAINLINK_READY state and msm_dp::link_ready both indicate when
link training has been successfully completed and the link is ready to be
used.

Thus, replace ST_MAINLINK_READY checks with a check for
msm_dp::link_ready.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f93fbcff2cda..af3cc32aa123 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -595,7 +595,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
+	if (dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -677,7 +677,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	} else if (state == ST_DISCONNECT_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
-	} else if (state == ST_MAINLINK_READY) {
+	} else if (state != ST_CONNECTED && dp->msm_dp_display.link_ready) {
 		msm_dp_ctrl_off_link(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
@@ -723,8 +723,8 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_CONNECTED */
+	if (dp->msm_dp_display.link_ready != dp->msm_dp_display.connected) {
+		/* wait until connect/disconnect handling is completed */
 		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
 		mutex_unlock(&dp->event_mutex);
 		return 0;

-- 
2.50.1


