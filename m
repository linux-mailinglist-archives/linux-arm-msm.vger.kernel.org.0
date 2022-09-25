Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12485E925B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 13:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbiIYLGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 07:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbiIYLG0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 07:06:26 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E32F31DE2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d42so6861698lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CrAQr2nGitPQM88QN5/kuBTbw78oOV1PqKWyK/7irX8=;
        b=QwqfjIz93V6ZmrnecEVD8uIrRefM8uoBM6koWgtjglItpYRPOQ9EyKdVNizNITTJxo
         mdwaCLSFCBuseKG/R4aG9B9hnLz6TNliT/zHSMzHxjESpm3qLuvbxQZ/4lUIuFqv8dLd
         TAHmhcRYubDKNWKXzsP0xSW6VIH/C7o+SY/eliS+oFVQkLNccxFVn0N6TUSs3qUClCAW
         9HgWvkaMj4lLmbkbZvthzqXGjmy+m1Nu16jpuFTqBWJEtUK4ljQC2+KVVN9rEEVtG1C6
         Btx6iaWvZ43ua7NQYjv7LhhWjThCW7EFlUYsV1fhfcF9HqXKR/D0UsYKZHEwJOdN4D6W
         Mm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CrAQr2nGitPQM88QN5/kuBTbw78oOV1PqKWyK/7irX8=;
        b=Bj2xlZxubk7yzmwSzZC1k/Cq+V/ObcugTmxrMOu5aMQsGIW8e5Oi4aee7rzgRkMRBL
         zbqxwFhUcxonw36UGE8b8NMocH4RwXKZvTjPnHZDb8pZqrdxDNxjrKm16xcdc77iZrOw
         YNLqdYLCRUl7BnETzEj9Wf9tTGMmWLQCwqfB4bW1SHRGDmoFxxXP8qsmHA/QkbQH/sDi
         Q1pt9ulNpS7QaqcOS7QefxSouK0OuXYt7Ilg/OTtVNDcwJf/BiCrgl29sTyBPEYfrTKH
         wRz0W1pp5bXD5NMM9FUjZ9u4fFVu7MdUsUW0QGZuV9L64lT/3DalhI5aXz/nKZFyAPN7
         a+yg==
X-Gm-Message-State: ACrzQf2uXqNpgwZJ8TXp8vm67YG3o7Lq810vV0sbFQ5uHdCttTPYE3Q2
        mk2xEXvhUoOn7g5mtnSNxLFYwQ==
X-Google-Smtp-Source: AMsMyM7VhAyTi/l4UzuXNsqv6E++PhBemzuipntch+/YsbOMwyFuffOQSkEQrO0Cra6fhJVR8NKMHw==
X-Received: by 2002:a05:6512:25a4:b0:4a0:547a:b29b with SMTP id bf36-20020a05651225a400b004a0547ab29bmr4157598lfb.469.1664103982675;
        Sun, 25 Sep 2022 04:06:22 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/15] arm64: dts: qcom: sdm845: align TLMM pin configuration with DT schema
Date:   Sun, 25 Sep 2022 13:06:01 +0200
Message-Id: <20220925110608.145728-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

  qcom/sdm845-lg-judyln.dtb: gpios@c000: 'vol-up-active-pins' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 20f275f8694d..1eb423e4be24 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -604,7 +604,7 @@ pinconf {
 };
 
 &pm8998_gpio {
-	vol_up_pin_a: vol-up-active-pins {
+	vol_up_pin_a: vol-up-active-state {
 		pins = "gpio6";
 		function = "normal";
 		input-enable;
-- 
2.34.1

