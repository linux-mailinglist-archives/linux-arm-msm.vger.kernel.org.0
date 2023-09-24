Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72E867ACB57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Sep 2023 20:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjIXSbR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 14:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXSbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 14:31:17 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB32EFC
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 11:31:09 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9b11cc499c2so354859266b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 11:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695580268; x=1696185068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3uSP3o9ardRpaQhkEgd5zKh22mwy8MCGageBq+4jv0=;
        b=xl99iM4XN/rKttbXBDK7NKPRl7tqueh7EpwMXyuNt8rSD2T9rsoKb9USBvyxXEOgPp
         /VInR4z45NuoOSZE7hAMj8qWUv4JXfsqmhb2AnMWn/vlyPQOlCsZZcq6WtuKqtaA8EE3
         9jrGRH9HLvYr3P2uN8YajnpJ2pzj6yC2D0Yb8GuXWrBVT/RKFjots7wRYcu9i4bi8fvt
         Wy/egsUUHaKWlK8IPW9o9JzMIArgg+mw77VMPLVO9xmmMnzZLAlSbI9UkIe9H42/FNGh
         kGBcRnk1VMwP5lQuj1QAovpXTwva9rAkbZr49hTeqcF+0rGvyBU6cRNUt4rZqycraMCG
         DfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695580268; x=1696185068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3uSP3o9ardRpaQhkEgd5zKh22mwy8MCGageBq+4jv0=;
        b=dVnMguUe8GPvFgYSBJAZBUTjwLV5TtaPNU4kNBh7bd7YiL5oiggGOolh5sTxenn/ms
         rC3TgYF+5T6G+44qhajDwWaXETjPMJ3pijTyPRJnG5sszmtod/qbUORKzBnYZvxg2JM4
         jBbwgU4vLprbfO7URWXky53ot7QZwCv36RqRIB6sN9MsJmA3brWK0QeUVeDz7YaNygLi
         09faqY9I3zoBSPZnufwpZSmCC6cJgSr5RQS/j/6T9Dd0pYNgvZyAaYb/SLD0u0F3rZqB
         PcUov/FIocg9uqE6C+aZpgjo5IgHy1CEXWyPYgaL2grIEnMoBMnj81ajxrk+7VbYjlPz
         IAWg==
X-Gm-Message-State: AOJu0Yxv6ymSk9vcinewgnNhVQ4EwT+Xs95XbF58SD5iqZazJNxtZ491
        YDvn6DQQqUHBgrYxjMHenxRXBA==
X-Google-Smtp-Source: AGHT+IF28QSFVA9qjbvA3dya1Mq4QRPwYd9syrOpP+7JW6Xc61j2s4MuLrohjsyKHTizn7yuPtFUnA==
X-Received: by 2002:a17:906:fe0e:b0:9ae:63bd:e4bb with SMTP id wy14-20020a170906fe0e00b009ae63bde4bbmr5028616ejb.41.1695580268355;
        Sun, 24 Sep 2023 11:31:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id ty15-20020a170907c70f00b009ae6a6451fdsm4599845ejc.35.2023.09.24.11.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 11:31:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 1/3] ARM: dts: qcom: sdx65: correct PCIe EP phy-names
Date:   Sun, 24 Sep 2023 20:31:01 +0200
Message-Id: <20230924183103.49487-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Qualcomm PCIe endpoint bindings expect phy-names to be "pciephy":

  arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dtb: pcie-ep@1c00000: phy-names:0: 'pciephy' was expected

Fixes: 9c0bb38414a4 ("ARM: dts: qcom: sdx65: Add support for PCIe EP")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index dd711484dfc9..c9790217320b 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -337,7 +337,7 @@ pcie_ep: pcie-ep@1c00000 {
 			power-domains = <&gcc PCIE_GDSC>;
 
 			phys = <&pcie_phy>;
-			phy-names = "pcie-phy";
+			phy-names = "pciephy";
 
 			max-link-speed = <3>;
 			num-lanes = <2>;
-- 
2.34.1

