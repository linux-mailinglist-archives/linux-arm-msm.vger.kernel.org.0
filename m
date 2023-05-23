Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4CB570D65C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 09:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbjEWH6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 03:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235981AbjEWH5r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 03:57:47 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C051C1718
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:56:14 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2af2db78b38so38190321fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684828465; x=1687420465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uw6zfBHO0opEqODFwIHcb35ENxPJxB7I1/UM0FjZOR4=;
        b=uDtYet+2r/ViWyTsu98i4c627u4tdRuGb2esFrAThG0yxNZS10ACONha0iu6vaQLnF
         L7LUryfPa/yek9T99WvIlKKzm3NdLACuszeVXaHqvjE6O34t2JJNHy9Yl9sa/iQ7oSa7
         SiFUhSwg7X5ILGhY8iCme4LpjhpOzAdzG8IkxyigZGNhfO5twGUnZTh08o/mM/V616cb
         zwvFDhjgxtHIHob0vSrpcbR1aiK4IoZdfYp+mJ3Gk5C7WyCqkc6Vs/0hlNsgidCbtkD/
         pTH0xFTxGDwMomdy9ISuuqQOFDqVdYpp395ay4SGoC5tCFMLnDQyF2raDOZaHyXA5TL0
         Msmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684828465; x=1687420465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw6zfBHO0opEqODFwIHcb35ENxPJxB7I1/UM0FjZOR4=;
        b=enDPxvD/+9WdEp8U0vpiBRjTFGCJ9Gv4TtATr6gzN9rwor2Lcshf06D+XcZ8LgXBpX
         3ss8uRxxac4mvdPDgnBE8IFRt/4fmTV5T9E2vOcPf/WHD2NpwzDzdw4E58V1hsUqkwZU
         5zNm7CeKp1v7fh05PqhJE/PiQbugopK3empaITgqW/dtwuY70WO6RBmwHc+lVNANY6P8
         I9iO+pbEnb9EB8KZ+uLN9Cyc4EZP1IpoXtm0CteRiSXyzmkUbVqVtjMpV0kH+doYjhLA
         jcYcjgMV89cKrFl9R6pIf9Fv5zL7YguHtoSJt7zFhUPUEBckCFMGfYcKt662E0RAuB5m
         +06Q==
X-Gm-Message-State: AC+VfDwIvW10Z2olH2n11rJeaxRfhc0heGPtAKaK2iNpTp5MEKNyZOb/
        RlWNW/MV2gmsWtdtkviICj200j2iwYgJzqRsbGw=
X-Google-Smtp-Source: ACHHUZ5je+tCABEpT59rWVo/4tlBAhiBSx3eWKuptU/vYCax7CwZgnwKQkwyRKrX/EuvKpPExSEdGg==
X-Received: by 2002:ac2:5d72:0:b0:4f3:bbfe:db4e with SMTP id h18-20020ac25d72000000b004f3bbfedb4emr2136125lft.56.1684828022062;
        Tue, 23 May 2023 00:47:02 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:47:01 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 23 May 2023 09:46:21 +0200
Subject: [PATCH v5 10/12] iommu/arm-smmu-qcom: Sort the compatible list
 alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-10-998b4d2f7dd1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=1026;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Rc5Y2oI69X8xvGgWy74AqbUqZBcFJifSW/Zzw/OwQv0=;
 b=AxD88SslQYlSx+jDzVZY7fDCrbjY+DxcqY2OWDXBPIglsPSrTy+5sbTPXxbrAqbDZono0TRFx
 8kqS2MfeoXfAzSUSXNSdhEehNfc1/lMYFLm6PLksmE0XSCcxYw8tQoV
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

It got broken at some point, fix it up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c71afda79d64..3800ab478216 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -251,10 +251,10 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280-mss-pil" },
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sc8280xp-mdss" },
-	{ .compatible = "qcom,sm8150-mdss" },
-	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm8150-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
 	{ }
 };
 

-- 
2.40.1

