Return-Path: <linux-arm-msm+bounces-64661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD64B0288F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 02:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2C6A6078D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 00:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CDE15747D;
	Sat, 12 Jul 2025 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0HBNJvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4338213D246
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281913; cv=none; b=Z+AA/Ig7yA0b0QNmLMXz24tDhMEYv/s19o7z2Ud5GX1C1FXgX65SYylM0xTmUefbm0Cm2eHG3VQ2ZbAmjhBHYJaLzxJyFteIGlLvWQImMX/j4x7nCTtfIpt1P4U5wl0idtqIBVa0MmTgSOhgNOwrdsvKSiFgKrrV4UYGkf7sKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281913; c=relaxed/simple;
	bh=J92vKQQU00spCPJVU/OigM0xG5dEIU7VHwUl2A4FDFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nTu6dD2DNZio7wZ6oMLZBGhpRp950aDByKw3CdPnx5/CKkfvEnDzmiRNTQ9HNyM3rx8F6Gxw+cw5oDZsyrYn1ubIXLoyazmunaTnOjTobqHlSgD4Adz5L9ez1yWtrvZzxmvJ6PLtKf768YsRqlT2ElupqvExKdoF5etaIztazKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0HBNJvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMjpls003810
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q11UOiARa3HDFn+Un9pQ8/hWjntRP+9VgAjNKaCCqQQ=; b=N0HBNJvjUhyeB+w1
	iQHXeMn3jbBYaG6mXuGwLuGW2SRCDWcFQi0cHZBYfsjMwJ8uoNT5bmoRLvjxrWPW
	uwkYFvE1tG6ZJl5bn1tiT3nhCMKIYUqlWhBNnyISAalmmkwRIAdRVmGz1k6OhZGw
	MCNMzTDEjz3M4FgosXnBhnwGc3STdf/BFu2VqmZxFGLHLh+qu74587JnonKBIci+
	3jWJvdMZD6Cc04Q8sd+Be6sjKfd9jHLYl2pGkPbCHh+LMJdvAXmBJx015vOzqKUK
	OBHcTjX5+gH/nn6rEyCSU1vPcHqAT8MkKJzeVQwhY1UksK/3CtCBf9q4RGgUi1Yh
	u082yw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp29w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2c37558eccso2211813a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281910; x=1752886710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q11UOiARa3HDFn+Un9pQ8/hWjntRP+9VgAjNKaCCqQQ=;
        b=P7XraVBqFi9kPzKp+V2zJfS869hJWFEzOFiKXbmEcqIaKBv+RybvVq+IkkK2GRM/wr
         hcO9prOHigshjB4MoGhOqw4YT0Fl8/LDYde+3L/a+P3Nj9kEpXmnNS6ieUiwskFV0UGo
         V7GSVEJMAXP8MTX5WUvcLzxNM6DocmcQJDTfcOIJJ26AyPzRIVf7Y8XoFVf80/X7/o8F
         d4V+kMxJXsoLXTyoAgy8OsHT9CtUcQnAuTLe/vYtk34nFj/yRsxGe1WeVQOHWu0kGrvj
         j/gl+6c9lokxpcP28+zxYcQVLz2fEJYCRpz66nWhgtNoZ9ziVsJ8TFf5eO3ocrDk1HB7
         OlZw==
X-Gm-Message-State: AOJu0YyJAzLvpBenMv4MUU5c+i7704de8goIFOJ87y2he9ElsOALoy5G
	J4vt5eFKMTa0mwOZCHjE2iRVJhrkBePv7GPQlNIMXlWumpu3QcAIwlpGjWMRpZY9Vbnq59eTSdf
	s6ie2evvH9YzMAGIN7RFiJOVNTpi0CJlBEn/aFs2adg2Vb+1o61JxEnW24Xm6K0O9SoWIc2/BqW
	Al
