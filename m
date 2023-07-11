Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21AB974EE7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbjGKMVm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjGKMVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:21:09 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A472426BF
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:20:01 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b6afc1ceffso92310751fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077954; x=1691669954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pF+62BSgddTAPKCaWz/3Ipd5EEzHkODMPLMBcdfC3I=;
        b=QQ6AVn8GkrhIPnn/Y25w2TGlQrJrTSjFw41oH5TzJ4FrG9nVw8HqxfVHy8BTdGBLp2
         sk8n1svoqhyPqEMcJGZyQ/H4/XNUFgdbhh3HmBpYWNbPmQdeFnnc7ULooJ5MT44745v7
         CPNoa7axo7RE5VaQh8RxWhNzuE+aTpdXXk0vR8p6PlA0ZC9PKHjyMYX18vHXH7kqe/cR
         bVXUneJq2tb8f5uOlSFKS168MfuPXfKDXP+LS/0wMY2D8C6sejbZYOgYYYzfxX/LdyOy
         eQQEx+M07uBSxv1yPjcuQWpjrdR9NMd90RKi65DszrCdtdI0kck5RSpxT1oqpO+jJuEk
         zPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077954; x=1691669954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pF+62BSgddTAPKCaWz/3Ipd5EEzHkODMPLMBcdfC3I=;
        b=YFzjRaxkEQYNkp+v+VGPalU2nraDtCRI/YzWszqV1Wx0M4zCCnbDI5OR++iCz0QxUl
         6JYxB/CG8XV+hSEjoK0jFcPe9TPKaggA9h7Ae5fljFCViQ4t80N2Aoz88i5Pv2/E0Tfi
         X+qvOVpmHNqS1KR/KjapLJ9mqDuTnNCGwve3oaJbfiIF2BAb9KlIwxgHYMC1TdOUZjz9
         +e9aGbBxg6fHEZLO0UAP54j8wu3nG+jSV5w+6tzDj/J+QtL22ZF+WABvcohbT7N7VSv/
         RpC2NyG9/4sjYCMTOHnMBfDp5dojWJj6lz1X6AaLG3s2M4RVKj2UTIjPjGmS8bfkdcSW
         jIYg==
X-Gm-Message-State: ABy/qLaBo95qgBkuLR1v1DNkpvx9e5P1pMIwyZcynlQ28jaBVQEaYUNU
        wTtI+l29sfOHjy2QYK0nC7FAiA==
X-Google-Smtp-Source: APBJJlEOmCRxgEtcuv4MoDu09F3K6BxvXNh08C+sZ++tsAMXi1rnHdDQ08daifSH/QIk0TMHxBeiwg==
X-Received: by 2002:a2e:8085:0:b0:2b6:d9b0:875d with SMTP id i5-20020a2e8085000000b002b6d9b0875dmr13300282ljg.34.1689077954579;
        Tue, 11 Jul 2023 05:19:14 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:14 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:35 +0200
Subject: [PATCH 36/53] arm64: dts: qcom: sc7280: add qcom,bcm-voter-idx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-36-b223bd2ac8dd@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689077904; l=1025;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nytm9EolJCU+y++LKFvuDAt/1VSGVvY9ubKWLH3kdjQ=;
 b=MXIbUp80VLgVzHgAsczbdl+x2lP+g4cVPrIPNIvPVACY8QAdMnLDpC+0PiIwuQ9UpX4LYTGEF
 j+ER9dzS1+7CkKnv6yiBlm4fqAn81IIWTPxCW61QjC8EHSbst3oJToZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 925428a5f6ae..a45d9e12eb97 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/clock/qcom,videocc-sc7280.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc7280.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -5294,6 +5295,7 @@ apps_rsc: rsc@18200000 {
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
+				qcom,bcm-voter-idx = <ICC_BCM_VOTER_APPS>;
 			};
 
 			rpmhpd: power-controller {

-- 
2.41.0

