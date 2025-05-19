Return-Path: <linux-arm-msm+bounces-58498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DB7ABC3F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 448667ACE60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA60628AB0C;
	Mon, 19 May 2025 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYM430Fh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C028AAE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670705; cv=none; b=HrGx2Y+P0hUqhYYd+1YV0z171vHF/7pwFviGMC9Ac3ZeTLmSZOMlqj6yqTxu76J++G05aD51rlTVAAr2M9Isz19NSluwlUPM43KdGmF/miivhGVzqmckCAcTV7qgb9G/R8J9M4OXZ3ZcWiI3CmZubx/93DZ5J/6l0QMKtvI80ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670705; c=relaxed/simple;
	bh=3nwf2cAeOe0t89XgSTKV/ImtM/hPU7+cGPw2xH/RFVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWmN7ylZHslqedRVwqG2l2zWuJvcRl+39YJF/cP9OAp4tUBU2heY2PfAkVzkRPy3fmAz3jMd0N9YDCThJJ6yMXpulTWElLpat5GA/sP+nnD2pppqo+y3/bMWVgU/ElDNUawh+pWUQsUdNmwAD0IZ85WDdzXT/AeMRavqSEhBkYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYM430Fh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JFfDR4023276
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxsAhzmbg/P7NGo/6NtGUPTBdEk3LlD0vaC4rtyESLg=; b=fYM430FhLVxJMaDy
	AgPdO+hyvSQr5WSg9ggYae2XpEK106SC+4iJKjtvuqCv9WvzN3qOysl3A8PE9O5q
	ivJGs58A69VkpFJPAXdEeoONwzYWV2LTDzauf+VDmHRRQ3L/zhL8n+ZuVCKK3pjC
	g0wY7ws7k1bDxDN0wo3Ze4rdKqiXdGn00jyzfYhi8BW+5GebPkQFOMyg6lbX5cBh
	mfWvIjpAcQv2dYkBwTc2U7hvfRaxlVGM5Uxu94vzq595rWlBes1Cu0PcnfcXz3mb
	KTI48/fAWhBOc/6It438T/H/Q9rg6z9EhqYZDXJ96Ti/CSz3sWlVyqgNT6YxTmEP
	AhbEow==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041sg2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:03 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6064d0103f8so6086862eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670702; x=1748275502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxsAhzmbg/P7NGo/6NtGUPTBdEk3LlD0vaC4rtyESLg=;
        b=C+TOl0F6Rc9HIscr1T0eNQOzHzIEWQB9k4IcDPwwsNkpFPcA7DNUGJojicpYxPBFue
         l6g/5afhCngUpEp8+XnY0nMeV8owKKdyVe+JrKW/dufqT2rTTcedTHezD7Eb3ZqCHpOL
         YOiwEHKg8E48BGkfckRBqISrrADajeYUw4BeSWRgRQtxtKtTt7Tg5VN5w/PTPBZ6XFuv
         aEy85kbDowSJhj/ES/4O4pIMq6VOonstdZ1ep77MSBON95+yg7F8l5Llmtd2emne4BiJ
         71V05g02lThmKRQiivW/r3q2FS6e1U8t55W1btaNJIVFxzb0DW4QtOwepzzJhcaYMkD5
         qv/w==
X-Gm-Message-State: AOJu0Yz2szV5WvNvPEXoRSNeJVPXdc5WFHoR8HgDZtIkPqyINCnYp7k2
	hfs7ofG2/2uE/wy6J7mvIMty2/JLzbii9kMeGpO6bpqRizmgX+DcTjcGqvRdeHZEiZgY+M8A9TA
	baQowMJQg8VTPdK+dXzfICbBJdj9EwwtV+Dur2x18oAqdyQrU/r3tYL7nsnbSjyjXAF+w
X-Gm-Gg: ASbGncsKIONOYuCtQ1PyDVkT7QP3ojjRE5g2x83I4YigPak515vBpRKIZEspUhlWd6a
	JR+gFcFuxI7iUZNUBNebv9msX4+SfPtBPByGdXoCN4DqJwPKQn+r8Tdx6tG8p6QxpBnZBiQLC2t
	uiVAP2jn2P61Qcr0SEt23QdBHVnRgmmfvAG2KoVBaKQH1PSaJUfqWmlC6IdCOePI4easr7xex8y
	L3+U3QJzUKsRyPiUplUc72yN4P3BiCcx5Xkn2yDYB/I4Xm267D8jWdneZMtlGXoyIRWKNYmYtpm
	1G7ApTlXKC5DUGaXy66RfHtIwOp/I3eWTHVckeND0nHDzANo2SDkKamt9pu32RVlUS6KDm9PnTr
	xd1zzr/O7kzbDzUPLkdxAnjRS
X-Received: by 2002:a05:6820:3083:b0:60a:4ac:d786 with SMTP id 006d021491bc7-60a04acdd3cmr4219155eaf.8.1747670702240;
        Mon, 19 May 2025 09:05:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwvHj2FruddFnCv4nLxJa9GiK1OTK+95W3iF8t3mPC1jSm8aD9GiN04PuqB3XzeW/ctRMQ6g==
