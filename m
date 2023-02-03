Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C45968A1AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 19:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbjBCSWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 13:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233537AbjBCSV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 13:21:59 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A562A9D72
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 10:21:55 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id x7so6065390edr.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 10:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9fcb729egx1Qvwf4/qTQgTQT5IezUR50YUrxIc9/QM=;
        b=htIiQkp9QisQYYb7iQinhBUhcZCYWJ1LcKZzJqWB5qelK4fayabZWSqKoMkeTlMPpM
         Mi0e2Vh5jAaJpJgTG8k+exf4JJ0jgIlM7R1QIemEFyyLFQ7aUykQ/Kk36i8mF1lkuHzD
         uVoRmQBAF76DHq9kpAPsw6hzIKkhQZIWkrYJbbRb2Lbww6AFUnEB5UwsZHxBYEzZYIwb
         40mbxO4CUfE8Kx7f3+54vsZmJpjkK8iKW7e9ZT0JYnywEI9QtvGQ9lAn9ji4HDIkyF+t
         OmqTIMNVymha80h2LB/S+v0Xxymht77S0ZR8rtu6DnUPNJKmt6pKI7/l4NMJgXWq5Oih
         aByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9fcb729egx1Qvwf4/qTQgTQT5IezUR50YUrxIc9/QM=;
        b=MnVJldEhqcJ0L8LO7TPF7X2NdszE+58hVSlu5+P5xpMgd4L9nWLRCS2t58lcm3NpfQ
         kRxH+jBp1JRwAqCIcbkM34YPkN5S+0mn6eeeeKDx3iSp0nIJYhP/h9v+PpX0I6H+ZAg2
         fJr47Q+3tAH+og6ugHMv92i+JTwPqMffAer3wRznx5beI04LAsG6mnb8sxiNbB8xHcGv
         7AAJK5BvSTA3Yr2nGXADopNPg+TiuJTx2Lk6wHJN7YCEo5/r92hVnMwMk8evQoEfQ15g
         Z4ikMJYtYJz0C1ezn+vZ5l1pVSa4TZ2TegaHasFSyHxEtgLOUrL3FwVCAzpAXO49pUd8
         A2RA==
X-Gm-Message-State: AO0yUKXyNO2sNDf/mTgapIhwDf6hFKKEHEgmzIFIh1rnUGNLGbGIPAzk
        xLnLcqeUTWeafiFHgZa/q6OrFw==
X-Google-Smtp-Source: AK7set8ETiI2pbj/xTmtWwqTv8Sj6FYZJ+mYV5Ik9Y/zuNgOurIAr5DpEleXSf5T2gBkhNgKtJHwKQ==
X-Received: by 2002:a05:6402:b59:b0:4a0:8b2c:2055 with SMTP id bx25-20020a0564020b5900b004a08b2c2055mr4670443edb.8.1675448515062;
        Fri, 03 Feb 2023 10:21:55 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 10:21:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw catalog
Date:   Fri,  3 Feb 2023 20:21:23 +0200
Message-Id: <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
feature bits to dpu hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cf053e8f081e..fc818b0273e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,13 +21,16 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
@@ -42,6 +45,7 @@
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
+	BIT(DPU_SSPP_SMART_DMA_V2) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define DMA_CURSOR_SDM845_MASK \
-- 
2.39.1

