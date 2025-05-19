Return-Path: <linux-arm-msm+bounces-58488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB342ABC3CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADAC01889503
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B531289366;
	Mon, 19 May 2025 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aADo4WDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1174289347
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670679; cv=none; b=FfdYlOIhaQORHnnDDeMnoNnQaq9vvqW8FXZhnlb4VCzKC89m7l2iVeercL2ELGrNflO1O/EuKKtEr8+FIt/nJeHHyeIk2X5EcoAv78PvSJpfzEHXCgv1JXgGJ8s3GONq2qVIftVoOQ6t8CKX63nGCpsF56msBCisf6Q3Z8+Y1Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670679; c=relaxed/simple;
	bh=WNgc4xPaUHAvPxtEH4T+Z9aLA1Qirozxni9sok/zPIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iM36f8dyLG1Qj6Ll157uJ61BiVVmy9fXZ69a0z6eLU7cVO/dK8BmLbOsaHhkhfy1+0qZxeWbwpphegxAOdx6o+7cD/rLUt6+wZ0Mx6FW1Aks2LaC+c4RhmfIkHbosj2zESHAQ2VODYjMsxTRQFePkHE4NvhrC/PQnGX9olXP+XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aADo4WDy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9G1aN006013
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynPSdK/V5vuBuCDckGMsf5MJ26e7Qgj1FWRsGRLvduc=; b=aADo4WDybW2O3GvL
	UtpG6j8bcrMNM4vipcGM09NiQ+CcunScTQHxS5NNfi0QmeTpWlbYvO4kzI7L6ZwN
	suM4oGQvCzy+JbmVZRNyLG1KsYjoodWoWgmRko6kVRSoiPqH98g9xCo2jIYa2aDv
	rUTrOg207GacWdsbEZO6MVgoUaVZqNnYWZoW5oDLI3hBphBoeOiIBVVYpNbJqQGD
	d7ZUoP/d4KLrg/5T1i+0QfdoUjSJZVG8zKshrUVHKYUntqbWVNxAxRFga/tW5I6c
	uTI8eUKk013WkGlGcikDkkuMqMEC6F8U75asY0LYtgGk/yKGLoqWp1GGDId0XiWu
	JrtjYA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymxqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:36 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-72e90e6e171so1581356a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670675; x=1748275475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynPSdK/V5vuBuCDckGMsf5MJ26e7Qgj1FWRsGRLvduc=;
        b=L2fFMtNw0Xf6cK6kq2cawWWKoKSF8ccQUGHqpp5Ngru7TCY2tARQ0g0TxpEz14b5xp
         ZGmzIyiwXvPq6XeqpEu0ilVUnRN+TCXUjjosE7D2n6wqPwNf0k61QBRoZAzlamQewfrI
         KyODpV+b0HI/jASAYPNxbBCoMc2KaSDRk3SHzepQlEW1Ur2K9Y+TDHbJeOeTv087+g17
         SX3LjJnQcdlfCNuabcdGhjGFC8uIEAB0ewd4VVBd29Z/NZWY6INJLowIG2MZF7DYPxbu
         PcTgovfPj4g2tJoS4ImGhXiZC5RvBjeKFjxUgN54TiWqkZU9p71crHuzZ2SbYVJsscgb
         rWzA==
X-Gm-Message-State: AOJu0YzUaR0Q5rKd4WSQcacMrFYxd3uRKFOCB3ureuvk7k0Zf4lNCO+5
	ERjPFmEOA92adi7pD8jQWaYVb3sPfPx6t98OlLneo4JJqO6ee5xVPTMyPJrTd17LOEGOLuzK/ZH
	GkBhNjsWlWNaQj1Ue03ETGJxmDQXoOM1S4EnrUyjJzHt1dEOaZ/+qNNUs7QNaHlWn3+p0
