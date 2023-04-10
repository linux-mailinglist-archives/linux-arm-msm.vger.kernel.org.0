Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40986DCB33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 20:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjDJSxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 14:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjDJSxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 14:53:01 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A14326B7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 11:52:30 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a23so8030943lfk.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 11:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681152747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQDITOMHIdfEo/UfLKkF1WdLVbzkIyAXvUaZR5s1k/U=;
        b=Ivmqu5bIp+mbLQPy3x/hBVyWrIYlLoGbw9PcoOVG2GVUhhpzaKPleLCi6n8WflwtXV
         dv7cUrvm1vQalJtzAK7Pj02zT2bg4pbMyU+aYQMJN7th3+PiTGGGltgdjcSRvLq2cCMh
         HsPVSmpSxtM6QIK/sB+78VK1SSKvd+XyAwClbySVmAHgyCHC493TK5i11Yhx2Tb6MlvA
         0b8Vb3KkiUyqlwCUcStxjthndkRxElA6irjXIkxLTV7noJCurXll3qCmTt2p4A4b2BsU
         061sY4kze9XhfuQu9qedr+AUIn/do1gekozEFuPV+oerXGDx5LLMC+cAci1a6uDt2i4w
         py2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681152747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQDITOMHIdfEo/UfLKkF1WdLVbzkIyAXvUaZR5s1k/U=;
        b=7wTuAdZCCjjnjroiyAkffCjhRmClEvAhSau+dlC2JDQCdOiJYOCz8RdywUOJAdxtz1
         Qj3II3m9aU5eqgx1WySg2UGMCkMdlP7ruD8qMXl1QXNcIuCA2A7EgTyXuFb/WQQfG4rb
         8F7vc9UpaSBjHSOX6nxapUyXT/u0936ByWtzd1RSrOPsh3VeQpRWsNyoFN6LKOOdWZtX
         ai55yZRMSlDP/Xz5FAEcfSmIp1GHkSm6wMmwFA//U+H5G/gdFx/O+Rqpw3y/3pTJ1VFL
         +/o2/XPh5qWCCod6bZID/JOFh8twO33LCdhKdJb3i4qp9WhNQ6GmHitFM+cM5IIPvkKL
         9ABA==
X-Gm-Message-State: AAQBX9envWV1o1ZHHqH212t09rP9k4Ur9qWxyCHm91ywOejqQKIJvCEK
        faEYEGT9G6iMhLLluD0Y9j+4Lg==
X-Google-Smtp-Source: AKy350aGrUuveydvpkrghVrLY36vZoiLW9cBAE9U5SUeV/1oxrX4oGggzYQQPGwewToBRKFwNVEuwg==
X-Received: by 2002:ac2:4563:0:b0:4e9:bf83:11a4 with SMTP id k3-20020ac24563000000b004e9bf8311a4mr3030321lfm.7.1681152747494;
        Mon, 10 Apr 2023 11:52:27 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q27-20020ac246fb000000b004eb2cc16342sm2222550lfo.21.2023.04.10.11.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:52:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA with coherent SMMU
Date:   Mon, 10 Apr 2023 21:52:26 +0300
Message-Id: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the Adreno SMMU is dma-coherent, allocation will fail unless we
disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
coherent SMMUs (like we have on sm8350 platform).

Fixes: 54af0ceb7595 ("arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes")
Reported-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2942d2548ce6..f74495dcbd96 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1793,7 +1793,8 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	 * This allows GPU to set the bus attributes required to use system
 	 * cache on behalf of the iommu page table walker.
 	 */
-	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
+	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice) &&
+	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_CACHE_COHERENCY))
 		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
 
 	return adreno_iommu_create_address_space(gpu, pdev, quirks);
-- 
2.39.2

