Return-Path: <linux-arm-msm+bounces-59119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12DAC145F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60B08165B15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A712BF3EC;
	Thu, 22 May 2025 19:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="My/lwRct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3416B2BF3DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940657; cv=none; b=caFGPpaNVd03P7+mMXEPLx3LrZp80FEJXLmjBhv2cJZtI6JCj14rB6LP3pgVuV30F9vleD3isU9A6Pg4uOaUbiP5+GrJ23SqD8IrE9Lcjg+ww4wml6/eRBUuVzQmysbA+4xCewGVUGdwqFl1FM2L34C6HyNVWWRN9ShtnHXRliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940657; c=relaxed/simple;
	bh=Yt3mSGf+0WKdOXnoSWbgdfjz97ORzWCa9DQMuZ1UL+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iEUFJj82G4OLzMxBmS0y2zK1kv30cAAKGwazrk9nAU07GOUdKdiQxlNTRpuy7bhy9+DBKS2SReCofbgmzuFMub2lW5ZcV3QKLiUswjp2v29tUYNPTf5keckCuomYskgYmzcyjGwLLltJyZs9mM4+VgYi+/bKmobbwBY6oxoPHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=My/lwRct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGCJjp024764
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	meSvyd78U1CHNUSu1sjX6MVvdc93GQx+HAJc+T3ka+M=; b=My/lwRcteVTKz3B5
	lyMfSYmXpea+e8fBktUmgG1OfNTLd/1xDDUQyF+5b10vMyErxH2hhs8fjPwP2eA4
	6JD6/WeS0OAT8ZGtzFpfQUwjpachftX8VVJhAc0fWKDEJmxgFsxbNMypo/roImmP
	8O538JZXkzFXuMrhqT/zXVPPxv5CPzzvXJHlYm10xhr3Kn6yKOu3TRhNVPInKcas
	Hya+d2+Df8tGCPDY79VkDgCMOUqUi9I7t7jH6Rexyxttydd9FMKF37x48pCuRQKZ
	6VWGQGQRkbrCK9lpUk6yQEeeKcTFl/jlwWE29PARImClkNV5aRzDemkNFi56k6eV
	aaqFBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4yd1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so1330272485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940654; x=1748545454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meSvyd78U1CHNUSu1sjX6MVvdc93GQx+HAJc+T3ka+M=;
        b=f5qHeUzGICXa5/EnMZm07+ST+EagxTAPO6MCpQyqJoNtjXx9dWDS/uAkeDM8TOiGCb
         SErdMsBigKrz6CBSQI3QSc6U5wgBrN6gRLkREV4Djsrx5eIFlqmoZJRz+exynRB14aLq
         Ip/kgZI2gTEFEWaKRpZS2VJLkefTVdArEtO3je73NKf877g9OQd72S1VxM4rlV6YcUAg
         N6RTCSjhjSP3gTBl1B7jE5Mhw7MEcK9LaEpPeqn6/e7qvQ6tF263ZiwNCRyQKEjnET56
         rWbpRImv7YW2Dg9SEyW0CZrpqjRWPo3c97ud+58Wz83qEghqIxqKzLAOT8bJi7th9IKx
         RS5g==
X-Forwarded-Encrypted: i=1; AJvYcCX1k3nExYzHRssW+jd/41bMi2gq6+LRbQrnFqvwQjNBEtneEheeAUvKOjO1V5uWXYnSgjnhBVhEtYdsM/Rc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0u7J9nlVLRLM4o7kGcjO2X7pAGorBV/e4nERGu0MP4FKE7g6B
	53l43VtoAMy5rFGmrSZ+iJ/hwwnf3Sb8Cs5qffNglVIlpBxae0xEj2qB+Zv4MU3KHE4ZbEJ80AA
	fB0N/cISk2JwXD+PaTZJs/7Vpa7vVqYYinAoLwarV7OmxpyvEOzXlelFHNwj6D2uHva1b
