Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE3E674D22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 07:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjATGOb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 01:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjATGO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 01:14:29 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D48B7D67F
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:28 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id kt14so11444819ejc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sU5UtyptRWXVDghW52MFjo+qdp2W+CiadpzYku8SKc=;
        b=NXuZbZWMnOlUksnCv2Nhz/GM4VMwvyVxVVbJbvDfeX85/n22/bM6sXaG5dt0+6k9eS
         xnoPF/3KzUz7ADOnjmRDwFNhnBr+QzCW2lEoLHncsanwR0cXQcZAYO1WyDVsf6Cf27DR
         gdvooS1Nh9Z3nOC6HC8bqemNwLU0SwF4ATGNy50tnWxHw+Txq0bTit/UzgAQGZVIPYUJ
         ZdAKodj2MQBeb5cZ+o/9OyMj4cxzl9phjpB5Vwjr1RSYbGRYeH4ihJPPejb3GmmsQHbc
         Hy/wqB7fbZX1XVJxZFKar4gii/Sv89h1/WUHliyXg/sVkCctmn9K3cxLhZSn9G3z7yEs
         zX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sU5UtyptRWXVDghW52MFjo+qdp2W+CiadpzYku8SKc=;
        b=CTgWqqA3sYqr1/qfOSKezEMBc0a4kNVThO7NuV072D8vjdktxE/R6gorkceSFAZEVY
         onzeGbhWUizILpHJ9EGDi1p4leGmrbRNvDBQAqhQzQ9irs2y1e7ZiR0Zj+iyapX4o142
         K+DYR5DOVKSTb/BFT6EUkLCf+Fcn9+A5+GqtaIuzSBIliGyRJdmAN7nerScDFj79u7rM
         MxyghNVNf6twDinCryG2lSEAxSCUw6e1y85LCi3ReyEovh9FCztH7FY3J3BXZxM4wHQS
         fwmGZ8plza05Mk9vrfqCf6bNLPuZnxsrBFuXV9ePuJQ6ki46cAif8nMbOxFDcJglxTyp
         DGHw==
X-Gm-Message-State: AFqh2kroHu7o/cDbvqOOe3+I9VTZB02gAFwbK4pRQQKrG3naAZphTPUM
        a4odXlFwLUzlQYGF075/lhOHXA==
X-Google-Smtp-Source: AMrXdXv/pCCRPSuuFBHbD6tEoFf4S2mFV1+3cB8E3SJg/9qcdKrsTIvlz8mdjU4dqnqj9maz9lxgqQ==
X-Received: by 2002:a17:907:c606:b0:870:d9a:9ebb with SMTP id ud6-20020a170907c60600b008700d9a9ebbmr10331262ejc.38.1674195266871;
        Thu, 19 Jan 2023 22:14:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm5813358ejc.3.2023.01.19.22.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 22:14:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 7/8] arm64: dts: qcom: msm8996: add CBF device entry
Date:   Fri, 20 Jan 2023 08:14:16 +0200
Message-Id: <20230120061417.2623751-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node for the CBF clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4427305f8a94..6f180a8efe77 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3572,6 +3572,13 @@ saw3: syscon@9a10000 {
 			reg = <0x09a10000 0x1000>;
 		};
 
+		cbf: clock-controller@9a11000 {
+			compatible = "qcom,msm8996-cbf";
+			reg = <0x09a11000 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_A_CLK_SRC>, <&apcs_glb>;
+			#clock-cells = <0>;
+		};
+
 		intc: interrupt-controller@9bc0000 {
 			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.39.0

