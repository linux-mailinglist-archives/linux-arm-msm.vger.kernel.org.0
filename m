Return-Path: <linux-arm-msm+bounces-64678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 334C9B028C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 597BB5A4324
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB8222AE65;
	Sat, 12 Jul 2025 00:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvtJ3mq5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC0D226D03
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281940; cv=none; b=DFtQpoN94daG71XulVndkfXyehRrh8PMG5sDqA45K4WRFaD8e3kDQc/XIEH/3bI7xPpIYqjQTJx379ZvpNMP/t4zjnCSX6GYwDv7KeKhvjVouwCAaOD4v5iBQc2vXlDvzzBaNGg4Ansx8sMMM7817i3xLv4oGLcAE/beDK0UY6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281940; c=relaxed/simple;
	bh=cVrxZLsPS+6RQHt1ufzsG9tg+vHQCxscM1KTv98juZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZFBPs63eOiT8DlkP6gPXtS1dkZOgfcNCHfthTcvBTJ5LUXXs4ZQLAGUQbpXHNDEPgrNBPv88EkrYJ5+LIBYapHNQ+wKkFf9q3Y5rvSkB3dDPZfLsyvNsYV8SZ4i4imvw8LJe2KK9ruDgJanK7mOA2qOxbPUK1Og4ZF2r9E9aQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvtJ3mq5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BN2mCJ021740
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brzXIsHemnuaxFgKGlGWJGmC5q7fHaCKN6Y5ci5Sa70=; b=JvtJ3mq5keG3hAtJ
	S++6Zgv9QIInRxQqSVkuRzN1cACQbPbAWzx+nPqub3t9a7tRHb/5pwzBc7welOst
	H/hqXh1CpgpTghBSEq/dl/uH286XyFxYYMNrVJS96V/nBgKqEI7yfAZXbIjbx2iD
	FWFWQViAYlBoegE+SswzcErnGbGVdUQQcAb+WIWqxqqUZmcBTOd0OcwjSdwMzL0o
	hJCC8ApOP6lDFA2K7dY/nFbzn9wSo+/BHo7uDw8xTJHxkB9P/COgqJ5Uo9cbbG8p
	C6ThQxA4FCafGJb5SnRivWPE+/Evf6MgM420CiPIixrLTpzsmRCvtP3/ES4cU4RG
	3T8irA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31315427249so2419254a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281936; x=1752886736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brzXIsHemnuaxFgKGlGWJGmC5q7fHaCKN6Y5ci5Sa70=;
        b=XOFPPQKiQzLmo31C2b/Y2ug2DUJkj1TC1euzx7MC6YROQOsMubBmgq7JDh2cPIdU6t
         /D7p4MFCPlCH7f+k9lOplL85shZ1Rzg+UL84Dva6tLNiZSjt2zrXjFetdm0Zn+dZxPZc
         d/QBmMqNXJXp0GK7DZjmm8pOs5G2RNxq8v7HCWBegJmQp6YJcGm2z1ZHBxwROlExdaUF
         YK1gW8Cw67I5OVZCws8o+DxDrT5pGjJzjBzfuyVQ3H/hyBvz0GqVNmFn8XcOz4Q1PB38
         GF2FVsPoHD7fTdRc4sbgm/dky/GKA3S424EyAlOcXiycuSWUE3SuF1a8VXpMUURq/iLU
         10bg==
X-Gm-Message-State: AOJu0Yw1L8JpClKFeO25IYaXiAya0oQTCs4ZjfhR/gdz5imZhtB7eNmQ
	q2TT1qI0Du+iCZvGwq3JR8+72IEHi9zzI40oIBeCLsJPOO7TWgTJgibpYXLObwNkAl2X8cL2xLM
	zhqAK3aKwoQzPZ/D8a2i1HZ8AFWe/EixHAls5YoatNFUydQH+XrZawZz3vsEQ1xBWocLD9RpfZR
	42
X-Gm-Gg: ASbGnctYx64hr8nKKmDL83pEZmj+SOpKkCuFJJQUMe0iLE453U5rsYGdyiAcoRLnkdy
	pnwHBx/4FmGhDyZzf+Wey/x4eE2a01G1bejzzIsCaPN93ayG07ycfztet930JkXNHQvtSTRcVJ6
	ZMhJv3YYazMPRgbLb6bCmnpDk5GxF2Jo8fuzaMwBt6wnDoT2pmpPFhk2DocaA5lPS99h3o//8IU
	vJmOqg/G4c4CtdhNzXoPNWAAPrxiLySxX2/FN7soSnYFcxXJH7KvKDdA0hw7wv35YTOZXTonpgn
	h8Q0bEiPDqHtQO3mXFtLakiwhZp9lyYJwri4lWseQUJ2vtkcmCSHvpPk1DZgdlAOK6kYf4VQMVM
	O/JdHv0J/DDkd5/7hKAjmSzIB
