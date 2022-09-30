Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B170C5F1288
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbiI3TaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbiI3TaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:30:20 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5ED2F03B
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:07 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x29so5820891ljq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QXCX/bvx+GMITxwd1sJyJkSs746MTV1B+EirXA61vBw=;
        b=kRF5S9r9tn9jPgt4Fxvlqu66cm9Fx8vkdJ/R8/JfXwvhrp9QiV7ym7Rogf0hsycQYS
         wR02glAPABCRilB8yXF2nPXM34iKfVDr6VzGGiw+94X9aIsmxDLS81Gc/dY7Jjks8jT/
         fiFtonH/yr+pDiZxPZcJdNVOiPcQHDfF9QRBDHyrFbO6LRC6MVM+aApPoBt6VCx7lJxV
         6wka2Bq285FRUPA/OSmb0TN2uaeqNalAVAUfHlVorZxdoJUaiWflsuGOYzXRgwsXX5o2
         OvsxHr2XCJ3y4pdb2zK9s6r4BQlbnddE0hrl0kpxLvNQOYSYglkblpjK6oMGW+JnjweO
         Fs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QXCX/bvx+GMITxwd1sJyJkSs746MTV1B+EirXA61vBw=;
        b=OWzlkO2s+IYgTtWzSCgHyL/3lrekBUnR0LU2w6JTH+DhGmvLgzbpypYmVz5id90c88
         Ahoa/N+SarSVEOh8jSA064wwt08UfuOORQ8Zf11b6Lt3T1AmUrBgryMOWw+CWG0HMdlx
         +SD8yarnHKxNKVcqHUqHRZqtIUD/ADDftHhkqrZ/qMnz7hRGT3kHtUDwZIsOEunxowMe
         J5gn/RNU+cP/GIks3Qrl9CKtNDrB2y/XUQ5ymKPi/iapfWZS5DlJz8zyN2P2v9xuqRNZ
         7bPhCgHjwj3svXiS0+80TLFmE3yC6t21+kiaNJ90+DXghyWYQP1c1srO2CiJEJgGud3Y
         ytPA==
X-Gm-Message-State: ACrzQf3NnhcSfdFgfIsLxPU+M3k21oIg29IGwZzTQmCUKC6Gh0YDU/CN
        2lDVi7vuqpljubRaYl8aexYwRw==
X-Google-Smtp-Source: AMsMyM7MlpgCLTGnNr8o5iJXWBowZ/BlEn1prfau5KLOMBOmzLQlzOf8s3TQ8JadSU+Fky1mmQaYFg==
X-Received: by 2002:a2e:a0cc:0:b0:26b:e763:27d2 with SMTP id f12-20020a2ea0cc000000b0026be76327d2mr3164724ljm.62.1664566205749;
        Fri, 30 Sep 2022 12:30:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:30:05 -0700 (PDT)
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
Subject: [PATCH v2 08/16] arm64: dts: qcom: sdm845: align TLMM pin configuration with DT schema
Date:   Fri, 30 Sep 2022 21:29:46 +0200
Message-Id: <20220930192954.242546-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

  qcom/sdm845-lg-judyln.dtb: gpios@c000: 'vol-up-active-pins' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
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

