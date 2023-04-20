Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52CE46E8BC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbjDTHvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234134AbjDTHv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:51:28 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC98549C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:04 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id c9so4459422ejz.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681977060; x=1684569060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFqKpCWwuZDAdPXnzzE7gsC8SfOjkfQgs5s8XBZ8aZk=;
        b=ukQ0Le6TMEKtwl1qb0k1IeiFAR0NkPtd3mYrddufs7v2M5uNHpAbl1167aNvZB6ogh
         qkcck/TwJxS0lhvqLD9xRMFzpp51JJPjmUAU/UYDCaIh6ua3MrcHhJChD4hxMtKusFPh
         tOwd1X5l5EqfG85mZRnwvx367LuDUG4BZOGEWS4udvQVAREfd8HKATkgDUwYyTE/svnU
         Th/ZG3VrDLU8I+vlTdCzn2J2uw5gGIDvoqTwqCgjQujXao+yZVuFh8cAWPC/O3Erd1p5
         PPI69gycuh8ZZu5xJABMoINP9vpUIXCZj6fVoJ5PLH7nGX4YF40ZwOjNT5FnZlp0ON6V
         zCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681977060; x=1684569060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFqKpCWwuZDAdPXnzzE7gsC8SfOjkfQgs5s8XBZ8aZk=;
        b=TIeMfK3UWe4PKoDQzmF22vuF92YfYSQ6gHW0PS18+sZ4xaumOG2MfI+AOBxoCBmQSL
         cUzDy836zaXravnT04aouUvLPdV1z6E4feCAl8IrKa7FppnACxgPuU77DjI2G0EmKBFJ
         //5ApliGgcvbFf+rSvlZh2H3yJ9cy5omtBi+Hr5e2qSNGQOa/UjOVYq8aE1X1j06RfDS
         +sFsWPynNw8riCc+esQ0Pb6CvhEzndtGMbUB//Q3H81cAQmrlznVl3SoJ+eNT2BggAQL
         njeycGR1MzYK3UT32QSI6PCUljbfXRx20MLF9T1L+8REnDeE8MT2/MaeDFBJuulchBIs
         Bpog==
X-Gm-Message-State: AAQBX9dSRl8zX2p7f9HMzqwBtlL5lbEWVGrzR88BCm2949ezqe+k4N9c
        WgH9PkDADcBCKBlmTMmgbDCAbA==
X-Google-Smtp-Source: AKy350Y2TcNWboWKh2QDy2Qdikod1p913oFrr5wHNBogRDNZFJOAiFU39DD+VrEDkwxsjp9gf9DMlg==
X-Received: by 2002:a17:906:ce2b:b0:94f:6218:191c with SMTP id sd11-20020a170906ce2b00b0094f6218191cmr689403ejb.18.1681977060507;
        Thu, 20 Apr 2023 00:51:00 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id h25-20020a50ed99000000b00505060e4280sm447165edr.94.2023.04.20.00.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:51:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/10] ARM: dts: qcom: ipq8064: drop leading 0 from unit-address
Date:   Thu, 20 Apr 2023 09:50:47 +0200
Message-Id: <20230420075053.41976-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unit-address should not start with 0:

  Warning (simple_bus_reg): /soc/syscon@03000000: simple-bus unit address format error, expected "3000000"

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 621edf508a88..182018d79a7b 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -609,7 +609,7 @@ saw1: regulator@2099000 {
 			regulator;
 		};
 
-		nss_common: syscon@03000000 {
+		nss_common: syscon@3000000 {
 			compatible = "syscon";
 			reg = <0x03000000 0x0000FFFF>;
 		};
-- 
2.34.1

