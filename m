Return-Path: <linux-arm-msm+bounces-64662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCCBB028A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 02:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9696016DA48
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 00:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA5715853B;
	Sat, 12 Jul 2025 00:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+9h6yKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63AE15573F
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281916; cv=none; b=fbmHYFI914guw6cNrA9YJFLxsjb3DQFg+5pADIua6IS57dqY59RuQso0UmtfVM8iMQbPZKe3U/41VaAxxDau3VRJBB6oHmZzrYhVDpSj2QJ/Ad32D31Puia0cWX0m8dsjJcQUqvrfHy5WCCgV6n+Nhgs1gsFNbxLXR/SqRfKwjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281916; c=relaxed/simple;
	bh=yTgqnB2dprf/Nj1ZzdiqTo9frUxLDJhIMuoIkqdGswI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgnFtYia60Xv4GzXLSR1imynzGBTjoQfCNQiKblgJDiM6YiWaFmQzrRTtMDjSZrVTllS6gWHLM3jhzSwICo/4mUVhZNsWdOVmLi8QvqRwKQzN/QwLtmOwCqKfhua+zAAcu0KsCgICrtwn9wNMV3VWTMrDB/XpDzqXscyk6mXDJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+9h6yKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMojIK018184
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mAPtKDSfIXrr3Q2q4T60fVOj5r9JaUUy2rjzWEDKfE=; b=P+9h6yKf/+JnoHlp
	SeY/HCdrAxxKpGLQjBnlR/RLS5NAtE5+kJ2y/7JdFzZpukzlzip6ILmczpwcYLBY
	suQLGyP5qIp9aWYhn25yI3tf4afl9Dg91qim/ubJmCIlXKF4fliiYWcm5OphpL4D
	B6FVkMGPcDTveXG7Z/llJvkZ+u41qKFwWiGrEeYwi0MInTn1IKXfQWRc+f8RVVig
	AufKV72pW7RgZYO2uSnbnjyjA8zLHldwk6lTlv+3cgM59+LQxTzREAL6oQKWYwS/
	Pde7TQrN3p9z9NFMD70ip/9Dl9252QFD696tJfwh+O16D2XtkH6jOIlidjrpdjzj
	uyDXdw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf345wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3184712fd8so2049681a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281912; x=1752886712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mAPtKDSfIXrr3Q2q4T60fVOj5r9JaUUy2rjzWEDKfE=;
        b=g2NIq3LQ1jcpBPRi6IzFho5cFBIHZTXbTDvDANjgSixgj0RYeMPzF5gytDJSMDqXIG
         8YHFJ/LFKVIQ70DdBnYriwDEDjDvpnpNE5dtMZJ8YKRo9MhZE09beshut2MZm+m7iHCq
         zAChDo0ltnOGc7Rbno5G8CW3A8YBIMp/xcSnRw+LUG2Kx2EGhwx9TFsUL5wWmI7GHTDv
         Q9vybbDtZ5Tiz3LddFbODRjMvF3+UC8OvTCH0lKFS+NBOx+n4B98VbgIwD28W9fjFG2X
         Hw/IhcvGZ8VzbWADdPLlFRZhOAfAt/tCLOBM7Wa7yoZaVoZCKrWQ1ElpukAdPig/r/CI
         bcSA==
X-Gm-Message-State: AOJu0Yy1GMYv9AbmmJgkSkNLQRO3A2OuKtB+UrysKu3faupvbkuFHKIK
	8fzhbd8Ax/xYhcHwebjf6Lw0w/5YJY1LZ7AuO6BauiybsCgTGr0tkLjmCyHRuqB7pNBdAK4pA0e
	RQ3PQrHVE8QS7ulNKgt+p35Dr4zLFSDDf6Bey0LhOLmt0qTjlFAGB/I/PV6Tk7fAXYuVY/KQcgx
	IK
