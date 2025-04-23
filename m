Return-Path: <linux-arm-msm+bounces-55200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F34A99A52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D0192147C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FB22951A2;
	Wed, 23 Apr 2025 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfYqH4wF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0523B293B70
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442644; cv=none; b=nxvBTR6kqTcllUM+6bxgPF+KzNz7cyN8blDZBbH5KChGeIpzjOI/cgxz0WNzPViWoUXpa9NpDZ/Y61AcwHtzriX2ICDnzwTeZjhwgYXuWbIEPoMR7ZaCoozO/QNGhWkhGoYKVvf24bMF4LeJFfd7J+n1CChtmCD5/94GVpkTxaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442644; c=relaxed/simple;
	bh=Qq5XvcA0YGKdKNPxzqWS5imRPhbtp8uyGYUSCRslsRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N14Ringb4qN26pPeVljbj3P5sKIzLkpGUSVHH6NhI3buOxdCkkMJWAsHiuR0EsYC5yWNa2x8Iz4WYI448k0fc5X8Yvf6xyTXv82K6VCdbsgbIum4mD+W33N2K56u2sKNM/97T7+MsKUSBMODf7Fz3eOFqJLemoszIsPP/eGpGQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfYqH4wF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYx81007939
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zG9tzSmSs7vELgPwRjqJOaR0OarGdGoWbRrRUzki/oc=; b=cfYqH4wF7EXHHt7B
	FTYAKjigkrBOKB2A9++jxLJP+FAiKW59Cn1ibC20qctTjYdhZXSQTIC34boEaaVn
	0cXkSlrp3eYvQ6U6Oj4cFfLWL3gtFZIcLAzXK6uuLEK99T1V5P5CwjClQmyfBBVx
	nfIvhZLdk2MpUwZxA9hL73nqtFiNaiPfQ13DTZwtvPy90GHH2hfTbGoOwxr2c7mL
	1GtClxIhIby5Zu5X3TK2fgFxUXVZux806oVGAn0JQ8fzq1JiHkqXWBmxZLUwPdtT
	uVEcy+rMYwwdNpsmj9NPWStiBSV3qzg6QcZe5R0fAZGsxJEinahZYjjNBTu/5Tvq
	HQRJjQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5bdqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so5921466d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442641; x=1746047441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG9tzSmSs7vELgPwRjqJOaR0OarGdGoWbRrRUzki/oc=;
        b=T7JbjkVRPSRc95lcUYLGudjyKw6oYQaku0k+s/vc8WA/IkiwRO5HMi0QcthjYvF6oi
         53sa667SgV4h8Feoj7TKI4sDpjQ2ZL8nC3/+QhVz/aY4fIbJuD2tCKCWmOTrP+B7wB5V
         PXnZ6wQYyAty6S0uT3SW/0UuQ10ICgmPPF4NbjvTFgKB9ZGVQFEqMe0ol7mffvtrD5VP
         wW64M7EVC7JUpvdmMj4C+6eT8r/+0QZ5JfLrjz8LBbsx8kKMZc/QIevCxVDIz3UkUPal
         NnORL1WdXzhspxnxGzNesHs4/IlpES1ZeC00MimgDQF+H8IZp1ur95wXn2cks+2Qqf3j
         KKow==
X-Gm-Message-State: AOJu0YyNEIfUhSPrVZ6e9Lbhg99FIyXjNqOXmBC76HpGxqoCt0dpWYWc
	vwf2hDxplz1mWl18z/ENNrJjfUUTMaKn7Mx4EIHKkaJ2EhCGJKCiaGhg67dSOeDygQo+kpqeQFD
	oQWaN62/2ermRdHtF2e0gAhtTGO+zzvTIbHLZ7SXiw7xW5pcRlIsKjvnbHPI9nTUN
