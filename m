Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A4E7318AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344820AbjFOMQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344822AbjFOMPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:15:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7E8273C
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:15:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so9896775e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831302; x=1689423302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1Al/KG8NWTXmmsHWuavPIHFHpGDFDNwIi35fFm7FN0=;
        b=q+jnV9dow2ysnpr+DgpUG8LSDiI1JSdSPsq2/CkxtBjah6EC0bynQ+fSdPMhtPBLc1
         201dqrsSMkKHprpmzk5PGtWSvxsjQUgHcveZq7U/1eIc57ycP69rjz3fb2a5AQ8px/ku
         ees+6WHgcOw8Sa+I+fHnzSKtNiVgBHfe/7fY3kC9TD36Dy87Fe3bXHvqbFqqYuCy7qRY
         JmyMAmT8SeHzbzI/yniHLMNp9ufgDZnfeluX6YCzcRiBpnx/OuK8LNvD60stAt9CrDSm
         r9GevzA5luS63q+SgfIMjXMcSq42ja5QRyU1kO/Kf4NJrs6XBQFu03lqIimOTIHKxIV8
         SjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831302; x=1689423302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1Al/KG8NWTXmmsHWuavPIHFHpGDFDNwIi35fFm7FN0=;
        b=J/xYShGGn3MUNiE5cvauj9G3FpaBHltxvorKoCVYZI2IfDsoB7K+CqydWz1JYISLDV
         xzwMAUK6kEe4Lzucxk5bkjtge686862bhkO0EcOwVDDK6lz2rUPACPYcnqFoQZOKSEob
         Rcey9MYvWQJYPnMyMxVBxCnxF1iJ2ff9Ev9XhEYC6s/wCCPucUnH0HXJg7UYM3Y3AxLQ
         B5tDi6ZL1qpPmfmeNVbnVWlRkGrFCGnO5/BS4Ib29r4ygg/4Teys2hTp3s75Ri5RLXze
         Gtx/G/eBJ5jiCkqD7QzXO3aIA6edFRo0OFbduyZPTdzYuDfn4zM04NPy338FodWIIwjH
         pxkw==
X-Gm-Message-State: AC+VfDz439ZvfaBHpWGtYiz1STEAnk7csRc8cxljanz9CtJA8f3fv/AM
        5fyx1VFROJUx17je1UBz6AKC6A==
X-Google-Smtp-Source: ACHHUZ71nGyqLCIDXraYAB2R46ktf8+TAA7NQUM7KV4hyoUCCpF5gPBeqp3nE5oi+hiK82hXndAHdA==
X-Received: by 2002:a19:8c4b:0:b0:4db:3d51:6896 with SMTP id i11-20020a198c4b000000b004db3d516896mr9695706lfj.11.1686831302349;
        Thu, 15 Jun 2023 05:15:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:15:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 22/23] arm64: dts: qcom: sa8775p-ride: add pin functions for ethernet0
Date:   Thu, 15 Jun 2023 14:14:18 +0200
Message-Id: <20230615121419.175862-23-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the MDC and MDIO pin functions for ethernet0 on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 9f39ab59c283..bf90f825ff67 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -371,6 +371,22 @@ &spi16 {
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
-- 
2.39.2

