Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CE170D666
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 09:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235960AbjEWH6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 03:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235588AbjEWH6a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 03:58:30 -0400
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E59819BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:57:01 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2af2e1725bdso38111321fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684828485; x=1687420485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71R2q19ZXsGZnOPocAOTBJ3+IZ1FZhz4Wl6PP95R9qE=;
        b=E9Np0nYqxVmNfucL+4LsBx+RYim8uF7NofAXouuhhBKVMdZ6fDo02uR3UlcwPHEZBt
         isCEHQ/tu45xDoGRaYVxCMiLLfgLmefxw5gXr3OzJGg+cHCtrABJaCfh6cGdLlI2v/zu
         qamy398zM52z3NdR8AqSabb8YZcumV1puAmmHPmVBkTl/hygNPfdyPbL9BKYx1yXfCee
         QAVzRkvc/dXmM0sqEQoy8tNDPa1FmF4bMqzBHFkkF+SYt5d+sDIbhNhRHkftQociBlsw
         O+kFHlupu0mOZue3T0UqRgdYMY4TpG/xw4dME3denUQGVhlpcY1ALW5w0o39ODds4b6G
         tqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684828485; x=1687420485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71R2q19ZXsGZnOPocAOTBJ3+IZ1FZhz4Wl6PP95R9qE=;
        b=GmOYYN1AZ3vkrHXB/L9zFds4pYEzryLMQAITFaYJOl4jvRXqJZDYwFJLLX53qhMFXW
         3eXi/UXnRcsH7wQCcVS2Q8UPmMv81xYYSgYKzAi9OVRY4C9PhdIYDi07+eHiyEp+TlM0
         BbhJA9wQh7mj/5p+jGz6PNvC4FH7OlcsceAvJahP1wChfFGrzf8aNOIaPAVcSIDeGt0s
         sMEhQVz1gQD4ZNkWq9nqT22ckUUAU0HqEJGPy57I3CcrF2vGdd8MLz9A/QitZFwnuCyy
         CC4lTw7k4iPPRq7MVzNIQwILHI4kk8Hhhl/KF3Ilya6/4BO4vA5WohYhph/DYeoeSeU8
         +s0g==
X-Gm-Message-State: AC+VfDyynmBPj4RZdaVWFQtD/RgqJQ34nfQ2H6SGc/FO+/C3cF1+C5/o
        rByZYCnl+YxE9yzfGQFgwNYU3bGAColNFTIT1BY=
X-Google-Smtp-Source: ACHHUZ5JTVpp/5NYzr6IYfEXUmBsbC2bmktnK/xToOViR87FZyWOzG7h4gTsSFl8nLwfgfTSrf+jJg==
X-Received: by 2002:ac2:4847:0:b0:4f3:b242:aa98 with SMTP id 7-20020ac24847000000b004f3b242aa98mr4037954lfy.30.1684828025193;
        Tue, 23 May 2023 00:47:05 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:47:04 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 23 May 2023 09:46:23 +0200
Subject: [PATCH v5 12/12] iommu/arm-smmu-qcom: Add SM6350 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-12-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
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
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=1014;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CPO6pRkqp9OH9BXcQBO5PamnhFLC+q+SwQwF41wCtLY=;
 b=k7xKsuFLcWfaIkR5AoVwsP5oWEGrwWp29yM+FdNZiowj/uPcFBuemt4KcDaxucF97xazSftcP
 FeLxlwlnyYMCspg0xBeAlehmkXWyCgK+IbNjZK0m2G5efyzBkT9Mgm+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
index cc574928c707..bdeb587552c0 100644
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

