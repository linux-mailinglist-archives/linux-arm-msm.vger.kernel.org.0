Return-Path: <linux-arm-msm+bounces-59135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B789AC147C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF7B174E38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2A929A317;
	Thu, 22 May 2025 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTh/9q2B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D1289830
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940710; cv=none; b=n+ACzP6V2aEJ+DcR7qDqbhZUuCg73P5TrFthaUzeh+/gHKfZJo/usvcU6wkRH5MvsbQ4OJTDFN4g21n9YwEF9hsfgLbi47KJ2pIK0gM5xQ8oQHYzKdkbzuT6jLeJQAhZCgZvg0Ww66iLHUXVLP58uk7W+EgQGc0IBfyEN1WLRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940710; c=relaxed/simple;
	bh=VTilDoUH90d6+gvbkhG3P29AUEnCmnb+w2E7Bbts9JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQZnNvg2lsJ+AWFnKOsT6Nw1QmegPLIxpMuop6dHaT++ieSsNDWSICkdhzTwDCP3tlmZuMoVQ7TVeDxWU9URpFU/0heMOgkVYvU+f6pnstghIrnPe7s5zw2L/ZBgIoFRtCjhhC9SxkqkAfzD3aXpw+/x6mQGZGscR78xPbkcaeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTh/9q2B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGSTrk020952
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTc0/EezgBT/5+RGEQvOyBaGeTe7VtWsnCarMd7VsYQ=; b=ZTh/9q2BERi30Nly
	5AbtgfT83h2nU1Szr1qgNZDnJ58M0i0OVuNmRb355+p/DUKzw7AARlFhEP99s1fc
	07Hrf3YyozUpiQOwNpjsboRYQutD5GvIkOr3NxUzoBUF9bd9nuyqiY6JYc9pSLDi
	ewluzBTZfjHW8j6JCGrbp91EjeCkgEk5JwN1dKrRmt44pULy6Pw8kIsGb/PhsIFc
	DOPP4217AvdY1HSIK2NJNjh/+dUHe63NgttaIb62vqOFMYCebZvpcer+RhFNkw6+
	s9ZGuMa1SarsMNRg3q0ANIS3LIu6KyhAfuGnwYPHYe/TctjRNw7aiY1TNa6MQ0sF
	oD5V5w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07p1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:05:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768d63b1dcso2956771cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940706; x=1748545506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTc0/EezgBT/5+RGEQvOyBaGeTe7VtWsnCarMd7VsYQ=;
        b=FwdoDhWi/PAwDKOtO2ozvm6Wq25XBlBQxH51MJ+p51AZDo7Xos9fvDYq+rVKRu7mf2
         y6pZmNoV5ldpE930rH66BexHh1ENASGfh46XmSM5dbkOduH4O8wLrCpisW/GOR0dMDk9
         9JbQx2gtWaYNj7xygNQl33sqoG6Ip2AVM6QXLhQl8o7nSkT44Tdp1SjwXiCHYVWnLm+U
         tZ+XyDV1xrSlM3xk+Hm7C6XbjfEfwhxMSv4I//JPXbbBwt/j/oWGZSg+R4blY4hrZsB3
         RfGlXbphUX3i6evhtlG5XK43I+AmAHxucAJLSgd87t/GoDM+18DFkDm1kNa9TwISvNDk
         EOVg==
X-Forwarded-Encrypted: i=1; AJvYcCWhMPEDvK7iTcLGmaaMhfSq4K6WPyqefWCLk19TSydsd4vg56yDkq3AMqGA/3ynt2of3/LY5N8KgjlN45aP@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZLCfGaBfGMSXEMVVuShJ0+k3xeyCLmMzQkDe9C5BSfcj62G1
	ize5QIa7MEe0SNd6yrr2fU0sabem3k/060FeFJF9U31/+3Dmcb0O/ARVhx8fBWQJqs1jdCF9OX6
	aHRgVxbM8yC+z5L7+IPzq6mK3FpfP48sFeWl9/zD5wwU1EUDclfZ3ajc4hRLrh6FkvHL7WhNfvK
	tF
X-Gm-Gg: ASbGncvVJ50VHtsNm2u8+bkvMlvnK/2Pv8VP44kZc4Enun8Z7wqwWQcm3gBaZKSFNe3
	0hDgUdzVFfeEJm/xPmyvSUdU9987yVVgvW9FiqtsVVyhR+ZBJ86IO31uiPtmQdXohf9U4exU7Uw
	AEt/T4gS0Zm87j0kFQlk3az03/GCXyeeUE7uyvq9VqGkOxapOA1Utm5RzyL0YgRZ/igLYv6HYfd
	uwQnu+dupVAQ4xftmliZCHDBBq+cVbEUGiVVH3eBKXmLH6wALNbOs65hmgUoBPB/r4Tgv7H4pOw
	49k0RJeHNNTP4JQnEnmcwdk6h7W4MmR0btoD8ktVw3TkKzQul9l1YOw7jfD40qwli7K4K9avPUy
	b6prvNpRGy8rCaagx6UXfBohg