X-Gm-Gg: ASbGncsj9PJLj9mkCIjfAlMZcr90yoE/vYdrY9dyDwA1s3q9GVxgvI9imiTdCvHMl2m
	Z6y4HXeQDyHmifbrEv1oZEO7b/r21cwiAPYbLEhy1R++KyrTDMQjzqZwBofMNBgQT3NQgrHwAHV
	pn5GzUbuz1GapJc4ezp7mPsbeyE29Go04fxXG0ZrrqNwKfV9Phjz1w9IF4TnLwcU7Bl1BjDTCOv
	J5txlHfl1xiIFFHUxwFlxJeoDVZ2vuvXtSw8XMP2tl94fkJt80Nega3HhQsFNAdeuWIxK+qWq5W
	yN17unxNPil/CCUcrP5Hl1AwyfJmaBFEuhPoqSufMEsVvMkY5O1SYN5m94HmlObbDdxmblVZTok
	xKTNYD/GCXjeMBdhRahSOQZtE
X-Received: by 2002:a05:620a:269a:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7cd46707ca2mr3516549685a.2.1747940653733;
        Thu, 22 May 2025 12:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEoBlcr8uJlH7OZ06CowCuAOkcwitzCRot/aYYoXoCrZstqB6iXIlg4LXR2UGY+FiR+3ACNQ==
X-Received: by 2002:a05:620a:269a:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7cd46707ca2mr3516544885a.2.1747940653362;
        Thu, 22 May 2025 12:04:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:33 +0300
Subject: [PATCH v5 14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-14-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aJLcwGKHuUuyJyLVdSDXU6TlIm9ioIVYSavHMvjyGfs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+yd8mTk2bq+c+3TmX5ynanBR5/773oyf8stvcI+eqP
 5xp8ra/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATuRTHwbBc9W6r95vWw+vO
 fEo33H74bI/AE3GlkzUmPAceJlx7W6nltuSGa/Cfnu9PgpfZ8dQ5y2d4WaU8/cZoa53SWLSzhXH
 axj0qGb67lFL1Cu4GN/Z1NzzNDGRqeF5/ZL2Ng/qpIzOebbr7bRpf8LJivVq25Nec3SeMQzJbeh
 iqt/zjqxS9Nfv+5t8Wa5sz/Pivp8h0MDoYn7Ew+/5rsrqPzOlGreCOWhcjsfu3jbxaan77z9B49
 ZdP1v3L+rzV6mJZm2t3OWxqVZVaEh/HzXzAo0bXgemC+/3WegtTnRB1c9/6wDVXt0lJ3f/Gu0aZ
 m3cjr/1ZFr2+vrTST6amdU827Co+kc5yOMKYYf/j57MA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9oq_vgnSgY4zkV-OFx1eFtKszJlYCQtF
X-Proofpoint-ORIG-GUID: 9oq_vgnSgY4zkV-OFx1eFtKszJlYCQtF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX7cP9sXgG2c3D
 bWnKelovLhHa9qyG5GGMnw/Q+Hd6FzppqzHSQbapOaj6Jff/g0AV1it1cpYbbkEa/kn0jt7Fxt9
 QGkvLiBj8GK/HwVmXsZ13G5HTYNICbed7NLA+jnye713y2BcP/jV/hmcicWrNVvCQvirKC7Ccbg
 dFFS9PlR1+L0dqSixuUw1YErNWpggbcEQXevD6cCRXyJzqMpCmiWGWhaQFrpSbtpEL/egws+f3m
 dXZu44TKiu9N6qgmUzBtU1GTHgwTj+jWAFwAxa0aeh/qAZ8zf+YOBlTRQ7ZM1+xqmZQRjJyVwjs
 9dD11b1EEWguvjfCkCIBPJDhmWMtCjVI88CQmgslbvuHoKiQ6muPeqCSO3VWztln+EKu0TRMWrU
 cIwP6P3TRGOIc6jvINA7rDQuwr7EqxvLK/oYzKbI2iAgSje/hjNzvI/W+CMB4PR3px8RHn0O
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f752e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=z6iiZyybfqEMMI01lysA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1244dd59648d11123c507a1369f28f952d047fd5..4482f2fe6f04e58408b55994d885ea1c717c6a07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf6b2392efb47fa8c3e3c5d17f1a72341872e18b..e1c6df3a3b72ffb5a816bd18266a35abe723fbd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -143,12 +143,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5


