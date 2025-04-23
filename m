Return-Path: <linux-arm-msm+bounces-55203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB5FA99A5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3841894E89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C059296D05;
	Wed, 23 Apr 2025 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/v++iqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137442957CF
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442651; cv=none; b=tCKVGyyaG28FO+XHWv20Zy+BBJvKphSlEfmxt9y6aWeCaGS2r5ulZZ9tcdyicvfA9mB6vErONz8V56Ov7zZgb8JAqGj+9dGVba35yrD6CPrId6uNC7vUlLNAq4idUi9ghc1iMduj8Ifw/f0aYX0E3kodP/spRsSah8dMdMcfylQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442651; c=relaxed/simple;
	bh=Kn7LnEOspw4wyJir8FIUyhf691eprhu9KYAd0SqNSUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojSgRRC4gZ6CjX81Rdj8bUC+QeRnsjfx7Yy6PvGoHLrNyj/hqybtBBwVZTYuJyX6JNhmL/uluwCn/K/soNbluskrdWsovZalfYaqWca0FoGePC1Ht49PrOdpBcUKL3JWP15gDRzIA7GugkPLBWYnp0znVeM3ukV0uzwTW2J5iPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/v++iqY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAkwaL014559
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xs+uIoxl8AeyPAUZnxjtQ4fq8EpQC8L+d76PDpvS5dI=; b=N/v++iqYzNZmNdUv
	vIsWPjsvMHE0Ukpd2ed8J7EI0tM5/MPTsxaWIxLAAEnqu76v/w2kPZp/inYHUi+4
	N5a5ykipEbDnf2aX1smazGjYF9ui37NjmOHPGR+pFIsoBmfIA/KOov6PYfO41qMM
	0BQYWEcj0GaxrVX82snMciQDpxlAZhRmhGbGnWUXY9rfsd3pvQ/ToHNBronIdK75
	qggMumBd6h2wEDVwBOuaF0+J778AtH7ylmitDYgJr0Onv4xzLOP4ny3rsBk4YwH4
	2razHuKq7hlgsT+RDwAKCARnYiQ48IKg3zHtihljg1X0Covkz35rImefVHvFykfB
	oVic5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0kcwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so44381885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442637; x=1746047437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xs+uIoxl8AeyPAUZnxjtQ4fq8EpQC8L+d76PDpvS5dI=;
        b=D4uzHN6kA0CHUWV+fmnmB3Bc2QnTWDFSFOalVeLuo/OJByQ8bCMg4N65LNs+QMiT8s
         oFrMeSxH8GQHrs3uaRxs4s+lIFFz+qwvgZI+eD/B+DDmKkTHC71ZjwH0l/4TVGFqxa+w
         /+nnqEigmd3pEX64UgzZLvVTbiYhMzG8S37MK1gssyKJNnQJECHsSiInWOsne6W0yRgr
         NVT1jkgG67J+aR/lEYWstlu+0RXxEnbSGzjdhVvuEKax4zuUb3WBDew2hfWO+01cA1Rn
         wmIAZ/vw7iM1EJ8KRilfAf5qS82PfZbK5LJKdxFU0QBaFl13xmk9bYwBAU5tVrtbogJs
         E4aQ==
X-Gm-Message-State: AOJu0YwSoDp9HTA930fz/SpEPhTXunhrwlHo8qV+51Old87pv1NjvsxC
	RBt061ZkwoVQFEO5uvECwK+0iEMVZ+ieyRqq14ir7I01yaMM+kjs63osfPpWMSFealE+wtJnsfC
	X1kTDBNJQ+DTmSjQwOdBHjgRn+DR1s1ckr4RjmpOKFcCLRegN2wyRiavz5wMczXiP
X-Gm-Gg: ASbGnctrHkzyWGBmH/oT+YAHj1OmyV35WOgE0h8NIgFWbQIXGJKZqNkqwTfyVqMvm7K
	DLBTy2ZfYfS6VtUs51uNJ9frUngRHbYxxcJs9d/YK0IwfuYZQINnhgT7+oE7eIu5HOxMIWfNorI
	vzlXaC5FSnelxn/AiN8eiAthXawZrYpZrIzf3UI5c5/e+sZNQplrs5A6AqcbMXRV8T1PETS4mRA
	Cjg5nSzbTD3Hic1V9t1sq8quQxxmGOpuLGd2DHDLZ8OaEz0SzBelwNsujDKvT+7pnoWUxcXfX+w
	AtjoUQzvJDAVKEd4vPzxq6M4NxeybXJosOaOYOmDlmy4dMNPGWYk+jtSDY4Q3w8Xg/9PgCMqjUm
	670ixOYOpQJo29+Zjiz7CxRla
X-Received: by 2002:a05:620a:4708:b0:7c7:a55d:bd0 with SMTP id af79cd13be357-7c956e7c5d7mr56527585a.5.1745442637425;
        Wed, 23 Apr 2025 14:10:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDIJD1KlR4wk6aYH/6YayoRtDtc8SC4prgpQZcbgUQjtH4R09nKB8r3U8yDIXktBrczFNTUg==
