Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056CD5AE7C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 14:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239935AbiIFMUG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 08:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240301AbiIFMTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 08:19:32 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AB670E57
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 05:17:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bx38so12037614ljb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 05:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=s7n5H179EHltl//tf656gfcONYELR4s9Z+s2z1U6Gm0=;
        b=ywef0Q5jictPM6qCJWGxeygAXu5gLbMk6gIfqK1eL5GbuAI4lxMFMLqNf+Dw5lZZdG
         YXTNWNakNwIg4km+c5/omQIBi93fFpD+1C2qlZ+eWZPIuTzyg1V6y8MC4sVEvQDdPWjJ
         WUSXSPp8ljLxxsXPjYNQDrswbSR797sFK5uVlzqe9E8v8kHhPCmkhtA6xiJ6eILn/dP9
         Vh8jre9RteSozSoMQHLl5+Nan+5QbHXkR0Y2Z8fiHZMZIgN5bw1LEej1q8JcI++JHCNH
         Ij3EtYRT5GEiQdCATcUjorZjHSD0c5j/pvxegZ0ZxgHfi4u1+AGX1XJ7Tgus9ApXP/NO
         raCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s7n5H179EHltl//tf656gfcONYELR4s9Z+s2z1U6Gm0=;
        b=zMOI5f8vla+0emE9UvW4W5m4TYNnXXAc0xnRolvwFmwnK9dqLN/yp2me5Px1iH4/kL
         DWjRZ/lUlV+EIflFwKzy51ffghJQXbqfYYjvT9+rHcfmnYY4HbmlmYhamHBRV4/1CExt
         zb5E3iu+QLqHCvsmOB3xc7opHkhffympmKeUQZQPOJ3vo076yHotMr+6ylc4eOZs0ZZn
         vt65/Zvx2kLcwNF9+xN9e6iE2tSOgYRtPE+1peQVgv70Jp+wAx35ptHh5HLVtit3gu2n
         6FXflKuBxeFpk6QLekSL8iqOTbm8n29eEyazt3q8DtFjFLxpD9DxKYyWzLHG5TgmtISG
         GoZg==
X-Gm-Message-State: ACgBeo09XkclrDNSk/u0khEiQ6rDCsSbKVANqnVqs4AWc5nrpILAxb1R
        5L/lwUXWLT+oHUP8h1/FPqQZUQ==
X-Google-Smtp-Source: AA6agR7yVDfxdDSu56xjFhDOAW4R57WFX7r6p+IlD/xKVIj2xWws5UrhbgmXrgq+NOExDDMVpzj8Ig==
X-Received: by 2002:a2e:b88f:0:b0:25f:efa1:a966 with SMTP id r15-20020a2eb88f000000b0025fefa1a966mr15014624ljp.67.1662466626433;
        Tue, 06 Sep 2022 05:17:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:17:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/12] arm64: dts: qcom: msm8996: align dai node names with dtschema
Date:   Tue,  6 Sep 2022 14:16:49 +0200
Message-Id: <20220906121655.303693-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DT schema expects DAI node names to be "dai":

  qcom/msm8996-mtp.dtb: dais: 'hdmi@1' does not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8dd4f6d09330..273e41c27942 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3401,7 +3401,7 @@ q6afedai: dais {
 							#address-cells = <1>;
 							#size-cells = <0>;
 							#sound-dai-cells = <1>;
-							hdmi@1 {
+							dai@1 {
 								reg = <1>;
 							};
 						};
-- 
2.34.1

