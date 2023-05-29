Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E16714B0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 15:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbjE2Nxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 09:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjE2NxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 09:53:25 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1FFE8
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 06:52:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f122ff663eso3574655e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685368368; x=1687960368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RwomgLtFuBAJdhvtFWYoHVBhBEZiHKMCWh0DbnY+6M=;
        b=MfFlU8AR2A2p82aHPGJe/D2zIhMQYbK6998C/3cZxElnlKxxnMNOHM4lgLN6q+v6cW
         Mp3+kVGlnxW36meBoqMv3vWBTcMRl2tZbQvDXKM3Cr2uKNllH/Y+gqE62dNqsJZV3BdW
         XoVno96dcsvWaRKtg25eF+pmdzkyDkuyeenWfEvHzqjU8pQNG3ethpktTPjJSzU8AwBr
         ZkHkjKw0ahixGZ7xW3lsG4Wnn2kDpelCNCUszGiPp8J/Mu2P5Lj5tQ8AAniv1P+F0kma
         igOVNEuv0GAwZDZAnxSKzzYkHYnS0mBBqNoivwCgDtInoCARtX9LTkd96fID7ZWtFDol
         ronw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368368; x=1687960368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RwomgLtFuBAJdhvtFWYoHVBhBEZiHKMCWh0DbnY+6M=;
        b=Cl5wiy7fx9eMWu3aGlbDOZf2qoqNFDfl/PrBUI4AiTWm8857D6i4MaoHuCYyAVN7QN
         Rz3A44mjZ5Vz9hNCmN711TRz8phNpCB0BM6Imxi8r2CXyOiS3h+cS9BDvZcGV/vSKGzP
         H3vsxFOh5RAtERf3fW7tGK0a1NftP4shLsgldBt/s9/chd6wpwTQyFcY6hdd6eIl4oJ3
         zE0KVUFD4Q5jk8ipgL5lwF0mHFKATh2GP/AJyYnBDgjg1/XBxXgoxDnwEWy3V1XUlPNq
         TXtJQ+3GWACXXsS8IdyvgN7qYJZPpwgzElwHCcMBepVH8+yvcpC3FljQMY1WDo1Y3c9m
         cpHQ==
X-Gm-Message-State: AC+VfDx9NQxIDvMimVdJObXmojhW4V/lxfL2CclZJZrYLgNWDqloP9lp
        5N99iqw4gLr74DcauFutyfWUuQ==
X-Google-Smtp-Source: ACHHUZ4i0v08P7CplUoBbNdpbrFlYTpaNXoDskAZBJbgbVg1AA1n+ZgBL0yiTHvk5AuCPizvlYqcSw==
X-Received: by 2002:ac2:4a68:0:b0:4f4:dfd4:33e7 with SMTP id q8-20020ac24a68000000b004f4dfd433e7mr3813645lfp.33.1685368368701;
        Mon, 29 May 2023 06:52:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 06:52:48 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 29 May 2023 15:52:35 +0200
Subject: [PATCH v8 16/18] drm/msm/a6xx: Use adreno_is_aXYZ macros in
 speedbin matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-16-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=4275;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iW1LHxRNIioRxxvJOIY0HtRkF0YVxdyIsQo1SElsxfY=;
 b=fqQIaJVSaqTt5KgCQk/0aQwss4Wknvm540jpXM9MmpdZP2YB7pDgaHUkES8HWlBi+LczQTrbK
 MbpsP5q3dxPBVbFX8yyU+5TmuxuDSquS8ytLrwvZK5nil84gjzXi/1W
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Before transitioning to using per-SoC and not per-Adreno speedbin
fuse values (need another patchset to land elsewhere), a good
improvement/stopgap solution is to use adreno_is_aXYZ macros in
place of explicit revision matching. Do so to allow differentiating
between A619 and A619_holi.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5faa85543428..ca4ffa44097e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2163,23 +2163,23 @@ static u32 adreno_7c3_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
-static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
+static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u32 fuse)
 {
 	u32 val = UINT_MAX;
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
+	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_is_a619(adreno_gpu))
 		val = a619_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_is_7c3(adreno_gpu))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_is_a640(adreno_gpu))
 		val = a640_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_is_a650(adreno_gpu))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {
@@ -2192,7 +2192,7 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	return (1 << val);
 }
 
-static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
+static int a6xx_set_supported_hw(struct device *dev, struct adreno_gpu *adreno_gpu)
 {
 	u32 supp_hw;
 	u32 speedbin;
@@ -2211,7 +2211,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 		return ret;
 	}
 
-	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
+	supp_hw = fuse_to_supp_hw(dev, adreno_gpu, speedbin);
 
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
 	if (ret)
@@ -2330,7 +2330,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
+	ret = a6xx_set_supported_hw(&pdev->dev, adreno_gpu);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 7a5d595d4b99..21513cec038f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -268,9 +268,9 @@ static inline int adreno_is_a630(struct adreno_gpu *gpu)
 	return gpu->revn == 630;
 }
 
-static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a640(struct adreno_gpu *gpu)
 {
-	return (gpu->revn == 640) || (gpu->revn == 680);
+	return gpu->revn == 640;
 }
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
@@ -289,6 +289,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
 	return gpu->revn == 660;
 }
 
+static inline int adreno_is_a680(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 680;
+}
+
 /* check for a615, a616, a618, a619 or any derivatives */
 static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 {
@@ -306,6 +311,11 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
 }
 
+static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
+{
+	return adreno_is_a640(gpu) || adreno_is_a680(gpu);
+}
+
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);

-- 
2.40.1

