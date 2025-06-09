Return-Path: <linux-arm-msm+bounces-60670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5117AAD24A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 19:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9A197A4712
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 17:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5703721B9FE;
	Mon,  9 Jun 2025 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFmIYHui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE821B191
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488692; cv=none; b=nFi48lLbPNsWq/L6QiDbCybY6NMDWSkiFdGUp6AfKUW3swkjTVXVRxi3fIPnxhuEW6JJT+07aTq7AufkmfX32q5h8ZRE1r/Onx13AOkvvHx0ooz/isx3FP5Z3l5eFz1hb2NS+XuGeAZUDbCafMQIqFw7OH62GtRRTG9+CZNHBsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488692; c=relaxed/simple;
	bh=hqqVwI2DtCjfh9orO/cac6PjLKpP78bMvl+SrAmC4zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPlDpmowNLEP3MvGy8PJQhnIMEj6LrodEOWcYjtTv/GM7+IrstDrtdjNlVOYjJLmaJGaLU+CKEuKH+F7cdRVfjGwp7PCR8MzfNKdKFYFrD0jtiPNJhZaqzymBWbZwxVheSx4YeUoOSUjF18v0WhF2D0wprkONbt1ibmrRjuLDTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFmIYHui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55994PtM001845
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 17:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F2gwz9xWCvt
	M03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=; b=DFmIYHuiFIm2j/q4DYDF2lOaPG8
	vjM9yH/w87pXIYloXTsVEv6twpb0jWJTThbJ5MI5E0qF62wKbc9U7Fp0TDtjRWLc
	wCEEtwHQRq6vpOJx6QP1AmbYLKWCnG9k2IvJ4TuLCy8ZhifcLUjKNQxj7pVJwbYP
	4Yegyxruw4YrAtOdmVGWabtnkku3OHKY891DhWSrI44pGjQovrwAIGino3cb8xWB
	DDhYSlIbQB0U9CXFbyd3t0/nctrNrKfXZ5voRuN1SyCpELXsjGJ2PDqh8lu2tJDP
	9X+JdtTE1vu6G8XfCMatQ9gTnWduivB6yBJFxKfvtkLVbqz+joXoCu5Heuw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxq2gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 17:04:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2358de17665so42895125ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488688; x=1750093488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2gwz9xWCvtM03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=;
        b=qWSGxsZDuVljzI64hcapPZsKldqIxY1z4e6Oif4S58S3XBn8HVLjtF+xulpG4N6QlQ
         BrvOopx/eCcRZIiiwVtZ7OyJCcDYkwYGb6r7sAaA0ZgPsaMvKLMRG0AoKBaLUC41QpzE
         ewKhyROAJJtqMJ/HbJJaH+L37RIUn9vxUqWPhPs0tfZG04lwedpekC4/tUIdF+2pGCX4
         AQqvqbvEUKEipgmPTVpn51F9duYEfv3/iTMjyzEWBDngNLDZ+PkEQjPeOW4E1Ol5g/SV
         Qbx/+nu3TbdPYeb0YzPPifHg/dpCc+Y7+QFAS6ZEHzwGxgDV3Chf+5X3cc8a3Cw9lhf2
         Tknw==
X-Gm-Message-State: AOJu0YxGT+5FjCN86LAlkXNSzM/s42vK3qwR9d2HYL24cFWi8dTqpf/e
	jm494EtVXNdXYAQVAp87jmjAWFftAqMDOzAQQGTkv9hwmv2so1n7x+4OTh7ptd3AGsEIitOrsp/
	plohKAcQaDIEkYzriRfO4AAD0069F0Z5mp4C94a+6Rfm5XJDICF09FlWuUJLh4wU5drQo
X-Gm-Gg: ASbGncsDu3Tbys5al/+gqHz9GhvK7ft3xx6yUigD5bn0aAZmovcIbYnCZv48K/I0ZQH
	enykegyfZyaOCqmJsH/14bT7feooWQHfUD2T6j/VoPpq/Ih0mzKMPO3w9h6WcAYlFxGV7i1iYPL
	djmR6H5y9Bwh+Z7KLdDQxwh2MyIcv9VHLbhx58aUrxHZJ5aHQ/A/rAoE6p4SlQfHKXScytxCLX4
	rqzG+zP4bqvEM0zeCUVYm5Y59f025QL1hBKxqlfpXV+MQ1hdjoNXZcnORQLkXUmJsrAMh+G2grd
	c2LgnZ3OKncpO6r1TSwBlA==
X-Received: by 2002:a17:902:d2c5:b0:220:d257:cdbd with SMTP id d9443c01a7336-23601dcf348mr200552455ad.48.1749488688231;
        Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Cia52Pz9TP+vPUc/qxfkyKQnpKKCfw3Z7/NYylirl2PJBjN0RgEB3Shvrl9SsiqWE2h2gg==
X-Received: by 2002:a17:902:d2c5:b0:220:d257:cdbd with SMTP id d9443c01a7336-23601dcf348mr200552095ad.48.1749488687819;
        Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236035069f3sm56821685ad.231.2025.06.09.10.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: Rename add_components_mdp()
Date: Mon,  9 Jun 2025 10:04:34 -0700
Message-ID: <20250609170438.20793-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HQBY6r6r-AKJ-Gyw9BDK9KrCK-WzTXF6
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68471431 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vt6ngUXDG6_mDpkR7fcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: HQBY6r6r-AKJ-Gyw9BDK9KrCK-WzTXF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX6BNQq6y+2dSR
 KUpGuGGGLPcB0T2bSnMT2M/sFB2Tuykr6yeem5as2woWd2KgLtV4OR0vSnrC028eRpoM8lOFp1E
 tO+bPBAz3T/+XTGs/ItHbU8qO5c7kJUy5JwZirTkSYJfACQwBPE3OL8b+nqcqXMD5tkETslRqOZ
 ejxroMdtCiiAaz2RxhJLHcUNZtmwiaBjx+gJtPMlzjg9nBEoq4+IdL6sOWfb58l74dxG52aPyIQ
 Qe5OWbfKPj/tUAkJmUG8+tppts5+QYXCTjxK8bwdkgGQweJvPv7hkyTYyJOnMy0XN2i8c1vsp1r
 /Sr0hf/bJA14W8t7zx0rKMZqrtr59mseCLXfXUiblEjcA45BmsPzBxqX2VIaF2h62iu1+/tXJ/b
 rEJqqVEmI3r9opOoMjMOKdRJvbmsM+rDssiy5OD5CtMBtKtOiByI3Ulhbd7FiRNkbYJfBSj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128

To better match add_gpu_components().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..87ee9839ca4a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -852,7 +852,7 @@ static const struct drm_driver msm_driver = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev,
+static int add_mdp_components(struct device *master_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = master_dev->of_node;
@@ -997,7 +997,7 @@ int msm_drv_probe(struct device *master_dev,
 
 	/* Add mdp components if we have KMS. */
 	if (kms_init) {
-		ret = add_components_mdp(master_dev, &match);
+		ret = add_mdp_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.49.0


