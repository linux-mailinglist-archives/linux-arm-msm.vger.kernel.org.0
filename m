Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 407336F8B76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 23:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjEEVmW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 17:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbjEEVlu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 17:41:50 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777B45FC6
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 14:41:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f139de8cefso17557520e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 14:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683322864; x=1685914864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKTw5Zfw+dKxxnY8fd/tof/aQPft5PObVsbIBwm4nOE=;
        b=ukT0/Gbl014hMNt6POWBZru46jjtyO67bCDOzbZQZOMZh/Xs1H+L8K6mDJGk6hCggf
         hP8OvDws58qepr8kd9WeIEaA83Rd6PluO+iUO5+29SlGxYywQWhIQE8qIa4GBG418mt8
         c5l3uHkpi/5r7sB13IdmqPFrrHzj/BxFMY0JaZPSq0RF8ukN/qvrdcvLllwn9NNL5paG
         xQMSTWDqos2eRlNGrdkBtaReQd/VjqO7SYfT15338L6qPFxVkRTh6Q6AfSncogyQyH45
         fZbyB/xTGzrtQcYxtMwV24Pyo+2bBYQzas5NnRA2v+FQniqofEXyRf8f/6JQ4+lNTg6F
         2clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683322864; x=1685914864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKTw5Zfw+dKxxnY8fd/tof/aQPft5PObVsbIBwm4nOE=;
        b=KTo/ybchJqb52xc9+Ktq64gPlLw0j0Y5BRq07yon9wZR2DgKyZcQ7xy/LvmqkrE7M/
         dxuvLXMdNcTvQVfTla1i35JLJnMdysiysHRWNz2cAErsWHZa4rLbAjbmk8n1MHMH1S45
         MIAp1veIAJNqHecUP+gDhs0q6pI8Z4OBOOyAuDtqA2yEfkzuPerepIJt7G6D2mSalByK
         lrVUuASB0uXYlZp0NxgXyP8/5OEqB7xOQQzQVUDXjg3nlsxifnK8Jn+8vQ2PZCZThL2n
         5n9iCQSigQzpxnKTyA5CqCqv2UpNNcZJZ167oX+xx+zQoM44esF6yhFrWCwll6UmNE1Y
         qKww==
X-Gm-Message-State: AC+VfDyCsoJFe1SistMqJTLicQw9+w3jHTZ73WyiExhoU5LEPdz3Ykes
        FTeBccrjSmjTUdo2X+GpmnRO6/IWSOscnPQnMvA=
X-Google-Smtp-Source: ACHHUZ6ZtEMdLb5DxiTNnLAorcEKFTUditPxbDFGZDHqLOLxFtWNDnrraKKGdt84CJWoao5/f5ySSg==
X-Received: by 2002:a2e:994c:0:b0:295:d7a8:559b with SMTP id r12-20020a2e994c000000b00295d7a8559bmr880720ljj.10.1683322863863;
        Fri, 05 May 2023 14:41:03 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 14:41:03 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 05 May 2023 23:40:38 +0200
Subject: [PATCH v3 12/12] iommu/arm-smmu-qcom: Add SM6350 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v3-12-9837d6b3516d@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=1014;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=d3S3xhOuliIdaa9KoHmUn1yxgnvenr1zId8Sw3Pr4Gg=;
 b=u3I52rgeZRIPJW2hyj/d+O+JrD0lLVAtextnz9mrc5yCQjY92j+5ZQdr3tADqPYJVA4RutRv3
 92CfHxICo1ADBe7zjWqCKUtgraxwFrHDFKvLO1TZbLhn+tvZjWcQpLU
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

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add the SM6350 DPU compatible to clients compatible list, as it also
needs the workarounds.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d7d5d1dbee17..e64c737724c4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc8280xp-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },

-- 
2.40.1

