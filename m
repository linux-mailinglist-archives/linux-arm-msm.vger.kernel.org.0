Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F81F537650
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 May 2022 10:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbiE3IJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 May 2022 04:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbiE3IJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 May 2022 04:09:00 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F86375205
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 May 2022 01:08:57 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id j6so9919637pfe.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 May 2022 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vz2goCu8HSSqj1z/SCgL7p1ZSvFJFBtaYvPt923/tkk=;
        b=HjUaNLgpj+1HCHz8WV11s5EFrLkt8jZwObVlRBh41LOTSV5vYht3tzqCBeDYQvSzY1
         DtzRSz3npLFzeZ7N+1LdcQT90juikktl1Zej+IsJFJdlsU2LVfc/UHCw2QXeTF36cjv6
         W2UUNwvXlDuFihHZBfHmKAzyVw96nTwQlOsJbS7TNkzP27sZkzup2gF7jg0bXXaHYhhE
         S1Fjmkn05XwCez20Mb8gSCi0HL3RN4MCpF4BNmZPCSxOlUvqzHTzjrJmHTo3CFgcnftw
         6gY0NoFBEpweEQ6aDWPGGArq+iYIHdy56VvXzuoV034IsADCamYFgRWLaQktq6KERWjS
         SQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vz2goCu8HSSqj1z/SCgL7p1ZSvFJFBtaYvPt923/tkk=;
        b=XwTrvA6I8ts1Ww250XmEMvGOXupDPDzXl5dVbcEVoMmfeLZ/6Q8joj87NzYytYXmj1
         UkICwA9Y008+Og3bJIiLw8sjEWx+1K6F1XAmkvgvllWug7o03gEhmH8xc0faDnMj6OmR
         43D83LoiMug16bO6BsW5h2XJaxvWh6haH4RX9bN0Y7wogTVNsnzQZrcaQ1WtO0mPXnMe
         zYK/pI+Bwg7kHwJi3ZhNGv454ULxu5FjSMAoPoONzznqeWLbXh4chu+RR2N0f+VtyDGP
         benx9ek61Op91Vk+G7jL0IZU/GxLUIArrG1EPrefTjSQupoRhOVC3PJHja8cAHEW8rOO
         /NMQ==
X-Gm-Message-State: AOAM532sMDomjqjvydKa/iN4Qa3J/GmZK8mGp5TIoC42ZUOCjeYt7mSy
        noto9gd7Y5+39CuaRRjQavDd
X-Google-Smtp-Source: ABdhPJyTSnLbwM3Yh43BnEZETXGDd6hYwOc4zYHkTWy+pn7V/vLULqcqYsLgxrBMtuxPwHrXNchj1A==
X-Received: by 2002:a63:f156:0:b0:3ab:ada6:b463 with SMTP id o22-20020a63f156000000b003abada6b463mr46583877pgk.462.1653898136828;
        Mon, 30 May 2022 01:08:56 -0700 (PDT)
Received: from localhost.localdomain ([220.158.159.114])
        by smtp.gmail.com with ESMTPSA id io17-20020a17090312d100b0015e8d4eb285sm8450345plb.207.2022.05.30.01.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 01:08:56 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     tglx@linutronix.de, maz@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] ARM: dts: qcom: sdx55: Fix the IRQ trigger type for UART
Date:   Mon, 30 May 2022 13:38:40 +0530
Message-Id: <20220530080842.37024-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530080842.37024-1-manivannan.sadhasivam@linaro.org>
References: <20220530080842.37024-1-manivannan.sadhasivam@linaro.org>
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

The trigger type should be LEVEL_HIGH. So fix it!

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index d455795da44c..b75e672c239d 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -206,7 +206,7 @@ gcc: clock-controller@100000 {
 		blsp1_uart3: serial@831000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x00831000 0x200>;
-			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc 30>,
 				 <&gcc 9>;
 			clock-names = "core", "iface";
-- 
2.25.1

