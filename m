Return-Path: <linux-arm-msm+bounces-58507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78BABC40F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B9CD7AFF68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2174028C2DE;
	Mon, 19 May 2025 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4ddBCGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C62728C2D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670730; cv=none; b=NxtBrVf35Ox/OkajkUSu4nPKJHWcaOaTg4+xUiTlo6zFY1CBDOBBwpzffEiz2LuQtZMXE8NpdOvRYoQJwtq8McxCoPBYMp26B1vSC9ZBw66N99K7F7nsRr6tx+6ZdqeaBWbqoUSIh4RfFHYBuP/PqDfLm6kIoWL80ATI0ts8Meo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670730; c=relaxed/simple;
	bh=HG6YaYLMzEEPgAfJMUZInIKSGD4Orq/oNbtN5+q+Rws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpTXC/bjEyuzwzcEjEw5wtMKp/gsm4H6BV/YdxGq6LQh5ETmUnXmSpWdfjMl/TTf+SmSHw6BXZs34bk0TktS17RdIL42g1KQCq9Hzz1l7FettQvXYa3QBKUsUl5Nl1LaLuX1WEdePH39b6Tr7hUjT0m+y8DYT6evC5E9QNKUNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4ddBCGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JE3ri5006074
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	psIyhC20IfdPMxns5UAQqKiE4lQxqk53qhxR/9h2EV0=; b=G4ddBCGfKajswi56
	9uZ+pno7CXlmOvsRJfBRyp1jmI65t1uxTJDmpY6AZGcD1UIyDf7LYvqz3T3LC/Ow
	+4Xrn7zqY5kRocgufMSDUMJBuP1I+Qmb5g65yplxJjuZRLVzTxjTX9X27h/d952a
	eN07B4hdfWWvUIP0+LKpqq+2ub0cIlHeXnMvFxrmQvCMNLtfK+QiObwHWbTiSwtV
	981f5I7wy5PFYea2t2d1YVZYbQXpM+3kqCljJ2lO4dB0+Z/oBPLJkVdnfU1WRJnM
	SgSN6dLB7H2HPTfwZYZANXkYtTMjdTsWkJUuatUIRc/tevFfdvTRWtpajOkV7ily
	EUc62A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkhn3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:27 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-400b1222c6dso3889077b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670726; x=1748275526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psIyhC20IfdPMxns5UAQqKiE4lQxqk53qhxR/9h2EV0=;
        b=CpttwcxysjCO8w89vH4lAsPTvRZFgzrVy8d3na+D5WDj74s0jO9oZimlTVkhThynr7
         qwzteuezgiH50o4RGg4wnvdKea5bqVaoCXR9nsokkQ4L6AsaW1826qviu+xl+Cz5U4iU
         6xoHVsToLLSC8avIPLtolKUcxAOoCo1dYbBktc7dys2oDrsPcrna4XYxviSPlNg9P/KD
         lsgqYf5qybanatgluBFpEUBTJwrXW+PrGriagcWUairCCwGxcfwIOnzXgK9IMOGaU49Q
         xoP0skBmQ/SIy7hZQN0ht3f0yvyzA6yFl7Rzj/vDCt+mH6MO6NwwNnXOKT1RuxwiHCbH
         8ZGw==
X-Gm-Message-State: AOJu0YzS3sdDgxlV+mJZgQr5rx8+BGC8ZxR0phGXdQtClO7yGr5r/AKv
	PbBxVQTniNEKoQR7vX6sjoEItvaraajhVS5/f3ZhbclMSKsVv/HnNrkbGJxVDNoXOkNN6IwtojX
	oBwD1P9Vaw6yh+B41x2PoSyXGBEIZXDondE8tIYHJiT9Rp6otsisoMGAImaKCT3Ok+ukI
