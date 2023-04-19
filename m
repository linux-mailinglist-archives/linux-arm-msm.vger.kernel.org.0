Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2326C6E7D2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 16:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbjDSOm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 10:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbjDSOmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 10:42:05 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432AB5B95
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:42:01 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id gw13so17239302wmb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915319; x=1684507319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yymjSGC3tlJ8CTIWQfRQnr7EzIyj4uwftqUzbfgU4Q=;
        b=D/0UzDxfvxPNll1SFt9ReNSOMw7GR5gMsFEgFViRFdc9JG/hhS+0jC//Bmf6e/rOsR
         OqU+p9AkOs01JMEIE04jvHzPkUAiuRfwXrrzgLQlEddqieON9xINvdv3+4G4GDnxjSFl
         JfB7Mw04qQgFpezNH7Iyyw2O90O5hiEWv3y/Elif3Nz3QrTLv55xCZmqVhdhr7nBt+4m
         tO1vR4tPEiv1yKOtnDPIEtIpzz7a47w4Ztt2NmtspD6PCmMoqdanfp3Zde89zGwM3iHB
         TWXJ10VW93Mc18JfkPv3wGo8KhZAgomBWdzrhUODN2q8ZfjhbFU+YAb3XwXdJ0F8H4Nt
         SDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681915320; x=1684507320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yymjSGC3tlJ8CTIWQfRQnr7EzIyj4uwftqUzbfgU4Q=;
        b=JgBslRKZWSOZ0oeJfozGfp9O1C+wpjwF597hR2RgcNIVlqqb555NgqmN2HLR39cMzf
         AziU4r0h2MBzi4Y/dvdW4EuutEHttscPug6Gw608A8jEGjg0mz1hzkroO7RYsHP1K15T
         T5Vtdj8X92Fq83guxfiH/5hdSdUKRSoSBLTbkYESkQN87R0GynCici5SLlvg4IuKsPIr
         Ps+0vqYJD5+VF1FJc465uUUaa7mx3FEEtiHuJQI3MWSL60v13VYSAMiuEoSBQX7S+Aup
         EwEFH1nVnodAUpiZ3NJkvCAqyG20zWAZFv9JLquOjeUI0sr3gAOTFbyiTdytOrXIa5cD
         XnWQ==
X-Gm-Message-State: AAQBX9eHL9ojG41JjwVw2T0z29NqPFOR2YQvi+ahHzVsDt+PkmB/R1MK
        4SYkGx9l6qn6gipZ/NLwEQSL
X-Google-Smtp-Source: AKy350ZA/JCUf9E/Lnl5b1IOhgk6vVOtDmd7tvW/kBoqV3l2kbmlmpjpCylw6CXGNsKCu4y1wTIRGA==
X-Received: by 2002:a7b:cb49:0:b0:3f0:8fb3:24ea with SMTP id v9-20020a7bcb49000000b003f08fb324eamr16592965wmj.9.1681915319834;
        Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Wed, 19 Apr 2023 16:41:15 +0200
Subject: [PATCH 08/11] drm/msm/dpu: fix cursor block register bit offset in
 msm8998 hw catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-8-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Arnaud Vrac <avrac@freebox.fr>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=1CThvjvUKSB2kgPiGI9aOtJO2XMAO12qU/LwO8wOVFQ=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2oUuxrZffTMgc2Prc/9Cgyh4CwUGixDoWFE
 tdJpMbmdG6JAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9qAAKCRBxA//ZuzQ0
 qx3ID/sFH9PfKFzjd9oKmQi89pqSx7jCVGBpbWTrAHuhnQ6bIjfELDfr1V6GQo7xl/ef0gMR/u9
 6v8qm4VGQHws43khIcFXvu+NrjE2uwVqhTGYZ2uItNg1fcnkqCKhvoDg/08SDI7ADvpD6ZmCi0j
 lHVJv9KFGa0AR4039iGE7R0NBQqcEei/HolSkxQxdZDjNbDF+Ls0lcMwcZsTufGLktpr5n/4fHL
 KFoeqUsi0p2CwfaC5ou4bFnwK3slgkrq9qeHqU+cef0CYqdJPWgPXKuMq57bvS54nm5u6c23mqc
 MLdkZ7pZ41nh9S/LMHbVg8NfvAQZaBPCFFbHrSrbFnvg9OPfU9st29P6aYmHEYneXaRgPEuWUq+
 ind4eFdmm4boScVYenSJJLMctBlN8MckIi/k3SjXanJY5tz/bCkL/pJLhyDhKjxs4PDxx3b4ECw
 VRWIPmuYaUHhruk9rGgEbysNG6ZuKw3pOBnACN3ZjNSQLMn/VPfPCnoSKjZX/fprenyL5l8vyjg
 +IofBepTPZW5y2P/SXLQQ4GWUXFM3eoW6+KC35RX/A7ene7ilr9YQiwKDKlYsj/QG9t5NxSgzNk
 1THb6wsKAFgBV0cISRJ8F39WFmhTpVvXJXu+AL6NDHRTbDBaV6+cI4h3dBnvO94eOs1bcmDBYRN
 nAKrWj89r9JRgig==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This matches the value for both fbdev and sde implementations in the
downstream msm-4.4 repository.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 7de393b0f91d7..5ae1d41e3fa92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -39,8 +39,8 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 12 },
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 15 },
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x3b0, .bit_off = 15 },
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x3b0, .bit_off = 16 },
 	},
 };
 

-- 
2.40.0

