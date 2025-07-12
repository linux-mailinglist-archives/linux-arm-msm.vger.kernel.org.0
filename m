Return-Path: <linux-arm-msm+bounces-64672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A93B028B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF376A609AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140A421A433;
	Sat, 12 Jul 2025 00:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6SwqmYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2413C81B
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281931; cv=none; b=I2ZiU+FJZR16F+K9DyZ7Zc0LTzoQSW3HcPhi7BjO/tasuz3pDW0KNDzD8uEtCebRkyRtxIab7D73zuq2qimjxw9tRrGHn7H99b7M/8EFVM68cuwsKMpmbtomFY9WdBDcRfFSqMXcoqdTaHt90+qAAeb96BiPQMl/XPrNqHO6DmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281931; c=relaxed/simple;
	bh=fjQ46wtHnJ8FY9wdYiHjF2udiecElMVze21Qux1/Y+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cq6h5kJOBqmZseCdq5AtGFKmcva9YiT2UbKA4BAEbTPKeSvlmIbJ00TyCf9wp5wBEW82DTx7dfs391Wp6lje+J8EI9RShMxIGntU/wKQU1KgftfzhPWihN1mkNJ6HiCA0/WRTNm+SHhcT5wUoSYYcXfpkTy80TG3WtgcOqRo/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6SwqmYO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0gwPn001286
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X44+EY0MMh66SQSLKZsrsjmtnAL6ZSI0nRwBgvyoyyM=; b=Y6SwqmYODZD9Xzw5
	CWZBlVJuMXC0j8tdCk8R7xlovwGem/qAUpGMSmnMrth4Hm7/muGdF/bWLg2zK85k
	QXQ2kqyxqj/RUJM3Hsrhp8jhDF8Pgd6gBregEpR0StAqeWGCRjXu7XEB2xJYD7Uc
	GTX+Wzi8rCu2FAENHpuunGheD+fYz5nTDtlXCYm0RcNGNE7qhLfBYE806kN5KFgu
	EvD95Tlz8HFge58uUEtaXNwf9O0XlA329r5HPdmIrJuEe6k1tAG6ilg+U8Bmw3WO
	aX/m4lBeUs9Usm0S5yfC4gOS/powQ9sjWoVWjc8EiQHRzuiTW2BVZwr4tdf1utWj
	q6bF4w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313c3915345so3819433a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281927; x=1752886727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X44+EY0MMh66SQSLKZsrsjmtnAL6ZSI0nRwBgvyoyyM=;
        b=OWAlti5xH2ag7Nwu8wTTjZyyCg5aQL75zBdr1bH5+yFjOUOMwe4Fzq48rmH/i02U3/
         hkODPR1z0sZF2j+FHp3XJYo6XuPXKlWtefQveR3T/xBv4LVrW6fQfmF5C7zIae5ugYfo
         pki2ryu4Y4yBXYrugxmuV3p4pUvTnzdXyf5EP8laG5hr12L66YB1zOhxuFkIRXH7N6zW
         3FWInQU8gZRmgUVDuOmBdZ+MNamMjsMkEaI3OacSvFR1p7yAMTz7iGnNTobNT+JI18s+
         FkUcEsH4LR1FYKHEbuUO9LhyKNCKfXoruff/xdYyQ9cf7MEvN2EVrVWH5VNpysCXlnh5
         cZfw==
X-Gm-Message-State: AOJu0Yx3qFtziZsIJUa6isO3Xzt0pzWK4WvNNrtl5hiC5jkJLJg0suCb
	2VYY0PlqJDIf9V/LMwlN2mvwh8l9AV5j59CRcLDYQrELfU/JYT9NXUuA72CejkFPHtFb3RFHJOq
	5rv7UXKjcCnrA0AokbPRRVB317BXgyqJn2IKzyE6gEUNAlCcrDysZ5+hQhnTjMj6IUMtZHrhf7u
	fr
