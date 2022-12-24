Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE195655A92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Dec 2022 16:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbiLXPnI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Dec 2022 10:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbiLXPnC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Dec 2022 10:43:02 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BEFD2E7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:43:01 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id z26so10705723lfu.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkr5Exgi06+xKVCCNyiQbw/n960G2dg7YaR+fydYB0E=;
        b=vGcSTABQWEfvXzaE7TTKQmvtuo0KHb6+psEaEPsGqAMd6elU+EHBfpfPJu3oVjplqp
         0Kz4vZc88JAvEvNhgqYd1jgAlyPgnb6c9KKj6WQSe+DEB+NNDngjvRLocOFCFSLD2s0q
         evsWNysST74SGEGtzysVBIOZzXq+EWfNPdIFSSFXFJpL0C3gBSAAid/gSpTQGE8ea2Vy
         9/WCvn8rCHqU9YgSWklhuqhazJKLQNrHDjoI//lMmTGHVaXuXsWI4nQdSBaF09uu/AhA
         hhj8i+3cS1mKk37gBGS+GXa67mRB8oqcU5Cfj/cfv/V2wotPYuhiCDh1Da6r8nO8fr1i
         mqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zkr5Exgi06+xKVCCNyiQbw/n960G2dg7YaR+fydYB0E=;
        b=ik36E2y2v54uHQPpldJcgzxi85k+DTimhqwl7Md34k87xnxiKazlNKnziGX7F7AgUD
         /rU+8y/+TYF/AOfUNyWFG6Ga7sQNMqF97ej+EuX4hVd8ivT3imKlNfe3YtmvxUQqRH9T
         e8WWc5CoUivGelCjwBV8TtWat/qEuvrDHuvedA4VO8/d4LC4oBl1OTsp0YpZBj/j+diM
         keV4TeXaYxBZYeiA7ucTljqjQSSwGookKTnCuOTK/2bafkoBphCo4UZzrvHUqTEms1eV
         rxkduRWzdpFg+g4ocVrfsvc3N27B+awKFFO0NrvU8wdN/mVDVVrAymNu4GAbGKDdRjL4
         lFgw==
X-Gm-Message-State: AFqh2kqpkv75kw7N5BwXw/LeUmhwb9MRRPNwuD8pClZnz8OGw+xNLguh
        +yUs0uaooefUWl6VpzJuaHAb8Wq3m9yXdWZb
X-Google-Smtp-Source: AMrXdXtn8Jn0v/6oK4lR6yUFFAtO13bSuAhMKv0K54jLZTayYXhV4bkIyklekaemDxhKFx9h2myPZA==
X-Received: by 2002:a05:6512:3c8d:b0:4ca:b51b:2bb3 with SMTP id h13-20020a0565123c8d00b004cab51b2bb3mr4202755lfv.39.1671896580870;
        Sat, 24 Dec 2022 07:43:00 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f14-20020ac251ae000000b004b257fef958sm999927lfk.94.2022.12.24.07.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 07:43:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/5] arm64: dts: qcom: sm8450: re-order GCC clocks
Date:   Sat, 24 Dec 2022 16:42:54 +0100
Message-Id: <20221224154255.43499-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
References: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect GCC clocks in other order:

  sm8450-hdk.dtb: clock-controller@100000: clock-names:1: 'sleep_clk' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index e1df3dad70fb..bb84bf3899b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -731,13 +731,13 @@ gcc: clock-controller@100000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>,
 				 <&pcie0_lane>,
-				 <&pcie1_lane>,
-				 <&sleep_clk>;
+				 <&pcie1_lane>;
 			clock-names = "bi_tcxo",
+				      "sleep_clk",
 				      "pcie_0_pipe_clk",
-				      "pcie_1_pipe_clk",
-				      "sleep_clk";
+				      "pcie_1_pipe_clk";
 		};
 
 		gpi_dma2: dma-controller@800000 {
-- 
2.34.1

