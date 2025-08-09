Return-Path: <linux-arm-msm+bounces-68147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E4B1F1A8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E75174333
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A8A264618;
	Sat,  9 Aug 2025 00:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J71t2Ve+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033A425D558
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699755; cv=none; b=e8MqXrW30uiULl9FQV2TGaR0fMbO6e3gADVa8wHvGn4T0QTnDQnB4Sg84RDlbyk2cZJmhWyQHPxPbb7EERMGlGBwgRjeaLAf6/0VkUV1GKeFbGArqLnP62QDnBRWg5WD0Rp1trQTCecdjFEosXU3bi86TP5S3Ner0JPIF/isJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699755; c=relaxed/simple;
	bh=JQn53FWdqnsenAxhsXtXftYUURqXJ8dtPT1Q4jRdnDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzHXx/bCkBSmoJhK26Muk4PZEBI5Qqui6duJqnjPj5vu1t+Ddd0LGaWbo7WnY4JJIA8+a29gt8tncZbuRJZhVeBb1Zc0Aj0GxwIW1319XX8v7K8czd51Hc5s72WE1qmlP7r/+x0Zs94dHwqWL10k5BOGmu53RSwbes9KME/HpuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J71t2Ve+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578ExSU9020381
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lygnt7Zi/DkDBsXWW/2tMmsIMiJD5/QBa7Q1HdwAysI=; b=J71t2Ve+xg0D+Yw9
	+Bs7s5zBjwvaNfF4eswxmyQNq3gopOMpfOaSBAuX18u+UZWwuOjMDeA8NdXkuT3U
	pL0GlnI3zDkMj5Ed29gs8AVaZmkWi+U4xRlkqQ9tCLg7Hycp35tK4YoUy2r/jD6V
	58BUZg+J1kDC0phV6l0tc2sjmlbiTBoW+U8eYgGlhzMlBXhFOJReMaNVhrH7lBgB
	vH3duJW74/OYT9x9KpUIrWsjfApUBuBx3YLaHJHOTbrQL0dd3J3f1ynLJG5wyqTP
	1piGel42/S7+ka33rRiD3jyVCLICRqCx+6JAFsYbZ6hSdltQx8FX+Xzld5+LxfLp
	Vy5/YA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8kjhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4274f5e065so2452710a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699752; x=1755304552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lygnt7Zi/DkDBsXWW/2tMmsIMiJD5/QBa7Q1HdwAysI=;
        b=FBYcRhtyaEYylHvRD9/4SIrWC6KrAcETjvXvCXa5nH0EmWCBM7XdkbfpD/fbjPZq3U
         VyU3MdSw4EORu6nfPLYvrLMPllWuOCWZUaWKlVMVi1iP1BayMVLjW1MNBMGP9zYFxGsF
         rSR2qcbJTm59nm/l5TRxt9gz0OpnrkoSv5dJT8I8dsK5RJAGjf/w4TZASvioA9SYyvaQ
         bSC5ajiWqRLxHqnjORUkeAKz6feNtnPUfp5dS09Y0L1tMO5Ut2ObU+/FmkH+p4KpBtcQ
         P9gUTg9qoR3Lzov5s32Nv0Fj0j3GIGFuPD01EfhSXUIZNDt4Gijxo+Yxxc94tHwaG2VI
         VltA==
X-Gm-Message-State: AOJu0YyuswphUNtG/5HGDWBs3zsHeZfcfMNCbr+vTYxSRIHGZ1kUYaUQ
	DOzX7uV3VHIBUZoyBgVS3uYgZnZSOLxoUOf5UNSSUejDd23lbo30OtUOsCI4tQ+lhFjYhj4UKZy
	5pXvOV6fz0ZGlLKm9kT9/3wpPheW2RFSEwfOJbnTErUntOCltVyTyleeCX24SZvmZ9D/ADux7uE
	Iw
