Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15DFC74EEFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbjGKMdr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbjGKMdo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:33:44 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524A210FD
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:33:10 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b703caf344so86023131fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689078724; x=1691670724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mouIVN5aOfpssmEDC+p5ObsXA9SRTIu++fiUoxbGev4=;
        b=M+NTQH739WHL132Z772IgF6ZDpFpmkie6AEaBb/I1t75yh/yFfoICb5pwTHy/lo0c6
         SH+FPwod1s+J38v6yWHCl/B/fSej/mh9m9iDJasfu27bKT5I9gEF0AtBrFcqfpz3z7BV
         fzg8EDR3TDaj13dUOLVs9kguL9CyKoIJjM/4ihVXEVcemjhhMvowBCnhHxU7rksNEgCq
         EpFoOynYexBRveDii8SR4VaQgSTxxpb8zGIDeeyTw8Ju//k7kqXifTpkWVQMLHxVVlzL
         55N6yBsBIRfaFhsrSfaMi0E+lMg55Wts1ca6hIamtyV5wwNjGO/bqi4JybP6S5rLhrad
         CjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689078724; x=1691670724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mouIVN5aOfpssmEDC+p5ObsXA9SRTIu++fiUoxbGev4=;
        b=aMk/vdqZHu3xgw+NgBE2keukwqsbb5vTb+2OWkyub08UbEmWXthJs7rSZxu2XwUc/6
         9iThTn1M51gCfQhkCEt1v2gEwNR1WLTMX8UjgGA7+454vF2DfAlSkBq3l5pAFWpxyKLC
         g+uUvSMNtigmOqopZUiTj1uyuXfTWF5XDQedqq/c1GvYFsm4wndB7nFOSpUq7RQhja38
         Uoq2WjHQr410A+geqxK3dhteB6HPye4esf7qAGSFiheYxJdNBUOxCBsqgCrVCzl5yVHv
         4fuVD0r8Ha9NC29v31BWe2a2EafhAwPCL2ScZKvuF2oNEUrqRm1WQB93o0O4zqvAHHFQ
         AtPA==
X-Gm-Message-State: ABy/qLbMNaLqEbrsXE213Iap4a7JZ46b1v4/szuiiOgDDGnXnYjHCeND
        +a9itkl5bGNYbpmnlTTcIWYNmGTXwGuNa4zRHHYHdg==
X-Google-Smtp-Source: APBJJlHf7yZI2vtKJX4P2V9vqBIPPM59NaTPvsu2eRHNcNAUC+aIqXx/owlrcF2ZViyku+o0Bd677w==
X-Received: by 2002:a2e:6e0e:0:b0:2b6:eb5a:d377 with SMTP id j14-20020a2e6e0e000000b002b6eb5ad377mr12645471ljc.5.1689077963176;
        Tue, 11 Jul 2023 05:19:23 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:42 +0200
Subject: [PATCH 43/53] arm64: dts: qcom: sm8150: add qcom,bcm-voter-idx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-43-b223bd2ac8dd@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689077904; l=1013;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=x0zGLJs0yoPS/RlnCeGNLi2dqlpoVvi8tNVTarjGkbE=;
 b=FSfXcsHn89MM1aKOUdCdC6mngIske/lMAzWCWPFQwrEpmxxUCYs9/p7KkltfVx0irKTji+kGL
 lJuu/TUXpvyD7WNEkqwsIUPvSbBK8HeL20eBfb7txG1n4B36T2oWkBK
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
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0cd580920a92..151cc60de9cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,dispcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8150.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -4332,6 +4333,7 @@ rpmhpd_opp_turbo_l1: opp11 {
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
+				qcom,bcm-voter-idx = <ICC_BCM_VOTER_APPS>;
 			};
 		};
 

-- 
2.41.0

