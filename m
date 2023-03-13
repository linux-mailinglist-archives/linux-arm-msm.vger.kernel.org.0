Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F227C6B764E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 12:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjCMLmk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 07:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjCMLmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 07:42:05 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33AAD6507D
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 04:41:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i28so15345144lfv.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678707685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhcwZlNg1FLmmoVA2v+6lR/X6B7kwoWSENbvRw3V+fM=;
        b=vfSPDSVrRfmUnyJTEAUk27gZ10xbrdknu8UTKubV/WT0zi5EufFWzhMxppY2TQx5X8
         kGMGqLrG9x2pHGecSJUUh3uwY/+Uo+DaEksZzSaQBMiHK7Rpr/ftnDfnFXIW1GzA3+g/
         vksxTrEaxTrgPG1Skc85M7cWweigIeS1wLicUl0lwYawScQmoNRafs1XuN8lo7uYVsp+
         wlZNfXvB1f38GcNEewUE2YX820CZvZjHWeyg43RORrGTP/DCsT26NdXFvKj2A6Oa8boN
         uVn8986tIGtQZzI96vHQRmsSY1lp0WTFH8gjEjcLrhl6YO+s+Bj8p9KCXY5W+T6l0+gn
         uLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678707685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhcwZlNg1FLmmoVA2v+6lR/X6B7kwoWSENbvRw3V+fM=;
        b=RzVReZR6V7b3ohFBLT42S1iOlwxzb1rXcaxUPWUXwNSTEKWdRp3CQJJZ8df3W2dZvp
         0ZZ4ObF4FaNvdPIEN7a765dw0SQH4xArPJUOwwBFQpCwiAU9aubo/rLaOCDfmfloV3Gj
         3H0fW/pLzWkiUFTHHJ3T/0SLLuRqyVB5B6weXiFCNnO+IINQAX86HZnRmT7mtOzSK79x
         EfLLg1Pl3T0kUpRKuR977utaSTA13PweAXlXODBclyHG6z/S+GKDA+C+0a/g4nuPBy0f
         z5njaxFSToAPbvuzrCzK1f48A6CZdh4Tx1wyLbz+9R4J/JdDQy0El9+z0evB5ThHp+q9
         vjvw==
X-Gm-Message-State: AO0yUKXZyEaTH6tC3ld/QHQkctUqWNpdHH3MJNvQOCdRnZEw3uF4kMvI
        RZIHilRcwBHCyAFhGxYObCwXOw==
X-Google-Smtp-Source: AK7set9nUZb/LOKJ1Ru3fd+Ng3zRMdv8buZPjLGcDSqZD+Jdo7l6mTnGUQ+SRa1ouS0Yaom0DfBFTQ==
X-Received: by 2002:a19:ac05:0:b0:4b5:5b36:28bd with SMTP id g5-20020a19ac05000000b004b55b3628bdmr3310115lfc.2.1678707684861;
        Mon, 13 Mar 2023 04:41:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id i2-20020ac25222000000b004d86808fd33sm948465lfl.15.2023.03.13.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:41:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 12:41:12 +0100
Subject: [PATCH v2 6/7] arm64: dts: qcom: sdm845: Use the correct BWMON
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-ddr_bwmon-v2-6-04db989db059@linaro.org>
References: <20230304-topic-ddr_bwmon-v2-0-04db989db059@linaro.org>
In-Reply-To: <20230304-topic-ddr_bwmon-v2-0-04db989db059@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678707675; l=887;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N++71rZKj+7oTWz7RtdV/kr/uVQ7WD5qOJ8G1FDU0t4=;
 b=B0vj+qTKkpt9ihZA5zXoBsvvJQfdra8ZsocCae4Got+Y6tx4AhzbMPk2vXYSkRuhPD7vxTLnJftX
 bzkqiBb0C2hHUke1lwm26GpmHmbmSzaJ0AuEAYgUP2yJdNQz53K+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the incorrect msm8998 fallback and use the new qcom,sdm845-cpu-bwmon
compatible to distinguish the DDR BWMON found on this platform.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 479859bd8ab3..1f2a97a20ef3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2241,7 +2241,7 @@ opp-4 {
 		};
 
 		pmu@1436400 {
-			compatible = "qcom,sdm845-bwmon", "qcom,msm8998-bwmon";
+			compatible = "qcom,sdm845-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0 0x01436400 0 0x600>;
 			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_LLCC 3>;

-- 
2.39.2

