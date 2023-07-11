Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5808A74EE8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjGKMV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbjGKMVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:21:18 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510DE2720
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:20:09 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b703c900e3so87396031fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077958; x=1691669958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7SX5vYNZ+wh+FjSCpRImtxC2bIIfmNAdRBfKIkKVN4=;
        b=l8E9UNCsvpEfG8fWIlzVtSQXLQ5/GbhyW8cFcqDBQcTujSUr9tjyEIYebotXGdA4wA
         VluiBtuxVvmZ5DIENTY53xRWpQALZCkcU/jqEk5W30743ivnBEob0uVsM/yZnifOeZUw
         w1q0pnGVuFbJ2yPlM6mrYpoQ8wGl00UzI3FCCwnd1qzkYajJGAbf0JITE2XZR5lljqt7
         K1Ag4BYL0p5ETEiVBYZU18Yb9y1on59Wt2XWwAYeNI0dAuAjZuxn6XAqWyAddd1rZs5F
         NQCQ7AiZmKyhUhhxsTvLFzfWySsE1Yb10o01vqzWOsnCJFdBlzRxX5fN+PFaXYrYkzP+
         SBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077958; x=1691669958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7SX5vYNZ+wh+FjSCpRImtxC2bIIfmNAdRBfKIkKVN4=;
        b=cM568ZYwVpMeh2wcL1UjuNaexISNFhMI53NW1lS2QwpMJQtoZKhhnm8sYlHuPwDbje
         rDa8i0NNi/mO0wNk65Bbo9JemHpjSJKKRNDHuuDxed7e4+Nl5mzpA02q8MZuTEktYY1H
         zOTAOWEZDZ8td/kTdB2U+QbzUj1LVSebKCRYs2aq9KqY1KWT+38ASiKNPSHr1TLeTE+V
         JBvcdAZNppSbOVE/vZOySaIvp1/307iDmx48LZTHN5iJuGJCDgNxl3wPt73+0QLCLU1t
         UurZnF9I0CkYoWcrFdzRgWtlSTeqWbYWDh4vUHyBR3orA52P8toVNR4FuSYKMp/lucAk
         KETg==
X-Gm-Message-State: ABy/qLYhjmIvP5Vl+IAgkPCs+1GeYJUATkdC8QvDvEBx5Ys3on1Sk2cq
        zugPM6QjWLI/knofCJZOz4IEvw==
X-Google-Smtp-Source: APBJJlEvZPjbKWwtLDyi+m7uZe8apYx172lgwNKreWCH0nz12Ju4Bh1onulqt53ikGX0xnMnpF3nUA==
X-Received: by 2002:a2e:9250:0:b0:2b6:fe3c:c3c1 with SMTP id v16-20020a2e9250000000b002b6fe3cc3c1mr13217950ljg.4.1689077958296;
        Tue, 11 Jul 2023 05:19:18 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:17 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:38 +0200
Subject: [PATCH 39/53] arm64: dts: qcom: sdm670: add qcom,bcm-voter-idx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-39-b223bd2ac8dd@linaro.org>
References: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
In-Reply-To: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689077904; l=1014;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RqHxnyd+iOCRwffNFe4siVguI4dHOX8Md4wGpVAKjsQ=;
 b=0n0uMxCZbiXY2lhF4JTtMPW5JgVP+Mrojo/yroWgbTCvcMU7OiW/Y/lZB03SHvLVohu61Lg9L
 XMw6pk6FW5xCFkJ5DdmkDzEt6hTEfZaiOBNO7wrancWerQ9KPhUv5y4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To improve the representation and ease handling, identify each BCM voter

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index a1c207c0266d..377e6ba57807 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sdm670-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
@@ -1286,6 +1287,7 @@ apps_rsc: rsc@179c0000 {
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
+				qcom,bcm-voter-idx = <ICC_BCM_VOTER_APPS>;
 			};
 
 			rpmhcc: clock-controller {

-- 
2.41.0

