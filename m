Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6577374EECD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbjGKM3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjGKM3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:29:19 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1BA170E
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:28:46 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-992af8b3b1bso732264666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689078461; x=1691670461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQLBnYw5pfVzQylFNgskr7H7oEW4uSiPIu84jcjkQCk=;
        b=iKf+0DBsW6NKx+iVPsnnv6z4Mjx/jRXWwqmsEhWJPiT7WrRlLvDsoTZ50zTAnqC4oU
         V5T/gjhf2TOQK+LuI3tjT/ghwyqKXbmzqojV8UBJPeOb0c0uSEKqrgnq/2UNvbsB5Qd7
         4tWkERMJPOYjbxyYY87Wx/O9SN1VR7XW8UQ49tworEEbifDwO1fn2ASawgNebrSP4f4v
         hAzpDk5Y0RoC9B4dsJS3HEqX6vR2rBVrTnZK+LUjnfS0FMRguY2dGFuy33d3agAmknVY
         paXuMbYJqKl4uZH4c/SQXZg99UrpJbS2gcijFG8WyGkGIc9InxBMrPs62rElmexPzsvs
         4Q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689078461; x=1691670461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQLBnYw5pfVzQylFNgskr7H7oEW4uSiPIu84jcjkQCk=;
        b=PZOnqWOXp3LfhHejys+JPbqOlDLj7jpSysgoSsRUCHASzW4xy8eHgqeadzNRG3JMjR
         w5s9psiwKF1J5CZrsj8ktHWtgAEPOAnQudyv40OGaVeKpPw75AZkucgzVpXmDGDfYKFg
         gt5K4k0v3JbeQC3y7vZEa4fU6E+Vh7EZm2jM3FJECwCkN1XOpiO42dB3IfPwh77/gjju
         CXqdG6Gz77GP1INn9CCvGloLapK0w/69iO7IhobtBYMIHCuyYmX4kanUoFE9rtLqK09K
         StONyj9grY1TNcQMCLB3zgHGUio/ku2nbFSweBKSjfwvcvS21uusfqLVqmmmdu9lVZwb
         EbEQ==
X-Gm-Message-State: ABy/qLYZhnTx6htdS4GrYySBzFGOrqE0q0CiQ+5+Hc4XGcVtwHng55XD
        HJXZX0NAtQuHtfwlLKTF1oLhlHOndtGxacLLyZjYtg==
X-Google-Smtp-Source: APBJJlH5jgTV6clHkuAbdLyaxwSZbX0NQWlWbozqxx3ivhQVSBF6LhXWQmS5O3CgizbKk35ErOwtyA==
X-Received: by 2002:a2e:6a04:0:b0:2b7:14d4:ce6d with SMTP id f4-20020a2e6a04000000b002b714d4ce6dmr7721930ljc.48.1689077968298;
        Tue, 11 Jul 2023 05:19:28 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:46 +0200
Subject: [PATCH 47/53] arm64: dts: qcom: sm8550: add qcom,bcm-voter-idx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-47-b223bd2ac8dd@linaro.org>
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
 bh=2n73VwmB8gd6z5jxJWL0kWv1/JV05PWG3zpj6M//Tvs=;
 b=6cAucdktEPv499aSOqbmljlM2KKvs2eSJ07hrXrAq/GVNAj6ilgikTUSIcX93dYozWDDDBb7g
 UwYMsvaySf6AKgM7Tyt09TTWQN7rdv3hVkop9AW3R7L1dPXgX0KPAkN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To improve the representation and ease handling, identify each BCM voter

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 6e8aba256931..d54b0ac6d0a3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -3714,6 +3715,7 @@ apps_rsc: rsc@17a00000 {
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
+				qcom,bcm-voter-idx = <ICC_BCM_VOTER_APPS>;
 			};
 
 			rpmhcc: clock-controller {

-- 
2.41.0

