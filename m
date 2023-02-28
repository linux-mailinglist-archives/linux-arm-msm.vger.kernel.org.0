Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321F86A5D8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjB1QtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjB1QtJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:49:09 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1091EFF5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:36 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id ky4so11106196plb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egu7jQJZy8HkWWmj+5UtXFJwW1koQiOWuH1rj1qf1yM=;
        b=gCSSKrWk9LNki132BjnUHYHjRHes3gYkjdoEiBMgKbAgNr06yDVV2cEtl21jlsHIWB
         UwqMkG5o86IfuZUGJd5rHkqA07NUWkak/C1PyNp89zE3gQUvVz09i2fM6mY7h2TVsICm
         Ezk38skycIZxD81DNKsvNTNSeP88u3mhn441isZCyTSB0gr8RBz2yFUneG3B76LuYBUQ
         ned6r1JYy0SmQHHJxpMRCMmSpedamq1/XlUF/VNtVWZUNyKtSpocbgg+WmL9chnurjcq
         XW3fWYzUoTW4GEyU139qLndOoqPUZ9CzqLGcvhjKCkdSGuVoUUrPCR45J5trX4ZdwYVu
         tF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Egu7jQJZy8HkWWmj+5UtXFJwW1koQiOWuH1rj1qf1yM=;
        b=ES3ZvjF177rAH9koq/RyiL51tIVo0kjDM64ITi7z95zm5bwm37QJjyhFiP1jAmwJW6
         kTLviogM08m6QbSMe8bM+yhlaAk4sJV3E7RvXmHSB7r7AbOktYksxcoaYPAdOYO1o3tj
         9+FCKzJgb8EI3t4pIhFK1q2vBjgRXqCihy9D6iIX3PlBSTj0Oafo9Y2vhGV2I4kgKFK7
         E3GVLsMK0SJ6mpU29jCvjkQMOBmqo7gBM3cn3h5I75PhfuNo7mP7QNfZSRTXoenchNh3
         fjgGeo9BjgGHszKSbAtAOFa97QhxnP0kayWa87diKZq6v/y+QhqLSCHVjrD1UqBGko0f
         DzmA==
X-Gm-Message-State: AO0yUKWSZ+1f5G6neEWG83X/rU8u9Zgf36MJfQugAzdq9deopE1kVnEA
        c3kI9UGKLSBgKcv35ftbs747ej/zN7MSRno=
X-Google-Smtp-Source: AK7set+zZvlMzfnN0/dQVa2JqDuf5dgBvGjxjxJwKGaIa7I7Llv4Ue0y3Gy0aTaBYDBYCUOzPRWmBw==
X-Received: by 2002:a05:6a20:6a98:b0:cd:99f:b346 with SMTP id bi24-20020a056a206a9800b000cd099fb346mr3466647pzb.59.1677602915554;
        Tue, 28 Feb 2023 08:48:35 -0800 (PST)
Received: from localhost.localdomain ([103.197.115.185])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b00476dc914262sm5908792pgp.1.2023.02.28.08.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:48:35 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/16] arm64: dts: qcom: sm8250: Fix the PCI I/O port range
Date:   Tue, 28 Feb 2023 22:17:44 +0530
Message-Id: <20230228164752.55682-9-manivannan.sadhasivam@linaro.org>
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
(0x60200000, 0x40200000, 0x64200000) specified in the ranges property for
I/O region.

While at it, let's use the missing 0x prefix for the addresses.

Fixes: e53bdfc00977 ("arm64: dts: qcom: sm8250: Add PCIe support")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arm-msm/7c5dfa87-41df-4ba7-b0e4-72c8386402a8@app.fastmail.com/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 2f0e460acccd..e592ddcc0f07 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1834,8 +1834,8 @@ pcie0: pci@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
 
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
@@ -1943,7 +1943,7 @@ pcie1: pci@1c08000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
 			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
@@ -2051,7 +2051,7 @@ pcie2: pci@1c10000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x64200000 0x0 0x64200000 0x0 0x100000>,
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x64200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x64300000 0x0 0x64300000 0x0 0x3d00000>;
 
 			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

