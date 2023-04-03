Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C68DC6D459B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 15:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbjDCNYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 09:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232538AbjDCNYI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 09:24:08 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65A922E90
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 06:23:32 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id er13so76287000edb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 06:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680528210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QkaHcd9FrOlxWr5a7MQGp6+vZNEoBTWVj8R7WwWR3tQ=;
        b=DXiRtYLY4zzZUiYrkGz/7fNOJQlJJdzkD42cFDuE8RzQl/wvD5Gl7oV/TJLPzcr1k8
         oqBfarKQqCcf8IVJD4/5+g5KhSdX0Pz1iR2g14KStbjC0Iam9FFXbrr1q2jbvjy/3mIe
         0iRDxqkyv7SoUHrAGE1FtJEf5AUZA/W3IbCzPubIvIo7BtWoq8keDs8g02Pobw41x9IC
         P+OI/WEvLfUPi71pgdqptGkFIh6FgSjzlc5G2KDxOYjIzOMS3rpqt9+szYoZk5JCm5RC
         w6Re4Bm+9VVblRJlQuMjfoo9+vDCTK6k6rvy40RPuBaYHP5NllzgjYjz8kF+KjV9lU+a
         rNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkaHcd9FrOlxWr5a7MQGp6+vZNEoBTWVj8R7WwWR3tQ=;
        b=LGdn0NAqXMH8PyHSwkJWsTfvFJe9L1YP/TZuVEEPsr3xbUuO6r7wdzI6xWFF8jYDM8
         uz4qDwWfhiMhHC7ebhuPx6dauoWhFngok597IuTor20Buh8Ju2iKxH+83ygbbUFlghMf
         tn3YdgSH7vs26uSMMjFIm95dLGYHe2q8xr4rWJBnwaEoLRRuREjZJW5Ouacpal/E6NRn
         tEoS7hig70H0FQXs7XRssPtwSXHSyQ79wROWCUDvowX6KdzA7tvtEa5y8E70fpA+EIZl
         KlXEv/3QYmH1ZJGSrv3ZRt3vGMCALXLOg4/SNGKfSNN1PQpy2ULZq4rJHJ7BAnKD+v2j
         eccA==
X-Gm-Message-State: AAQBX9ebFvd6nJBN5gMogzfMyGjGRmU7TeFrHryZYCzeuo68EkSQS5UM
        IwF+UV13DEKjKmBunnIXmMStnA==
X-Google-Smtp-Source: AKy350YRKLDbhG2gHQg0UYaE3DrgrGQUqgwF0t0kcpzukDnZOilc84eaYBye+wjGFPesjyfvudb8rA==
X-Received: by 2002:a17:906:7090:b0:885:a62c:5a5c with SMTP id b16-20020a170906709000b00885a62c5a5cmr32958316ejk.46.1680528210409;
        Mon, 03 Apr 2023 06:23:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id j18-20020a17090623f200b00947a749fc3esm4328488ejg.33.2023.04.03.06.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:23:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sc8280xp: correct Soundwire wakeup interrupt name
Date:   Mon,  3 Apr 2023 15:23:28 +0200
Message-Id: <20230403132328.61414-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bindings expect second Soundwire interrupt to be "wakeup" (Linux
driver takes by index):

  sc8280xp-crd.dtb: soundwire-controller@3330000: interrupt-names:1: 'wakeup' was expected

Fixes: c18773d162a6 ("arm64: dts: qcom: sc8280xp: add SoundWire and LPASS")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index af7bee14fa06..cd38320dafda 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2606,7 +2606,7 @@ swr2: soundwire-controller@3330000 {
 			reg = <0 0x03330000 0 0x2000>;
 			interrupts-extended = <&intc GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "core", "wake";
+			interrupt-names = "core", "wakeup";
 
 			clocks = <&txmacro>;
 			clock-names = "iface";
-- 
2.34.1

