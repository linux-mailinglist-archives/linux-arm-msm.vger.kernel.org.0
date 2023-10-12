Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92D7B7C68E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 11:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235414AbjJLJCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Oct 2023 05:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235516AbjJLJCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Oct 2023 05:02:05 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0CD101
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 02:01:56 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40651a726acso7449355e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697101315; x=1697706115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbTB2uPyXxZYT1sA9JVR+NoxhvrgHUoB1FiBsf5/CkA=;
        b=W4Odj01DO1LJQk5w+i9T4hXlvQOVg27CK7OWTUJc0iCGYfMJ3tUwJYBi+tnZbodY6e
         3g9s8yN6scJ7uajEy5exIfEJxox1WWMugfYCChTvcMy79n9JCFWzKOvqCC3B+jaaZec/
         KG20FvLSIK8ftLs4coT4RjhqkiYy6tRBBK6d2srxBZ6IezbWaf4PZC9avVHTlvKQH2Th
         rX4CwSa96rGMpo4QqAO6AVPhcZWa1KMsruL9wwUESWfNyN4HarjyQOYQ+TPk9IYquwkr
         SyCnM2mr37Md7f2bsek2eMzOnTBsOq5JxgJlTLv3J74nLOQmpmkhP8rRXy743YqYV1X6
         8dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697101315; x=1697706115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbTB2uPyXxZYT1sA9JVR+NoxhvrgHUoB1FiBsf5/CkA=;
        b=jdDl9HH51h8yyTy3zCc+TKlZ2KK5f4+MP7nM86eV/3swP9BLNwQVPKc5ibp6Tr+KQh
         0rtmWknQoJx41009iEq1jVhiSYKIc8ja00aoysztBeCB0+1iDzWsgbR1ACuCNNAXjLeR
         kWtsrte8X22Ga8/vzsxtZ6BjyNececOxaLaSof4w1riFs4lgXD1Y/7Qs9CXNZ00O93tx
         JfSuT4rLCQeZipP3eTzuckL6IKTN+GWFwdvEQLWza1NSROdqj1lDIQ0EvYdRBlkvN9YA
         YBTdS49zfCVDD8kKK68vN2rVAib7Zg9+5yMGRtQ7o3C1Y6YwY0djr7uYbRVTRjCy6A4V
         a2Qw==
X-Gm-Message-State: AOJu0Yz1YNa21rJ4K3Rki8JlkgRSyQ0E4aO7dyxcp2vThjUCJQMhccqs
        Uq4uVJylIqZjunvFQ+xucOoDYzYcMM/zme42pIVwFBzw
X-Google-Smtp-Source: AGHT+IFAbiuzJ9bdNBOrih0fvUaz8W8y7ucjaGtcOTuiFHXY6bnFGTxSh1a8QhUQBRenTfGvpAHAiw==
X-Received: by 2002:a5d:474f:0:b0:31f:d5db:a13 with SMTP id o15-20020a5d474f000000b0031fd5db0a13mr21002063wrs.61.1697101294500;
        Thu, 12 Oct 2023 02:01:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d4f10000000b00324ae863ac1sm17811176wru.35.2023.10.12.02.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 02:01:33 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 12 Oct 2023 11:01:27 +0200
