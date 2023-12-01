Return-Path: <linux-arm-msm+bounces-3002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCF38017EC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 00:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E948F1F2108A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 23:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684D73F8F9;
	Fri,  1 Dec 2023 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzkbGwPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324621AD
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 15:42:44 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bc57d81f4so3955479e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 15:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701474162; x=1702078962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okC+c6WIs6pU2KoWIiH8mBiVykqcI/UkEjsDZ2vTjXs=;
        b=EzkbGwPlM5KgOvVP+tK4WHlAnNBB5M/RCQHMylJLpxkmAUpf7XoN8kyT/hIAriZZnk
         /sQCfCXYLghBncJQX3N0XRlefXHcT4zvG2kJEaF1uEB6+PcMvamOVoPz6DcxXU1sTwb8
         JKrR6t6AKppDhWzwZjo9UhPU1xtI6YmUpEUMpyCoDrpEr71U3rKJZIGJd84MXSr0BHvC
         yn6IEkYprtdtyh97tfNkHyaiy6x1C1HEfnNsd+GDev7jiUVXJUGX/+zXWRPjn4FSmcRD
         s3EcBijUDxPiBzvO08F0cT4W/mxKuooXc+u68kNFAp/i8IZfFNJswDJrvudIK56v8mVs
         iWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474162; x=1702078962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okC+c6WIs6pU2KoWIiH8mBiVykqcI/UkEjsDZ2vTjXs=;
        b=MxvE8FBBYlKxteGmfmuCV01uc8F61YDsm4Up6Bz9ivH95ETn4b1ouPRO1eY6qIOQdD
         zVdQryWdIgNBbo0TBcFxpm6wowGmMNJZEKH2G/Ua69xHWDLynanNrFTZLTDpIGAiNwuT
         G0iK3ajh4MJMoo1IRxXg9hqTSjaOf5/65bO/9R+LMksY0iAAN4ehPTcc3dX+ZiCv76YS
         s9eP8J4XKjxk1sjBaOpBP7+36lRAAWCTlo17Qtq1Fy6EliifphyTaMHVW1wanp40+VKo
         eo2J6rfkI9c0ULk/6SO97nvCah/uf7yAlyzHxyoQdNN20yavGmPivC0dZo4DODMEo/6d
         motA==
X-Gm-Message-State: AOJu0YwPR7dAm1rxt6y5V/fBlJen31TdrQ/f3+lK1Gu4yHeeB6YxvNQQ
	BXwvkfNIhg0Cj8SV0vVlQGyz/A==
X-Google-Smtp-Source: AGHT+IFVxIG599B/qmVK8nvPueo1AL+dGV1zyGuHDAAkXVB6v+C59YW3slMPcO1HEuPyeEum3M3jDQ==
X-Received: by 2002:ac2:58e6:0:b0:50b:c88a:bca with SMTP id v6-20020ac258e6000000b0050bc88a0bcamr690043lfo.64.1701474162472;
        Fri, 01 Dec 2023 15:42:42 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:42:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v7 07/10] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date: Sat,  2 Dec 2023 01:40:31 +0200
Message-ID: <20231201234234.2065610-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the subblock info is now mostly gone, inline and drop the macro
DPU_HW_SUBBLK_INFO.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b2a9b2cf2c05..f9586ddbafda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -248,49 +248,51 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @name:              string name for debug purposes
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision, on QSEED3+ platforms this is the value of
  *           scaler_blk.base + QSEED3_HW_VERSION registers.
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.42.0


