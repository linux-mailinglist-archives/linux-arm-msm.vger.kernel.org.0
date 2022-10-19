Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01576036F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 02:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiJSAPW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 20:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiJSAPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 20:15:11 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6DD10C2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 17:14:20 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id l19so10389107qvu.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 17:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wwnm6LKiML+fh11gH9Tu7VPQ6RS5x21rDs+S4mP2wuc=;
        b=oTI2kc1BjMDd7DajmAln6UVuu359RajTTxtsIEp9Ep4oTSmlOfMZ1+iQzbTiWyMgH5
         YuSPOtV/9X5d05Dhwre7qdQ4b15JDtR0xGbehztWImf0AMAGtz35daHRBYPBhjMYZmyH
         9zMPXTJpMtDqGzsQfix8ub0hXIa99ovm7j4cZYoJGu97U5u02QwW695Jda7nmlTpbBs3
         7hXLVemapoAA2t0VVhNJtC+IIrcv2HAoJDOBcDnkvq1mzRZkisxlbPQnL/bCRA65Cy+q
         iR5jR+mkIonsbWIE5uVIQkcPbsbLax6J5mPwVPgnv9V4/CAVC39/z5Aufoh/lSY4/BPn
         cFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wwnm6LKiML+fh11gH9Tu7VPQ6RS5x21rDs+S4mP2wuc=;
        b=NR1yX3PC82zinV47p/RP6K3vbMwb6DcsVa7x7EKVtj4s3d8+X8pSqCN5I072EToXqf
         4yAbpnJ20VR7K1qJKDs3DIXE/u8E66xxHWC3CBHeyReblaRc/ThOS0HvUGVCIbmvaREC
         DfVskFzLHcsSdyl4JCxzMlUtfPi2dV5eCTddClgJmZFQlY79shQR+qNDd1PJMP+Qmd5s
         yijJQrLnWhJVsfR6C/Fxl0ZwFcpA1meXMNRggSn3+JwKpbbFtxwfQlsUo5aQlFXUL0TJ
         nhG6cBZwFbaCeOt9JHn1f5ABWri3RQqCerfjU4ZyxJDiktHXWBBdqxS/h7Rk8g1WYOXL
         P11w==
X-Gm-Message-State: ACrzQf125FVWAkD9XQkklAJM0wsKEfZkBW6SYWiF1ulhSEgY/t8edEr+
        Jvng0tFnb9pEj49eomCrehRY6g==
X-Google-Smtp-Source: AMsMyM7DvuH7HrtSqyD7TD/tEuLg3Qp247pXXermrRfUu6GlkjqRsIKW43ka5QyDCB3HDualpJDYnw==
X-Received: by 2002:a05:6214:d06:b0:4b4:6bdb:27a with SMTP id 6-20020a0562140d0600b004b46bdb027amr4375273qvh.53.1666138442662;
        Tue, 18 Oct 2022 17:14:02 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id ay40-20020a05620a17a800b006bb78d095c5sm3381240qkb.79.2022.10.18.17.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 17:14:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] arm64: dts: qcom: sc7180-trogdor-homestar: fully configure secondary I2S pins
Date:   Tue, 18 Oct 2022 20:13:48 -0400
Message-Id: <20221019001351.1630089-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org>
References: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Trogdor Homestar DTSI adds additional GPIO52 pin to secondary I2S pins
("sec_mi2s_active") and configures it to "mi2s_1" function.

The Trogdor DTSI (which is included by Homestar) configures drive
strength and bias for all "sec_mi2s_active" pins, thus the intention was
to apply this configuration also to GPIO52 on Homestar.

Reported-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Fixes: be0416a3f917 (""arm64: dts: qcom: Add sc7180-trogdor-homestar"")
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Changes since v2:
1. Add tags.

Changes since v1:
1. New patch

Not tested on hardware.

Cc: Doug Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index 1bd6c7dcd9e9..bfab67f4a7c9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -194,6 +194,12 @@ pinmux {
 		pins = "gpio49", "gpio50", "gpio51", "gpio52";
 		function = "mi2s_1";
 	};
+
+	pinconf {
+		pins = "gpio49", "gpio50", "gpio51", "gpio52";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &ts_reset_l {
-- 
2.34.1

