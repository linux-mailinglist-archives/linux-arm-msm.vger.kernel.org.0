Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8016A5DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjB1Qt3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:49:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjB1Qt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:49:28 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DF52CC74
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:46 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso9151875pjs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eEMB9s5VCpJlF9KahYvaWlXJSQFG2Rpw7o2twh3Yp4=;
        b=FQuMVxezTSRZiRV5XbRKPIaYLXP4B1Y3xCIXmpl9/LzT48Rm7keCfUTlCATPIUH/XV
         mablt9ofSz3ZxMN5qztABjuTS2KLkTpJzsqic3rbJk4Kxye9+sn3GgxmWYUzn5Roq4vP
         JduDPsRwxCalnhgQbGrqutA8D3d+H5z1E6iDXgKP/z6rjY+MtuA2xmKcNTQ+oA9RtQmN
         BYWMv/jnzfuwZevBi42gKSn0Jl2Aq06fF/KJ666tgZterkO0ywPkQ6j/WdDdPyh7huZe
         X56RATdR0zrQYI4fDd1VKTNy8yf1v0vEAQL01FIH2qVrZ84OHyLlijOt+/ot9zu9+uQy
         u+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eEMB9s5VCpJlF9KahYvaWlXJSQFG2Rpw7o2twh3Yp4=;
        b=dmXgKjqfhdaCWBmCSI2p1zn1lxc3YBdc0Ga9X5xKWdA+ugJXODgEKEkeLeE9JVnVOi
         uqeiCyL+Jw0nDZjcDt2deLhDAc/HrV74jSi3AhKIiUc2rVBmKGSaaqoIFuM7xiGLmSwk
         kpvfijUSXT/mJhlmbm/nQpHQsLUOycEZt967otoWS9oELmYLRSzUGnzBXEN6OfyRcRNn
         jjVU3h8Ertobhs5SBKMmX2eK6+IT8NUQPPdIud1HhOv+bflT9Y/c7pMBaseuGJF8C4PH
         oRII+m+k9zTqotl2aEFn382O03/kzjL0FWA0eoLgiEypvz4bjh5Ieq8vd8Q4w3UcPpDL
         PaGQ==
X-Gm-Message-State: AO0yUKVbUgLd0pKYtwveJwJVGHCromnyeZEuN5vpJMBndJaiXdPfn3VY
        13NZyxnO9r80nLbEcQZLNnG4
X-Google-Smtp-Source: AK7set9KMqVsd6eMVqwnfYGpkyUkg18ps6Si1zK8tVHG6melJDr4hZN1JceEcyUtYMORaaVKOhU++A==
X-Received: by 2002:a05:6a20:431d:b0:bc:8254:ddff with SMTP id h29-20020a056a20431d00b000bc8254ddffmr4842486pzk.1.1677602926154;
        Tue, 28 Feb 2023 08:48:46 -0800 (PST)
Received: from localhost.localdomain ([103.197.115.185])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b00476dc914262sm5908792pgp.1.2023.02.28.08.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:48:45 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 11/16] arm64: dts: qcom: sm8150: Fix the PCI I/O port range
Date:   Tue, 28 Feb 2023 22:17:47 +0530
Message-Id: <20230228164752.55682-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
References: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
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

For 1MiB of the I/O region, the I/O ports of the legacy PCI devices are
located in the range of 0x0 to 0x100000. Hence, fix the bogus PCI addresses
(0x60200000, 0x40200000) specified in the ranges property for I/O region.

While at it, let's use the missing 0x prefix for the addresses.

Fixes: a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arm-msm/7c5dfa87-41df-4ba7-b0e4-72c8386402a8@app.fastmail.com/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fd20096cfc6e..1fabfa05708c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1799,8 +1799,8 @@ pcie0: pci@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
 
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
@@ -1895,7 +1895,7 @@ pcie1: pci@1c08000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
 			interrupts = <GIC_SPI 307 IRQ_TYPE_EDGE_RISING>;
-- 
2.25.1

