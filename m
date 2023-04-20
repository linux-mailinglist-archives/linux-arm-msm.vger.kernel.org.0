Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4454A6E9F0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 00:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjDTWcW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 18:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbjDTWbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 18:31:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE4F6A70
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:31:40 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4ec81779f49so947113e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682029898; x=1684621898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Gx9hOgjws0YjXjWKNVHvwkPmSavQFOa1C9EN/R+wqo=;
        b=r69+OTvdPAJ4sKqvjR7kEd3QeVT7UrZWAtHfwc9VPuD4P23u0aKU04R04eI1I4vDhv
         ZLdrDuU/SUV972AzJsfmBa834BQ/eT8x3IKHJvnSaAchmOcUDNaly1SCgXKZdSTFmv/A
         XkqyQqJU707bQACaa4zhxHd6AQ54Bxzi2OCLHdhRnRLf2h940aCzSUSN9HaD+jKB4kKx
         IXstLdu1YaFPc+VJOKHFJQpYpS/QIMt/BJPvMLoEVPD0PKVRs4k/L/kDbUzt8EeRpl2y
         rUkgnfn1GHnqxWI72pKXIPH6Sk0KFQY3n2tAjaq2QxtzhU6GVA0HqL/S/hXiW861V0bI
         RGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682029898; x=1684621898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Gx9hOgjws0YjXjWKNVHvwkPmSavQFOa1C9EN/R+wqo=;
        b=jM9PdeUsd9Zw4fQ9MLXNT030DUSZP5loykRJ/RAiKf/8sY5x5RpADw/ERTdn3tF0ZF
         ptwGAWBUbENoOQhCZQbaPALzQUgKnm57tYjqZUbSenMHdh5PoQrlk0IKOfIRd6i/AwcG
         BtPeiH93yFbTyVYT74mXlTnCO59vK4WZXsYVaq+TP4qSdSmUup6ORFojrlLyy1w+iG9m
         Key7T/U+39ThVJzeobKnjYdLXtZSBiF3plsl+pzAOCENqrKG093sf7VmwKFsyAthmCN/
         in5205bX+88qKzClO33UefJrdN/gziN/YumkDNcPBfJlREmPBJ+eIcTejJt1JJK+Wk+Q
         dC+w==
X-Gm-Message-State: AAQBX9ftNOu41fUUGMzFOTCGSBtx4iktt5tlKd0BWFHZaSWazQ2CF8WC
        pRMyf6S45ETvkyJpDjmWiaXzaA==
X-Google-Smtp-Source: AKy350agF//FITNbmTr+sk0Wqprb9qhtIJOjH7KH5TKwATYHuhXeon0c3RlBjUadrSwCnVZyDBKCMg==
X-Received: by 2002:a19:ad4c:0:b0:4e8:3b51:e7eb with SMTP id s12-20020a19ad4c000000b004e83b51e7ebmr826262lfd.7.1682029898488;
        Thu, 20 Apr 2023 15:31:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 15:31:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Apr 2023 00:31:19 +0200
Subject: [PATCH v2 10/13] drm/msm: mdss: Add SM6375 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
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
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1357;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IZraHC2rKjwAxvGejhLYdH/8ZPnRD2vaDl4IpBKvSDs=;
 b=FP2ipxs5Nr8YDG41US/6zI6ekAMslR4vE0K4u7LOeT1EivuPnX1w5tKQTXEck12W9qVTOEtDivz3
 WuRS5/DZDjHC58OaEhn697/T/kdfsd1bZWmPg7vS1HYlJv1GAHpk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for MDSS on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4e3a5f0c303c..f2470ce699f7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -546,6 +546,15 @@ static const struct msm_mdss_data sm6350_data = {
 	.highest_bank_bit = 1,
 };
 
+static const struct msm_mdss_data sm6375_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 0x1e,
+	/* Possibly 0 for LPDDR3 */
+	.highest_bank_bit = 1,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
@@ -580,6 +589,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
+	{ .compatible = "qcom,sm6375-mdss", .data = &sm6375_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },

-- 
2.40.0

