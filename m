Return-Path: <linux-arm-msm+bounces-68142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DDB1F19E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6882A1AA7BDC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC82242907;
	Sat,  9 Aug 2025 00:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+SL+fuf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567842405E4
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699747; cv=none; b=GzkHgLsH7pfnI4ppi31Mf9F+rogt1nzgHY/q4q1xX6keHZwzfve0de9pBqB1h0m46YXoDqGJAdNI2xz3bON3/cpJLiW0HLYb0zv1lyk4nJetny6YM2MneIRw8qBAL07xySZomu6MrLzqw07BMZcWKHhkiqPU9KLpvsrSKr1cp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699747; c=relaxed/simple;
	bh=29HYP/DXnl5EwK/8eh4LDOHT+urC513pYg2fM9mWL2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mknXbJe1DLuKhgRWTS06tAF8qSeTiKND7yDG3A49E/vg443PqXQ3PHAP1Ur+ZkN4Ysbq1MCZHYh3Yc8QBdJNwErQxK/8Bow7kuz1qrtLx3cla78JPM1l4DOcF4hfT4jN94S5m4Gy8bbB2gaAPm4M06jz8CboS6IyQr0cDOnVMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+SL+fuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578Dw9tV011818
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hdCfTP1N1Lll13RFi4QL7o8c/WBGzlCEwL+AMYyzJM=; b=E+SL+fufl61vfuki
	fbXAWnPJNTGbn1TtP32D96aGYWG66TAvIz1ls1heHdVLJhJ6l1leMvSqBGe7l/2u
	+ANgQoqNvvFNAsy0Pm3lHdb1UBsy4Sf8h+R24sF5VbNtQDlw67ZGZdu1QmidD3br
	vjWQ0N+H61kkPE3tThVmZ21ddln1VstzvLQaExVJJOMup4G3nNywTVOiNL8Uq2tP
	bx3R91/G4Z6/9474W9SLawl5Hvyw0WSeN/OdQh01jJUTJLb0NbKZ8Kkj7ZCBroa1
	MWVjTlBzNLeU5a/UW71dGOw6Ib/RR0lozSXh2m4Xg286s2pWr4qx/Lwkr5LOPpuh
	5DGmKA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy69d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b42aeac2d75so1103968a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699744; x=1755304544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hdCfTP1N1Lll13RFi4QL7o8c/WBGzlCEwL+AMYyzJM=;
        b=VL4l1m8ms2qq2GG43Cy/t8h+UX2paIVmywudCkVaBTLW4JGxyZ5eVM1ZrifJ4ft4AJ
         mFKMkoOBH6ids6mHnO2lCczdBt3f0+AGWNVWeQe2i2mK9Oed7skhnr4I53HfIGlc2tz9
         6o0qgK4vDwzsH2BlEqcinfw6LYWhh2zqgbQo7Hp15HMhicZi0iEms/uSCWcOb70XrqIG
         FgZ27dhmzKyZ5DI6zd5RcN6W1VCQu3jEPyd8RHalppLsC9OapMHXxsuov1cUt9vMuMSn
         +FsZuWp764MOQhs9B+puRik6qwNCE/oAVpuLgkBcGOTP3JQ6aQrJX0IqcCat8skkTIil
         dYJQ==
X-Gm-Message-State: AOJu0Yw48sx54hQeYv1OXdRS/QAONwGLRAbU5Ueb8P67l/KLV1rS0M1H
	Qe/vRjuWyV/cCWVUsbyHoLdT7GWaELfHZpjHig7vN+iVDByRdbOEC9KYWaNtHt5KiyP+ePvvjDw
	gFYfeu+As0OU93q6kus42fsXsAuifDNtvjnu+qiw1RUzLzezM/F9FocH4C2YWJoZjyEm/3a5w0S
	UJ
X-Gm-Gg: ASbGncvErnFrJG5+Ga0GeEAU3113mkqR3wDn1arf8hhJD2ML4hXX3yOp7g+F621cfvX
	mWlnl8LH9+5+7DGvWqSHVYWx6N2bcWPnlIzUEcYSQ/+Tley0ya3xlRh8gg5gOWMj1ledHiddhuX
	7TqMCJoheVj2LB69K5HEZucoYbB7EiIvcq27Mrc2ehZs6s4gdAQRFo3ovdhAoRD8XsdMi9zheW1
	qstr7AiEQr2qi4whdZedVqM3qmxhSkqe/O/H8MlVr51sJRKtBo4xuOJpobz1g4/kMmjy6wp52BZ
	MA4qOpJ7A/j2bTV801ZfurGOHLyiRAGjnaidXuPQDylpIfjQyUE7umihltX+C0vlpWiTBYi2QCp
	hyCAZ7bYzgg7Dm+LdVvZIHzB3
X-Received: by 2002:a17:903:1c9:b0:240:e9d:6c54 with SMTP id d9443c01a7336-242c2271e8dmr79853075ad.48.1754699744046;
        Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiff/ThYc6UuyZtbEXTBnN49IuMPgSQgl9gfWHA+0K+TeLvuc4b9uNZ9TWhJt8aKuTgT0LiQ==
X-Received: by 2002:a17:903:1c9:b0:240:e9d:6c54 with SMTP id d9443c01a7336-242c2271e8dmr79852665ad.48.1754699743574;
        Fri, 08 Aug 2025 17:35:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:18 -0700
Subject: [PATCH v2 06/12] drm/msm/dp: Use drm_bridge_hpd_notify()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-6-7f4e1e741aa3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2470;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=29HYP/DXnl5EwK/8eh4LDOHT+urC513pYg2fM9mWL2U=;
 b=hUDrHjRGa0KSwFA/brYTaqQ3aB1uEyojqFJUPg/WEOdZZ0zMPAQBmtvg12Q6ggaRIFRwqN2hA
 NgI6QAvH7kCA9iTY0rUfx519/9SnrO0gy/ydRL5EGu4CCUm7Fs+e6Ka
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=689697e1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vUZxlgmVQAOzQBO0PGoA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: RarILTxFmf1Vn_xPI9svp778q_ebTuuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX5Z4vHNi4wHYR
 wsEFxfefoS3sSfjUTx0DhYX6k+aCYZSfMeW0BfhRHa3mdLre4BdmY9ZolP4b0QwaLyKszLWDz/y
 8d6k9+qMfv239W/gPM3LCGG8ZQlK1Fopgk6W7D5fce88+SQUjlOkBWowxZbX5/J8+aqjqsJ0qVL
 BviS7f5UDGFRYzi7R8CKC4A0wTharnq4iT/CFm6+NtTZVHDbb6Mh3QO6/b6h93ep2+zQ6jcWHBX
 VHVkU7PUjOjfnmRDtOJBSVdMIbHkrV2mmrVxCjKImecdNDVxocE4Y3bFlntu0IRQDcOp69K51a0
 h4L/Vgiv7ATG5yqUqgw7Dn6Yebo1vNzKb+ANRK4F7aYba5LYXa3yyOrKuOQFtGqHIFfdzEif/Uw
 TWeXIuJ1
X-Proofpoint-ORIG-GUID: RarILTxFmf1Vn_xPI9svp778q_ebTuuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046

Call drm_bridge_hpd_notify() instead of drm_helper_hpd_irq_event(). This
way, we can directly call hpd_notify() via the bridge connector.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 55fe8c95657e..8779bcd1b27c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -333,17 +333,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
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
@@ -367,7 +356,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e4622c85fb66..f935093c4df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.50.1


