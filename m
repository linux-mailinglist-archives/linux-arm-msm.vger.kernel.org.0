Return-Path: <linux-arm-msm+bounces-89148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE7AD22DC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66C0D30A1DBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A11F33A9ED;
	Thu, 15 Jan 2026 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVvtuNe7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuxWYiId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF4B33A716
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462172; cv=none; b=GftpXWO0BGFqRXGchaH6jVosIvGYFdAh3VGg3bvhH+6bcZA8+PW1x/TvtJCSPQGQy1TKQw23D83n5y5IC4OWfFnJ2UaVU2Hq1DW8rBGTkfCwqb/JIm4DY3mYz76szPdZEp/6h43ua1abVDjmGas0fyDDA/CKvFjzsKTlvOaI8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462172; c=relaxed/simple;
	bh=Uj6SkCD9WpEPo0n4wYd5ftFA1pIpk0IwLQYdPPl0+uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUthhFpEdryXVSToJhnhNoJUYlVjvTek9QAC7PUyoTS0KPkMEldr68KMwYdR1PCYEjO9Ju68IRZnsoi0bntp/NHldxn6K5Dt07zPYJZOaDUspEX/FFiTF8H/dvNqKUkc2U1WINorSS/VksqFFXDOcLqkqwrC5GvoJAjHrU4+RPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVvtuNe7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuxWYiId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fggr1744864
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYMdlqKEaCVNYnY2T+ZZKkA05y51oThEIgGnkyPnO68=; b=WVvtuNe7E9bu2Dua
	2UmXq88zKk3Hzw2jC0iWHbfF4zvt3AEk8uG1gRf/k/7at2NKJTY1MJr+byr7INNk
	JRwNliwjmEc3ta0wUqWoeb/JzBH2R+pIj1Xz30R8CM1Of2zkiF6dZ+YmdEgovxrt
	afOal9dTBe6XibUOLT3mLtizeSSOX8AvGAhptWsb00K1/uA+oDL3sKXpfX4l//vy
	HZ5LIFJ1i8iNx8ArUrcD1ODIMAw0ulEt3Ewsq1AXkupiFOvP/RdpFYAfrzQmeBiq
	FasxJTauqOJzRG7o1isU4PIU34cRoKNhZZoBVI8bcUpUgO0X2xvzDBxvZYWWcybq
	F6PGGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2g6be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9fa6f808cso183512785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462169; x=1769066969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYMdlqKEaCVNYnY2T+ZZKkA05y51oThEIgGnkyPnO68=;
        b=NuxWYiIdAnIpMywZHzP4AmE45NVHkAZ+h9nJPDSfxGAB5JQcct/rBHmcnr2Blw8kwz
         nFbyQfeZjwaASznA3fb0RBd88HEpsVNYC/ebVn02Odtc9SUxHrdOnad+cdneLC1MC4Q5
         iKZOELhzRkMu9VYeX1bBNUrlhKac6Ybh/MSj+3ARV1nDrCB/SmmAv14vNdaJLeC9w1NL
         Iz9bnQ4NI+zvZo56Rc/dw9mHLyqGB4ErgVJsE7dMdNushVBhC6HSFCHbpZoCoB0ADjMZ
         1TKtcdA8B5Q7q9pMRlCWpMmfisPIKPftX0Vu29JFf0/dzkcn+wtpXtRtuNKY49yiYfOy
         gqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462169; x=1769066969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYMdlqKEaCVNYnY2T+ZZKkA05y51oThEIgGnkyPnO68=;
        b=sv6eKFfSaB4Fj2le9Zd8Fxl2QSALMpEgUB4paCQAWDH5LRGPG47H6Vz5jlcbq1QAOz
         zJJim89Z3nKOskxKxfltJ/uI2yCex3UI1e2NyyJPBDP5lRFXZyGMlIE2cLDeNyNi/OfQ
         uTkUgzMPCuXvFJDIZHOZrCb441cWC5G+w5Cc/CrqaB81q+3S/zDfdj/hDIvP8QJm119V
         hQQJFP6EPS+KqxKzAXR/bhq2L+P0i1WIX+G74JNnYEl1u5Ije8VHd0alMx9m4dGi5XHo
         uVxNgNtktA00SFjZCHXA1SeeX6XZl20JT7Mg0BUglI6E2w5hAGwSnaN+ycuvt8LEe5Oe
         oBOg==
X-Gm-Message-State: AOJu0YxBjJLtRR8PPlXuMsQbxooMq30reD1PjKYP4XJZO+p+RQutK0Ne
	hoNjANcec79CjTEDQuUs/Dv3t5n9YjBoyhYfg/JdjBxII2YCmwOwcXkEFp7BX0JccaKXRMyCCRo
	qOfE1/MMSidVknKTjQIHG7TnCGkElZikmXrs+osNg0xtymuo0Xqs/EA0NPwJgM60dhxOw
