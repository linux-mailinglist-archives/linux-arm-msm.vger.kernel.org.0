Return-Path: <linux-arm-msm+bounces-64676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EEBB028BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86B815A5985
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F27B225776;
	Sat, 12 Jul 2025 00:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuGCGBLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA932219E8C
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281937; cv=none; b=rJ0Ez+7jmVrWPczKIOnEndzniaerRvY3AfYHpsJP0jBGzu2VocXve/aEvFFZ31TORfKIBnHVJ5iJW0R761ji5YeMw63zZ8FwWNLy/aboGdqhvSXw56iRVOECOZ3V0+Z3c1Sf8DXnB4HB2Y7I6hGb4ovLxVSf9txdkuR3a08nzTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281937; c=relaxed/simple;
	bh=Nilu1E/giHkwBPy/wf7h3OVA7PlAAogAgyPHnfWsq7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvebQuid4gMDFmhdgdtzOu+ChUQp3aWb6h6pu/Xfy7RXjF7sV4e/gvtbOz3Ba5slETAeNcvgobtT0NZQN+PONVpctITzFmRcOjGkVZdbJlKMjZ+5v2BFBkubka9sy8iTI5rNJoCa/kYbD6MH+lwyoCuU8LydtHrhMlI3lHK8MZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuGCGBLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BNRRef021754
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hfqgXTQcuvdD+oPZQXvpnC/A02zcRDZ028wqX5sH15Y=; b=iuGCGBLdAI+QG2tw
	lbDd6WMIWvQ/E1JxIK5MPbRReUyQSmYJjqXCz+L1EPUTgXwz6owUkbAwmPYrqhFe
	klzw9sFCc93p4IWbOrI2MO2mJG5WTjx/bgIWLwOU4b9iEIije/BBRBjseS+VxrHS
	UZhqVDQQLoVMs9W5mwLw5cgm15lz1cH2Km1q8NPCYvqT5krP8+dbCoUEkeD5xA5H
	Qw0QnplsfEa3kxcfegiutzRkv68YMSMjTfLouNIIrNG281eQ9o5hjb2lZ4l2wPbU
	Fyaiwdi1/zouVzCJfWEWqyj0k7xVuvg6AV095vmyc2NtiK7HJl8W6MrmOBeKmgDT
	kBxZ+g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311e7337f26so2663509a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281933; x=1752886733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfqgXTQcuvdD+oPZQXvpnC/A02zcRDZ028wqX5sH15Y=;
        b=BTmWgGyv3FRUSk+gUB+qjupX0Dx7nkGV3EDZAkNEQ9WbkvYzHq9mQdMdD/rcJRhWoH
         9pS4xBvqX/1FFp89Iatfm2vlJgbY+aoY1O8IosUFTbbj3cvC87uV2ScgIZ5BE4Tk8/Fq
         XbVJuQgnAuxgS3URvOCtWf3zSbS+fWjGdN1pIWkFQk0MvGPtu/uGQwcbouTKBBTnCFm5
         iR2Za3ioVk2JNoSt1ZXCGAN6UFAD24hmmjKu4Aeq5JF3+N/ayjfIzVNmjA8mR1OgdcaX
         TT7aCi/9Hjp2xV0CntBqTKtsi2FKN85sCMaljcuJzamxu2KEzUgkqKzMs/74PmR4YGzT
         lp6g==
X-Gm-Message-State: AOJu0Yync1g7Y1tFY3VJTNIYoZVXSY2aVn8ymBZo6nr5eJi3sWUMydQK
	ot9H5vHApp/1aJfngN3jG0ZfzH25kv3Ig1gts+GHlUPTRWC+dT7PLOm7KaslW6h/ZjWGzgBqx+y
	Vs00RuynZn/0sGxxe+D7GJ5hCi3UbxXvViQRSbSz6wIBwcKmvd8AxxLRZ6j0x9REdziXhaIKfXW
	AH
