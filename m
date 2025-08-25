Return-Path: <linux-arm-msm+bounces-70714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E16B34391
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A224A7AA867
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088AC307ACD;
	Mon, 25 Aug 2025 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcXKcIx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CDF307AD1
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131571; cv=none; b=UKmeJJePS8HLDpC+iX+iUrYU61wBZWAP9wPPwfKSkrzAtZeKVtpFXRKCqeOtckP8mBuOLXJR1fafQKshWN9sdP2zhxgzSLdxmVTq/KRCzYMD4DP8hM7WxZQ6SFedTNnMwEAVBMBElDhitAeGPA7zqKzpg4hjrBRFjB4gEnl/8cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131571; c=relaxed/simple;
	bh=CQew//jCuiFG64AEQ7qv6Ec8/khFlO/FKeMU5oCidU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfUvsPWSCw7Il0MUbWTLOzUR5P49sDQTCK8M/BwfP5kxfPGAvb7xVpBHOr4+0ji7vDd4qylijmogn62myL5KkXICGFauhRtDvDKUegDqujOKdQ3B41b7TvMS4tI3X1GrAzicubEdB+6ENOEZs1QAZuD+q2v0dNY9/8oyLooWLss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcXKcIx8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8fWoD032260
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1yd10YofnLH+CQC4gSLJjeDZmLAxXPdlUuNT6txE1Y=; b=KcXKcIx89ECYWM+p
	Qumlgpfvh7fNUJ/+asqPchqOSihvhFSpD0mg5oAWug7OoGEeE0qSbq57S85peLe6
	4OCCeIk3/BDph9cZ/1uPltJcOHuQ5tSLv4w6I3T0yEYf/dNyo8lpDyBwspduW3DF
	RLfE1HBg2RfhA+Xg/VuyFo+A+woEI9ec0phF57ruxPvG9UOfR92QlOOuDX7SzBmg
	K/NAM1WV7JOJVdnOM0jeTUsh5pzQ98929T7Bw5eRvLy1epvFWa7u5H2zujIXTaor
	F6n378ZEd4YEovLjC48UloZb9rWIiiapG6q3t41Rg34eaMlndjgG8AF2ONMCViTB
	y9kfIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771e1657d01so865799b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131568; x=1756736368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1yd10YofnLH+CQC4gSLJjeDZmLAxXPdlUuNT6txE1Y=;
        b=TsP5kK8fbseZHkQhIoBm0nKTUpjXR7Wkul1WOTWujwSLAE0Kf3x2Iu3oQeozHGrjCO
         FFsxoY7k/667A8A/GasZ2gJGo8ltkyGjlFbnHM25/UC9MKNXXwMZOgyx+afb1kIadSh1
         iVN/uPzpkGX5tRB/lT0qXqDIsgNeUfUem3GlyQApP2xuGBacSfOb0hZ9AUpDw3K2UbzP
         jykITCsmq3glSNdrPxi1s2RjFspgaH79DkHAreYGofsXZH6gtXN2c9BdX5t0fRhKHBJQ
         QaT0j+097UR8ZffF9nobxEUW9H6PqVXQ0pjGo29pbdHzDqBP8fjqG3EKxmmx7f/f9iRA
         52aA==
X-Gm-Message-State: AOJu0Yzppvqu1zvZmjicmV5IdxL74/vPstMYpF0Uij/y/oZHpomOEm6m
	PbMvLnz/Hm9u/d8XbVnLW6ibbPZ2sJY1ZIbFgpWML7Z0GFMPlelmx2aVCUjCcm/ePEdu3l1d6C0
	FX6jV1JoJZFf0rXHdLZEipIeSD54Ip/38hf6Ro45Y7KTquY44WNjjRIVY7rtFFZ/efo3B
