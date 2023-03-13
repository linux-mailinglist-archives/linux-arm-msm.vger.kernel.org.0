Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D106B7648
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 12:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjCMLmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 07:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjCMLl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 07:41:59 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E43C865066
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 04:41:26 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t11so15313942lfr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678707682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+k+reC4AwOd4vHClc4yefjsS0s41ZK6miu+3sYuwsE=;
        b=D+6o3R1C0cSJshMzbgjMBzugrRd02mjgMMfcRAKcnQWvZlip/dpYUvdrAwLYStgPJo
         fiZzOFkhkhPAlxBmzrAa9GmJCIlaxse4NnECdxF1x4Yr3UqS4R4nWdNmiPFmWmDdRxY/
         Df+eK9HgoGcaYxUT7CwXASV/f8O7XTz/pdgkKBAxrzBPktwfJxt40blD5azzyr7T/J61
         bc1Co7BLkUKxHPkYsXIXFFrBY2Prt1gmxJjr9eawzJrvCcWGLTzDVaGLSUmmJz/3hDkE
         Gczune8n299zuSUo6Ddj04cgXOovXbVOBcbvLb3KCfQBULipdHVGos6yEaQ3jShQtU7d
         x97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678707682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+k+reC4AwOd4vHClc4yefjsS0s41ZK6miu+3sYuwsE=;
        b=AsSVDPg/0s68fCQgB92Q/VOR4QkBt/8s7+9/i/r3kfCZmbYVdFGafZR7TZhyaM817l
         CBRDasmtTQ8vYxkl0udwtQnUqwL8l0DwtBNXy8PlXJxiyNzD+u6comTDSRpdLcaluZFs
         CEV+5ABiY4FABeych4rlA/h7gKIsecaBWe55utoffxrh5WGJDaAJRZd1j+cegesIgxJE
         +6hRwwyb8Xuw0XRBC1dsy1ZCNjVkRIXrn+S1KfxOGoZY32NhEzvJcN1txvlMRKHR1vWs
         hHfxPe+V456sKfdbnswY0IHBqcKyTlQ7BUmH5fYCg8WJOMVnJ9liltPZh/wb1fRfY2C+
         Taeg==
X-Gm-Message-State: AO0yUKUoeJvPAr0ufHNCS+Jne5SF/3NZq09aW6Z6PzEfLlBr9p7zA69A
        2RM8QVeqUrkgMJLq6VxkNkvJKA==
X-Google-Smtp-Source: AK7set8JAuzg3+U4FmrY83xuBoNpWhJ8U0Eae2ii+jB7mOPeJtAPpZ1/jkLcsDPaWDwSEPde5egsUA==
X-Received: by 2002:a05:6512:204:b0:4db:a19:6dfe with SMTP id a4-20020a056512020400b004db0a196dfemr9171576lfo.26.1678707682378;
        Mon, 13 Mar 2023 04:41:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id i2-20020ac25222000000b004d86808fd33sm948465lfl.15.2023.03.13.04.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:41:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 12:41:10 +0100
Subject: [PATCH v2 4/7] arm64: dts: qcom: sc7280: Use the correct BWMON
 fallback compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-ddr_bwmon-v2-4-04db989db059@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678707675; l=775;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HQt/UEo0cCtLu7F+JcX1cFn0BClxhTD3AkZRLXFvT0U=;
 b=8GfFDsHT11QIGg4Lh93AuCcCvfDiE3d5GrUEo35sOOaBIOvDCiRTRVmEUHTptsgg9YFoj0wItyjZ
 b0Q39cQ1Bp8sVVQITi4tFc+DvQ/0+uwT5yCCU3tEU/gbcqROcQd7
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

Use the correct fallback compatible for the BWMONv4 with merged global and
monitor register spaces.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8f4ab6bd2886..f15fea6cc316 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3533,7 +3533,7 @@ opp-7 {
 		};
 
 		pmu@90b6400 {
-			compatible = "qcom,sc7280-cpu-bwmon", "qcom,msm8998-bwmon";
+			compatible = "qcom,sc7280-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0 0x090b6400 0 0x600>;
 
 			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.39.2

