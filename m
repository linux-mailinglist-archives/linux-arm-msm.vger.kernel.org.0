Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692E7686ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbjBAPvx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:51:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbjBAPvd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:51:33 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3110875197
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:51:24 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a3so11048763wrt.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfCnwwPZjy6FnaOHFNneujf/YG1qK6ESTpPS4vQZO1c=;
        b=Aa2gE+B/NrckXrEswSYwJ7L5tHLcQteyCvTrngS4YkPnKRI3HYkkMPcmzOcLR8nIDZ
         7Z6jbD9Ho5Pp71JfHIEZIPMis2CjB6c6GyQY9wxx669oGFWuperATmDgJdLWRUP+YtzI
         vk/DwIj0MtOqo0WsJQuQ6M57znE83zis3q+8r+/jqkyypJADCEc5WJbqdVxzbPGJtlRs
         IcALPdtS12sZ7LpL8P9yWZhZKrO87wUwwVJVcOCqStzH7sw2uTu8nZqSko9f45MzzdnK
         G0SfCQ/uQsZHLpSqLMsIO8xPa5F7aVeA/4wnHusORu5Hzdcpy8O/TEvwQmKT0uxkuvhs
         Uc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfCnwwPZjy6FnaOHFNneujf/YG1qK6ESTpPS4vQZO1c=;
        b=dn+NqiVzO9/jfo0XaNmgHnahc3qp0yXAnFXl8SNx6Ck6SNk06gYr5T2eTiPeFoWHaQ
         uhbkLTXntt0iMyXYeHZK/2ys4OdKZP/B4mb1iWHOExB9qPLXA9pXfvJDJnRkm1L2aykd
         i1T2tRddyfVShHuuRQCv53Qq54BdJ6E1cz9Psyk69Jo63eaPUaGE+oxW2ttgJOWCzQfg
         YByB26kCW4EMJo7ZDz06bRhrwm8xz9joxlaEwfb7uRTOPjemu+KsEFaSRSnSh2M8SBWU
         mvAu+bcGmtGCKJr/eXg3VeKZRC4YGRTRdfZkBh7/oEYTBh5iI2uatXIyGN+riKlp4FFb
         ytGQ==
X-Gm-Message-State: AO0yUKX+yIFuH8lk0mu507OxnbvYXXZmw+jUoi8riuAx1SqEnUc9c4D2
        qhVyMIHGa+KmXqGqdtv3XvOJLQRNGZdjf0U5
X-Google-Smtp-Source: AK7set/oGNutnl9p6PytV11+IY1abvGo/hYBTSo/xovZTMaae7qpZQaquRiV1GnUiy63javVl3A0Gg==
X-Received: by 2002:a5d:6203:0:b0:2bf:ed6c:2344 with SMTP id y3-20020a5d6203000000b002bfed6c2344mr2770137wru.9.1675266683774;
        Wed, 01 Feb 2023 07:51:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe441000000b002bfd524255esm14816189wrm.43.2023.02.01.07.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:51:23 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 11/14] arm64: dts: qcom: sm6375: correct TLMM gpio-ranges
Date:   Wed,  1 Feb 2023 16:51:02 +0100
Message-Id: <20230201155105.282708-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
References: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
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

Correct the number of GPIOs in TLMM pin controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 31b88c738510..0e161c301804 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -581,7 +581,7 @@ tlmm: pinctrl@500000 {
 			compatible = "qcom,sm6375-tlmm";
 			reg = <0 0x00500000 0 0x800000>;
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-ranges = <&tlmm 0 0 157>;
+			gpio-ranges = <&tlmm 0 0 156>;
 			/* TODO: Hook up MPM as wakeup-parent when it's there */
 			interrupt-controller;
 			gpio-controller;
-- 
2.34.1