X-Gm-Gg: ASbGnctUj85Y418xvuhHy0mheBAjJDKs0vQYhVpPP3qYdm4N2/xK8xdapAi6ko8sPLE
	4DmMNaPMjcH4Ir2pQGJolgratWQ+++Tf6iJpQjDUvnyFomTqHAW1b7WhiMJtLPBwSwGJ6/Y2EJR
	fQDWoZR618JMsUTrubv3BxYJB+V/F0PzFyux2GOz0Sk/Pp0lUhbycLBdct84bXSuSY2SyrAtun+
	JmHr3rqAWKvOrDb87DJhK34oaz3+kFyfFroDhZWr8AgM++MsA4UHnHY6DzazEAr4vQvUO0GI1lc
	duqYbFaMOeiczkC1za/DMxJkSs0yOn5WxKh26ukZ7zdmnpzIWnz9v2Rr71d2AC68ngFDvG4RW9v
	ZVeGwgNx4PVSyakxI5XLtsn+9
X-Received: by 2002:a17:90b:2790:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-31c4cd04544mr6586944a91.23.1752281927159;
        Fri, 11 Jul 2025 17:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEoLPLd8me4X8XPt7V2tzzU0N8EU2ZNyg5wcTau9plhMwtdyz+45J7Cbb8YmssvpxzQ7F9HA==
X-Received: by 2002:a17:90b:2790:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-31c4cd04544mr6586918a91.23.1752281926709;
        Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:18 -0700
Subject: [PATCH 13/19] drm/msm/dp: Drop ST_DISCONNECTED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-13-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2475;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fjQ46wtHnJ8FY9wdYiHjF2udiecElMVze21Qux1/Y+0=;
 b=a2mpv0CIxX8rOFkYRUChcCtBBnHir6lhM1QupbemCr+UDu0A66v5VkIgBVwZWzeDdtz17c5GU
 dW5pQKU6HxuDR5Yv3N1+X/l+jAuAB8B+XMOvGSDmTTpKCzIyi6hChSD
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: g73lsZqP86od3Sq3RuczF2-mtTPyxjyE
X-Proofpoint-GUID: g73lsZqP86od3Sq3RuczF2-mtTPyxjyE
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b348 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=geG2uR4XrXNgRqKXHj0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfXy86onuBuZd3A
 Oan/aK/qdxd6JBwpc6M+wwZITds4BZY3bAX0jfHFGPxR5Y8GUBJvya2NCgwFuXG6n4CTlvZh2cG
 1IIlz37i7ppZiyICEpdloU7mCNlN9gHGwYz5YR5+1B2e/A9MvvyWMJZz7fOGY+7ooL8rIkgBGnI
 dESSDU9PySY/SMp4yhaIPCtndxvKqa7D7YRAyIuP7s8B5/+Xjfx+CC7jH+LNn9vpRVgU4TYFQ/c
 I4GS2RtK2nUOLlHyLWNlNKytZgQ6OrM15Tp8dWWZTqIclp9cmEewFFmTyQI2Qqlf/YyGhmk1KrR
 G2q5P9kX5SzMNlvaZPXzUD6yx0ZnS6+4kc0zLasHSbeqz6t9Up/ULMj56zM7DhDvW8rBNFoC1Up
 aQx1knXzqlwAwA9FOdQxYlBSS5fEfrT4pV1LB31hDIo85O6s5A3mW0tcAMNmNHJP2bBo3wHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120004

Drop the now unused ST_DISCONNECTED state

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5efc8d4ecf54..dac5078a849d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -45,7 +45,6 @@ enum {
 
 /* event thread connection state */
 enum {
-	ST_DISCONNECTED,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
@@ -526,8 +525,6 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 	} else {
 		if (!dp->msm_dp_display.connected) {
 			rc = msm_dp_display_process_hpd_high(dp);
-			if (rc)
-				dp->hpd_state = ST_DISCONNECTED;
 			dp->msm_dp_display.connected = true;
 		}
 	}
@@ -608,7 +605,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
 	if (ret) {	/* link train failed */
-		dp->hpd_state = ST_DISCONNECTED;
 		dp->msm_dp_display.connected = false;
 		pm_runtime_put_sync(&pdev->dev);
 	}
@@ -669,12 +665,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (!dp->msm_dp_display.power_on) {
-		dp->hpd_state = ST_DISCONNECTED;
-	} else {
-		dp->hpd_state = ST_DISCONNECT_PENDING;
-	}
-
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -1628,7 +1618,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	u32 hpd_state;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1643,12 +1632,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	msm_dp_display_disable(msm_dp_display);
 
-	hpd_state =  msm_dp_display->hpd_state;
-	if (hpd_state == ST_DISCONNECT_PENDING) {
-		/* completed disconnection */
-		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	}
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	pm_runtime_put_sync(&dp->pdev->dev);

-- 
2.50.1


