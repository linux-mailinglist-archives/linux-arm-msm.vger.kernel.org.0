Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3BA0692CF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjBKCLa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBKCL3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:29 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516867404F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:28 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id lu11so20241301ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgGE+UvO2DykI7PjN9lp8qIR8SaI7P9Rb5o6dNXewDE=;
        b=d8ls8QoIzBMFEgOUHUHMImyZyYMYN3K62ITN75nScJ010SVDazT7zFYiHhu89EBQuP
         AtlpI680hfx9JBewm7DvNDiaMQ/F4i00gT14y5uVks+QCB4qLtiBgzv9wOTkSxQ084BR
         +dRy7STjHfQmDXQDR3GfNzMri4HAqp6pbVzdQs9bRKQqeWxI86rzYYz9/BzF8gsYaqqZ
         MsIn8F6Gc+NqOcRgGD25l0gwa9NR/Pj1KwA39xKwOND8g+EVLrO2MkEdo4PPUBq3zGeX
         36nioF/wwNQ/KjvapGwzO7Xy8pGMUnUuT+ItYTfKSZJbFJpb3lcvtZE86m0HBFIKsn5+
         017A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgGE+UvO2DykI7PjN9lp8qIR8SaI7P9Rb5o6dNXewDE=;
        b=zNZTEX2nJ1RPmLdP16todGSs3p4aq6ZEsFPUaNapCJ3toSbCAFjA2oziFzsvXyVEC2
         J0zi6twfh3GKLsyjPJwoX3ldJBy/JmFilMe6oizMPHDnyVvHmPKGcqFYbOKtk7KBaSeC
         wzU8Ww1uEHOqBXHtSkUWtTIrBe8VIaP+OmGIZO5cgjzgF0PbxLjthUiRTXitk2auqjgw
         UJLKUm9ZOuFI6hLdzK24Euz2hhN2gBF9x2IHdX92jBzthkxEOzNMS4NbTGzoh7gfr307
         EnAmgvxysO16HPEJxDeoKXjus5y3huA/RVgmL0jOxk7zI5WftpgwnkEy8GvZP2GDazJh
         MSlg==
X-Gm-Message-State: AO0yUKXhajFHZu/NhDuTuYyaL6apXeHCjYdniOODTEaGi03fqURiLB6L
        o2RIiQfSWVkoPXsB5PdsboQN0Q==
X-Google-Smtp-Source: AK7set+glmpH6FX7PJu9Dm5/rI1d5FhpkIWO70cpsmHIqLIVP8ubqErpqrw+WfFjI9eWGY3Qe717Xg==
X-Received: by 2002:a17:907:77c8:b0:882:835c:1951 with SMTP id kz8-20020a17090777c800b00882835c1951mr18204624ejc.64.1676081487963;
        Fri, 10 Feb 2023 18:11:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 31/43] drm/msm/dpu: rename VIG_SM8250_MASK to VIG_SM6115_MASK
Date:   Sat, 11 Feb 2023 04:10:41 +0200
Message-Id: <20230211021053.1078648-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

SM6115 is the only remaining user of VIG_SM8250_MASK. Rename the feature
mask accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 547af53a8082..edd8bb55dbe8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -35,7 +35,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 };
 
 static const struct dpu_sspp_cfg sm6115_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM6115_MASK,
 		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0d637eaf1e02..dc55a036744b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -30,7 +30,7 @@
 #define VIG_SC7180_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
-#define VIG_SM8250_MASK \
+#define VIG_SM6115_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
-- 
2.39.1