X-Gm-Gg: ASbGnctDiTZz5Y/Fv1DDT5QelSJnaKIC8dQGfCYMLHIs5nSnOpOgC9bmwRuaht6A9Xz
	V9nkhjXd7YCbi+O9w1N2JPsLsaBy83Yi+jjzkIlUXa1nFjI/TnKEQQZ2Unmp68ShVCwPWFqrsmF
	wMhO8id8Q3XIhYWCtQKyV48jbNPIxsjx+WiqYdmFJ5yCVN1C86EoaEXcHv4gKlhVGHIAqFqea6D
	S9fBR0cTtdJ7bbH8XyujpD5BnTBb6ZbjYTKBA0Fxvq20J7y7Cr37Yso5zLXP/tvA8ChxL0UPFgi
	aP4KO4KUMJ72qJQkQFGC/ZVLUfRoChIsRl65ikZl1BNX/K/R/6x/iWDLaRay+2m/+A9iYa4=
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id d2e1a72fcca58-771ef50091cmr1422415b3a.15.1756131567558;
        Mon, 25 Aug 2025 07:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGFvu3XuT9VU/LnqIitNUMdiD78ZWBqA+dkmxK74qwT0hQeTdkMlAaWKNmSD7AF3jPQpDnfQ==
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id d2e1a72fcca58-771ef50091cmr1422378b3a.15.1756131567093;
        Mon, 25 Aug 2025 07:19:27 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:19:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:19 +0800
Subject: [PATCH v3 33/38] drm/msm: add support for MST non-blocking commits
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-33-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=2126;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=bbMgrjogFWOe53cU7bupWnZmtxrreVf6AXy9Q1VXF+M=;
 b=gpg3jVD6oQp8tI8kWMMSeHm2DZx31ldvlH7b/o8hYiGVXXFJvVsSukXwu+8X2LIpMWKJk16+T
 Az8Qnk5jGIADEg6fsCyTUrl4ahidQSBEY8LldaFTeQqX6Yi482rJj8G
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX53wuS5TWksR1
 yLFV2fygtZP6GYjGlayT6nV2AgAmWwWNc21yfAsGUAVxnIdpvX7rUuv+bRF5D9uPKZ/ehsNUa8A
 p48nQe85uU86/ye828W/NuvHmI8aGHa6K2Wb5h9po/nbcBamfAisGTH6aeMIStmLSzqu90liyE7
 s5pLpPuylAGwgKbNQq4eQrziaz5CJf07E/kebCFbTj2J+qLszpQQl9UrmmGUi8OCb3ex4kU/YtU
 BrNZe5Rt3CTD/aYQ8JsqqXQCm0EawMcSRsurEIeBdq8HlIaSSjTiOFH6a2PTUvjGZptaZGtyF1k
 KgB+Rx2JDb1YVBLBXv/Titw8ZAJnyBPUZ+RCOK4f2DUD9cFkmu0DYcmzAJw6NbWSkMUQv3Zsy0l
 L8jSlPe7
X-Proofpoint-ORIG-GUID: vSr6PxWIIMBS5_W7M950XLYfp3W5Fy4D
X-Proofpoint-GUID: vSr6PxWIIMBS5_W7M950XLYfp3W5Fy4D
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=-c5J4RddxQ5453FdQNsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Integrate MST framework APIs with atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits
for DisplayPort MST.

This patch only applies to MST. For SST, non-blocking commits are
already handled via commit_tail(), which internally calls
drm_atomic_helper_wait_for_dependencies() in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 3 +++
 drivers/gpu/drm/msm/msm_kms.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 3aa0020dec3a90b693ad3d4171cfcffc091aad4c..b1656fb456d54af11ba8a30d4971fface114c7a1 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 #include <drm/display/drm_dp_mst_helper.h>
@@ -226,6 +227,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6889f1c1e72121dcc735fa460ea04cdab11c6705..09776be1d3d854f4c77d7df3afa8d56f53639411 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -10,6 +10,7 @@
 #include <linux/sched/mm.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
@@ -29,6 +30,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.34.1


