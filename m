Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A79B686AB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbjBAPvV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:51:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjBAPvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:51:17 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B76C6D5DF
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:51:15 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r2so17732076wrv.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9V6IrRFSec0QSkJNn1rqOWPstzO3hyR9Dg1Y2Z0JCc=;
        b=GEscF2KOEldxLMK5VihbL4pkqm+ni7eyKf4zn4zU1fDiXASsz3nHOwfAD+lif+56D5
         ajYFS3BGNH6hCqufvW8Dq3JFtZuybwCT6zHo9P/7amIaD7QSfft9ncB2OGcgjElU5epv
         zFCFwwshqJORQbWxT8GLthhm0AjIHWMsz7tpViUag7aAmzCH++ywCLw2rK7wre1InmDK
         AHJu32g1GZ+b/BZ8NZA0DIConUJj1S6fDb4RD/W27UnFpFL/w0sRoGAF7MzD+h15ilWN
         a1wlOTP2XLO5TBaHKqXgvnOUYuLBMU4F32iBRzoW1SobI2r5qftAFtD+fH0yYsl3wi3O
         Xi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9V6IrRFSec0QSkJNn1rqOWPstzO3hyR9Dg1Y2Z0JCc=;
        b=Jg2Fr9XNVGZ9JrnG4a/oiFcL6szzNLBhLhckmZekMCeNOpnmWudQ5Ngb6WDS7wJZ0r
         vgKNzzyf3T6oQtQWmdFG1cB6KzPZ/JU7X8vDmdI4EXN8mnTUA6b8MmEvYUD2idquyyOy
         +DqskZy2b2PrWInW11kMSF6pSWw80NANzMKihWmMnkn1rtMQa6GbIp/eAWsuZue8O8Jp
         cg51wLj0mBrcF9E9QpKLlmd15fu/EuQS4iZfr3iP44oyZA4LibKv0CElE5nyVXdORWpK
         O04lA81Rp+5DAyzm9R+ec/PwRXvFCzLrE6fDP0B+wY+Rz1M1RrgPerDnQrtn/TM+YUYq
         NLlQ==
X-Gm-Message-State: AO0yUKXcrPzZkAlBZLAI9rS+RdsrfIAyo4CstCSsjcFlbcc+3CXkUTa9
        2G/6HU8mlQ9+M9/HPilJe+cStw==
X-Google-Smtp-Source: AK7set/qlubOHwmey/ay+xN3dB/eddt+pdCm947s4ISWhz2FVzvmzfCgzcfwyXKS9aAYi/Nx6hLtPA==
X-Received: by 2002:a5d:468e:0:b0:242:82a4:2bf4 with SMTP id u14-20020a5d468e000000b0024282a42bf4mr2121876wrq.10.1675266673690;
        Wed, 01 Feb 2023 07:51:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe441000000b002bfd524255esm14816189wrm.43.2023.02.01.07.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:51:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 02/14] ARM: dts: qcom: sdx65: correct TLMM gpio-ranges
Date:   Wed,  1 Feb 2023 16:50:53 +0100
Message-Id: <20230201155105.282708-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
References: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
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

Correct the number of GPIOs in TLMM pin controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx65.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
index 619cafb6d9b3..13f98197141d 100644
--- a/arch/arm/boot/dts/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
@@ -427,7 +427,7 @@ tlmm: pinctrl@f100000 {
 			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 109>;
+			gpio-ranges = <&tlmm 0 0 108>;
 			interrupt-controller;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
-- 
2.34.1

