Return-Path: <linux-arm-msm+bounces-58490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 393BAABC3D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D1713B0A4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1ED286D6A;
	Mon, 19 May 2025 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwZMpKfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B2289836
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670686; cv=none; b=cp4mi9NNvS8sS/zOlEanco3lL9N9/wEbmoeih8yMtbAZEiaziUOiyoFK065qYw57Ud3iYjiUk3ecDiEdIiEjlGHbSHMskZ4k8Ts5K47VOjh10LEpoox6U8qtMdaALPHfvououh1r58Z0B488IxMuXRg0NJIDcdEb9W+NvhC1p5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670686; c=relaxed/simple;
	bh=HRCWSR3y+0OzQTN0PMjdQpx3WTNK0TJ/W8c04BRFJvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2ESpSkvD0t+jtnEwU8UClIuhsXno1O84Ee0Cp9AaXuz4PUoFkz7nPv3F0pxvThTcblAC66El6MYRCRQitMOyGa6vXSGSJMsH55tE785wOX171Rjb1n2IdTSJXHZ0ry6YQpkPTrSVD/eekcqs8b/bVSEXqFjcn5U6hsrnqhVuzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwZMpKfZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J97Uhi003010
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FDxZDgmGJjbMlAxepaAf51QdEbxjTOxCvkQ3C1XGrM=; b=iwZMpKfZqBrJb/Mp
	VQwaEdPsoB5hBoA5Q81vmcDuTLWhPnkgYtxONCIsvREINMIeAygArkj+0sHZb2as
	ugbFG+IorXZPPUaLeQTD9LBsntkKcrHhrC5vX8A66DCGilgCFCTeHLdB3Vd3GheP
	EeVBKHyu4NkEz8/ODAcmBrNgJN6zS8ZsKKI6amOxeyN6NLPmAg10b5CTAZwpD0S7
	+NEzr/lxvj7v3x702pA/5uR5nXvQrgIcqQ1Wlvu/0vWkvy8lQRDW0CFfpcZ0B33r
	qRk8T9tN7Hq7lYk5N9/XSpKsnpgJ+2M1UfhB0lrENkK5CxxB7ZPQrBHN5yyR5d6v
	DoOxaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn15j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e2bd11716so4668606a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670683; x=1748275483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FDxZDgmGJjbMlAxepaAf51QdEbxjTOxCvkQ3C1XGrM=;
        b=SyInLhJCWg5I6TAYDSVDBlob2mfNE8KiFjqsXBm1370IeBg2KMBEHdC6b0BH3i6Qpn
         BKjhI2QY2Gwj36Fpka77AtBoR1xh3wy++Hgs3s5HIIZHP1GTXhS9d9AUfc/iIRRAp2wt
         h//sHyGD2/Ws04tNu+3fODNw1FIoF36Zizn9HL1HnkXfkSU2H8DmUr/llvTp41uUbLsR
         YkT8SGtTJZwqhN7QO0f7ch6xjUtAaZD8cf4vK94Nz3GgBKGNL4oOIwT7scrn58DLrlxp
         Uu85T5vJ+epOu8e01uo8/NSRzRylpIDTGrxdGQ04CPpdPNeEje7vXjtckXBFaZgv0pwY
         V7Mg==
X-Gm-Message-State: AOJu0YwskPTNmueaiXWr2f6CwjPfYjpmk6Xe9XIq4JVjEQeRdrmiWgNZ
	V5hU3aqocMQq6eCg3ZQZGKhCsgIxQ8Rlk7PH/+ddBj4yeuyw6o1s7LywyEcr7EkTWkci312tBYd
	rQ8ci1N1xTB5faGzvqcW4Fq7QCxhCdNNMX0KFZlwIWLnOFgwp6aoJP7Ynyoci1x/alywQ