X-Gm-Gg: ASbGncv2nzVMmXE4Xq0M6sf7YteLTx7VP5Yr2w0XDnDnvJXCNbsI8TdFCAyFXklQduz
	qKlH6mPo8mDwmaWDZSMLzNwv4xkByUu1bKiXSOxEoebEzGW2pCRyTuh0twWOZZRmeZRv3HnE+hb
	ldGKvKwI1NGAKxtpQ1FRij7zw9AJSoMWrorC1qMAf3zUczENd+RXHqoEJwx5OUuUBKFF5If8uMV
	faB2fIpe48ZwGo2InmlP4QxU0D3IzNvChfkmEgH96NLLPjgIk5jE1QfsV/pj5V1ZFET8uNiTOei
	EeWxVSuBomeqODopdgijjYmG+R3a8mPCvtsWz8ok2LCoahmSikJl+bOzYadPJoT1XgOYxn3cCWo
	q9t+jL3X6/CfhuGjG04U0WQLs
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23dede396bbmr57111635ad.15.1752281910329;
        Fri, 11 Jul 2025 17:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEkslTssGGwVbA+ubFmEhnufVz2ZPDP3EbIVkI8173qZsyR2UUDWX8SezkuEsaNcgc484+2A==
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23dede396bbmr57111375ad.15.1752281909914;
        Fri, 11 Jul 2025 17:58:29 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:29 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:07 -0700
Subject: [PATCH 02/19] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-2-33cbac823f34@oss.qualcomm.com>
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
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2318;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=lmjyDwDYFnlKQuJK43yWUhZMEmCS6vExO8kuvCtTUMI=;
 b=ZwqK2sAaMuPEEntJ5YT/sWXzkcT1wgWrynvhWeXOd8zBND2GunLXDSSk9GsE675dXMDZJs5qd
 +bKpFlE8FfmDETAg/krNMaady/F3h5fWvRM0d6dXwYiaKK8lPci61mL
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX0LKj/1PN8EHG
 6OnnSF1fZr6zHeDIiVeusF9ijefJTcBA5ngqdaw8xk4avn722SM4/OSpXsYYyXnpkzF7eTWZJOF
 yPWW3vh8w8/QI2YEg0T+yIhqxiHrg64Nfqm76N8fwD3ztYsrkqO0f2njUBWzN9gc2fLhH8GX0z5
 o4UL4v7RZKmMEuJ22H/oSmdbnYDf9yw8QbtqnEVeqmM+b0K6EJqTXLqKh2uJxOA51n7jt3wkEvl
 UpdDM3+JICtWmch1EFFWjPz2X1oXo8UZIojrEoyXCxh3kofScrhbwAdAlksOUKDL4Qow8JJ9ByF
 03dSmPpXnVDgGhMNafk2JlSZLxlYd9btXeWVkaBqbWxEwBsThnddoVReFe/a4s7gaBVWw0JQ0lf
 5oFS73dnax37qlbrzt9rkN1IhiBAJAKrEPbEsF8x2KpvkUsueCV0aptJnqZALvXV3wzr6Or3
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6871b337 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=PbHRmTaTmGSOozFvvjEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wU49MwmJ9YbG69b5Xi175Vj37Dho9YtN
X-Proofpoint-GUID: wU49MwmJ9YbG69b5Xi175Vj37Dho9YtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon
Chipsets"), checks were introduced to avoid handling any plug or irq hpd
events in ST_DISPLAY_OFF state.

Even if we do get hpd events, after the bridge was disabled,
it should get handled. Moreover, its unclear under what circumstances
these events will fire because ST_DISPLAY_OFF means that the link was
still connected but only the bridge was disabled. If the link was
untouched, then interrupts shouldn't fire.

Even in the case of the DP compliance equipment, it should be raising these
interrupts during the start of the test which is usually accompanied with
either a HPD pulse or a IRQ HPD but after the bridge is disabled it should
be fine to handle these anyway. In the absence of a better reason to keep
these checks, drop these and if any other issues do arise, it should be
handled in a different way.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Note: Taken from https://patchwork.freedesktop.org/series/142010/
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6945df782f7b..1072b5fc00ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -595,11 +595,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -728,11 +723,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
 		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */

-- 
2.50.1


