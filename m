Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7ADF61F0E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 11:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiKGKhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 05:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiKGKhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 05:37:53 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6A813F84
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 02:37:52 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id l8so15519741ljh.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 02:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rZ789OFHN1lvkUIK4iYOi8r4E8Mj/5sPrWBtspHEEYc=;
        b=SUU5GZV7PxILUP+Mvtd2gP7xXAx6ujr9uOXhF0uRH18a/r9aUS17lPy8XCXLXzrYcn
         OpaiT/FZHxf4x/y8yR3DErFyw+neNuH72Y+DTt0CT0WLPTq/WJklySeLcUEg7gx5IRpe
         8y5BdR8D11K9jR2//LWrt7NHSkCT/LzI/hP+MN2nus/SNmy2YIzVgorK4g6UOwA17l8W
         fRFqDujR2f+GmM7agUH4AJZD8QmrM8R7W149HIysl4HkUNvOnnRo6jICyGkwd5L5ulrb
         j9lypNP+Fgjlb8+EMOa4YIPdPQ59nmfxuuMuIqNnwW9CuZiaOOEFUMWq2q17nX+ckBlC
         mAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZ789OFHN1lvkUIK4iYOi8r4E8Mj/5sPrWBtspHEEYc=;
        b=Sw7YJkoaSBlUPgk965YHkn/7TnsbQrf+1oNzmZCeF5T0nTEmdzeVVUxHrFdsEcL+m8
         pqRi7Rr7JH4UGLfAGwstveo4I9t6TH7ckg+1GCBHlCniRdrkYfDYoxfVg1QZYW2BKpnR
         9RxtRl0Zx6fmsdKVAFHaRnHQ5RqCbWKszkAvZGaRlWvjmb9IrA/nsPr8clnRR1fzmAWT
         9MYOI4y2nyTTEeeOkmWs2D1sBjqI6OlR/Xt4Fdqts8OUoUZwOAAziFdF81yXImbIUwIe
         9Ur22vg8uWLBZqAfMmjX9kr23koEscqaQEtbDpnUTJcWYyAH5CZc614lPuyZcIoMvqW5
         k96A==
X-Gm-Message-State: ACrzQf14kxL8rFFImklp95AXLxhhJU/ivusLdQtCEZhuJQBMV8pc0Hwm
        TcII9M+NyQXMua78HHdZaPZszDuQ7mcq53cf
X-Google-Smtp-Source: AMsMyM4YYYeo3vxWbYCQB8vu+0ohY5wwmclDKz+L3YLGxETCqfM+qAO9cHNmUNcZAtCYoM5dtUPOkg==
X-Received: by 2002:a2e:9ca:0:b0:276:ac05:b821 with SMTP id 193-20020a2e09ca000000b00276ac05b821mr5561542ljj.84.1667817470535;
        Mon, 07 Nov 2022 02:37:50 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512200e00b004979ec19387sm1162599lfb.305.2022.11.07.02.37.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 02:37:50 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
Date:   Mon,  7 Nov 2022 11:37:36 +0100
Message-Id: <20221107103739.8993-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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

From: Konrad Dybcio <konrad.dybcio@somainline.org>

SDM845 only has INTF0-3 and has no business caring about the INTF4 irq.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 27f029fdc682..06897a497eb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -86,7 +86,6 @@
 			 BIT(MDP_INTF1_INTR) | \
 			 BIT(MDP_INTF2_INTR) | \
 			 BIT(MDP_INTF3_INTR) | \
-			 BIT(MDP_INTF4_INTR) | \
 			 BIT(MDP_AD4_0_INTR) | \
 			 BIT(MDP_AD4_1_INTR))
 
-- 
2.38.1

