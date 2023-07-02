Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCC5B744F32
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjGBRnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbjGBRnN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:43:13 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50FBE67
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:43:11 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso58392591fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319790; x=1690911790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6xlLRk1fYN/CIBfPLrvf0p37P9WFmKE4yFn7ZJ/dKo=;
        b=pTQafm5Oj7ccSGVOVbnjW9wwbqZXwPWtKv+vOeoB++pPbZefHB8IsGDXyMg1CYdi/q
         vjcQea/na+3n/UGnRiFmQaoAYWLDBQyegWnQBfwS00p9U4DphA870o7mQNLlT5d8Xrd4
         01VNVw0xrl7LokKnrPyr+T6Fzl4rcqmu8m8EcO1lFHdykqzTx7eXgPe6w5VrcxhAJ+3g
         2bzeMtckFppvLadCuPr9RzJ6wnXEhTpCMFWO9R+S0/gUcukdgCNll7ZL4JbSO6hgusvK
         prtBaSPMMEwVidneD162uUMzt8ITDMcZb+yH5zGo4pCKoi44nUcxE0+Meu90KVAcZwIc
         r5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319790; x=1690911790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6xlLRk1fYN/CIBfPLrvf0p37P9WFmKE4yFn7ZJ/dKo=;
        b=SSTFw+i2trsAv2BUmhteJT89HyB47HOk5HeF+Ygv4rDw+X+ZnhMMnvmV4evhNFP2Ke
         wiTGJ/cOf8YaAXe3JYuUw6DWcBp0XbDQ3zWLgIQ8ueVfW9+UAXJBnGhp5WUmKcCHYVIG
         mo3ICBXLA3K3Pb7sZoM6mpUFhfItypZWoElFMCgIAbXqLqdFr+dSPxYtettCuzQEGXJ6
         nNH/KZpqimB1HO8lcrMNy5SXUHBzrSECqbnfz4pDj+Njcc9lpTuSRGghdpjjHAV8ZZZv
         pwpgxC8YRNnpoLSMU567i2Z8usSyew622tehaIAs3+jRUF3Tx44Tyomua/BF3fvNA93J
         rRwQ==
X-Gm-Message-State: ABy/qLZgNhUOvJXB6zjxKq3ZP1+039kqrFozOmbEcLzb0bWjOO9zogPr
        tPfIob04Zbr5fuKmC/pIvd/Qqg==
X-Google-Smtp-Source: APBJJlGzUSqA8cgtTpQxgCces82GHZbYjOw4Td6m506DLn9qHglWl/yrBewQzk0QEhjY8H/aWqaiYg==
X-Received: by 2002:a2e:3a09:0:b0:2b5:8a21:5627 with SMTP id h9-20020a2e3a09000000b002b58a215627mr5172699lja.51.1688319790072;
        Sun, 02 Jul 2023 10:43:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:43:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v3 24/28] ARM: dts: qcom: msm8960: declare SAW2 regulators
Date:   Sun,  2 Jul 2023 20:42:42 +0300
Message-Id: <20230702174246.121656-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SAW2 (SPM and AVS Wrapper) among other things is yet another way to
handle CPU-related PMIC regulators. Provide a way to control voltage of
these regulators.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index b25cd58003e2..ba82b6ab899e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -223,13 +223,21 @@ acc1: clock-controller@2098000 {
 		saw0: regulator@2089000 {
 			compatible = "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw0_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw1: regulator@2099000 {
 			compatible = "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw1_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		gsbi5: gsbi@16400000 {
-- 
2.39.2