X-Received: by 2002:a05:622a:17cb:b0:478:db63:6f51 with SMTP id d75a77b69052e-49dfda38cc2mr11391481cf.25.1747940705657;
        Thu, 22 May 2025 12:05:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmO3myhGKXc3zyjZQd0qrKtRwdZU82OVvg8eLp1QTs05m9q0Sbyzla5HFoYw5w0Dx2dnzxcg==
X-Received: by 2002:a05:620a:6089:b0:7c9:574d:a344 with SMTP id af79cd13be357-7cee22ef854mr118810885a.25.1747940694804;
        Thu, 22 May 2025 12:04:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:49 +0300
Subject: [PATCH v5 30/30] drm/msm/dpu: move features out of the
 DPU_HW_BLK_INFO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-30-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9308;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dgx5X1yBWFmdPYdJIyIJkCBg1wG8k1o1xqWmN09qE7Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3UASwCzosHgATZQUnLox3XCPuv+4AVOC29Tj
 MumKA94GnWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC91AAAKCRCLPIo+Aiko
 1cbUCACJvWLcGeFkg+EAr5zx6HgmYzUF2dvnrwysp2WFEjMLCMkVCj2dk0Ovje2soVWWQTHj50s
 Vz095jwZ7VFHI5yivyNwPsoSxm8U5fE4DFFXphvSdQzIiNoBrKlI5pjnmstVHxc1hOngUehz4Hg
 7AmvbIeS4TvSrMT4TDJvbLWDZa5LHioiM1xzm/lehHP7txJ88Ewl+bNQdowA5ZZpZvRh0rYTDz5
 jotguW5IHzzCn0TIM902nOUqcD2ddSrqieyju3YSkuBfmZMyaZV//htlbzjln8udBRt30pAig4r
 n+BOu8P0GhDneFo8WlBgD0KzmginBzQOSi2l2k2nfhYLD927
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: iZ0D4JpyShiu8G6rl91bno0QsmstVKgw
X-Proofpoint-ORIG-GUID: iZ0D4JpyShiu8G6rl91bno0QsmstVKgw
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f7563 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-ycWNAup90JVQjvHN6MA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX8oLInZGCNMrS
 ZkQKELuCvjEfOtqn7LwaUpFyjFwdFc9GHej0mW1j5rs0thUFiJfoJfxEBSFvlgFBINRgshEsANj
 kAc0j7PHDDliZKex7j6ALmCA/Wg75/vx3TrfUFe9dBFg4zQW0dIpa7KcHn0pszrWubaj/ue/77q
 1y46pHGR5SKnsOu3P3bGIqK0uVdZsPpUJU0la0LhBx2qCDAzwwr4y3sMW8AfYPr4E0r12HxxTcx
 9CclJ+sfEqfSI8dwmjQbsLxbXh08aefEmNCmqUq9poziUXtn81zkkslov6v6thzjLy6WySv+KUT
 XujLY0rkRXKYeZIJq7fR0dqqe8MjeYR38YuGn8Pb9SSONvg12RC9JCl4s200kiKe2qvJlouw3Qn
 OlCDUVd4r3EOdgLdDR8CBT4NvvHxDDz82Mxi4H2tXzTDDyk3YOCT30U8kmD06Tqse8h/4Czp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As features bits are now unused by some of the hardware block
