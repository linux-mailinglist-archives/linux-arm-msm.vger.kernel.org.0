Return-Path: <linux-arm-msm+bounces-63027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7AAED0F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C0531605E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C968C266B52;
	Sun, 29 Jun 2025 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNA26lun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237F263F2D
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228241; cv=none; b=XC2QmhYAfXkSefVIc+Qr1f9zlXj/4QjifdRvVfimUNC1dw6xwfS8+Um11WfMpKUQ334hp+HFaovsom9rfR8ljCQe9ntu+YA1t3dqwe2AU8d88HZlV+o/BloiYRWw0h126ypMnM0MMLZMlbPaE55ryPXN4LSSIUsixvalf8eWP2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228241; c=relaxed/simple;
	bh=ayKPNIzMHytJlMgLXTS3H2whkdxFm6qzz5vdQc2N/d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoK9itQdNoYY8xehPWZdaLFwXImux59qTX8nZF3uLUEwZ5s4xK7Ay9nvTfAceCv0m2wtVFmEON1MG3y7j3WaltaUeJWGOOUfeYqzhJyZowQbAN0LsKrS9rcIxc8thzJSnkPjBzhWlD8EiBNCW9Rb29Wszjsz4cxuRJCerTHkIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNA26lun; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFnYHk005314
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k07yEnAyEzE
	a9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=; b=bNA26lunYr+ved4vKFT73ZKdg2I
	1epYMrVwBa5j/JKPC2aiwLSRVeTHlFzUqGPzH9kJRn6I6XHUb9gFL5gykmv2XTPY
	T378+Q/PSN/M5lQd2E9+cG6t3QPOCwuD/WItaZ0EoKAXcWZdm1fDswM1p1aEu5te
	Y0hZYHkh6pP7maHNBCGxtP/76DvHQTvrBoZB80TmrBQ2A4bCK6e38lzpatLP62Tw
	CJIgGvNHn3FmQ22nhz9RboXrNsMYUrA5gEhaxmiZA+ZrHhAvIy9yuvIzIGI4qsGu
	GthzmjiWBVeW2XHXyH2ODcKcHzBBybaTX6U/oQ3WyIxxjBGSvcdlskP0TpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9tpmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2365ab89b52so27838875ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228236; x=1751833036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k07yEnAyEzEa9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=;
        b=eOZcfUnEEQGbgXJeeWXZBXe1wb9+lqfGqvv9NDO0MjU2RwBllT9SBRScx+6j8jQ+Cm
         +4O2XLdHsJKj7TGK2ggmG5znFtiH1CnCU+qTjwuygkwpoz05E4LnmqiJkUbzd7cY2Wj7
         +aVlgCnPsqGMbMBVkY2m3jt62cgzz7j/M6hCWYtx3bqDz89dAsOgVtBdk4s41pBg5Lec
         A1QiXqWHZpsePl82uv9mFS8CroMe/RDWDYX668CsbnLoO+8QmTyh0kF6C+Fa7Z6vCepU
         ru56YOEwTIuy5jXO73fvB7sUZ0zy0KI63FVZKxDMa+lt/DQPIwqyPwxO35bDoiQzgypn
         wjFw==
X-Gm-Message-State: AOJu0Yyb+bqRgs2iBzHlOSv3IbflHreHCNvpGb3ZCUeB4AaOZ5oSA2X8
	sUFL2QwzdHqNxCiabY/HvinnD+JH0ook29VqNMzUb2XvA6ndCXB44Mgx2pBib8ecdZpcLjAC8oi
	LumOiuo9nHQVa/B98YXq77sCKCQIU5McBpdKAReTipdbcpRHXHM4ClLKk920UiXtRD+aD
X-Gm-Gg: ASbGncuZkUqSG8lUU8ouCwDnXLyDz0g+zuOvst76A7EyNPqvPT5lJtWCbyr6QU9Yjex
	wWWGKIQtaiEr4qE/3NL935rvUUCY/Ms53MYjH8pm00GVRkzRUk+seVCDUqpqj4Pzakf4k/RLRM9
	ecYIvrBbpXDf9J/0RtUY5W1MVUe0Oj3ZYy8LmIAOoxtg3cnqTRw9x+dty4kY8Yf7f2yge/fCE7k
	5RbStgPt4j1rkTOOwSlvKpexqHCbnY9PEaHE+hQhZC38Ia77Mv7pQV9oWvLYeRHyUKZ45uLzu8M
	oWJdoZ//bvGYQdQW87r+kp8+6zSC1bcxsg==
X-Received: by 2002:a17:903:3d0d:b0:235:ea0d:ae21 with SMTP id d9443c01a7336-23ac487c9b4mr181492885ad.35.1751228236516;
        Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbqKK4XP+eBPgJHXyazG13c3Qw9Vds2B4hlk1UpKPfkqCJy6P8j6VSj/+TGEYyxHjNQNNVqw==
X-Received: by 2002:a17:903:3d0d:b0:235:ea0d:ae21 with SMTP id d9443c01a7336-23ac487c9b4mr181492615ad.35.1751228236130;
        Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3013d7csm6301398a12.11.2025.06.29.13.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 40/42] drm/msm: Bump UAPI version
Date: Sun, 29 Jun 2025 13:13:23 -0700
Message-ID: <20250629201530.25775-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfXwK6dUY8EyLqn
 Dciq9GdHT5aR7ezJ7ZhkoFMH70wAA3iPmMlsCWq0qSRSgGELwiXLKJwOPTLhmk3tY7Ls56MuMri
 Y1keRTe5prNVr8P1HTNQaRhyJQTrcrr+Ab+AcTGtIEoRXecqTcihcxkn91NFxR1K45Ki3kPfNll
 L3zM1XhA6jQU4MvnG152gMrp/Y8lWfAWPGUJ4ZFxDyoYKJzKv56SmkR3siBwbcvoYtaNihG9pZq
 zMGqpVmpXtAFLgr+nlqAOT1YLvQ382W9TpB1xz35PbVQSc0CRQqwhYw6KXcA7PkjmoHuQRZkvrD
 umsePVg21oUwDFaN2ruNx81bqWCbrQDsUclsii9rEDD2Lbx3uFwsue1KhuvZwrKqa4YB3vf4ZaY
 OfnIeSoHYxQTOAIGbTsXL6zx6z5ZHzsZTB7R7y14onwbF4LDdlCsMrPnDKq1VEutZnTJac0Y
X-Proofpoint-GUID: omENoD1f78983oo9sDvTPiPHgYW38cnL
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=68619f4d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: omENoD1f78983oo9sDvTPiPHgYW38cnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7881afa3a75a..9b1f1c1a41d4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.50.0


