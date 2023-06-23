Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE3073AE60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 03:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjFWBhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 21:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjFWBhf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 21:37:35 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A652113
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 18:37:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so11681e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687484252; x=1690076252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4bstuPVjYa7L4ojK4OEFbj0gBGI9TNeSw5TRZ9ftnk=;
        b=RDEB1I8Zn+M6OLcoSg73f/PoHJ0gOrP4rt4iIJARfKAn8Rjk1DsOF2lPr3Bi1xW/Bh
         Jo2wTtWbOTCaDcLDWJbD775gVpCIZHTgUtSfwJmyzPBIPebOl9KEExBxcA2nmJaN7d2b
         TtizC+eI4RpiJdrATrvnxPouMSI58X3LXHO2Iq9NWMJQesNZC0lbpgBWS8rqHVxCmvp9
         sEn+esXE+6JiBERLLdAQY9oeR1J1L7rvnYrU0GSaBy749ejYjxI2QEC2HiPWHFFu0XNZ
         KXDVRkcN2TJCNw9zNoinkhZTmTiB3jmpUTGzyuxUXa9W0MGBJi7SmRztw9G3wpoKvt6i
         r3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687484252; x=1690076252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4bstuPVjYa7L4ojK4OEFbj0gBGI9TNeSw5TRZ9ftnk=;
        b=GZjr1gb63WrhhaY9c85YicFoyxM2++vbj7ZiBDqx2qnsqIJHzXfPXq1qFoRH1xUC01
         O0phNmOXNqcrNgk+iiDvToCu99aEMwzYGEL1YPnteJwumF+pOrzftWQPgcpkNVT72UKM
         4ayAIAjRCmj7iqDrhIxLcQ5hFhmHbBhp6iJtvAd8/eLqNJC2eikdHBaW1vDXL/GRzpP5
         qpxpQkR7lh4/Ib/jMbtL/qB3rNnEP7s/Iy7I+3wTSJXK66Ye6xQt7oZ9Hf/gB7ZTdbEm
         m0MW26KSZPBN13woDRSKCl44iJWDhqsyqSwVvgePiaGC2R0KRBfwldpCMFQlNGswBtGX
         tBdA==
X-Gm-Message-State: AC+VfDxmji+q/N8wGCbqGwy7LDlidTl5rdwFSxKHT1r82Sx7k2OrzzsW
        Wm7WIr4+M10tG/IacwE8BsS1yA==
X-Google-Smtp-Source: ACHHUZ7xx45SOPDwaSrHfcwb6Lqiw/jqNBK6jpcpCnjB0ziqhevZsUEoqx7siOsVEK9D4ewVdC05qQ==
X-Received: by 2002:ac2:4db9:0:b0:4f8:57f1:cc7b with SMTP id h25-20020ac24db9000000b004f857f1cc7bmr12025638lfe.21.1687484252336;
        Thu, 22 Jun 2023 18:37:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac25a59000000b004f252003071sm1290984lfn.37.2023.06.22.18.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 18:37:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Date:   Fri, 23 Jun 2023 04:37:30 +0300
Message-Id: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
This includes the common block itself, enc subblocks and some empty
space around. Change that to pass 0x4 instead, the length of common
register block itself.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 ++++----
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8da424eaee6a..6edf323f381f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -159,10 +159,10 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8350_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
 };
 
 static const struct dpu_intf_cfg sm8350_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 900fee410e11..5354003aa8be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -104,7 +104,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 
 /* NOTE: sc7280 only has one DSC hard slice encoder */
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index f6ce6b090f71..1d374abec1fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -148,12 +148,12 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
-	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x4, 0, dsc_sblk_1),
 };
 
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 8d13c369213c..79447d8cab05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -167,10 +167,10 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8450_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
 };
 
 static const struct dpu_intf_cfg sm8450_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f17b9a7fee85..26e3c28003f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -171,10 +171,10 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8550_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
 };
 
 static const struct dpu_intf_cfg sm8550_intf[] = {
-- 
2.39.2