X-Gm-Gg: AY/fxX7U5Ur1ddfEjgF/j2HEWavWSk/avjVBOjRP0NJHSAoMAARKRGXSNFTRmSYyjVr
	5LSNWgTTTH0J977YFAYpk26M15Wk6khS+4uhOJoosLa8iwa6/rxp9pg71F2poww4/ZDVsXWs2uO
	lvlaDZX2GVJVbagEEmo2LAuz2vMPRraPNS8ilLD70nPokzFgLWMfRhhlmvhW7oJu47IZgx2URjy
	QC/b8kplQWtzz1l19SLgIzZLNHYg4KqEHtepOF47ECOZhWQggUQPJm+ee15QNKrQgGO99Hj5yWF
	tBKG1ICrN0jCiPIu9YAKPxX4HJkVT4p4vsd9K6jaUaJcXADG/aBbNF1ZA61frOcJuYx6xQs5BHC
	pSDED9jfMD/EwCE5TSeH0SsxNwVBcEKONmQOfPNQLpCOz3vbEsQR1Szw6MIEo22sSamJvu75Yaz
	UY/z1G3y2l05547zsP0GhdtoM=
X-Received: by 2002:a05:620a:31a5:b0:8c5:2dbc:6253 with SMTP id af79cd13be357-8c52fbcf036mr732592485a.51.1768462168638;
        Wed, 14 Jan 2026 23:29:28 -0800 (PST)
X-Received: by 2002:a05:620a:31a5:b0:8c5:2dbc:6253 with SMTP id af79cd13be357-8c52fbcf036mr732589285a.51.1768462168135;
        Wed, 14 Jan 2026 23:29:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:29:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:13 +0200
Subject: [PATCH v3 8/8] drm/msm/dp: Add sink_count and link_ready to debug
 logs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-8-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3587;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PIbs1V6oCZycCnfF0WvcY9fGYHmsP42h2zaX22R58XU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bGdBfnZfdy3t5IMN7ieH3Zmimnw86Wy8m572HQToph+
 GKYK/K3k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATuXqbg6H/jE6Q9Xw1Ca5l
 wvdc/W14n8Re8vjl/Ux2rkPWuklnFHu+32tNil6u75rqrLBWcME69aP/PlheC4z12Paost7x4qe
 eauXQ99GzZ3afOzXBTOnJCZV12kK+rs135BWerJC5ZqLg7ZI9s+ZL1sekl4UMERv3SabxnlbYP0
 NhTezx262Sfr7MOXfr3ojPfzqF/Uxd9HEG4Rxdrf7l3sLPXjUsd92w2XPjUh77DsO2N4FFG8uln
 IN6AmS2sYh9DHSq6O6IMzlsHaJQsW13zFZV7q7O/52Gr44WHbUv9fa8q3U0yeZ94JpdBxIFznBv
 nlMuceO17vvoCPcXL7kuRxtPmLjTt8oyZ+GKnCefzERdAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfXzJEomxoAfNaE
 9WVn3S8PI9Tv60RvcugW8H6A6abQf4kYXhP4fkhuIET13Kz23uTuAPyc741bwqrXc3Z0aAfCkmj
 PzQg5AvPtUpoZA8TGwVFjYTuEz1mzLmChLP5vsCQBUW9C916C1o7htMDp8K4shfUbz6tcbuQK+L
 AQIs48Lj0uvXceMIPeKukmHUGPkEux4JPvjsgyZIEabIFfUi0hecD43GUzsQ7ErA9YAsE8YcdVN
 3LZnkftjsUYcG9oX82HzFBe6FjubrDNE9BRvbytPuQvnw2Sv48oxcQmiAJ0aojavkbjYCOEK8qX
 VYu+4hnpeyegq9XRTg7UyNV1dYd6NaaRwuEf2XfKzQrfH8Ah8Fah83FJauiPhoUUIgMrYx9ql+H
 SMHs1DRTU3pa12mh+llOmcsQHtehf4kYrC4NRn3G+r1Kmi0WGdLVrhdyPygCbw0hSDJ+IJtB5+k
 1Ex5Ov1ICskGYwd+tVQ==
X-Proofpoint-ORIG-GUID: 5HcGxlAi58SjMvC8MRvr-NLgfxWljtYz
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=69689759 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=D6o9UKO1UCu5gje6phcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5HcGxlAi58SjMvC8MRvr-NLgfxWljtYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Add sink count and link_ready to the debug logs for [un]plug and HPD IRQ
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b26fba89e73a..67a193f58ce2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -388,8 +388,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	if (dp->msm_dp_display.link_ready)
 		return 0;
@@ -411,8 +413,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
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
@@ -440,8 +444,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	if (!dp->msm_dp_display.link_ready)
 		return 0;
@@ -465,8 +471,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
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
@@ -479,8 +487,10 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	int rc = 0;
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
@@ -493,8 +503,10 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 			rc = msm_dp_display_handle_irq_hpd(dp);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	return rc;
 }

-- 
2.47.3