X-Gm-Gg: ASbGnctlW0xkewj+BLiTxyPVedgA7hxOq7CVM/sdqe+xvvyysephRqxbSqyc/LleFS5
	6yGazoIRXt64xCSKPLxCoQMaGvXXfHDl7oOGzhRxvm3L2fRAIa/KiO3FmE3AROn3rvpA3e1z92o
	8ZiL4i/q57kvb2TI5JieJ+tQvCkgzpQrqrNKLBbQuRV9pd89a6yEMP8h4U0p1+Ff6t2gdUtkjQ9
	YmLTwetfZR6LhI8P+fiaKt1ymKvKRh43GO2234feOa+qWzM1iso/H1EzyCf0kyV0GzuZEiMJ4UR
	uJfrZnT1Zsehsk5LKs64aSzskcHlHWl3V/iks0SEk2HWNSU5VXm8nFSAhL3oE1NkOwduJw7nRRK
	dUsSM2uommgZjTBBU3hhaP3As
X-Received: by 2002:a05:6808:3192:b0:401:e61b:5f73 with SMTP id 5614622812f47-404da7297d5mr7267569b6e.11.1747670675283;
        Mon, 19 May 2025 09:04:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyZyTToIU/Tm0w29XMmODH4Q7PLSjPrUHu1JEr6U43DaJPPhGHJwdfk+R/oWRT6oWZU8XAdw==
X-Received: by 2002:a05:6808:3192:b0:401:e61b:5f73 with SMTP id 5614622812f47-404da7297d5mr7267536b6e.11.1747670674851;
        Mon, 19 May 2025 09:04:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:13 +0300
Subject: [PATCH v4 11/30] drm/msm/dpu: get rid of
 DPU_CTL_DSPP_SUB_BLOCK_FLUSH
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-11-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2724;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2iSXogYj98Z0EmWLJeT/h5TcIKm1RtdrNrUcq+04pEc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z7nh+1P86WtU/CstGK/0Rz8dk6nK9EzSHhT
 JRudh/xG+6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWewAKCRCLPIo+Aiko
 1XlLB/9MCpa9QwflqabW92gpf3LwFi+pewmOWsaany1ahhAkYV7v8mNVr6E2L8ndGQ+f3zoxZcn
 nIxR52XGe6ivVvKN/tuPnohrsj3Pqs2MocM8Gzdobb8PyUfk6nGSXPS96w9ruIZ9lozlta7nAJH
 4nYsFzTYJtw1c55JyedGvkm1/VJ+lGLH4t7+XowIizV7u6xtDxQokMwM1y2y7syb2hAaYT7F9/s
 FXA0V50M17AVEsbyxW/EWSCFdg52zYortLy9SZO9ZAzdfqRYylzZSBD4mBorj3opEWeX0P+Jlxq
 BB2qSzyOKE6xR6us8O1l1By9idqMWmuWCI7sRgdWwMp66iBv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXybHP/9qvnd0a
 dszXMJQBIMOuqCIvkVhZ5CE3hWycMzQ5fpOVT6BZUxK8IoPv9No/ozUSZiv7yU4ikhV7RwYyLA2
 kJR/bvSiH4KRSRFiw/wOK/5+6wOLQGag66zgpzdWDB6DLz5pPOxQ+hyVrikjth1o9rIzwrIIh1F
 O4AqyMtJg2BN14/HYAF7/hrEugmXSdxWRii5ewAfZhHIolcj6Gr3Rn0lzz3U1XMfYeOEtR28/XL
 BLmbiW8+BU30zRbAqO1jG86RjRSvkivwqChTT+N9rwvEQc+yU5FKkxhOeXToXN0O9crw9Ccw516
 vVEvUzPcGYXT0fDflElCed4z2JHABCSFzkz/22ce06r2jwHCa9BsE+wijR8CCYD3E7QL/j75iWv
 quToW6UqSArzoB1zxlUlZ5YlHmf5EOvbdbJCPKmDljUFuEfwI7Tkd1nTEzfVyTvJlaclpaF7
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b5694 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Yf7QHpgQJbPwferW474A:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vPxdZz-_yqaBCEuOpnRVCPdVlIyfMWZN
X-Proofpoint-ORIG-GUID: vPxdZz-_yqaBCEuOpnRVCPdVlIyfMWZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -133,13 +133,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5


