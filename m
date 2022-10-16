Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C8760018F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiJPRBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiJPRBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:01:31 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0394C37434
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:01:25 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id l19so6248973qvu.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8o5PFjxV2DbD9sEGHbpRvhtOpSPJbDO58y01xwZ0Oc=;
        b=E7mYrEkup9Ze8qdVgwYmg9FGzNxdup9Vvd/vSw98m3e4diV7AQeKt1i+4oKdrsGXW5
         5DzzicMDS0oZDLcOCyPZuuKYivh/+uXQLh28gTQuy6ptTVK888GPJrNfYlIN55CNo/UF
         aBoYU80LgBwOglpHMzwgHMtXmdJJR0FRPFGwlJe8uH4Dp7t/7lJdtUrft5NN0/hP6TvH
         0ugOoSYWxYYvEqwqRu6Lnm7vuNNixz70/tS+g2F3Kw5542osuE7QVPqtshAt20oy+Ug8
         y2qdyHDRTMtbE7IAecrG3UfHeMtIpSG50zDGoMJCRAlOZ68R4rnLdGnZX4EBMu5M9MOQ
         /WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8o5PFjxV2DbD9sEGHbpRvhtOpSPJbDO58y01xwZ0Oc=;
        b=sjTeTBE2/pI19AneAYRTTZBzAlyrdPlOpHSZKE/xv3WM2OBuXRAAvOpMGcAj6SllJ7
         8Tld01OorMDcPIxe6+qBTC3ggh3lDzmc8jsxY2ThVw19xGPpR+VMnTquMkLdS9n07XYe
         WAErTckZHcPAlsHGJ4glSkWGL3D6571wZagonMJlsLVmBIOyhbJ33Tow3mTjRlzTNwuh
         uokraxo1WCciOZEdvTWx8WQcrtXuNm+MMKMiiS4u3WviGH0B0HxxxsQOOPW/Hpfj7qVR
         wga0yFdIbQxeoWgVE2dy4JWCeo1ooyYcAAdyRcXmmgRLr4NNoB3qDccfGqlF9XQd3WmH
         9ceA==
X-Gm-Message-State: ACrzQf2iKoC8T8YTQYMA+FUk0ALBdEmhZQIRFigi72Ll4q8Te/lwCr13
        FNEDmIoUcuy8uH6TAAV56NZLUQ==
X-Google-Smtp-Source: AMsMyM6MrphQXjZQTV2mkyuNppVmiBqLlCSVTHuixQ1lEoj/JcisUlNnyp//AKevZl8QBlyzl/0j8Q==
X-Received: by 2002:a0c:80e1:0:b0:4b1:a9ac:21e6 with SMTP id 88-20020a0c80e1000000b004b1a9ac21e6mr5770843qvb.50.1665939683875;
        Sun, 16 Oct 2022 10:01:23 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 03/34] ARM: dts: qcom: sdx55: add gpio-ranges to TLMM pinctrl
Date:   Sun, 16 Oct 2022 13:00:04 -0400
Message-Id: <20221016170035.35014-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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

Add required gpio-ranges property to TLMM pinctrl node:

  qcom-sdx55-mtp.dtb: pinctrl@f100000: 'gpio-ranges' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index c72540223fa9..f1c0dab40992 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -559,6 +559,7 @@ tlmm: pinctrl@f100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 109>;
 		};
 
 		sram@1468f000 {
-- 
2.34.1