X-Received: by 2002:a17:90b:33d1:b0:31c:15d9:8a8 with SMTP id 98e67ed59e1d1-31c50d5dfc7mr5338685a91.1.1752281936289;
        Fri, 11 Jul 2025 17:58:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvo9hbWXSjbIaLy6V9BoL7KWqzJCvsi54CA7ay9HQd27IGhLWtKXupp2h3sOg371TH9ZnR9w==
X-Received: by 2002:a17:90b:33d1:b0:31c:15d9:8a8 with SMTP id 98e67ed59e1d1-31c50d5dfc7mr5338667a91.1.1752281935841;
        Fri, 11 Jul 2025 17:58:55 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:55 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:24 -0700
Subject: [PATCH 19/19] drm/msm/dp: Log connected and link_ready for event
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-19-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=4119;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=cVrxZLsPS+6RQHt1ufzsG9tg+vHQCxscM1KTv98juZc=;
 b=FuqweivJeealXfSD8xy2eFBqVIbs56G1r5I9+i1Cn2gvrrUFh80/4K/TytFcQpIvOJpGHGp+J
 QErTeVZWORFBk8y5k9LYBtXb1jKvneKx5O1SPg+6mgQKvSpGhB4WYQ7
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b351 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZRSb5Y5lcQKK3ktpWfgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX+lJ14M2TUqQD
 v0Xp8ex5OF+pn1HEcMTFBSSp/DBDNX00UYnAKQ9RXIyJYglra8DXRAo788rpT2xWy6TQEMvg8Gm
 muEjo196zZ9wotnkyqYw14GHIFIJlh7WKI9XhO421ppdxo3I6CccntTgpc8BWLAPTxqxdFVtv9u
 V7YQi1JTgC6tJ4H+hMDnSSjX9bS+ChfDuPpyBIfJ4thTeUcA+uTmwy8KeUCI0Rvs3qez1OuBHI6
 K58dFPpCO79Q50qGrNOx5nIL4U/4ynfmbdTpOH+zU26qb82+gtlzct6HGF9shefIqSA6cf6pwzA
 bWcp8K2V2KMWhuXhWLPnmUxYpWf76ITEdNUgsAip0Gj6zgnpY7Ps7rRY0K13+Owz4BTEwv+v0Ch
 b9oAZVw2SOWdlft86KfhrXo8UhhZHNm2B3T1W4qFbZENMGVxXIhk4U/+K8rvh/WDFQbQM7vg
X-Proofpoint-GUID: WdLAWzQMpobnWjde_dqMqW3pklMnnlEm
X-Proofpoint-ORIG-GUID: WdLAWzQMpobnWjde_dqMqW3pklMnnlEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

Add the connected and link_ready states to the debug logs for [un]plug
and HPD IRQ handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 32e1ee40c2c3..6cff87e4ad9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -543,7 +543,9 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
-		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
+		drm_dbg_dp(dp->drm_dev, "sink_request=%d connected=%d\n",
+			   sink_request, dp->msm_dp_display.connected);
+
 		if (sink_request & DS_PORT_STATUS_CHANGED)
 			rc = msm_dp_display_handle_port_status_changed(dp);
 		else
@@ -562,8 +564,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d connected=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected,
+			dp->msm_dp_display.link_ready);
 
 	if (dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
@@ -585,8 +589,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d connected=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected);
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -615,8 +620,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d connected=%d, link_ready=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected,
+			dp->msm_dp_display.link_ready,
+			dp->link->sink_count);
 
 	if (!dp->msm_dp_display.link_ready) {
 		mutex_unlock(&dp->event_mutex);
@@ -641,8 +649,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d connected=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -655,8 +664,10 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d connected=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected,
+			dp->msm_dp_display.link_ready);
 
 	if (dp->msm_dp_display.link_ready != dp->msm_dp_display.connected) {
 		/* wait until connect/disconnect handling is completed */
@@ -667,8 +678,9 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d connected=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->msm_dp_display.connected);
 
 	mutex_unlock(&dp->event_mutex);
 

-- 
2.50.1


