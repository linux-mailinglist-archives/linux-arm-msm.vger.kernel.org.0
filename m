Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C408870D772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 10:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbjEWIax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 04:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235259AbjEWIaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 04:30:23 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F6A30E1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:26:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96f7377c86aso803390366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684830408; x=1687422408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfoMnvnUW9JxHFNrsE+j3PaFEyoaLfNhlabOCKS4wNc=;
        b=l6ykQSVdmLEbNNXzfQv3iDKLKjLPpOf5c5105Qr3ISsVHx/Gd+yN+9VxHhEpEqQKeT
         KDMQtfQTFY2+V+dHliRoM8seinPy+5QhJu9G0kyLQ/wsYgB8t25CdMtndBawhx8BisYe
         m4o9Dm8RyMif/7xIpr3ocNFUIqbJAbIXVlRbluyXMGP1TFRqR15Dlpn9Fb7puEGp4AjT
         16xWmogxDuv8GS31xVDCJwtzAplIecXKhuVZcUmMBmhb/jX0XKC6QBHmMgnRA36DR4NO
         ArpAxnFiVrhz9mLDQO8sNmf/VLf2eON9Xlr61dlxob4Jks50DuACl3p8FGkAHh3WPXnW
         EvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684830408; x=1687422408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfoMnvnUW9JxHFNrsE+j3PaFEyoaLfNhlabOCKS4wNc=;
        b=SNGwKSOlKGjxMrHcXDu7i5X7R6LAf0SGTORlRUf5oaCIgPMKhx3rC9bND04iX3H/SS
         y6yk4Obz4KauFrA+S2PH9QXlgzWlTW62L0gu5gaZaQqY4dXnW7TRnPGL0+Y8T00eC1ai
         7gEBr6+LOb5RoBnEVhNGvmbWZLKR4Z5corJZ/EhGWyU2Georp90iv8fGTrmS1sq5+Ukh
         O4eOkPKO7HC2VVFQosax+GaPXKwo6KaATYPBUgKOAhRt6Q8SnoTLTOw+NRFSpdTP6IGU
         vR+vc+ENAKzq/tnFgbrbK4hHlSK18jC4InUIdFp7ZmZIFKV94oXxAMT7YReCYK9PDJq2
         YfcQ==
X-Gm-Message-State: AC+VfDzAm20JOxZW0s3SBzVZ+wbOFmEyMBb6RvnBOqk6RZ7frzXEnwIA
        0K4ENqo3KTDOV7SNv5DqoBKqZLar9rZLgWMRz5k=
X-Google-Smtp-Source: ACHHUZ7vQpCMD8z+tXopWFPnkqXpWLOyK1g9oM8UkYcSzlJeaWh7JT+2ofWynI9x1gg11eZm6ERCiw==
X-Received: by 2002:ac2:4e4c:0:b0:4f3:aa29:b663 with SMTP id f12-20020ac24e4c000000b004f3aa29b663mr4324951lfr.35.1684828023618;
        Tue, 23 May 2023 00:47:03 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:47:03 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 23 May 2023 09:46:22 +0200
Subject: [PATCH v5 11/12] iommu/arm-smmu-qcom: Add SM6375 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-11-998b4d2f7dd1@linaro.org>
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
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=U7GrazUMOESVisMUp1R2X/i2E38+ra43yVyDZTsdMko=;
 b=694+VJyXCZBUKckTCLQ5CsRJG+wJkbWuXCzZ6sGhBmhOWdEFH75k2SBgXqgbcBhvOwywQuLyK
 PilQQ3EaWw+A7wV3sA9YtDy/qbCmXblyVWuNqJmC+1aZwMqKT08ZrDA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SM6375 DPU compatible to clients compatible list, as it also
needs the workarounds.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 3800ab478216..cc574928c707 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc8280xp-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ }

-- 
2.40.1