X-Gm-Gg: ASbGncsj2EaXpR+gGJpzO8Ns26hpmlvzJRV+dHitcx7MVp1ZB/r6ZAqyKItm8TKkWTW
	qQ+dofuw5T05/cDqtaZzjr0leohNLAsnWwI/z9ILhwLevWCny/OeS6jPFNv6B7YbhaZq0djSg99
	IRuE+DzC0G+GEhLghnSrZwyGIYR2UOLyrMQ3IhymDjM9WKAIwgkolYbkfoSkCJtDL3SRyc0SwoH
	oIw8deM9H+vk3EKnrnVQ2dhMAcEu3ZY/jUlL5VXqGLnkseoGqpDMXXaJuysGiPrXQIvkf6W35fP
	V6gNwWFBlVHRoQJ6ijBSckO/5EvhcP50MSMzLd9jY/i4NqDBR0hMbYf4SRtuxKb6Jac6fU9uDeP
	Bn1o7PbxguGipNls3wCRgadaR
X-Received: by 2002:a17:90b:2708:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-31c4ccc0e50mr6907463a91.10.1752281933209;
        Fri, 11 Jul 2025 17:58:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7/uPvxLktYrM8ch7LnXCoHhYeFgjupJmhBcRiyeOoV5Mh4IxsfUoFBcoS1rpfP/X9mTjmzg==
X-Received: by 2002:a17:90b:2708:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-31c4ccc0e50mr6907436a91.10.1752281932809;
        Fri, 11 Jul 2025 17:58:52 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:52 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:22 -0700
Subject: [PATCH 17/19] drm/msm/dp: Use drm_bridge_hpd_notify()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-17-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2506;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=Nilu1E/giHkwBPy/wf7h3OVA7PlAAogAgyPHnfWsq7A=;
 b=zjvhshEsuNvdL2MGy3+vIib7IJ+dS8vv6SU9gQtMA5rPdCA/RooUYT8P7do31i9ZOTW/XcJkd
 FezTzROw+JHCyUc0ytOAv+OniLISzTxmQR4B7pMZtbqSrFb4edr0pQ1
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b34e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vUZxlgmVQAOzQBO0PGoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX/Zz3xYQDK72S
 pL3lG0XrcSlVH605hzH0M5cuWE3o+0CiM+qA/TAZw48KT5k5uJEykJgudzya27gcgYrL4CZ9vGM
 uWZ6aH6E62Avw0e4HOvKWHskdl+o6x9lzEcxU2cRMIpfdAwdEoDrTbZq5N19j3bzCDpufAxH3s+
 A5C7YPb94TMjX8u3eT5LouwYC0oVgDhCmQYpvRyqzsbl7EdyX+gokjX7mPvNyqIYLpxtjKGruAX
 KDrqTDesR3OvwBkTuvdPx52rd+jv8k3buOT6E0ynHOycwbo1c6rnnuOR+wjJm0LV5JeJIjsPFDm
 lpAmjklc+uuo8uu2/Zmn/7/kRSWRrfS0lKHhqCKrSMTEjCh/7xxBTn4J8UwOPBS7tRWQYZ4EZb1
 wylM3xjsi6+oZNXnbqVbGdUgI7kXZYKjhY0F0PV61pSZVYuk19JVFs8x3Rphi5g6vu5vrVlT
X-Proofpoint-GUID: 7AsnIed70nA93n3MT2_lihDaatVLTFnE
X-Proofpoint-ORIG-GUID: 7AsnIed70nA93n3MT2_lihDaatVLTFnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

Call drm_bridge_hpd_notify() instead of drm_helper_hpd_irq_event(). This
way, we can directly call hpd_notify() via the bridge connector.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3aaa603da4f9..87f2750a99ca 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -324,17 +324,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -358,7 +347,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	if (hpd)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, connector_status_connected);
+	else
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, connector_status_disconnected);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 68bd8be19463..6e12694d5a64 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool connected;
 	bool link_ready;
 	bool audio_enabled;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f222d7ccaa88..b12a43499c54 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -358,6 +358,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.50.1


