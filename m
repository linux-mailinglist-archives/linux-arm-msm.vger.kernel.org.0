Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693A0775E66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 14:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjHIMEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 08:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbjHIMEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 08:04:47 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0783A1982
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 05:04:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe2ba3e260so63551515e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691582681; x=1692187481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkZCFzxfzDyKA7LYooj8Fy3ZdYlwwxLtlpox9Vb53IY=;
        b=vGUKZmEPBkDx/7F9lu/X34D2GA+UhZYWFjHqtsItOHwt2YfQrLz2q41JHEvRkqZNZj
         B2u6eo6WiOb6t7JEnOvQoPz3/UCYiNFnc+FJcNt5R1LvfDqjFd0TUrHcracY+GDrYHaf
         F2xjp893J6fQbB9Y7mF/w+01+kHiFHDrGa5iaGZtA6iBvFlNaRjRthGID6L1kVM1hBcD
         8bPMsaEKE4xi3vFz69x58Fxt717UFHZfZ7YdON6xwjO5O2J+y52EAJU4zC36fnQILNzo
         nqgmqdKoIXIkwKQhJRP0xTTLDh0z+NPRDxF+D3GIMHircdDajZLU7vCEIXhk7Eh6IjFM
         FMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582681; x=1692187481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkZCFzxfzDyKA7LYooj8Fy3ZdYlwwxLtlpox9Vb53IY=;
        b=Fj0bbRid6+4wiQr4I5CPfJDPWsz9Okz066bqVxHgQJJsaqjX2Use9Dd+xQagTLu2Du
         l2dvq9Dj0VsDp7886PFa/SfG2jkLxKXVKJQRJ87haDdqfjTCIF9fHy6cYykDFEo7y0FB
         M3oPRpwRuB/swR+PzXfNRFkwVxfQMZgQq7UUHnHkvujbk60riRv7UbM2YcENJQPKyZe7
         TLQ+MBdswVAivm7FRtH/WgeAW8if+WKL7+foGjp03zKxah5FOjIFwyNzSBRv7DiP72q+
         0xSajyfLarL0OIBMD2SZoZVpxU+Rd50t6Uvmi/8HQNTlMmndHa9J/OVMYDepz/48HNxC
         p85w==
X-Gm-Message-State: AOJu0YwTyDfQDqPvbydFRo4YQa1ycT3hAff8vZOUVkDyl/noh5dlJ5je
        PhjEtvq0or/yO7Bmnumuu8GDOQ==
X-Google-Smtp-Source: AGHT+IFYk3DzbomQTzFpWN8TXzDHbS1k2DMgIJIU0zuU+RfqTFui2Yp7Igw+uTj52Fmz9QyZwR+b+g==
X-Received: by 2002:a05:600c:2811:b0:3f7:4961:52ad with SMTP id m17-20020a05600c281100b003f7496152admr2049176wmb.3.1691582681629;
        Wed, 09 Aug 2023 05:04:41 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c11cd00b003fe1a96845bsm1808573wmi.2.2023.08.09.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 05:04:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 4/7] arm64: dts: qcom: apq8016-sbc: Rename ov5640 enable-gpios to powerdown-gpios
Date:   Wed,  9 Aug 2023 13:04:29 +0100
Message-Id: <20230809120432.1036405-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
References: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two control lines controlled by GPIO going into ov5640

- Reset
- Powerdown

The driver and yaml expect "reset-gpios" and "powerdown-gpios" there has
never been an "enable-gpios".

Fixes: 39e0ce6cd1bf ("arm64: dts: qcom: apq8016-sbc: Add CCI/Sensor nodes")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index ada0777567623..ddb19709a9eee 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -273,7 +273,7 @@ camera_rear@3b {
 		compatible = "ovti,ov5640";
 		reg = <0x3b>;
 
-		enable-gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera_rear_default>;
-- 
2.39.2