X-Gm-Gg: ASbGnct3xmcWXYntbYEmH+w0d0RrzBYKEapgfiVfFjW9DoRrQ6JKpEPjhH1LkWkhunv
	pR4qrfCzG3bs4TCzVlWxtwd9cphLHd/2yLBeUGpbNDW4Bqt4C1MkTowDL9iOy65Tn80/cBFvT+G
	zqjDaZexws6ABvJ7EoC83qca4fKuJjwviOmTQ4vPVGiAFw576u5vqas9hfsTC6tpPUKblEmUUXl
	qxcPkJ8WY+caCa2Hu11fV6i1coUKIKTbKgt1Qd+6PCk3hFVgPgwSYH7gnCaddfdCSRUrAK0mzFT
	S6ku7CjgpLrVeUYFs3K82DCINcosMnn0WP+wD/U0uKR1ALZ2qwFZKfohxRv8c6wSblnvrCR2X9t
	Ozqld5T8O9p/FP7nYm1KyZlVu
X-Received: by 2002:a17:902:e550:b0:240:bf61:fee3 with SMTP id d9443c01a7336-242c225701dmr76135415ad.44.1754699752008;
        Fri, 08 Aug 2025 17:35:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE33DCMAedQDUiF2/I3ZWb+fz5inLjDwdHMAuwQmrl6+a26bmnVEJtkyEOMMqC99p7LJwIB1g==
X-Received: by 2002:a17:902:e550:b0:240:bf61:fee3 with SMTP id d9443c01a7336-242c225701dmr76135015ad.44.1754699751568;
        Fri, 08 Aug 2025 17:35:51 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:51 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:24 -0700
Subject: [PATCH v2 12/12] drm/msm/dp: Add sink_count and link_ready to
 debug logs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-12-7f4e1e741aa3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=3874;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=JQn53FWdqnsenAxhsXtXftYUURqXJ8dtPT1Q4jRdnDU=;
 b=UfAJZEmii2W1xg/n7I3OixqLYvkqxFi5dqufHjpIdry9W5CQqZsyJUliQA/+ckK85WtgecgCZ
 CVY9K6KZqniDV8ngdPtL9w803gnE4hUnfeNcWL8TSsh2p37Dk/WXnlm
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: z2cBHW_hs74qjy5s-Tqnq0eGi4o4ZY3k
X-Proofpoint-ORIG-GUID: z2cBHW_hs74qjy5s-Tqnq0eGi4o4ZY3k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX7yXPnlXXuhX7
 VQPVQzknaehlgjUzYEHSX/Yd/lvjHK5r7oi0RLjOBofcPb6nYX8qtaS6o7//CIOo12+wYZsNnT1
 xX0DjilyB7+sTcg4XLAl1xECcegNPAEhUOjodo2HTsmult8sSukwvYvMb1tAtdwSW3HN4go+3m7
 TVPeOB54ZWQCEilz0cFVKLlVcgoUAr74tTneq3yuRmOjxzmPnBWNlhnp8jjQhQFHkqfNv5sBReW
 frHZDKWONUAkFmjMo6iZtKywbqn0V1LYjLnj9GL1ZEX59t9OGo/Uvxiw9n4vMOLTiP+HvEPGM6R
 9djWDfuJqP1r8UmHNoOfZpOl69zBuiBk90/RufrWUx1U7AI5N7JMSzXy9qYz/+nSYLE6tBfqKxk
 50dqJFfI
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689697e9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nsv5_4zRg9i3qj8PKKQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Add sink count and link_ready to the debug logs for [un]plug and HPD IRQ
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dd529942f7db..93ea623473f4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -455,8 +455,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	if (dp->msm_dp_display.link_ready)
 		return 0;
@@ -473,8 +475,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -500,8 +504,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	if (!dp->msm_dp_display.link_ready)
 		return 0;
@@ -528,8 +534,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -539,13 +547,17 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 {
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	return 0;
 }
@@ -1540,7 +1552,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "type=%d link connected=0x%x, link_ready=%d, status=%d\n",
+	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, link_ready=%d, status=%d\n",
 		   msm_dp_display->connector_type, hpd_link_status,
 		   msm_dp_display->link_ready, status);
 

-- 
2.50.1


