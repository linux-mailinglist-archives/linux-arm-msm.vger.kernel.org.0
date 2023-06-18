Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 320C47345FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jun 2023 13:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjFRLpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jun 2023 07:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbjFRLpD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jun 2023 07:45:03 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F8A10FB
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 04:45:00 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98220bb31c6so386918766b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 04:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687088698; x=1689680698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZtIxdtnpAHoo8wbrD1X8l1VeR1fj92TSQ255sLV4WM=;
        b=gbvsA82GrNWYK3da265F5T5AYQX78I6WiRw58CsA+qhKBYpY0/ywiyKQyXrpSOD1++
         7hkB4+S2U9LXl2CGuMTwLMkdGd/BNCcuf6uY3uv+EVKJwuDZSOZvWjqMZu/McvwIcYT4
         W5K0F4RTUNHD8i97w40lEfv+hCjBrLenzXaEKsYCWoqJbpw7InV8DqRmmFFBxAdImpUr
         IYL7qcPx2/Ulnhdj6wMQgv6cJ/+icPrYb1d3v4DTHBqQytvZMFYkQ42ZrljdBcjngpkf
         2F/4tcK9uDuWB2b1HhjYy3MWHStJFwq6M5huTHeRtAQIF88qjr9eribYbKUF9m3v06GB
         TKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687088698; x=1689680698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZtIxdtnpAHoo8wbrD1X8l1VeR1fj92TSQ255sLV4WM=;
        b=kCksGjTL4u+zV3cgbD0hZUXbFcN4YQ/fLScg0RMTVq9Sjl2t+3d+rKozhtbsHvoP7b
         0HtP3sMlcKQ86n2f/OT33ympMbBVplBtGx4Zx30o19LnDp7X2plnOgkmSAH977xyFWmy
         V2zWNs3oU9MbsNV05X7GyaRT8SPEaDPdoq8R4JVIL5XyLkvjcj/aIPJHyJwo20XQmnv9
         6Vt0+veRqWw1iEqMCTHoixV3xDhIrhK+WN5xv5SXaeBL6HyYcujXjnhmmWWAWjY5TgDm
         W9lzOz/zXxL+3SEUZDcKddMK4nfPjk8uXcTEVkR1rFmm2j9oI34aoDSFjSwAcT5Hw/q7
         yxyg==
X-Gm-Message-State: AC+VfDzvYkkLZ5VkquDFpRB+ZnLYy7mOossXIZIDcFlRpc6AtJzZASFz
        uDdCjX5VrshODBixpcsJ9jNRCA==
X-Google-Smtp-Source: ACHHUZ46bYU0uATzs6orDXh9TG3/MzoGEdlshO7th36yswZmNOq4OsgZI8ZoEjnIpP5g4ssjviXZaA==
X-Received: by 2002:a17:907:e87:b0:973:92cc:fc78 with SMTP id ho7-20020a1709070e8700b0097392ccfc78mr8500754ejc.49.1687088698698;
        Sun, 18 Jun 2023 04:44:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709060dc400b0096f937b0d3esm13183854eji.3.2023.06.18.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 04:44:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/7] arm64: dts: qcom: sm8250-edo: correct ramoops pmsg-size
Date:   Sun, 18 Jun 2023 13:44:42 +0200
Message-Id: <20230618114442.140185-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230618114442.140185-1-krzysztof.kozlowski@linaro.org>
References: <20230618114442.140185-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no 'msg-size' property in ramoops, so assume intention was for
'pmsg-size':

  sm8250-sony-xperia-edo-pdx206.dtb: ramoops@ffc00000: Unevaluated properties are not allowed ('msg-size' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 8ab82bacba81..9f3ea8d8d798 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -112,7 +112,7 @@ ramoops@ffc00000 {
 			reg = <0x0 0xffc00000 0x0 0x100000>;
 			record-size = <0x1000>;
 			console-size = <0x40000>;
-			msg-size = <0x20000 0x20000>;
+			pmsg-size = <0x20000>;
 			ecc-size = <16>;
 			no-map;
 		};
-- 
2.34.1

