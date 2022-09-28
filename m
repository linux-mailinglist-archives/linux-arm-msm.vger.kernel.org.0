Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5B35EDFFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbiI1PUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbiI1PUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:20:38 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8FF57BD0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:37 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u18so20854349lfo.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8gAb0vttvsZ8wRV0w5Eu2WIvLvAPbZHBztrbwSwM8vY=;
        b=xgs6vT8teutOSFqb0VQposP83OTGki/PknCXsIbr5xGNEZGDaOfRYMEyn97Ilvol+S
         +LRGnzc51DCEPl3tfFTHWxUwiAemmxvdNqC5yP95YW9o6ZrUqNQzAcHQupC5o5ky7OQE
         dIN+7/+x+rvTQxTs76tT/7GVSd3nh+QgBDAj+B7YJJ6+pOe6bB7zpm7rQRS1a4U/h4d4
         3cuMvVAi9sCxqw0zHYFSxHJSaLw+XRyscJ0FNeGWuLTQ/GK9d1TJ1zsyeVOGR0ffgsN9
         BwS8g7Z2/UkpYKC3lEKwS+EXytz+d55aNonu54ly7MTu8PaeVBQNfE3Xr/mU3KY7m6x/
         7NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8gAb0vttvsZ8wRV0w5Eu2WIvLvAPbZHBztrbwSwM8vY=;
        b=YhTXIEbEBIrvxR8twT6a6iHFIvvzEwvU0rhMDwTRdoTJHfoygGu26YGS/Tx3l9qKo2
         spQ4TRkiEiEchNM5zxdPmUoh/rsXjh6OMk+vvziAW0UKktInzVp11eagea5NBjP341RO
         xlYW0te4FUpyiVUiDdIFvgKJ0RlxVziMVEU1N05QieOKgMr41QJjMmr+fp1MllC/g2wt
         ErLvLhJCPYqr7jFG98iXfjDmosvmZ0JucH29ek4ug/YkMCy14XvwUCkgA6jHUfmLu9uI
         6PirnPojru23lZIDUzAPnw40UzktewO9iX++lkM6OSRXZJua92OPw879VsthxiT6oQWa
         RGqg==
X-Gm-Message-State: ACrzQf2DfWOSWIiPNmDUXpCtmk7yBAqLcu07/5e2kzJ5sVwR2yuVVQKS
        Sppl2v+Wl6OD4i22q6lkrSCH0Q==
X-Google-Smtp-Source: AMsMyM4bMv8X2l3axxRXBvUc+yU6M49iZMEsYIEYQjPgxc8If280c7PBFJL+iGRW+647aZKCgEPsng==
X-Received: by 2002:a05:6512:6c3:b0:49a:d227:1b5b with SMTP id u3-20020a05651206c300b0049ad2271b5bmr13138341lff.386.1664378435773;
        Wed, 28 Sep 2022 08:20:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:20:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v2 03/11] arm64: dts: qcom: sdm845: correct slimbus children unit addresses
Date:   Wed, 28 Sep 2022 17:20:19 +0200
Message-Id: <20220928152027.489543-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

slimbus uses address-cells=2, so correct children unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 9db1fce6b198..2264bba69f84 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3841,12 +3841,12 @@ ngd@1 {
 				#address-cells = <2>;
 				#size-cells = <0>;
 
-				wcd9340_ifd: ifd@0{
+				wcd9340_ifd: ifd@0,0 {
 					compatible = "slim217,250";
 					reg = <0 0>;
 				};
 
-				wcd9340: codec@1{
+				wcd9340: codec@1,0 {
 					compatible = "slim217,250";
 					reg = <1 0>;
 					slim-ifc-dev = <&wcd9340_ifd>;
-- 
2.34.1