X-Received: by 2002:a05:6820:3083:b0:60a:4ac:d786 with SMTP id 006d021491bc7-60a04acdd3cmr4219092eaf.8.1747670701869;
        Mon, 19 May 2025 09:05:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:23 +0300
Subject: [PATCH v4 21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-21-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4709;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9wVY6xHvqDcF33GFzYtwTC0tzUZCiOlueW7vIUDiJZ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z8RKKQynCoTPB6vJlgo4GwgcVNdJxg0Qa3e
 W7CRvWrZJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfAAKCRCLPIo+Aiko
 1VB0CACtfgAQgO9mhZoB+Q4ML9ja0Ell8Jpl61IlCmUs4Ms223YjySUUmXyR1Eq+6d5UlBx+RIo
 7/BtL28AjAUAwPmJn6T+Vc6W5b5S/BuYt7uzbZD84VED9hYBnqTcDoELkucasZrUr6IoJTX4W8H
 cGC2IMeRK1qXFbztb2eT15bz7tNalDvK1NfQba2KpJ7bj4NshGtnXSL2eJusIOzJEwWcuwkOeA3
 ROnSgM5ECLvT+BN5g9lk61/PPMRgPezlTH65eDg6/6epXhLmQ5cqLKd9HivAMLnPMBJVUGU7seU
 BdwF7LhdoQQ7I8ZwHWIOBQhNqQgUYhFagD47lSLeKLmpQZzW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX8qA2crCfclWQ
 +Nsed3zlve3Eo71Hkd7PZcSf90EsOK1kLU8+nC4gAuLu7I9ND9odYa39H8/aBwMl37a8tw6yP4m
 KG3N3dwDG+sLOnGuZu0ldO/BupL7eFZ18Xt9Jv1DfBDFR/2QNA7kCu6QBxENkHxGwhuadXitbVK
 AxcFAlrJmIIOO79d5peTUZeBazx8WU61eQpHAd/9x8XwOiEI2arycJfyUECN3XJ3r6q5u1xoy5b
 ITlOtJ2ojVEHVtU+K4PTwEG812cMAt/t2W3CTCHr24d1MObMZkB81jMlsGnGe/HF9Fmgnkiox09
 LIO0M1K+0rEz/lWn4KWOCMtNnmJNL3B0KjeseR71NTTpVIShufO+v5KUYdvOjucJpZ5xS4JDZ2/
 23NqavU+jMe7KFepZBP2LsANQRncNyle7upGcUDw4Pe0QgnhabV+w0+YhRQiF/CznAADoAhm
X-Proofpoint-ORIG-GUID: M5Nq5kZsFzFOStbSIO9lPvjNbqp6LI9K
X-Proofpoint-GUID: M5Nq5kZsFzFOStbSIO9lPvjNbqp6LI9K
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b56af cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xxl3IjUXEjn2PN8_a8EA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MIXER_COMBINED_ALPHA feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h      | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4777a4a852da0d65e20cebc31fd05647e0b4c4b2..d64ebc729bfb589bf90af89c094181f879d5b1ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,10 +90,10 @@
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
 #define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+	(BIT(DPU_DIM_LAYER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9ba9e273f81ab1966db1865b4ce28f8c18f750b8..5e4608d10c6d4fee387c9a599a73b15661148430 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -85,7 +85,6 @@ enum {
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
  * @DPU_DIM_LAYER             Layer mixer supports dim layer
- * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
@@ -93,7 +92,6 @@ enum {
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
 	DPU_DIM_LAYER,
-	DPU_MIXER_COMBINED_ALPHA,
 	DPU_MIXER_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 4f57cfca89bd3962e7e512952809db0300cb9baf..3bfb61cb83672dca4236bdbbbfb1e442223576d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -150,10 +150,12 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
  * @dev:  Corresponding device for devres management
  * @cfg:  mixer catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_ver: DPU core's major and minor versions
  */
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
-				    void __iomem *addr)
+				    void __iomem *addr,
+				    const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_mixer *c;
 
@@ -173,7 +175,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+	if (mdss_ver->core_major_ver >= 4)
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 6f60fa9b3cd78160699a97dc7a86a5ec0b599281..fff1156add683fec8ce6785e7fe1d769d0de3fe0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -95,6 +95,7 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
-				    void __iomem *addr);
+				    void __iomem *addr,
+				    const struct dpu_mdss_version *mdss_ver);
 
 #endif /*_DPU_HW_LM_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index d728e275ac427f7849dad4f4a055c56840ca2d23..7bcb1e057b143a5512aafbd640199c8f3b436527 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -60,7 +60,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		hw = dpu_hw_lm_init(dev, lm, mmio);
+		hw = dpu_hw_lm_init(dev, lm, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);

-- 
2.39.5


