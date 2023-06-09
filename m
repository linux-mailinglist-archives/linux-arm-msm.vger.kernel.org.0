Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2AAF728DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 04:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237081AbjFIC0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 22:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237408AbjFIC0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 22:26:05 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D8330FE
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 19:25:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f620583bc2so1544228e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 19:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686277557; x=1688869557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N12gfFtx2uUrPiE+zEwFxqEuTlfoHWgM0ZbjtW5pSzo=;
        b=SVsN58Z0t+JlJ+I5tvxA4qNE///PF/a2ISpvmYGAOkppa0MWJk6bN6PUEE9lMMOqBr
         ZBtlFGZRqDBrYhxwxCW7ZciJCbih0GxhgFIgH+VPdalqgujoGDdJ5ezlXSSt9kEvCT4Q
         iUWoCUIkudi2n5hRHO2RruIIxZBB+wOafQW4G4lnmvPVld4z5qXARKKlGIJfOXq697jO
         4v5QDfXN96ikPG03PX8AXnMVxS4flh5sUhhf1/vAmE/kvexYVFmqkXX7Wk+24rXHaTJl
         Rh/LfkTw//eG5jhNJl8SYzG+3+yfXEs90dWeeC/QP+Lm10xdnEGYSYHZ0ieSnQhzwfWL
         79LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686277557; x=1688869557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N12gfFtx2uUrPiE+zEwFxqEuTlfoHWgM0ZbjtW5pSzo=;
        b=J1tjzrBzHXLc+fkElPito/PD7Qa/S623GZoXd2Ttd/IfL9EWsi6pgcmK+ZFxAy5Qv6
         11e7w8KI7nayXEG9g8SMY2AL1OBWMg+ojQ79bnBXVS2KIEUiYKhkRkAmEuQVhHsXqTKH
         PMRQVDCLaxn6G90ZS6n4zwizMmJl6D6W30OFNvfU23j8crRwdNR7uYH+8bikhwZqcjgd
         xXl6uVrAnd2vyuSBuMskJaSa3Xh08siPlky1aWqajumRVvvf/cmX1Lhtv7ygQhbxNOnj
         GhUDSK2S6HB4T3FS/ZRmYvTgNAhZoxnWWmP2lCnfFOkARm5Hrj3AWyoINJbywBMngMIc
         W5SA==
X-Gm-Message-State: AC+VfDyYHdMKku3zKVk5PVWHjXLQwtrRcOPZQb1zVUojvhtc2Kk5VwDQ
        c71depO3G6lpXb76wxXLOx85dQ==
X-Google-Smtp-Source: ACHHUZ7OgnE6kLJ+gfqjJ7iKAmImzEnuOgACazcfTQmu6NFSD1RYTDk/CmxXUnJFA3veyhf1psZD3g==
X-Received: by 2002:a2e:9792:0:b0:2b1:c0b9:61af with SMTP id y18-20020a2e9792000000b002b1c0b961afmr134973lji.52.1686277557108;
        Thu, 08 Jun 2023 19:25:57 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id x20-20020a2e9dd4000000b002b21089f747sm167429ljj.89.2023.06.08.19.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 19:25:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 3/4] ARM: dts: qcom-pm8941: add resin support
Date:   Fri,  9 Jun 2023 05:25:52 +0300
Message-Id: <20230609022553.1775844-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609022553.1775844-1-dmitry.baryshkov@linaro.org>
References: <20230609022553.1775844-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Wrap existing pwrkey and new resin nodes into the new pon node to enable
volume-down key support on platforms using pm8941 PMIC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index a821f0368a28..cf1fcf97fa88 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -19,12 +19,24 @@ rtc@6000 {
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		pwrkey@800 {
-			compatible = "qcom,pm8941-pwrkey";
+		pon@800 {
+			compatible = "qcom,pm8941-pon";
 			reg = <0x800>;
-			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
-			debounce = <15625>;
-			bias-pull-up;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+			};
+
+			pm8941_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
 		};
 
 		usb_id: usb-detect@900 {
-- 
2.39.2

