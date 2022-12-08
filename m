Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5930064770E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 21:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiLHUOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 15:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiLHUOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 15:14:20 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8243078BAD
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 12:14:18 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id h10so2757480ljk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 12:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU1DfEK+semHpOcnJabZifeAfzgBN5cQVOW2r9R0JGg=;
        b=ter0SaBgpNrY6YFD7LnMAsLEWhnP7BLiK7QqM45I897FMwGPXgiMjgWDyNlLBhqnvA
         aHwDyj/BuxSSBxkjBWCY100pvzgfTEhrrM1WcTs0dxPXZQtzJTPd+HI4V9y2kJ+WS+Up
         JUo6FTmm8WAxYhqz0ReUXFVS0kwJ5BuBkan7TdArU8N527r2AjKkDA+jHOODXOpl0t94
         i/T7kJIOjuygga44O0s1erhZZcvYxfJuH8BP9pLz4nQpTSpU8DVHjlKCh/wH7z9TVBQp
         hjQCUnrQoEYPi90rgDvQXo8e+6wt7eA8yerMQnbnS1Iq4TMV5jFWHjR6cTHF5oXAPXSS
         C73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qU1DfEK+semHpOcnJabZifeAfzgBN5cQVOW2r9R0JGg=;
        b=CJISr443j/EHT8VamEO+kkOrMXtpPB4Xk5j2Amg/qrzOhah2osEHhrAVNnIUHMspUs
         5Pe0XS0H5kfhWGrMqHJm0i8OcAv58IJRMp2EYtEyjul98cElWCnZGEXrqWjEK+n2jaq4
         lrCqqXVIE4ZxlWDIKM3PTCOrtGUFS52Zm8g029rZ7AvfJEBYfRGE9aJ+ARruPITNvjsQ
         4oKadm/SlkYp13AVSRvkE2LYyjgFJG6win/h+//UVPOP9T6MHT4LddyrCdyIHhrR+qsM
         nsmpaxOJWGTChUNq0FFtSRGD+WhK5xCfb120BSQ3YIjsw/Z40advJRYZkOdGpDYh5FSc
         +yDg==
X-Gm-Message-State: ANoB5pkHjGeipGLXCSttHp6OQyqemgyV/NbOI/GOFGw/OD89i5ZQtxic
        LJo3HspnFhiocviCi6uQ4OvQyMFh5z9aRnnE
X-Google-Smtp-Source: AA0mqf6VmX7UrSZI+d3CM3uvg6GURIyWxtTHX41MJlKtdrkgRsx/NsTByV8fvxynRNtb/bf2eklZUg==
X-Received: by 2002:a2e:b602:0:b0:279:df93:d323 with SMTP id r2-20020a2eb602000000b00279df93d323mr7368072ljn.251.1670530456721;
        Thu, 08 Dec 2022 12:14:16 -0800 (PST)
Received: from localhost.localdomain (95.49.125.53.neoplus.adsl.tpnet.pl. [95.49.125.53])
        by smtp.gmail.com with ESMTPSA id bi35-20020a0565120ea300b004ac6a444b26sm3466428lfb.141.2022.12.08.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 12:14:16 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: sm6115: Provide real SMD RPM XO to SDC1/2
Date:   Thu,  8 Dec 2022 21:13:59 +0100
Message-Id: <20221208201401.530555-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208201401.530555-1-konrad.dybcio@linaro.org>
References: <20221208201401.530555-1-konrad.dybcio@linaro.org>
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

Since we have a functioning RPM clock driver, let's make use of it
and provide the real XO clock to clients, instead of the fixed-clock
stub.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 81523ab7ff60..0c6d57a17bfc 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -650,7 +650,7 @@ sdhc_1: mmc@4744000 {
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				 <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&xo_board>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
 
@@ -671,7 +671,9 @@ sdhc_2: mmc@4784000 {
 				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 
-			clocks = <&gcc GCC_SDCC2_AHB_CLK>, <&gcc GCC_SDCC2_APPS_CLK>, <&xo_board>;
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "iface", "core", "xo";
 
 			pinctrl-0 = <&sdc2_state_on>;
-- 
2.38.1

