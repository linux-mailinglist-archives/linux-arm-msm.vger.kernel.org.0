Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F096C1A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbjCTP6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbjCTP5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:57:51 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF61217143
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:14 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id o7so10822574wrg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nLJZiXwqxY+Yg8uo1itt5FvWTiY9tzGpl6uBO3+sbw=;
        b=L0VbHTASXTj1ZTPH7+wXYtsqSDLLvo2z9/zb2/zNwQ+c5LqE0xoarKw8VzouIoTmFX
         yocEjeOSJduPvn2KmbgDj/5uNsXhxLiRE3IAdVqpYcveUr497TiD4IT0UDi5qTAbdPoW
         H7HeIHGohEepPEZmZuwoVp4rmbfqo+brW3oX6Eaz3/QH3WRHt6jka6nTLP/5Nf3JiFbo
         QQnn6B0hVHDpvQu10EZVj+fOxwZap9XOWWXrasLGPMD5+1IjdRcxifK1ouoLF4n5/y89
         5p9nej7/lhFRF7swFN+cnzIb3mL+ppL/v9pf2C12BMxbxoO2S2nIRJ3YywpUEBgr1eAV
         R/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nLJZiXwqxY+Yg8uo1itt5FvWTiY9tzGpl6uBO3+sbw=;
        b=2Es4lfAnnEjy1Qbr2tV/XQkUy4ifwTFonxCYGitcihHwAsbGtBd2PLj5G/kPwOG29W
         5WZu+goo6JlMzreSmflkaqVLtMHdgo3qM7EA+uYWbRFz1Ul6pbzk+uD9fN12yOYTn11g
         Qqiq5aRq6ZHBOgbjsPVQuI5bpIjZRg23pKRKP2tEsPRtYLD6nhTAY+VfN3C53iEbAY+L
         /HxcdoSlajWjFFj9xlTuZh47qWM79MHl0bnV3EjxwjVB2QcA/eKRbYwjoYMg3GpSKcYY
         GZrtBiJ3p0wD6R5ALyB71iY1eRwhYllKUzAGu4Zz13OosMYlidzwQ2BOR0G5COWGxrlU
         sEfQ==
X-Gm-Message-State: AO0yUKVbV4OtL3Lr/zvEHoq6MsE4hUvU+42zJHVCiVjguJH5m5ZDFNf+
        PH+T04vzYSybdVbNxR4G0TU8Mw==
X-Google-Smtp-Source: AK7set/cU+7TX57GWSvWUxLDkVx3inW/+e4//elvHr8NJ/fWaGpe5DmxaXggIBfdtRcOJ6gGOm+2LQ==
X-Received: by 2002:a5d:6990:0:b0:2ce:a898:a896 with SMTP id g16-20020a5d6990000000b002cea898a896mr14773032wru.30.1679327340679;
        Mon, 20 Mar 2023 08:49:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:49:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 10/15] arm64: dts: qcom: sa8775p: pmic: add the power key
Date:   Mon, 20 Mar 2023 16:48:36 +0100
Message-Id: <20230320154841.327908-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the power key node under the PON node for PMIC #0 on sa8775p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index dbc596e32253..f421d4d64c8e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -19,6 +19,13 @@ pmm8654au_0_pon: pon@1200 {
 			reg-names = "hlos", "pbs";
 			mode-recovery = <0x1>;
 			mode-bootloader = <0x2>;
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
 		};
 	};
 
-- 
2.37.2

