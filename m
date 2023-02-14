Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE961696BBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 18:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjBNRdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 12:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbjBNRcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 12:32:52 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415802FCE7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:32:28 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id u21so18523401edv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75tuzeWbOHge8haUYR8VqjYvI04B0j5B+fIBRQ7seb4=;
        b=dAcCPrk/5VN/ClxEQr1TVvSb/2mo/TA+rgX9sxkv6f+KXSvy4R1iQXsx0231GcB+V0
         QOLx5lBOHEQ8hvs83FoiRKhPFLzJ6SQzY76lgQR5cd43St9NTG2RSiaj1DckHoCi3hLz
         lFsG0VuBW1ny48WR4JXTzZ6JtfEQLTY0nyHBQQy1Wc7xlOlXhNuRCGfR0CLMJX0MdRn9
         i5K/pRPH1NmekmUqOBeVHcgCA5BJtnvtd0ZHhqxZWckykRn9NUpB0Rgc01iCkSk/VaBO
         zqUZBD1bewZd/l9DLSDMzUv60BHMQ7YorigdRgm9ozGtsGeinss72sAgge78ie5IPZl/
         96tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75tuzeWbOHge8haUYR8VqjYvI04B0j5B+fIBRQ7seb4=;
        b=bp2BFK69aqiFFJ6YlUajD+u4YliVB5xjGoMOel1HrdzpI6N4NeOOqi0y1LWTVQS1Ml
         WcAidPdUnlxDWbABXkIdzH7ppWd43rhvq9q3xrS6bHO55k5J9rEJvLYzuqtZv942Eyt5
         5noREQyMLuN2TcdBlidonco0ButYn1AQqNDuwfqs/V5rEXWGbUZjEYJ5Sc+IZ6bTNAEQ
         YAxRx90qZfPrd7k6orLsySv6sQtP2pBvu5yrZ0jqM/EuNlvJ3Q/tG0080zvWKCmc6Vhh
         m7273vG/XxUIjjalMh20e8xfK7mREbV51GiynVroeud3QAjs11AV+JxDv4noa6gEnFc2
         UwrA==
X-Gm-Message-State: AO0yUKXMs4dI+L1HgCbfx3/0iGjRPLYlNgmcw8PdgLhUOZw2WI+nbnOZ
        bADuH3pTZ8LZ1wlQsjtrMiO1TjD7Idr5jLju
X-Google-Smtp-Source: AK7set/hSEouGe401ODACUcZFYBVji3OrHZ/i1V9rNpDQ648ZWtc7eok3NgCAYZbGBGbGPuBvWYMOw==
X-Received: by 2002:a50:ce4e:0:b0:4aa:a4e9:fa28 with SMTP id k14-20020a50ce4e000000b004aaa4e9fa28mr3000868edj.34.1676395946610;
        Tue, 14 Feb 2023 09:32:26 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 09:32:26 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/14] drm/msm/a6xx: Enable optional icc voting from OPP tables
Date:   Tue, 14 Feb 2023 18:31:42 +0100
Message-Id: <20230214173145.2482651-12-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On GMU-equipped GPUs, the GMU requests appropriate bandwidth votes
for us. This is however not the case for the other GPUs. Add the
dev_pm_opp_of_find_icc_paths() call to let the OPP framework handle
bus voting as part of power level setting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d6b38bfdb3b4..b08ed127f8c4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2338,5 +2338,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
 
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return gpu;
 }
-- 
2.39.1

