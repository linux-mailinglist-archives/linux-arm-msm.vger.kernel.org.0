Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A4B686AB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbjBAPvW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:51:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbjBAPvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:51:17 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBE56DFFA
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:51:16 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id y1so17760929wru.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtFpTKh+778i3u7Xml/7TcHhpU9aGcPUkMXcNerm5b0=;
        b=FufjqPti5E7gJxq0L6Pf0x9O/8UhLzSPvn+1gpYqdwETTTDKY26x409lPZqd+ULnX3
         frk8njGrVbkeUw4mChOaXS47XGKBE3SS9u5DnQjToneErNAdnICbz7KOJekHZGqvigIp
         u+RFgQCkeeeXQEHXosi9nMrK1GKyYmMWYgFX0LLfqB8CuvD6eh+Gn/VEg1BGZ/Df+BwD
         ulyeyyhpSAg/qf+PwEfYFxu0/Dok69rdSxxmVdTf2DtmM7NGiVOe9yRoVR4cTo+hfH1t
         iE46rq4UPmyaD92uhCsbAbhPHSnZxa1xQgnLHhksdivAtIeo6ULzNspd7otSlhAbk/tW
         1Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtFpTKh+778i3u7Xml/7TcHhpU9aGcPUkMXcNerm5b0=;
        b=CcbNyFbxVyt/zKKHgH0oIVHJCM9jaA38HkXDNOBHS56Noz87oj6AD4m4XgIHo8dD2H
         Q3MLBRqLCv9jLAdYEoPAL5fO8+3A0MFJOQhPzwTp+D5FhnEUV2NQJi4fAWdqE5dzoPoY
         5FdAdeYUmGAtipawL9XawWWru0MlagvH3vucoEgQfaSwMu8Wh5vI51IEQsVkN85l57Z0
         3Bd6Row4marzW30tkRnGJOEkFp3kTLv6mO6qnQWDPCnslVAhVhJ100uZ/bKoLNkQdOte
         nEvSOsuQbKgCl/cQHYMXTvJffNC0KZNdPozRgEo/byTJFdUQ59TLk4Dt/9LeZWX8qwNk
         ANqg==
X-Gm-Message-State: AO0yUKW/0K80bCwnniaVX1wT8W/w84Vw9lRUs1PpxZlqxqtTfxxYdZhp
        Cl7c/2/ZNDsIqoR8vnjLC3GcIQ==
X-Google-Smtp-Source: AK7set9suw+u9m3lei7OP6HJn+V3Ym96ptr12xWV4MaSbb6e5yNFQDCs1cumg3vMU7hZT9YU7e6jsA==
X-Received: by 2002:adf:fb82:0:b0:2bf:d461:c2b7 with SMTP id a2-20020adffb82000000b002bfd461c2b7mr2658683wrr.71.1675266674866;
        Wed, 01 Feb 2023 07:51:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe441000000b002bfd524255esm14816189wrm.43.2023.02.01.07.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:51:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 03/14] arm64: dts: qcom: msm8953: correct TLMM gpio-ranges
Date:   Wed,  1 Feb 2023 16:50:54 +0100
Message-Id: <20230201155105.282708-4-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 4e17bc9f8167..610f3e3fc0c2 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -399,7 +399,7 @@ tlmm: pinctrl@1000000 {
 			reg = <0x1000000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
-			gpio-ranges = <&tlmm 0 0 155>;
+			gpio-ranges = <&tlmm 0 0 142>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.34.1

