Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631AF5EC7F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 17:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbiI0Pfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 11:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbiI0PfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 11:35:15 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8CC647F
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:35:00 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c7so11309178ljm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yf9XK1G2cR1dJud+EZAPAPzhOlqvNONzt1R39mUvFpU=;
        b=dxCtZPdbFUfLncwnp3nb3AngpifmjMG2mhneN5wKFFrOziPZxImQCIkZuAioU1IXxJ
         /YNh+EJySaM+TxB1js671T0KUvq4vDrkiAHtmDiRwlX66W9bfHb803pMAg09udFXyPfr
         gFwRhWphN6Pqa9oQAv2jPrwcnmSwTWP1IECIWfaN+/aCLqONAVdkoMMXsnTvaxIzDhm7
         mXpwvd6oOZoOifFpkFK7NA0hZutjD5wMOKWZ18Y0kWMtbojYoUc2igsL5BtcutnXY+F6
         vS3uOFfWAN0tJR3UEWTYS4OmStcyoTVd2B+Ku+Y/TIkPvHOEoNWG7lm0p1V5nqepM4MT
         gXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yf9XK1G2cR1dJud+EZAPAPzhOlqvNONzt1R39mUvFpU=;
        b=tvsT0ewIhThJldDa1sGht6Ctg7GtootQXpgbSNspcyrTK7+tNEB7jZ5dm6/xx58d3o
         e0trrdFVZFx7kNcUkH9tPDDeGNfPOo7fmztbkwv64lZMbEVcPjRRw4+sH+NdCqYOl/7w
         u32w7QAIa8hlqkTXNStqBg6rPcYT6A0AH1GfMeWuMC6iF3isplPbLEKPJHyS9mbUhDPK
         whbmDwM72FnMAp7zAyc2LfdxGeP/WkzJcW/odt1C7fFQr3ZpTm5+OZ1175cdHxr9/vfD
         zH5sb2ujdzYPrlAsSkKxzc+Fi9cbIi3H7e4GoTxi31Lsm+5m2EMOd/KNCmrmsphfk3Ua
         GFJw==
X-Gm-Message-State: ACrzQf3PHxIGctedsVhXWD6G+sxWkuwnapaFO8BDDywU02zV7KUIdGqD
        heFXdUiZnd7zFtbAC1ftSgXkEQ==
X-Google-Smtp-Source: AMsMyM7T9ZPNXwz6GsGbz2D7Gn9roLE7NZ6p4gW1SGEsQyXXmP0CfdYU+E3Q1tuBH4AUmNnz21yncw==
X-Received: by 2002:a2e:9886:0:b0:26c:57d9:10c6 with SMTP id b6-20020a2e9886000000b0026c57d910c6mr9306365ljj.309.1664292898994;
        Tue, 27 Sep 2022 08:34:58 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:34:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 06/12] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix gpio pattern
Date:   Tue, 27 Sep 2022 17:34:23 +0200
Message-Id: <20220927153429.55365-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
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

Fix double ']' in GPIO pattern to properly match "pins" property.
Otherwise schema for pins state fails.

Fixes: 4faa4e73011d ("dt-bindings: pinctrl: qcom: Add sm8450 lpass lpi pinctrl bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index 3694795ec793..c17cdff6174f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -58,7 +58,7 @@ patternProperties:
           List of gpio pins affected by the properties specified in this
           subnode.
         items:
-          pattern: "^gpio([0-9]|[1-2][0-9]])$"
+          pattern: "^gpio([0-9]|[1-2][0-9])$"
 
       function:
         enum: [ swr_tx_clk, swr_tx_data, swr_rx_clk, swr_rx_data,
-- 
2.34.1