X-Gm-Gg: ASbGncu9nGsa+7RCBRRHAPYSptVfB6SgVkj+bu9m1ZB9G1GWSwHD/FqvhxpE8jSuqbp
	iE/D4WUY1a1aKOd1TIP5NaMs+xXSaqrkKy56UwurEQwYQZ6k2fiQ7FrWWOF1St+fEKnx2BdpGT/
	DQuK6n8inaswugaarVNQQ9rcW4SFB1hGsr5FKe+Unj0kZ8GvIJCEtLu8XCoVaSbbDS2/1pxhRz5
	HvLF03dxS+qV4h/FZcCJNEi0XCBZZqycBOMoAVCx9e5605InG6QG4Zg3kc12gsrqIcpdOb3a4rU
	2gU6nBzsbLh7S5ivqZJlZLWe2z6dcMt2CN2Vc8J4RzE07PSTtqjU2wZskN2zV8bjQbr2lpSkb/o
	+N8mGaHPuwoep2/Np3qjvrqZ0
X-Received: by 2002:a17:90b:5404:b0:313:5d2f:54f8 with SMTP id 98e67ed59e1d1-31c4cd148b2mr7794408a91.33.1752281911658;
        Fri, 11 Jul 2025 17:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq4f4FD1KyBoQ3RY2kpDLTIO0B98CWBMG6U/eFOvveZwt51uaf+y550/LpdWY6uMhEFIxlSw==
X-Received: by 2002:a17:90b:5404:b0:313:5d2f:54f8 with SMTP id 98e67ed59e1d1-31c4cd148b2mr7794374a91.33.1752281911279;
        Fri, 11 Jul 2025 17:58:31 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:30 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:08 -0700
Subject: [PATCH 03/19] drm/msm/dp: Return early from atomic_enable() if
 cable is not connected
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-3-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1248;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=yTgqnB2dprf/Nj1ZzdiqTo9frUxLDJhIMuoIkqdGswI=;
 b=yjOQEw8i14tfTRd06tsg94/QUzhqjZkPogQvCBkFcs9cMN7ePscuKKGEamrhgXNfxOaO1Hkxl
 z+N10idpSCiD1fACySqT60gko49fsibuORGnQlrCHdURey5hsdsSXbA
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX6UkcXfjIFj00
 PyJ4/IzUahMLNBoyhOc00hcE8j8q4kopbAehqutRdYnckoIAjnFO3EyJ7LK5zg8JGlKowY5c1Id
 U6KerR9XegTP5aPfD7DJECmadWGxYUI0cyI8ekwcn6lhDbVjhdHOJ3N4CzGs7eSJmPHP2pEAFVt
 QvAK5vzI1AsRC5/KKapZIUFrY6jkSqzmxLiHwO0T99YBSdM+mWj6oFuC9GT2udSn0PRnptBcAiv
 A0Wu7w5B6sDBTzsNtiaP564Az4MMzNKIqTWUmlZCmabbREo9WZE9HWkqDPNsgYU0lSkDVcLATsb
 Q29Pv5AwWfroSZR8VvGUS+k4g4qKmYNpSAHljELnOVYjYtUnLF9uqtrLDJIBqYDXq1KZf5vM5Cp
 +PqvkZRjCgoAqZdLf7lRa/mxnOVsNcQgxLav2J/AOC2vUJW9az0FJbahXlaTklzeZWzhU0uc
X-Proofpoint-GUID: 0pIbagdN0Ojy2vml6ftQ4DW0e4bqMzCS
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6871b338 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ONubTFmf6e6OPp213KoA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 0pIbagdN0Ojy2vml6ftQ4DW0e4bqMzCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

Replace the ST_MAINLINK_READY check here with a check for if the cable
is not connected.

Since atomic_check() fails if the link isn't ready, we technically don't
need a check against ST_MAINLINK_READY. The hpd_state should also never
really hit ST_DISPLAY_OFF since atomic_enable() shouldn't be called
twice in a row without an atomic_enable() in between.

That being said, it is possible for the cable to be disconnected after
atomic_check() but before atomic_enable(). So let's change this check to
guard against msm_dp::connected instead.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1072b5fc00ae..fe38ea868eda 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1606,7 +1606,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
+	if (!dp->connected) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}

-- 
2.50.1