X-Gm-Gg: ASbGnctV6hRMePQPDcqVTTHVRrZN3y86l9/wmlV3IZ/Ns/RFSO6CQq+DUgmn0zJGDMs
	2z+UymIJ9jYqyE4DH7phHEzR8nPfaoUdKb4xUPhXdHiHIIEe9Twwzd4mIFl6QBShk/RkEqoHGMU
	aC+kPxCLC2Q9V+hH5qAzhpB6wOnkIVzHCy2/hEvnEiLgK2N6cKuAkDLkUe7aoHZnsCEbpuAcciA
	VCNYQX+CqniYzx9Kh2yo7xYOiGNrf4/ioWpi19yjAUxqwu3Z3spO5Fo+VDeA0KRU/C/jfkhSxx6
	Cil5gCP6PZQkOFuzZ/7uSmMzTJGjMGE3SKk7/RwJqphxTFw2rnAsSbzu9OGuskBIDtFPMaaxV3f
	qZSx/7QjtCEOfqefrVG0VgCbi
X-Received: by 2002:a05:6808:4447:b0:3fe:ab15:5ecb with SMTP id 5614622812f47-404da713fc8mr8587261b6e.9.1747670726177;
        Mon, 19 May 2025 09:05:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpnXUw15VIRH9ZzFj+pI7awDbai1ReeZkHk1XU3ODYJ2eFfiVcOkonITG6+frvyjXclK3beg==
X-Received: by 2002:a05:6808:4447:b0:3fe:ab15:5ecb with SMTP id 5614622812f47-404da713fc8mr8587119b6e.9.1747670723246;
        Mon, 19 May 2025 09:05:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:32 +0300
Subject: [PATCH v4 30/30] drm/msm/dpu: move features out of the
 DPU_HW_BLK_INFO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-30-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9251;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WGwW5El/NPaEL8Lh29GyLwyQ80ot96UiOnlJY8tW1Q0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z+fxoCGFrb+HVV1NGcrN6hRxQH4CQ/aeMG3
 Bg8pUQK/oWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfgAKCRCLPIo+Aiko
 1baaB/9wKEZeubnhbtHQeIMmdHA1dg7W8C/3jPBZ7A/Gd5V3pG1V3zd1VsGbh2LNNsLwiiy9gqV
 9up81KXkCpLT3Mu93gsbGrbQ3y+bzBzCmp0U1qNUyr6smN8iiRETNIO8vuYAjUlabvlAOyAZ9DU
 x2a5QzSEPtGAjquZ16NWRK1S9EqZY28iuQqt2JACnQD1/VHT+vfVO28H6KnT0cNUSJKjKvtredG
 5l0BAON1AswBRYoikB1MlQnu/FgrnshK1rez2SI9Y5hwFeQ6EiGzugaULkZ+bq24IDcELlyXsbE
 ZXwPeeZlCdWZWMUODlggK/1O/4zIbdV7Tw67Gw/EljBt10KS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: uvn2YC25zM8901LcuvATiVBnaxtu3rwG
X-Proofpoint-ORIG-GUID: uvn2YC25zM8901LcuvATiVBnaxtu3rwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX7dX6PerBbFJH
 x2qs63TNM0Zqqu3q7wXWWQPnqND4tC2iOPmjPSmrp5raO6Nzi+8CV5uB+CuTcpWYna4gXl1Z+fK
 8VBC/DK9fC7lBD8DXcMLfgpKIx6E/9tVB1VOqGTBh7qJR5/ZvSORo0Zh71iBLo4P+AV6l41Iai2
 0mIqG+yJELyWcNFtoN6UhomEUUuQyqc3j7x+hs045aFdfJw6hl7roXWiT6mov9tkG1JB4E8b0k1
 42BzzDd2eI4IsOkQPQZynJlrtYFjpIqSKJ9Uo6zP2xeqaXIjXO2DQ+P6L+q3dSVlTfnLPr/EXxE
 mCEVv9ypXnth3sSs6nX58nJPa7xp+D3Ky9q7wNU8TwU8xljUOoT6M13agKmVq+TlaHXTgSPVhsW
 H1KdpCJYZGXg/7pw9OEONSQNoIdtfDbxdXkT49CP//ZPlCe8Jz1h1RqwaY1Klt5kKqYM+7cj
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b56c7 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-ycWNAup90JVQjvHN6MA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As features bits are now unused by some of the hardware block
configuration structures, remove the 'features' from the DPU_HW_BLK_INFO
so that it doesn't get included into hw info structures by default and
only include it when necessary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