X-Gm-Gg: ASbGncv2l/59+xsBYfZ9eccoezx10blGOvMtqRDM2VsBtBW1UDiaIhWnuCeSdfXLaqh
	gs61+QsPM2lub5y4fRaRBtHZA2sbztecCL2cScxc65ym/c6E3tP9p9HBigFohres8x2IMdPNWYz
	UkUTl0xZ8mePUEs0ozljehpGwH2vOzdwom+jXDyN+lN656eEkm31Rr1S91nhW7oEoppOmCl8vgR
	4qys4BhJ9tryPFCwsdnqVMrIZrEeKREosEM6t80OfmBia4NeHTZL88hXHmVnpZLgjUL0+tiIEPr
	APh0RuL7KoUqauDUZF9SJ9z/0ftu+6+8IfOwZxMXpSPTbqlvddcJnrxpeJX4K/jTcAe77ZN/sr3
	qYKgqmWSkPL4rf+KV+Xso5MGp
X-Received: by 2002:a17:90a:c883:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-30e830c797dmr21435494a91.7.1747670683462;
        Mon, 19 May 2025 09:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7AmJt2W9PSqLl+REINIbL2UpwfMsIZhHh4BBFDXYL0LWYSqSNo9tzNZSmaPLI6OKd/1xX7g==
X-Received: by 2002:a17:90a:c883:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-30e830c797dmr21435231a91.7.1747670681252;
        Mon, 19 May 2025 09:04:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:15 +0300
Subject: [PATCH v4 13/30] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-13-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2814;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N0pAo8UpsrHulbvgv5s/riZ4AWFopP0/nbObm51ASZM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z7CHLv/uMqzIIhoFyY4/EEfQOEVUwYTcLsv
 30MVgIV/XmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWewAKCRCLPIo+Aiko
 1eXoB/4wONYdijE0h/v+6ALqSk6hFh4RquZOJ92AyGoByLz/9+DD8NT5XciXqhiz+LN36wd7smm
 MdA7z4BblJyVXdepPz7abZokU5uoJPWUnNptYx/X2tcj1RBxaq4W9PdPVo43jBoO73DUnM7JEZT
 CSGt6Xvvx/PRcxALTym1m92HnRsqDhjvYZQWoEPVvtDiQXWTYkLCpjOJ8maRlaKVv+xvesfVRrB
 MXagAk+g5IC/hSu+ILsUYEW0gKyXVJsLgOVgDf4nT/dpjq4blREyg0pD5qSmOGTu9byrM97Hwld
 xH17of8TPYJuWVkhlfpq1DK2PY42xSamfFf+WoUtCZO2TNjF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Hjr4IxXibjsxm1ly1w6XnPHbJAbOBI2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXzT2dFqy0uDK+
 JLP+gSSAJ09JAMudgo+wDw2+SGCfWpEFUP9DvM/NDcRtenvCRgJZvpkGZkr7w0CiE0Jpi4h667l
 hIIY8T2IN7NhkRcsaWntp4VGjpDurX4TzB3KtVBit1V7xuRHsxujPdufmQH5uthXI6L8YcNUpvo
 iGhsir6ePewrwNX1BgodQOQKFl7R+ZVaZJ0o3TalQUi/mu7aJjaINP+oP/Onvv2RqHvSQ2ZiCdy
 RcYqsuGwTGbSZcM9O3TfXOjDowdczrj1HeEKPyfXKeKtV8EptlqEGQdY3ywcDaJyV7O16eWUeno
 2tkPi7qpdXvmUIWmCfXjF/xHsn+RiFWY/y0lpNIMjBlBQtluE48Vd+F1Uj5v9ybydmpoEua5WmN
 w0zdSKmc1PIXnSYXFWyHf0MPO9hnskFeLgGk9/yNrB5RNwy3SSebZboWOmIwHt0ymRItgB3s
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b569c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BlGH1-kmwhya4yQ-KWAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Hjr4IxXibjsxm1ly1w6XnPHbJAbOBI2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5cd87b13e839e7ad60356cde162405fdfb6f9498..1244dd59648d11123c507a1369f28f952d047fd5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -106,8 +106,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3b6133e1bb581741fe87b049ad0c89bf30b76019..bf6b2392efb47fa8c3e3c5d17f1a72341872e18b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -143,14 +143,11 @@ enum {
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


