Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99FEA645BCD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 15:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbiLGOAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 09:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiLGOAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 09:00:20 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F222A391FD
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 06:00:13 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id t17so17667181pjo.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 06:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGefmKMEXqWoGu7xIFjnC5m/g9TolIorwDYvhcWeeRg=;
        b=oJK7a30Mr2LkFqooyVg0pm63JlyQOjxUpyH9huMRz1fbq5VA3YR5KjoaoRdBcl+i88
         A7DAAvJDi78hXvVmHf1AWOrZ7jAOnfomvc+ch7/fUd8RHbzmSkrxt7KeTpXaTV9VJ0a+
         lnwhKxRY01WNGsIrusLM2xijeXHZvrMbO2fRUeWZCMTc1ewPPzxadUdtIZO81hQ5swr0
         21QVZveUsYIfw3yrvmKZVec0rRAu1/18evngrlhb2Er0TOq8Yb82F726ctjooUwYIcVx
         c5LI0N+WmGnJd5swAWQbcaG/MY3QZSTyQT8gw9ezKxkVckL5+bT5hcbm73WTozlUGRnN
         ASTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGefmKMEXqWoGu7xIFjnC5m/g9TolIorwDYvhcWeeRg=;
        b=CITWGJJXh8GIWwu6cf7Vjp00i2EujbRrT2WwOsM11vOBWBkfe2seNKJolbK48hDUbG
         Ua2xfIzknjWur05G10e0tVQjnE84VZYeyEiztLcJ/t9lt9m1gjZxReqckgCxdJM09esJ
         zIKGPU60TTcG1IocfMI/M8YYUqMJqd9Ie7IUJSytK9w2NLSCO9GlnfRxy/UVJLdBKBw3
         qWboDyq9E64oIYop+R9s+OrEy2SeKSuY1lIcZTjX6PBzr/Yl2GBMjmw9547qJ/cofdal
         ViQu8BZMpuJhoQqFQrkfEsdlEchZ0Rkhpy7ZwgTVa1m34R8vEMImmsw1W+BQL8Hp2nVi
         00VA==
X-Gm-Message-State: ANoB5pm01FiFQNTCXbqd1T8Z695gyiycbJemCY6ZZ92M7Oca+YorpPxn
        +rBNSIULKwarUwcWAuvJUB8P
X-Google-Smtp-Source: AA0mqf4zcdu1I6R57Zdsr7a6QFCdrc4ms6nXqRhPXfMXqpJqJsAtmwTd57t6p5rBlswXOWu2573K6w==
X-Received: by 2002:a17:903:181:b0:189:8f11:f2f with SMTP id z1-20020a170903018100b001898f110f2fmr48579907plg.133.1670421612815;
        Wed, 07 Dec 2022 06:00:12 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.5])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902d49200b00186b69157ecsm14720160plg.202.2022.12.07.06.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:00:11 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 06/12] arm64: dts: qcom: sc8280xp: Fix the base addresses of LLCC banks
Date:   Wed,  7 Dec 2022 19:29:15 +0530
Message-Id: <20221207135922.314827-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221207135922.314827-1-manivannan.sadhasivam@linaro.org>
References: <20221207135922.314827-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Cc: <stable@vger.kernel.org> # 6.0
Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 109c9d2b684d..0510a5d510e7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1856,8 +1856,14 @@ opp-6 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc8280xp-llcc";
-			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09300000 0 0x58000>, <0 0x09380000 0 0x58000>,
+			      <0 0x09400000 0 0x58000>, <0 0x09480000 0 0x58000>,
+			      <0 0x09500000 0 0x58000>, <0 0x09580000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc4_base", "llcc5_base",
+				    "llcc6_base", "llcc7_base",  "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

