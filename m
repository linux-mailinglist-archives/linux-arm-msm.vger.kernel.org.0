Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19CAE744DE6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjGBNnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjGBNnk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:40 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2421DE6E
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:36 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so57197311fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305414; x=1690897414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+Cyc6iyJgi1jIYR2SdUySI+dkCNcLYZsYejiaDMvPE=;
        b=zSCrmjUlSnbnsOIN2azeZHVUEa/pKRqVg6qp5d1QZKtiflqu8sbmrQdLIy7ou7f7ac
         ly6zNCoXwoP90lcu5m8TXdngs5kje1U2GkpA6tQuGSazW2pxifS6a17EtpyhkTZSWFPE
         z89rVbgIxlg68OpJOqfzaH6wcro9UW3OhY2wtbm/xHs4Y8F4T4tbzSJoa0x0g37CHvap
         lPfDSg/U0Y7vKJZ/M+HCOfTYR4qIn5IhYIFXYnfh7gjUfuPvYVOAzXqalMjDHTiHPDef
         ZEGbVMLXt0mUcc2I5Bt1GXdjpeYNEXcAMUYUmprZxkTUo+22hzr4W4/euHpDBSrovRjF
         p5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305414; x=1690897414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+Cyc6iyJgi1jIYR2SdUySI+dkCNcLYZsYejiaDMvPE=;
        b=A4R5QZhchmaLHTnT2TSAH8B+fCJFKO4gGLwU/g2egPn+e1pg/B+YSgRV4Xyds5xxjd
         d3bo5E2X2xW5dZ73HLM+0OeJqipikpscYp2gnc1+QExYViIBX406JEEz9HwMtj3rEsOh
         jVIPf5IqBvUWLLUPC7yeXb7sXoMOytZUJx3XCeksyUj1C6gV7ZyJ74TfYCh1nhSJAK79
         nrNufHDGyaY/MBCphmr2QCY/PgRu88mr/p+MpkdSY4KDqczmB8tX2gwGQmRgau2Ufxjy
         EznNlIslqvFH90d5zaJpjoakQjkT2FAVmz4jmSQF7X6EGwEbD2vrIBILeS9lZeekUOgT
         hSiw==
X-Gm-Message-State: ABy/qLYZ8IW8n80Tqq1VZkGWuGHwM3CMGlhZteROypm+50YI/8CSM2q2
        jEy/nPKA8vD2yCD/RRfoq/7pBw==
X-Google-Smtp-Source: APBJJlEJXPhv+mL3PSks2p+M8n2QILPW3Jsv3cBKHJYDJ/vkUbRx4Mrr0iK4DvSGGTxYA6cr7K44YQ==
X-Received: by 2002:a2e:9844:0:b0:2b5:86e4:558e with SMTP id e4-20020a2e9844000000b002b586e4558emr5043278ljj.38.1688305414502;
        Sun, 02 Jul 2023 06:43:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 17/27] ARM: dts: qcom: pm8018: move reg property
Date:   Sun,  2 Jul 2023 16:43:10 +0300
Message-Id: <20230702134320.98831-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
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

Move reg property to come after compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index c602544900b2..85ab36b6d006 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -27,9 +27,9 @@ pwrkey@1c {
 
 		pm8018_mpps: mpps@50 {
 			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x50>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8018_mpps 0 0 6>;
@@ -37,9 +37,9 @@ pm8018_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8018>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

