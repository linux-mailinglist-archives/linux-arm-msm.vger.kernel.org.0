Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17FEC6F5999
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 16:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjECONh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 10:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjECONf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 10:13:35 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A08B5BA0
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 07:13:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-2fddb442d47so4915709f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683123212; x=1685715212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAIQS/BOPXMOFYhvnsG6hSIFOmKVwFFNkHh46Y8652o=;
        b=S6TM/3QkR4jgLyb+HdKBwWKsa+TE+es479AG6l8m8gG8GzvoDEmk/Ac1rGRhIw86Wm
         fAvPAi53M7EnosCQLDVDh52GXDanfzDKLAgUvocvNSjYMOUVoc4qQqjUixyX3r9i85Cn
         OKzLPQ0etucCMZHhMbtKy5Eax7WM97MpIxpeGt0uGnXE07Cn17PskUDGXpoEFg6tTbx4
         q2ac8CgjW4act5L1Q6MHisXLxBWKFSqRXKICkbBk/dG9Z1pYL8wJ9glFUtUxi0d4XvWh
         5mYSffa2Kcb+mdm+qmU190sUvk7IGuijPKV48SzjFdED8OwQEp9ezqR9XmHFaWAwbtIZ
         KBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683123212; x=1685715212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAIQS/BOPXMOFYhvnsG6hSIFOmKVwFFNkHh46Y8652o=;
        b=NdWcLRsxnhHsdlrQvjzDpLPARpgy0Oe9zaTqOEJF+T7j19rRFHLprv5b7O4q6W9b7A
         fvGEpKxk2Bg/vQ4xqLXLDy7upJq1w+VNcQ+QKcuq5+zIbRUIRbBh8srUly+N3pc5rplS
         ZwZsq+1hJri60LEK1BfJ/ZhJKvM+cAeiyIucFOPJ85MCDtQoMSQs991MLWgw488uwCWQ
         zop50fd89gdqaVEMA18SPH0Kr6x0nxUzPA+it7Y3ily7MQKm3+c9xRWBwndPJKEb+btj
         0Tc91F8V+Qf8JPFngrU+Le6id1SybfCiCk1fU1KsI9GKzUih/YgAVk/isE4rgjthQgE+
         Y0SQ==
X-Gm-Message-State: AC+VfDxK6v5F/1YMYkmHcGGKy5Iio9JjO7OcBhOErJDTrHIgkY/EMeUW
        QOwlX4Zl63/WZbNGYywX4u0lzAilTdidv+mDaBLuSQ==
X-Google-Smtp-Source: ACHHUZ5DkUMF/s7xhTlYY20NWHn01XdHdr7xf8YBXK6rqk7Q7SpS19cGrMo41TVkcXbqlfzfytK7Lg==
X-Received: by 2002:a5d:5387:0:b0:2fb:bb97:d975 with SMTP id d7-20020a5d5387000000b002fbbb97d975mr151681wrv.47.1683123212008;
        Wed, 03 May 2023 07:13:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id a13-20020a056000100d00b003063c130ef1sm3028638wrx.112.2023.05.03.07.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:13:31 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 03 May 2023 16:13:28 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: pmk8350: add reboot-mode node using
 sdam_2 nvmem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-topic-sm8450-upstream-reboot-reason-v1-1-c5ac3dd5b49f@linaro.org>
References: <20230503-topic-sm8450-upstream-reboot-reason-v1-0-c5ac3dd5b49f@linaro.org>
In-Reply-To: <20230503-topic-sm8450-upstream-reboot-reason-v1-0-c5ac3dd5b49f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xjYd0Xug6SR/toEiny1p/J32ShG0ZzGMNC3ZlTA4TJM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkUmwJOOhMui4jXELLALLA5ttUwZkVWCOtnOG1IMB0
 0aHlc4eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZFJsCQAKCRB33NvayMhJ0RgGD/
 0eLwbbBzIVCdYqMlz25/zUn4NoJy66pbXs5Kgils1XeYeaxKRVphkOIfhYAEhPpY6V+E+jo6VS72vQ
 +Wt/JqcD6Tnrq9QzdHJ7DTi5IxZnOBF9H3LmI4KMTu42rtNz+Fqtd7kBksnyaURi5xUqkLbJAqXJb7
 rOMkRD1XHXG8bY/Uskyk+luFtdLchHPa+Ivd8kQuEvqGfe5GV1sifVgqLYqBYIiKgdyVzDGHGOEit9
 U2xgh1mPjeqR7b3qqP7SK84PSoIZzA8bFudMDcZf9PZTfYoNtVonqltIZEpfZFeJvigqORzdklbzlC
 A1y7zQqOgmIlfBYFSWWbelAReMXViUnjTXPZvmNPpfl4cTx0J8XiiffqJjxquNnwn1/rV1zD6R4T1E
 RwBDEWcQSdNO5LcF9ZMcB9mLEaZq6ildBYA1TwneelC522K1Z9vcR4dlP8Jq9t28LdF+8OWU7Qq6JJ
 OddLaqSZQBoRZ4t7Wb4Ke4RRG4MLzHa3HKLmHYXPwPKtLjx1ZcCHXiYNhpPug3oZ39Fzw2iRaFje7o
 +7k/g/vQsBh2PNgpBKmKF6ztODVP6tId5vuEqoEfCFNUGsY5w+n7tgcn2wvMVyresOHd4Vwmn+cswo
 c4kzSfl4UnOGob4B2EKpvJCNAMdUaHNB/zmaqGr1+i+eWGIRpxB1yHuOTUXg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce sdam_2 node, which is to be used via nvmem for power on
reasons during reboot. Add supported PoN reasons supported via sdam_2
node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index f26fb7d32faf..bc6297e7253e 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -13,6 +13,16 @@
 	#define PMK8350_SID 0
 #endif
 
+/ {
+	reboot-mode {
+		compatible = "nvmem-reboot-mode";
+		nvmem-cells = <&reboot_reason>;
+		nvmem-cell-names = "reboot-mode";
+		mode-recovery = <0x01>;
+		mode-bootloader = <0x02>;
+	};
+};
+	
 &spmi_bus {
 	pmk8350: pmic@PMK8350_SID {
 		compatible = "qcom,pmk8350", "qcom,spmi-pmic";
@@ -66,6 +76,19 @@ pmk8350_rtc: rtc@6100 {
 			status = "disabled";
 		};
 
+		pmk8350_sdam_2: nvram@7100 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0x7100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x7100 0x100>;
+
+			reboot_reason: reboot-reason@48 {
+				reg = <0x48 0x1>;
+				bits = <1 7>;
+			};
+		};
+
 		pmk8350_gpios: gpio@b000 {
 			compatible = "qcom,pmk8350-gpio", "qcom,spmi-gpio";
 			reg = <0xb000>;

-- 
2.34.1