Subject: [PATCH v3 1/5] drm/msm/dpu: create a dpu_hw_clk_force_ctrl()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-1-4bcad69812d3@linaro.org>
References: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
In-Reply-To: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3100;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=A/G3MVO3WfKh+AqmbjQ5ogAUwEdsxecl9VHw880vMMU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJ7Xq4Jw1pCAzFBCnmjWylDx9kPa3sj7k2Xk1Bj/4
 40NlNRiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSe16gAKCRB33NvayMhJ0doTEA
 CvD60gIMBV+0SdVwtSQDUJiY5c9It7mfxJ62Ff64/GmMyyE+ynlW8K9Wa5cyN6p81o6P08lNEEMUFN
 UUfoZ6Y70ZQRu68OdcNqa88ZEgIuDQuNIx6pqHVQsZYmVN/AvZmYO80v4DqYZGVW1k4K1VIGIqJzVu
 lUt1wcgQ70tVn47U4LBsmCAKDJGGDS/U5a7fcU3vNyG71S+oqVBIayw0ttRV1qzE8CPxs5rH5MLoBf
 HKhtGPp6gi/ywbzKHGxTJChYhTHTzqbb32aLNh7EKiO07rBBm7IltBgEcc9a8gBg9aGjtkrFbP33DK
 fedXC7EADx+Pp/2B+XZURtqirEY/dnqCCisyWlJyt1DjhjUVfCz+0iAz4hnucqbvEM73b6peJKEIXn
 eHzIIHaIfm0loIVX9j1ir+86JjqoRlQod3W5olAcPV88hEq2n2+iRwBARrVacxZ3kVIDr69yNwU0Jd
 C+4FE5j1/scFSTtxn8HB5S5rwa83kiYEX+TtXP0F7RlFC6KHgkw7XmfOqX2c475duJm4B6FUGLca0C
 1zW89o9p3A2I+BgfaDIFxSPJ9DWusA+RGu05qNEJedgfkQa0VPYWzHr3hE1DOmeQb0gQTzi9Vr89Zx
 ntOXJ7LAg98n4dT//LDE91DRsABo0YA6ylqp9J4b1SlmswWk4J2DjX9VPi8g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an helper to setup the force clock control as it will
be used in multiple HW files.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  | 23 +----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  4 ++++
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cff48763ce25..24e734768a72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -66,34 +66,13 @@ static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 static bool dpu_hw_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
 		enum dpu_clk_ctrl_type clk_ctrl, bool enable)
 {
-	struct dpu_hw_blk_reg_map *c;
-	u32 reg_off, bit_off;
-	u32 reg_val, new_val;
-	bool clk_forced_on;
-
 	if (!mdp)
 		return false;
 
-	c = &mdp->hw;
-
 	if (clk_ctrl <= DPU_CLK_CTRL_NONE || clk_ctrl >= DPU_CLK_CTRL_MAX)
 		return false;
 
-	reg_off = mdp->caps->clk_ctrls[clk_ctrl].reg_off;
-	bit_off = mdp->caps->clk_ctrls[clk_ctrl].bit_off;
-
-	reg_val = DPU_REG_READ(c, reg_off);
-
-	if (enable)
-		new_val = reg_val | BIT(bit_off);
-	else
-		new_val = reg_val & ~BIT(bit_off);
-
-	DPU_REG_WRITE(c, reg_off, new_val);
-
-	clk_forced_on = !(reg_val & BIT(bit_off));
-
-	return clk_forced_on;
+	return dpu_hw_clk_force_ctrl(&mdp->hw, &mdp->caps->clk_ctrls[clk_ctrl], enable);
 }
 
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 9d2273fd2fed..18b16b2d2bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -546,3 +546,24 @@ void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
 
 	DPU_REG_WRITE(c, offset, cdp_cntl);
 }
+
+bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
+			   const struct dpu_clk_ctrl_reg *clk_ctrl_reg,
+			   bool enable)
+{
+	u32 reg_val, new_val;
+	bool clk_forced_on;
+
+	reg_val = DPU_REG_READ(c, clk_ctrl_reg->reg_off);
+
+	if (enable)
+		new_val = reg_val | BIT(clk_ctrl_reg->bit_off);
+	else
+		new_val = reg_val & ~BIT(clk_ctrl_reg->bit_off);
+
+	DPU_REG_WRITE(c, clk_ctrl_reg->reg_off, new_val);
+
+	clk_forced_on = !(reg_val & BIT(clk_ctrl_reg->bit_off));
+
+	return clk_forced_on;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 1f6079f47071..4bea139081bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -367,4 +367,8 @@ int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_signature_offset,
 		u32 *misr_value);
 
+bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
+			   const struct dpu_clk_ctrl_reg *clk_ctrl_reg,
+			   bool enable);
+
 #endif /* _DPU_HW_UTIL_H */

-- 
2.34.1