configuration structures, remove the 'features' from the DPU_HW_BLK_INFO
so that it doesn't get included into hw info structures by default and
only include it when necessary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h         | 17 +++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c         |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c         |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c             |  4 ++--
 6 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index a065f102ce592311376f1186add7a47dca7fd84f..26883f6b66b3e506d14eeb1c0bd64f556d19fef8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sm6150_dpu_caps = {
 static const struct dpu_mdp_cfg sm6150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 2950245e7b3f5e38f3f501a7314bb97c66d05982..fbf50f279e6628cb0f92b0188e1fbdf156a899e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sm6125_dpu_caps = {
 static const struct dpu_mdp_cfg sm6125_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d51f6c5cdf62f3c00829167172ef6fd61f069986..47d82b83ac5378cb0001b3ea6605dc0f98aec5ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -154,14 +154,12 @@ enum {
  * @id:                enum identifying this block
  * @base:              register base offset to mdss
  * @len:               length of hardware block
- * @features           bit mask identifying sub-blocks/features
  */
 #define DPU_HW_BLK_INFO \
 	char name[DPU_HW_BLK_NAME_LEN]; \
 	u32 id; \
 	u32 base; \
-	u32 len; \
-	unsigned long features
+	u32 len
 
 /**
  * struct dpu_scaler_blk: Scaler information
@@ -376,7 +374,6 @@ struct dpu_clk_ctrl_reg {
 /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
  * @id:                index identifying this block
  * @base:              register base offset to mdss
- * @features           bit mask identifying sub-blocks/features
  * @clk_ctrls          clock control register definition
  */
 struct dpu_mdp_cfg {
@@ -392,6 +389,7 @@ struct dpu_mdp_cfg {
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	unsigned int intr_start;
 };
 
@@ -407,6 +405,7 @@ struct dpu_ctl_cfg {
  */
 struct dpu_sspp_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	const struct dpu_sspp_sub_blks *sblk;
 	u32 xin_id;
 	enum dpu_clk_ctrl_type clk_ctrl;
@@ -424,6 +423,7 @@ struct dpu_sspp_cfg {
  */
 struct dpu_lm_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	const struct dpu_lm_sub_blks *sblk;
 	u32 pingpong;
 	u32 dspp;
@@ -434,7 +434,6 @@ struct dpu_lm_cfg {
  * struct dpu_dspp_cfg - information of DSPP blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  *                     supported by this block
  * @sblk               sub-blocks information
  */
@@ -447,7 +446,6 @@ struct dpu_dspp_cfg  {
  * struct dpu_pingpong_cfg - information of PING-PONG blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @intr_done:         index for PINGPONG done interrupt
  * @intr_rdptr:        index for PINGPONG readpointer done interrupt
  * @sblk               sub-blocks information
@@ -464,8 +462,6 @@ struct dpu_pingpong_cfg  {
  * struct dpu_merge_3d_cfg - information of DSPP blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
- *                     supported by this block
  * @sblk               sub-blocks information
  */
 struct dpu_merge_3d_cfg  {
@@ -483,6 +479,7 @@ struct dpu_merge_3d_cfg  {
  */
 struct dpu_dsc_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	const struct dpu_dsc_sub_blks *sblk;
 };
 
@@ -490,7 +487,6 @@ struct dpu_dsc_cfg {
  * struct dpu_intf_cfg - information of timing engine blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @type:              Interface type(DSI, DP, HDMI)
  * @controller_id:     Controller Instance ID in case of multiple of intf type
  * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
@@ -521,6 +517,7 @@ struct dpu_intf_cfg  {
  */
 struct dpu_wb_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	u8 vbif_idx;
 	u32 maxlinewidth;
 	u32 xin_id;
@@ -589,6 +586,7 @@ struct dpu_vbif_qos_tbl {
  */
 struct dpu_vbif_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	u32 default_ot_rd_limit;
 	u32 default_ot_wr_limit;
 	u32 xin_halt_timeout;
@@ -606,7 +604,6 @@ struct dpu_vbif_cfg {
  * @name               string name for debug purposes
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  */
 struct dpu_cdm_cfg {
 	DPU_HW_BLK_INFO;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index b9c433567262a954b7f02233f6670ee6a8476846..b3395e9c34a19363019ec0ccfb0c87943553b4c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -360,8 +360,7 @@ static void dpu_hw_dsc_bind_pingpong_blk_1_2(struct dpu_hw_dsc *hw_dsc,
 	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
 }
 
-static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
-			       const unsigned long features)
+static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops)
 {
 	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
 	ops->dsc_config = dpu_hw_dsc_config_1_2;
@@ -391,7 +390,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
+	_setup_dcs_ops_1_2(&c->ops);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 0b3325f9c8705999e1003e5c88872562e880229b..83b1dbecddd2b30402f47155fa2f9a148ead02c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -33,8 +33,7 @@ static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
 	}
 }
 
-static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
-				unsigned long features)
+static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c)
 {
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
@@ -62,7 +61,7 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_merge_3d_ops(c, c->caps->features);
+	_setup_merge_3d_ops(c);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 5c811f0142d5e2a012d7e9b3a918818f22ec11cf..96dc10589bee6cf144eabaecf9f8ec5777431ac3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -264,7 +264,7 @@ static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
 }
 
 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
+			   const struct dpu_mdss_version *mdss_rev)
 {
 	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
@@ -313,7 +313,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 	 * Assign ops
 	 */
 	mdp->caps = cfg;
-	_setup_mdp_ops(&mdp->ops, mdp->caps->features, mdss_rev);
+	_setup_mdp_ops(&mdp->ops, mdss_rev);
 
 	return mdp;
 }

-- 
2.39.5