X-Received: by 2002:a05:620a:4708:b0:7c7:a55d:bd0 with SMTP id af79cd13be357-7c956e7c5d7mr56524585a.5.1745442637024;
        Wed, 23 Apr 2025 14:10:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:08 +0300
Subject: [PATCH v2 12/33] drm/msm/dpu: get rid of DPU_CTL_VM_CFG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-12-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15065;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=47KdKwzl6eJzgTGC1PmI4bMv2JSspbmc7E5cJjyGADw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcrj4H/9vgx8RDlqmDBtOgR/Z79pVvO5CMPI
 ToKAyR8MGuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKwAKCRCLPIo+Aiko
 1YPKB/4mwyvTxeKUS3DrSHFcJmt2qaBm/7qEzrakKoCHi7mLcujbsh/dWONGKJItujYwyICdlwr
 8MQBRLBHaovNQ6CP3SV7VjQZKpEgKbIVWkH7fyvBHg8gvXMKgM0uO20ZT0UhtYgt+rHe56q2Dra
 rYnlx8bKg2CBitv0hcgb6x8rlZB4pDug2XZcLxoQ4DO4IWEKfm+vkk5rPu7OvfXiZR3+f+KcXBI
 +ecuhAuJGmhfuPoRrXcM04AoV6IE6Zu00vHsdNVVBuSv00LpUdovJRYRTbqM1ZDkJz7a110jDJ4
 3IiDfYkP2j1mh+wnHypMTCXP7z5of231L1OaGclaorkCibKQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: BjrKHOiKZghTZo2wgcgdT9bsvcXmobfJ
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68095757 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=2tDT8zELnxangoEIUYcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BjrKHOiKZghTZo2wgcgdT9bsvcXmobfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXwEvPB7EwQnBt WdeBFMcx0YfVNmr+FIGB4j7Y6fsq2BMp37VOF2+QyUeh+qP6BvCnJca/9mfbU73CvzzVHj0AaH9 WXvNhdQoXuHBeOWtAXm2L++fXgfSQGsG1xmXa386uxw3r5v0xzZz1f6GRDIYJwttopht+Qpcb82
 gML9HA6HapO1aAWBOL5mbm9cIBuW2Cb5tqPZlkZCe8Zx4fLYCTK6zj0nwtuVUy8SDesel/VGak2 T8xshByw8bNZT7xXHzDqZIgY09qb7XyCxehTNUwXBec2GBcq2yGL0EmwWTmxQkYYKHHhSFtGzDo R4pu10HaK/goag1pOoZaXscTXDNw/fUv0Ix6OPY3mQShbcLNYutvY+T4Hc+uaqlfNh6nQQVj2vQ
 2dWkLEQd2LrqQsLyYZt0k9MV4M4ai69ooU5XnN83BJwMrdMAYtsYCkvi2ran/odQeiPnbQ3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_VM_CFG feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               | 2 +-
 11 files changed, 15 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 922c9c6ebd82cdfc7f948df590091852282c9f64..4ab361b7c977c2c97927543154d5dcd00091879c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -32,32 +32,28 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 6fc6083607403be8ad2287952c99c7bd4d30f2e4..490ddf9880103fc853b5187256c4b960739820bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -40,32 +40,28 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 281826170da082fc90a05c641060901ece0fbed3..2ee29c56224596b3786104090290b88cecf7b223 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -32,22 +32,18 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 957e92d63f07723c8834bbb6e9c5a4d6449999a4..dac38e0ade971876c2ed73b6d46cd4055cb77d2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -40,32 +40,28 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index ec0cf30306d2adbd5f07a2b6a6a443d29e11f712..db332286a0a92cfda434571a2a582c45460e5300 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -41,32 +41,28 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4bded17f2e371a48a5b21808b9f0c55c00efbecf..826cd366495139e0e4cf1862e923ef0ece0d7184 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -40,32 +40,28 @@ static const struct dpu_ctl_cfg sa8775p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index e17345d954f26b234ef6cd65843e1cb349376ed3..f5f018381b4f0f59c2751b18528994ff79555d58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -32,32 +32,28 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 4d37587d6a6374d9e6ed6d8f13837aae0ef55c34..ecda48282f52e0fc33b68117650b9f2b76c90276 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -31,32 +31,28 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a2dc353151f3e1a4cb8a9f4644e7fc2e037356a2..22ca093419059600f0ad7e1e7a0a4e443b977860 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -110,9 +110,6 @@
 #define PINGPONG_SM8150_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
-#define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG))
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1c6be8f93b54f28d370a379d1edccd178fe3cf7b..27422a5a340b90ee02f36a87cf1bab9d97504c76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,12 +134,10 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_VM_CFG,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 543fe12252b7887ce2bd28abafac3be7caf17ac4..7f6c548b626dbc5bcc3ddb27f185f336354dcb37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -568,7 +568,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	 * per VM. Explicitly disable it until VM support is
 	 * added in SW. Power on reset value is not disable.
 	 */
-	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
+	if (ctx->mdss_ver->core_major_ver >= 7)
 		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
 
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)

-- 
2.39.5


