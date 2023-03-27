Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38CC16CA4B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 14:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbjC0Mxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 08:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbjC0Mxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 08:53:31 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E0519AF
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:29 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id q7-20020a05600c46c700b003ef6e809574so1930334wmo.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xLbshkx8RN3Dp5pV4JMfPJgexrRDb08ZnEhmNgvIW8=;
        b=DN5zlzT8lBCRiq18EenA9tEbn5n8IpWw4jH6eQi+f7ZGyZUGT3RNp2lPyQ+nSTPnw8
         g5cpS5ACzV/j8UyIyCbYakip31FlVZrcSwNhyXHEgqQcEujcGEd/XdN6p6/a+sKk/7SX
         Bhbjyk9BBl7Vg+fyf9dPeVYNvh1PQMycMKQy+RxOpvEiREEIrWuupNEhYGlVsop2I2DR
         FaXcT78CGQyQqBmZswzFMc8pEJqcTFcB0lRuOPn7d7IofcIVyrEySTIARP8bsyUjvnS1
         fpYrFUAT3+IGewuV5yv95R5EIzZGdx6sN8AIcIX/DnrelZ+yKnODEW8w+X+nwuSdpRLs
         T4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xLbshkx8RN3Dp5pV4JMfPJgexrRDb08ZnEhmNgvIW8=;
        b=2brNOoA08OpgZD7GRqxW8+to5Dx11s4ekye6iUyNbGSdDKsM9jRic3LtLjux4o8HGJ
         NmXhylDNARIH4bsFBEUeWW/2/vo4+zsJ/D7vosGyNdkqNmTuRgpf7/iASxWxMzhgkf9I
         FeVhIB4lDi0cPKtC07KaD26sFuSyRUz2+4bnBIYJREY9yZAhqchePSbGVjyT7y9cIdQm
         3l7tTRu/9cTRBBGqVsYIskWEO2PXlrqBrXuXZWLX6yPyB0wK8dClORXmDW298AqLhNEc
         yy+cNLLe23PGd3e96lEQxB4wFMRnlNhO/m6yfULm/JvINp4hZECBLj2VDhTh5s6tYONi
         HSbA==
X-Gm-Message-State: AO0yUKW9AValep8uJ4Mq/5eDZSlXphc/IYuJLEd76ZwRzxJDzK6FXQqq
        AX6ZNdDsCGD2UlDxN0PnGi2jcw==
X-Google-Smtp-Source: AK7set9WWTu28DjahOZNwv8/DaGb5PjaAwrlWJycYTjARylTu7X3/sB8BOqBaDO6igjO0Xcish5UiQ==
X-Received: by 2002:a05:600c:258:b0:3ea:d611:f8 with SMTP id 24-20020a05600c025800b003ead61100f8mr9758392wmj.38.1679921608872;
        Mon, 27 Mar 2023 05:53:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 10/18] arm64: dts: qcom: sa8775p: pmic: add support for the pmm8654 RESIN input
Date:   Mon, 27 Mar 2023 14:53:08 +0200
Message-Id: <20230327125316.210812-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the RESIN input for sa8775p platforms' PMIC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index f421d4d64c8e..8616ead3daf5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -26,6 +26,13 @@ pmm8654au_0_pon_pwrkey: pwrkey {
 				linux,code = <KEY_POWER>;
 				debounce = <15625>;
 			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.37.2

