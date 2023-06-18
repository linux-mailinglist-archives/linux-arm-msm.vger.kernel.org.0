Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC917345ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jun 2023 13:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjFRLox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jun 2023 07:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjFRLow (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jun 2023 07:44:52 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC5610D1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 04:44:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-987f7045f9aso157968966b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687088689; x=1689680689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhL8KtwaYHcT7IR66TG7VubSU1MX9CLuOzM0f221Puo=;
        b=GW0IYfNFLemT3JyZkg+GYmqSqwWKFgg6ihpkp56SCYQ5LPz544JAWaiptb9Xgb4EgM
         X6Gpm9nRX0vUDWGll7cZm6rIn+h+XNKTPIeufTfPacnEjjjZVr0XmcxW6YEgI5lK8Aug
         2+9GHLfBEaH09EWvQZwWDH900+7fLaLCDBa4Cht40oDDe4kPstbvfEzNSpzX55fEYMr9
         2b63INeMw24d80LyXmVXzSPzx7ZnR+0Y54RuqGVemqmvstqOIlYOIufLqH4F0mqdu0Md
         Hfa5HjFsmG8DXxU9eYfxo0QQ8Bm55kXv0KskSzHu/vRFxNe4Wntm0oiCQlU2vC5pmDxL
         833Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687088689; x=1689680689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhL8KtwaYHcT7IR66TG7VubSU1MX9CLuOzM0f221Puo=;
        b=LhszxBkDrVWhFkv8AQiXFiJbh8mzfGRrVQ1lmS7zzNMzdfeM4WReLIJ09ZWt9teiso
         /ajhOLX2P+95njav81mWaxQ1h3L1Nid8KKJwpTAIND2AjLH/wOjLel167ep77U2C8mQX
         Lzx7XhOlKu+Hnt3wHm4PK3/RAEnRAhMZQSwCSed8FKI5Z+la4JGbUFtg5hXdYtff8ArY
         Dneai3yvBsk8+pKaIIAxK1RztsE8ddpUr/5V/zutX4mq9WN/Gt9TUa2dLhY7FaDJllgR
         B2r90QfO/XZz5JWliJLm9AezhoGX1w6zslT2pjsYEG2yn0+4c4BiCOQIi48TYgWyN4Zl
         FbLw==
X-Gm-Message-State: AC+VfDxbmimBZ/N33vUsXuwPqPVkqqqRcAVG6VmMJpq/CSDf6Mbg1JKl
        ppjF+nqCwCYzFH4MM6Zl25PHwQ==
X-Google-Smtp-Source: ACHHUZ5OT0jWVs00PZn5ksvk+MMG3/2lSYbe9YqHXEkgKh30EIWsOl/maNhkNafs0ECtpnsYlwY17Q==
X-Received: by 2002:a17:906:da83:b0:982:ab8d:1e08 with SMTP id xh3-20020a170906da8300b00982ab8d1e08mr7149008ejb.59.1687088689498;
        Sun, 18 Jun 2023 04:44:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709060dc400b0096f937b0d3esm13183854eji.3.2023.06.18.04.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 04:44:49 -0700 (PDT)
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
Subject: [PATCH 2/7] arm64: dts: qcom: sm8450-hdk: correct FSA4480 port
Date:   Sun, 18 Jun 2023 13:44:37 +0200
Message-Id: <20230618114442.140185-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230618114442.140185-1-krzysztof.kozlowski@linaro.org>
References: <20230618114442.140185-1-krzysztof.kozlowski@linaro.org>
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

FSA4480 has only one port according to bindings:

  sm8450-hdk.dtb: typec-mux@42: 'port' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index d7975b3cf064..e5cbea92e07a 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -518,16 +518,9 @@ typec-mux@42 {
 		mode-switch;
 		orientation-switch;
 
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				fsa4480_sbu_mux: endpoint {
-					remote-endpoint = <&pmic_glink_sbu>;
-				};
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
 			};
 		};
 	};
-- 
2.34.1