X-Gm-Gg: ASbGncu6evczhGCHU/t2y6WNuWvg8WZsa5BZWyx6BtDl/XFBL5qeUHsLy7X3WrHhwV0
	IB5g5BTD6SbccdzLGNruK4Szl78e8h31Cl4yAfQldsb1s+wAg+Gvf/j4sK1IDlFvr95fxlvqjQu
	8DowmqGG7ghni2aUZbOjI97ued3goNRRt8Cv88y/y4A2nd64HZQ1JRHDUeNWrU/eG90Ag1Be4E6
	sDqrs3AaX3TI8ixk6oVazVpErBYaFuT8hZlT4Uvg/Zgyy/d+xOXk5sPVQQIM30O1r3PqzHUWFK8
	rmjTnayxltiKYT3AFWNRJcthj8bj8wfMwVRwaeYWklX5UDhl/kEEEbM8l2oH3GtjYFUSLU2Ongr
	/bSAK8jcJ7Ymn84hKoteQmICO
X-Received: by 2002:a05:620a:4694:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c956f66bfbmr45973485a.42.1745442640826;
        Wed, 23 Apr 2025 14:10:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPy+46hZonIHO68S6GxeHeSfyUZSb+0MN0t5zKg7gumhop9jxpqvEslKjNNwpYiIz14V5+Q==
X-Received: by 2002:a05:620a:4694:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c956f66bfbmr45970485a.42.1745442640448;
        Wed, 23 Apr 2025 14:10:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:09 +0300
Subject: [PATCH v2 13/33] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-13-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMvwZw2IoUGRGV6OIhReHxHfhgm4YrJasKj5L020giI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcsgHXSRWQsQpb7cjMEJ4q8XMjB7P0NtBHbO
 UmFK5Vs7QuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLAAKCRCLPIo+Aiko
 1TjcB/wIbmuUwTeNRUvW4dGyL85rL8ac8oHysgu2g9gKUuC9oYDQaeqt2enNDmjDMIBWEo1SsZi
 EW61+QeJSzm8t3YnJJHb/fid0qGpMRxeYrAXqP0x9r0bVAiglh3Ye96Yi+VAxggdGX6mNdTqvTo
 kJ2Ra6ZC8wB02tPdfpdskdxRiB8Idwy6b6bE7UILMANizhDQkY1kiuY903XwbSHeArpVTgNNSfq
 E3S68/AKz0I770W25Q6hNohRbaOSfQ6t+Ke+WTxt8RpHpPcrfjTiYkRFLexY/AiFz9V0HJGsOYq
 iZatFbp2AcQTe9swXeDmyoBfg2Mopct6BJPfJvFlkJpqyNf2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX/WfH50uQb4pT kpbdFAkQPmX23skLp4ZitRPdxnzlL0+YwcrqqLhHINkfdLDTyyfgQ80wCdhj5aPMGQydJMJimks NJLvmBQGT1XeEMiHcPUqaklLqqC/6zB1AkRSFvT8dmd/+VcTiWRy7yEZ2XG4kk3+OADVB+H3oMA
 4BFgJ+2y0hSb1+PppG+XEovKR0JBx2sWLYCp5F7vh5VBnMLC5uPjIOkMcc/UTwGvCDXskZn0FRB R+uzSzfe5jG6gxwkpTmR/7HfkNq93a3iYWkGMOCjoI6NIhKo+Y0J8Jl9BCq5HZPutFHbrItY+6C Hyl49UfpsooZGvEZNnwe3YrpU6SI4SlYcaYPLaLJOfnEHMa9f0M3mOY6v+bcB7i9P0+6kinI4MS
 UTEn/fksLoyMVphc4GgI4OCDlJ6Xhr8dmJTQqRvGh3TY38nRVxINzYIWRCfWPMh8GHGHhbxr
X-Proofpoint-GUID: Y-V2fsn9negr4VRyzX7T7oW0ftTanQcM
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=68095751 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=BlGH1-kmwhya4yQ-KWAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Y-V2fsn9negr4VRyzX7T7oW0ftTanQcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 22ca093419059600f0ad7e1e7a0a4e443b977860..20f4700ef9969003cfa4728049b9737cb9eb6229 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -112,8 +112,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 27422a5a340b90ee02f36a87cf1bab9d97504c76..36100e21135fba09fcafdd5d36ac919cd17f63c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,14 +145,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5


