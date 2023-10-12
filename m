Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8FD7C6225
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 03:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbjJLBUT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 21:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbjJLBUS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 21:20:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD9DB6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 18:20:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50337b43ee6so622139e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 18:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697073614; x=1697678414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0QpM7iUu/pH8/30Lj+P5P2kendMvJf7ma+nZODDuwY=;
        b=UiKK7UJmKpC6h0YTu4MXj5o7dZA4fD9TRggfToveixI/tH/jeOMHBhyrh56/XSq9Ik
         ZSR8v2PdcvGaTkpXdYmEqLmqrIAmSD1B3N/lKg+EFHAHXbqFsXgGoWZMXcBQT2bVByH/
         e2FjB20Da0rTr1hZUvXURXc9HG3aTjbXIfXfNFwmpD/jPWZYzyDXMQ0zF781LnWoOLo7
         wPjmmzcm6F2AXpCCp5rdWlokGEPkpT88778u/J1mguDmpe6Sltc2TbmQGNrio5NgfuMx
         GFE8YaMhne/1d8iLPiAPMwTs4qm5QcvCDCJrh5atjYLghIv/HMEuQ37/A+e7Sk95193n
         ee6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697073614; x=1697678414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0QpM7iUu/pH8/30Lj+P5P2kendMvJf7ma+nZODDuwY=;
        b=bEpk9/LvDlLzax+USc0Rr6DN83s+ubXgAzk6G9SqODt9USp2GVSskufy08oLGjLqpL
         +nes0WnMje1v5vSQMzdIkmPdgp5VqPSpcpyZZY0+WpmTJX3/giwPerFyUBb4RZW7Ywm4
         OsDFWBNBpMBLzPV6a3GxQl7PuafcjzrBL9Bs/re8qPjz3Ht6yFuhH/QMkl+Zwr6tXshU
         VgJkW0opUyae31xSb9LUAOu+3KBjq5nuszZ4hfy3ge14f8oaozYXj0tqiZkovgcmPmkc
         uOEaTP7nOi5LFNb8fv+Qwg+kyXfOKPk4A56dQpVmMHkQ7LZUuMqN+vsZ4o3PuLX+EDYC
         Onew==
X-Gm-Message-State: AOJu0Yy2lXv99Qb393DgyOKW6VZ+xxiRWiXRkuoljssmvVEt1zxqRl5I
        4hkxK61gCtz6htEYuBgddat+4g==
X-Google-Smtp-Source: AGHT+IH8qnQEiUNTgWFQZB4vHjuJ93fMWk4a1pMikLcYkzsMQSZa8cpLIN5nllg75n69SRdjQB5nbA==
X-Received: by 2002:a05:6512:3118:b0:500:a0a3:80ff with SMTP id n24-20020a056512311800b00500a0a380ffmr17005309lfb.58.1697073614266;
        Wed, 11 Oct 2023 18:20:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y21-20020ac255b5000000b005056c997ed6sm2518994lfg.163.2023.10.11.18.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 18:20:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/a7xx: actually use a7xx state registers
Date:   Thu, 12 Oct 2023 04:20:13 +0300
Message-Id: <20231012012013.449918-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make a6xx_get_registers() use a7xx registers instead of a6xx ones if the
detected Adreno is from the A7xx family.

Fixes: e997ae5f45ca ("drm/msm/a6xx: Mostly implement A7xx gpu_state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 10 ++++------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 18be2d3bde09..91a564a24dbe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -882,12 +882,13 @@ static void a6xx_snapshot_gmu_hfi_history(struct msm_gpu *gpu,
 	}
 }
 
+#define A6XX_REGLIST_SIZE        1
 #define A6XX_GBIF_REGLIST_SIZE   1
 static void a6xx_get_registers(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
 		struct a6xx_crashdumper *dumper)
 {
-	int i, count = ARRAY_SIZE(a6xx_ahb_reglist) +
+	int i, count = A6XX_REGLIST_SIZE +
 		ARRAY_SIZE(a6xx_reglist) +
 		ARRAY_SIZE(a6xx_hlsq_reglist) + A6XX_GBIF_REGLIST_SIZE;
 	int index = 0;
@@ -901,12 +902,20 @@ static void a6xx_get_registers(struct msm_gpu *gpu,
 
 	a6xx_state->nr_registers = count;
 
-	for (i = 0; i < ARRAY_SIZE(a6xx_ahb_reglist); i++)
+	if (adreno_is_a7xx(adreno_gpu))
 		a6xx_get_ahb_gpu_registers(gpu,
-			a6xx_state, &a6xx_ahb_reglist[i],
+			a6xx_state, &a7xx_ahb_reglist,
+			&a6xx_state->registers[index++]);
+	else
+		a6xx_get_ahb_gpu_registers(gpu,
+			a6xx_state, &a6xx_ahb_reglist,
 			&a6xx_state->registers[index++]);
 
-	if (a6xx_has_gbif(adreno_gpu))
+	if (adreno_is_a7xx(adreno_gpu))
+		a6xx_get_ahb_gpu_registers(gpu,
+				a6xx_state, &a7xx_gbif_reglist,
+				&a6xx_state->registers[index++]);
+	else if (a6xx_has_gbif(adreno_gpu))
 		a6xx_get_ahb_gpu_registers(gpu,
 				a6xx_state, &a6xx_gbif_reglist,
 				&a6xx_state->registers[index++]);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 8d7e6f26480a..9560fc1b858a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -328,9 +328,8 @@ static const u32 a6xx_gbif_registers[] = {
 	0x3C00, 0X3C0B, 0X3C40, 0X3C47, 0X3CC0, 0X3CD1, 0xE3A, 0xE3A,
 };
 
-static const struct a6xx_registers a6xx_ahb_reglist[] = {
-	REGS(a6xx_ahb_registers, 0, 0),
-};
+static const struct a6xx_registers a6xx_ahb_reglist =
+	REGS(a6xx_ahb_registers, 0, 0);
 
 static const struct a6xx_registers a6xx_vbif_reglist =
 			REGS(a6xx_vbif_registers, 0, 0);
@@ -353,9 +352,8 @@ static const u32 a7xx_gbif_registers[] = {
 	0x3cc0, 0x3cd1,
 };
 
-static const struct a6xx_registers a7xx_ahb_reglist[] = {
-	REGS(a7xx_ahb_registers, 0, 0),
-};
+static const struct a6xx_registers a7xx_ahb_reglist=
+	REGS(a7xx_ahb_registers, 0, 0);
 
 static const struct a6xx_registers a7xx_gbif_reglist =
 	REGS(a7xx_gbif_registers, 0, 0);
-- 
2.39.2

