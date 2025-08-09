Return-Path: <linux-arm-msm+bounces-68140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22599B1F19A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3A0A7AF9D6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEE323C4F5;
	Sat,  9 Aug 2025 00:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INIUqQF4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1469623A9AA
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699744; cv=none; b=fPY8VGEmi7Md5gPkLeR8oz+EbRiTrC/KVcgX/0tNga/9/JdB/CXlGF+CE4kL8jCojRW6SNwJkcpU9QgRqZWF5IbbX+6heQnLP95V5V0Qj6cA8zw+Kuje3CJmsU7tsLa++QG/k51L14ppzz8/u/QLX/663kfwvqX4bkmT/G1VBVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699744; c=relaxed/simple;
	bh=58pz+VUOHj7Z0Ly24ZItrTkzzLlWR66ogd2xqPyF3A4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5Jq0E+Q6A6Af3ZGX1GPLeTKmw9PrNUkNipBpvtJbR3EUbvb8bl+TxQSJxatlroIXolEu9iAIEHoTucuKZRonAkIU7tLO9dIbEL69ZxXfPaFkb/TccRsuDywKBI3Dq4uFe9oHFgaxHMEvTJus8aDd9wtdXKIn2kz1QiTIwIIX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INIUqQF4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EuA3J011907
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXOtZj4AG8lm5vvINjpaTa4etK/yY7fA6vbU8dIkBcE=; b=INIUqQF4UXhK3SDP
	GO1CXtEMfLZ+Ne58RgutuB9EckctL1e9qnrhGKCqqnTNNunahUGEjjvCEuRURzWR
	gVPhekfA40jZs6PX6nkJNTpTorueSx0BWIYuTJwwRXhdqP7zR57B3QfhOU7TcN9Y
	M6g6R6S95OHvlY4j4RY0sFV4etKUxiDfXDr/l+s365Qy8qd0dmyreD8APc1GOF4u
	M+Nx/MmzHKpLBTtAvGqwMGT9u9v+cGYi5tj+QnavJV5il+q9Qr66bvU/vVKgcFz6
	6vL5a5/xWBI2nd0hUBleR+gErZrtOP3AqwJAO55O3frzCq6dBS/F2skGLR9Cr/Mw
	J1q1Cw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy69ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23ff7d61fb7so31328035ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699741; x=1755304541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXOtZj4AG8lm5vvINjpaTa4etK/yY7fA6vbU8dIkBcE=;
        b=vZ2EPNaWqJAzr6ezmo9GbrSR/3noKjH0zrM3DM3UJH+iKvX3Hf2EWy0wE+y0zFwm/v
         JH0fdzoCQFwyWrZNrbGArm6ssLtkAvn61PXbiVnq8jCK6qDqdrC2KldwZ4L6sWrdoneG
         mPisC7Zj4vVmq50ItrgcsrpmqtPIOUv46i0cMDca86Oh4s/wMYEK7kHC9WoyuFgeO+up
         F5YdDAiEMfsfHTvyjOWE3B8EIPwIbCi49aD+HPcsLzYD3xjtwL3VkgsMCEKTMj+kQ3Xj
         G/E+kZkR2RxwQNUnLyPc66QE+OZfxaUNDNIsXxZntr8NQ30T16Md5D6Ek/ETWsqn7W9X
         U2Ig==
X-Gm-Message-State: AOJu0YzpeUlwwZU5EN4RkWJaP5XGvYK/HxQKPAeteYTMcNv3TaQQYdOo
	O5p0QbEOt71RibxOhBHPDJBAXwosKNz+WOt4AByhSFXco2PEmh7/0Daaq5dOPEHwxknzM42UCNT
	Aav6aMC8k7kQSwXfDewjQ+pydV6EHmGFJLs8fX8+SWLUbHOIqmQrlw5mtkXpaEGJ1eMjTQU8aVa
	VE
X-Gm-Gg: ASbGncv3zeipVy9oHnNszgKV/gHhvkKMPrhkm/CAFQgEObjGUpwgVfpGckYBPviTe07
	4gSXuzPxnjxFrxw+SgBUS9wDwpZAPCn2AwxAJwzOBPM6tiDUGWTTTsqi3Q/T4K/bjeQcA3FvadO
	arTdkVcLunsflcoIAZetEknIXRNI/dyc/s+yWFfaIl2O41NiYxOoHUvp1RW3YL4aqWyowe4Uw8S
	uJC32gzB9LGTHdLABgg3qdULbsbnxQj7gB9Miglp9R1ZkezA3ZrL7ZjKFHFIpttKETavWsI4/PW
	7LYLRVI5z0OelK11/cNmR6V7FMRzQwjm1qHFnKBMTMZKWV/AjVArgvdL8XrjhliIOOXtA+P2k1c
	WsqISB2UayQPtLcoUnhzhvxAa
X-Received: by 2002:a17:903:3d06:b0:23f:b00a:d4c with SMTP id d9443c01a7336-242c29cdd3amr60381395ad.2.1754699741443;
        Fri, 08 Aug 2025 17:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDyEuI8cudsyGtLHsEqiFHexgdl0zgq5jG1/dngt6evbM2Zkgpc/LBc1GnzKw2QMS85nXS1A==
X-Received: by 2002:a17:903:3d06:b0:23f:b00a:d4c with SMTP id d9443c01a7336-242c29cdd3amr60381135ad.2.1754699741056;
        Fri, 08 Aug 2025 17:35:41 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:40 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:16 -0700
Subject: [PATCH v2 04/12] drm/msm/dp: Move link training to atomic_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2088;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=58pz+VUOHj7Z0Ly24ZItrTkzzLlWR66ogd2xqPyF3A4=;
 b=eSNm82PX5XDbPsqU0qhNfwtEkv99SM1nnMQfbj8CUV4Yiqt32zqfug2mQbHMfdphj2pXeeZq+
 a5+8ZGyjM2+Atpl7P0zmlxH63kdl24dOubtns2aknTDjXqXQGWkE6tQ
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=689697de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3k-UeYenDjfnnxpotcMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QTGCcqDPCTfR1QWWTzSX3c3CSMsZrrKJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfXzrJEpVrJTty+
 ia4Oj1Jtzd+Yf8iwW+4NoF6fBSZJZ7elVg7vutJ3gpcC+FairNhDKZJlIQRVKS1gzDLeFdcldQ/
 QS2EkQMmSFS7XIv4p57rIu2UfWm0SnDoRTgW0GYSmC/RnnaJoeNZbk87JaPZPYDmB/j7a9CNY/h
 zK4FvPsuNK/aVwG+BkCKn7CTNRsQ9+TQAKE2IS3M7uw0uaaMB3qoR+gp47BLrGVbpj6UHvayjyc
 H13Rhp78u/kv7DNS6Q7+VgVhjgMshV0asaRXMXBrVpHXMTWlYCgCGgEtmyFcQu55+thxOiGv8wi
 PZ9AQNRbEKrC+dI5shVdYHcryi8MN8Bpp6z84/ix4KR1Tk+Ks4dUMUDoL+6D67vMcF1nYy0VQ3v
 JD9ijG1y
X-Proofpoint-ORIG-GUID: QTGCcqDPCTfR1QWWTzSX3c3CSMsZrrKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e2556de99894..c849befe58f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -427,11 +427,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
+	}
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);
@@ -1839,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_hpd_plug_handle(dp, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_hpd_unplug_handle(dp, 0);
 }

-- 
2.50.1


