Return-Path: <linux-arm-msm+bounces-62970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B31AECDB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CFB41754A1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA7E253350;
	Sun, 29 Jun 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrLv/1jz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E920226545
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206102; cv=none; b=dSiVW/m8qFdcwAmncN5ih7nTzhsAtXSHPF2aY+kYUVZ0zCgZi2rNFjT9VN4eJij2esSWURqJmESmdCIYpjo66mZK1RVZCUd50GXy5Bkqih3JuM1rzZb2UkklPd8qPB/glFrbN4/59XP1C7YD93hG8v1L4o73TYFD+XQM2JDPv8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206102; c=relaxed/simple;
	bh=ayKPNIzMHytJlMgLXTS3H2whkdxFm6qzz5vdQc2N/d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhsdIfqzQCPDHvPMK+iIvkMLrAiPfY86tSfzVmGoqx2dx+s2+XYmYNfeOuwFYgbDy3qwZBjmTUUc9A/fQS/94jdMRwHpieGchq2yUHLdGcGT/JB08gRRtqQOqOAGMyCiiuWH6SlULichpd+m1NlQFz/u+KAGwB9vR8SvnrwQDzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrLv/1jz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAoNg0027193
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k07yEnAyEzE
	a9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=; b=BrLv/1jz9HuoGFdTMkip3HYRli4
	mZUyfD8ATY8tG0dbrEqCF+eY7hbeRdvP5hBt+g0GP+PkyDeJL5+LuxFHp7KBU9kh
	xCu4c5ivPZtVQuGgC736sAROPGlmBn9/gMAqJx/5Aiqm8kgd/1v1kExS+jQh+6lc
	JRxd35QrvyQPrCj1nEeMyXIhX3zT/vUZjUaGlMOoo2YXmXSi5jGBQuEY2aIAK74J
	+yMjdY38vniDkBYiBow/vCT8ll/bSMOn7aif0pRjENgvU+ZqfsL/nuzS+MwmReXM
	Evn4MUrEY4AYWf7XaOQgS7HLaTqKXlGtQ7Ir5cBt83nUXr7R7ozV32P4F3A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9t9fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31c8104e84so1017507a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206098; x=1751810898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k07yEnAyEzEa9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=;
        b=Du99kylJQn0Gt/mCZyOhxJA7qdXJJXrq2561tu+mwbzrQ5Xg8SffqioUzrhogjr0x/
         QfxjASWFpAdnQnOX/UD8l+XKYKbmnuVQ1y9dfLduE1LQpsTGjZ3dNvadvBKvksNXgYqu
         3OOO556DfgC4D92yOjiEE03xw5U/sS1VvEWkY6ESDWjRM4EZQoRYjzuLJfBKxGW8GJDw
         Xf1FIxDL2QDjuh7rcd8n670lPNi7NFLRi9j3LUG0mV0Eu8JmktdqLQUT/R254QxLMzZa
         /M4HVlyMbUWolo8OXdsHWm0edLt2FONUsVpF44AsM060BZfppU6si8TgbKsaZS870WiT
         AtFw==
X-Forwarded-Encrypted: i=1; AJvYcCVJqbonceZ24GBEfxPfMepfbfWOlDn0xDiWrCzSXaC81/Z/yE/o9WmtbMc/ysd+gkOw0S6E/9sZ9rjXnxYF@vger.kernel.org
X-Gm-Message-State: AOJu0YxTej9TBDomLAxpCAShHRm6LN3V0/4P7HJ3FxQmAaKmMcCofslK
	hL2pYZAPZdkp1Aw4VNAl/WRoiIsVmGHkGly6gT+rQGvjhz+ronelPeUNx/5sYNF+tjjgb+h/93f
	xMTvoGwPOsPDIC8lxU1yckupuWBjR+xq/M5fvNFeR75YZh1jlMQVboQK/KDpx08Fiwdo7
X-Gm-Gg: ASbGncuC3FweOPt1B9yncaUCCBmenL3M6d2ZYVFin82F/7oW1IDUkbHMB3L0MPiG3HR
	+G09SMA3z4k+0gEXHAzWUsunoFUfWEsc4bxCQEirLEF/80QyGROkVJZvh338b6YhYP8amP5JziB
	vEF3RtSYyOr3l8H8Yt7+IriseDRMxQMIDJPIYkeo9A3BaVzgj+r9BAzYbGlWjaQMLzDLLGc0C6W
	11h/Qp7Z7BB7aN2WRdM4uJV1GJBaBWtOg/QS26i4dv3RE9dcdahdwzFd8fTFGphI0F9yIewwFBI
	veLsVCVacOaoEvsfwWNYPc8HU2U26oZw
X-Received: by 2002:a05:6a21:393:b0:220:33e9:15da with SMTP id adf61e73a8af0-220a12a6673mr15927724637.2.1751206098452;
        Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUhzRnC2Gzmes1F+eCUOlvqyKWiSWRnUQbOPPUCyCwcoSzMtVgC+1PBHnNQkUf+FfAkfUkNw==
X-Received: by 2002:a05:6a21:393:b0:220:33e9:15da with SMTP id adf61e73a8af0-220a12a6673mr15927685637.2.1751206098054;
        Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5571b7asm6905338b3a.85.2025.06.29.07.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 40/42] drm/msm: Bump UAPI version
Date: Sun, 29 Jun 2025 07:03:43 -0700
Message-ID: <20250629140537.30850-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX9QAy4k5E9s7D
 LmMHJrjut27F+KrFWXt3t6xDgHiesMhdIPEy79dvxp9TZyGO3m2uKwnEizNsqr9/gBljA1yVIC6
 L08/no51RlJtcRupevqe6MveN9k2x8yewZdx39dZELOxJWuERQecPFdp5ChO2LZd3UiByPVSDcH
 ChJO+pLVjLgg644BdRPSS+n3RSBx0X6OhnOiwn7wc2sHemjJ9BOR68vw/Ld90U4qOb0T1ViDfhw
 hQhx/+jWr1RJ23GvU9XKb4biyY51t0q/wziFjlaG7xo3WpWE6WORjclprtbokk08DRKlgTEIB4E
 YJdjnhOV6JXWsVVddSs1PX8f8Td59x7UAR2lAanxLV3dodALZEAWsySEbEb700FkHcs4N2lxlkd
 z1CUZen5FDIcFpr0ZMyNBpuy9n0JC7nx9EJIAo7su8mxEl7oeDEykcx/34DjSHvkGq5mq3e1
X-Proofpoint-GUID: jULgp606YeU25wDId3xuvU-zt5B4LyBp
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=686148d3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: jULgp606YeU25wDId3xuvU-zt5B4LyBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

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


