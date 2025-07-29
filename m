Return-Path: <linux-arm-msm+bounces-67022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C9AB14FCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5F2A7AEBA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DE428B401;
	Tue, 29 Jul 2025 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiwRHPIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B20D287244
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801065; cv=none; b=fcqNDIaZ27CWYVIbE0m5QlyEcmVpFK9qPiDZF3lLvGLBHKS/YyUAJ711AUWupbt25ODIp84MW+Ew4i9WHbIhY48Ias/g/OKQaL9483N2z/NdniZbnuOvPchont53+EZPPDXxYdTwA8DvZ959k7kXz3ZqwQm/sNNuiN90bxJURcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801065; c=relaxed/simple;
	bh=OjCcQPQrfynntfXQWE1QbRhM4jxC/iuvd0QhrBx8e+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/VpKO38uLQpJfFmtcPMmn+aVig0PSceOn7d8Ng2xHSu77CQzYsZ362x3pG3EN/O2zCz1i3W/rZiyFQG+fOeJXnbvhOL8ZM/FZaNYJVBFTQdGQ/gUOmctL9C8+h3v73/a9nOj6EgBiu1nxiolNGIHCRlaG15GD1ZdkUaa0RTcm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiwRHPIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9TCJX018846
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JAyYn1wklNQ
	c4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=; b=ZiwRHPIzkt/3rNNsb7aQ7Wtdd18
	2mqUN0vdF2ms3+s8r2S+BUfhg3DB9QllgpMo9D8qjvLLKrjXoBYHd4FjZMKKWieC
	8fSaBhWXiB7vzb2Y7L72RtZX5yOi6l0YmBmbBpJ6VKuDrPHc9dVSH5oPbUUSQKYs
	8iMyA2bzj3q0Lf8jptTAkVNWgj6+HpJdJrUVUGz7YVLEDNJIWU/UtPkLyFMxQI3R
	9D96nUziOkQ5C5PJwkRbyDc63Z5rz1VcoqkYJhVOQNfTjICVi3+HXgqfxk2oO696
	6gGlfUapttfVrzOnOsG5/7uB510eSrhwoC7KD6UNjmIsDD78n+PkExM51+w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q860md8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31f4a9f67cso7467274a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801062; x=1754405862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAyYn1wklNQc4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=;
        b=H+BE5mqqXs2MSxuJUVHZJd50UhErSnq720mTLHRFvolE823Ph8Zw21tiJvl7mDqQMl
         7UtuhRBDzYV5UpLIQwbrv23bfS4AmMk2dkSL7vfj/i1TGeH4oSPGjWML1WCd/SfloYj/
         wJ53xNmwGFb2z7D/yfz0v6xn4siMxtQqxkrtyQ3BjsKqMyu1Sm/YynhZO2oT6hzHVZ//
         Yrs836V0nGtuFAQWFkv3Wejty6R5RFLhTxUnICCyezfaHSIzzE+VROwi3QZigH9ao1Q+
         nLxFUUGBOcoc50HEdyTpGg1lBOED4ibjY87H0sytJfhkvVD5JD2UUkMN5rTYSRN6qz9i
         0C+g==
X-Gm-Message-State: AOJu0YxADh3L3aJ/XL75eao+b8u6NEKpvsU1XiE8Xo1kneekNpCQ8Bya
	I/4HbguB5xoQBmk/qEl+87I5pCczO/4g44Np2k6rfqrBEa5Tr/C6sEGv3+qwiJRBGEKyF/a6/iM
	OpwWY7Tvp9/rWdGWelTcP/61QTY/8bdDhC3p5QW4/ISFZRfgAzJJz8zgI6AwBssnJ8wbt
X-Gm-Gg: ASbGncvNq8g3JWZRCUHrAwKyaGRCWB8Qx3v9fF6BYklIEnX4Ccv9FDuZUZxlj7ycQWy
	VTAQFnlhmAAkJ64wOAaxJ+PMbh87UnjkSYPnU+k1bsK0jP0jBRmRHqfyRLWJGLnrkpxJwNYQaYb
	pn32mEYW7wCt0CSousIckE6NrObuHmursz2JR0YMUL38dqFKjeOeQsV5/8cJQCETmymMsobYo4w
	n9yCwejW8kAxvcjsWzoV64aJgVe2hky119pEKcAS5TvoZ1M5/L1trzP01V0GpdrADQuwwxGa3Zn
	97fa1Fz7DgkuWBE89gyw50RkQrwQB/SxxnPaLYBgS+WjCKHutEE=
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31e77afec2fmr23804170a91.28.1753801062159;
        Tue, 29 Jul 2025 07:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1VfCPq05jHjaQmPdpsTNpOERHdd8AcbiU4RZ9VCJMxFekjA0Y9XcD1WRvDW/ywpd3mPK6XA==
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31e77afec2fmr23804129a91.28.1753801061607;
        Tue, 29 Jul 2025 07:57:41 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b42121a2c8fsm1289263a12.43.2025.07.29.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:57:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/7] drm/msm: Fix order of selector programming in cluster snapshot
Date: Tue, 29 Jul 2025 07:57:20 -0700
Message-ID: <20250729145729.10905-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExMyBTYWx0ZWRfX2VGCZaImiEF4
 S7m/RrKX4qYYdc8AXj2EluEWAddQ52pGkl9eC8xed4cS4Jy9IA46HKErKKolg2H8Fw2b4BKsVUO
 QRPhubmKg/2/ofHfY7xvT60IlqEVRxyxdfVrNRFw5kDzVpCm8GoU3BufJQ2OLU9XamJnQSA2IDB
 SRKLdbtd2DnRDL+srrt/rJHmS6tVKId22juAfqrS4SHwjFSP+wiywuzEsSxRGjzpxNu5JVD1/gH
 284d5Qo2cjsO+x0kja1vWZ3JDA2paZK1Bg05eT30MF2Yf9FyPQEhbW3FmQawS5X17SmDWwQabTB
 UoiYWqXswK02ODqqT2od1LIzxfyW+uXXm0gEODxZyMCI7/BeHlIXNkSnWPIqc50tmPff4DHzLwn
 CpEhCvVjhi0GHJOF4VC23FBarT1hbCHsl/FlBhQPCkXb6Ecd5vLdZjQPUz84T/YTn+19A3Ng
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6888e167 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: qAq287dHj0Da3AbhRJfeaz0rWZIw3jkM
X-Proofpoint-GUID: qAq287dHj0Da3AbhRJfeaz0rWZIw3jkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290113

Program the selector _after_ selecting the aperture.  This aligns with
the downstream driver, and fixes a case where we were failing to capture
ctx0 regs (and presumably what we thought were ctx1 regs were actually
ctx0).

Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a35cec606d59..5204b28fd7f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -759,15 +759,15 @@ static void a7xx_get_cluster(struct msm_gpu *gpu,
 	size_t datasize;
 	int i, regcount = 0;
 
-	/* Some clusters need a selector register to be programmed too */
-	if (cluster->sel)
-		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
-
 	in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD,
 		A7XX_CP_APERTURE_CNTL_CD_PIPE(cluster->pipe_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CLUSTER(cluster->cluster_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CONTEXT(cluster->context_id));
 
+	/* Some clusters need a selector register to be programmed too */
+	if (cluster->sel)
+		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
+
 	for (i = 0; cluster->regs[i] != UINT_MAX; i += 2) {
 		int count = RANGE(cluster->regs, i);
 
-- 
2.50.1


