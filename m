Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292C55EE00B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbiI1PVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234663AbiI1PUx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:20:53 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F335A179
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:42 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a10so14772363ljq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TEIMEXNTxGqg9FIJuHmUEfN/3H8rW2QISPKmzsdVbpo=;
        b=TjKchRv1sYiCNIUDblEuXE9d6Nj96yZW/Bh9Qej8oMyDXeA77J4kB/PuR76nS/tiVM
         oEQCWLmlxPE3hB/qi9W1xjJl8xdlW4WsSpmGfBYtR/+2MsgRXGMCxEb1UxEeqsZLvr86
         yeqH4UeaUu5w0/wb059HYxvKgulk+NI5GfgSVZdRrmjLqJacQvYOHPP8rNXpOwkvX4Hl
         sgOCwdzF/UyruhNlNtlK7bpMVqLLP0BqcXuuEpSTgnzRnfcyqsMGiT6B++ycGbJg2OIi
         2WX+rSANiH2RI8mPypmUgo2i5DxXFR3tp2u9fsQvzjUlaQR5pH4sh1uT5Bw5QHMjYcv6
         RZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TEIMEXNTxGqg9FIJuHmUEfN/3H8rW2QISPKmzsdVbpo=;
        b=V8+w+LMW0j8FnBUnRv6eWD08J5wRrMYpE8xE3Wv3EL8yubLj8cJ6GNPRg3nnXlSjPM
         hOmPUMhIKNxQ+GMFVh5RW1SfHVXWz49VW+FXoWpNEe/kMWnqII7XhWk4C+gPUaE/2EJ4
         fzegwJK3Nrg3x0jASj7wp8jLfobjrm4Rm0SWQ3iNiZpTx0d7Ok3f10ZVMpUHvodMniqE
         UbyOfEiTGz85mmkjY6Gii+NTZCNkp/biPvgyJqFkAu4NtmGmEnQEauSr1fXnvCWbn3sj
         gs+LIFDLdHRQpZRiCh0EBaUTY4waV57bEDeux3oWr9bvwhqpvVVSkt7QKTIybfH0j1Pg
         VK7w==
X-Gm-Message-State: ACrzQf0vvraeBrRyWjzoHGWfo/jg4P+HYK4VNWKo+jCjf7AK+hfsOWpo
        uTH2xaKHI68TqtbU8YetTUoYSw==
X-Google-Smtp-Source: AMsMyM7+YZABGg/Lo00PPHcxbrg2EdO5N0fmX8+9Tr2tA7ji3CsUjnRVUG53N/o/sfg2V7DVXPi2og==
X-Received: by 2002:a05:651c:90a:b0:25d:57c9:30c4 with SMTP id e10-20020a05651c090a00b0025d57c930c4mr11361507ljq.386.1664378440868;
        Wed, 28 Sep 2022 08:20:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:20:40 -0700 (PDT)
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
Subject: [PATCH v2 07/11] arm64: dts: qcom: sdm845: align node names with DT schema
Date:   Wed, 28 Sep 2022 17:20:23 +0200
Message-Id: <20220928152027.489543-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

New slimbus DT schema expect only SLIMbus bus nodes to be named
"slimbus".  In case of Qualcomm SLIMbus NGD, the bus node is what was
called "ngd".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1213f78a8b7a..7b62efb180d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3823,7 +3823,7 @@ qspi: spi@88df000 {
 			status = "disabled";
 		};
 
-		slim: slim@171c0000 {
+		slim: slim-ngd@171c0000 {
 			compatible = "qcom,slim-ngd-v2.1.0";
 			reg = <0 0x171c0000 0 0x2c000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
@@ -3835,7 +3835,7 @@ slim: slim@171c0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			ngd@1 {
+			slim@1 {
 				reg = <1>;
 				#address-cells = <2>;
 				#size-cells = <0>;
-- 
2.34.1

