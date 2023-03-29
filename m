Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC5396CF2F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 21:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjC2TR7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 15:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjC2TRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 15:17:52 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BFE4223
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 12:17:43 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a11so17269919lji.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680117461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkKk7Qpt0miI3NiUcSnncqHdyr3DuNCBLMRDZMN+mTU=;
        b=enBcjGxxUnor9oWLRKL39mGkXt0uM4ukXO4TmIUsx8QDTVJHE+WtDZJp8K6XZtoUsO
         TtPTRxWK2LFhLrFf4LbFuqwmGw457e0bhK7OydymVlxIrOBf48dOQvOGlTqCzguFflOD
         YeyL8hWsKo5R0OyIMLU63dzzDWsGQ+Ham8ad67fdl6G+QEbuZp79MnA80woYVwVd5fMF
         r1slPiC7RNS6x3IwlPQqR7CVKKBuK5VloT4SKHBNqUs9EGlMN7THx2mC1SdSaBCajuH1
         uUWVG2VleI+tiKgTLS7u+YD4KkyBxjGZqlhzYA8LomlrT+FeMM+t5OxMTSNk6FtSYYEN
         ZvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680117461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkKk7Qpt0miI3NiUcSnncqHdyr3DuNCBLMRDZMN+mTU=;
        b=tLsbY7cNinG4Dfl41m4EpM37kVG2TVIh5TVd4hX8bU3+ymbgeDJXrWAwn5wNM/Q92t
         tZLiSYGfhz2U0wg5sNXjbcJ7Ak0wbQ7EvNSWwRnZuwFLNW8Uut5ByV734lSGYN+Kgghh
         aIRfi+hE2wHXMTb8+odHwN1N/wdXThEP6eocRr/5+STUrMjH7fmvEakaJq+XjMfDPoD9
         hpA66OTxTAdhuaGCkRDdanzWvmrhc1CguXaE5LtMmiVRmfuLsZ/KGgVlkwddje5dsXuY
         uPTJG4IhSF5jYXOMhC7kxN1r0oZeKfTHjriBv3+VHiG0WHH/6vooD83u0jZepYXfCu69
         7rgg==
X-Gm-Message-State: AAQBX9eXBXEYObJA4Bus0wC77UnkJxjGhCOD3HPupewNnMw77cyLpT1M
        KhdHQFq14OMgpzxhMfBcTH47dw==
X-Google-Smtp-Source: AKy350Ys71TFalUqyX/0rCk+E386hQB0F1YvA98ANc8+ixU1OZVN8vyGzE0saNWdDU0GDay7QHZOGA==
X-Received: by 2002:a2e:9bcf:0:b0:29e:a3a0:ee2f with SMTP id w15-20020a2e9bcf000000b0029ea3a0ee2fmr5997809ljj.30.1680117461681;
        Wed, 29 Mar 2023 12:17:41 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id f4-20020a2e3804000000b0029ad1fc89b3sm5189658lja.60.2023.03.29.12.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 12:17:41 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 29 Mar 2023 21:17:31 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: msm8916: Improve GPU OPP table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-topic-adreno_opp-v1-4-24d34ac6f007@linaro.org>
References: <20230329-topic-adreno_opp-v1-0-24d34ac6f007@linaro.org>
In-Reply-To: <20230329-topic-adreno_opp-v1-0-24d34ac6f007@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680117452; l=1898;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JPOS4C7Jq8MAmse1/02vKyaIWx2AGQSTrD2cYU4Vq9M=;
 b=lR/hlBWa2ERR2A1gCrnw36uoxaK8g9TG5iXuPzYclbj1Ce9GkiXJWntiYjP8oOqkHpGQkzk4jdjf
 xNIJmF5aCXtrCkWWqIkgo6zRBmnrYl36cNeRr/WMJC811dC8QWzk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add required-opps to ensure reasonable power domain levels are voted
for (currently we've been piggybacking off of miracles and MDP
votes), add missing frequencies and add newlines between each
subnode.

Fixes: 61b83be9117c ("arm64: dts: qcom: msm8916: Add gpu support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 639b158b4fbe..13bd0c647c1d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1287,18 +1287,31 @@ gpu@1c00000 {
 			    <&gcc GCC_BIMC_GFX_CLK>,
 			    <&gcc GCC_BIMC_GPU_CLK>,
 			    <&gcc GFX3D_CLK_SRC>;
-			power-domains = <&gcc OXILI_GDSC>;
+			power-domains = <&rpmpd MSM8916_VDDCX>;
 			operating-points-v2 = <&gpu_opp_table>;
 			iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
 
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
+				opp-27000000 {
+					opp-hz = /bits/ 64 <27000000>;
+					required-opps = <&rpmpd_opp_svs_krait>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs_soc>;
+				};
+
+				opp-310000000 {
+					opp-hz = /bits/ 64 <310000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
 				opp-400000000 {
 					opp-hz = /bits/ 64 <400000000>;
-				};
-				opp-19200000 {
-					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_super_turbo>;
 				};
 			};
 		};
@@ -1368,6 +1381,7 @@ gpu_iommu: iommu@1f08000 {
 			clocks = <&gcc GCC_SMMU_CFG_CLK>,
 				 <&gcc GCC_GFX_TCU_CLK>;
 			clock-names = "iface", "bus";
+			power-domains = <&gcc OXILI_GDSC>;
 			qcom,iommu-secure-id = <18>;
 
 			/* GFX3D_USER */

-- 
2.40.0

