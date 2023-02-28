Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75BE96A5D7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjB1Qs5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:48:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjB1Qsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:48:51 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C9614998
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:18 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id b20so6177493pfo.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAtK7Zk8PyaaL2KGK3kPqF4OjS65bLvo7hShFbPeFVg=;
        b=nrya+soptTdI+aVebLmaWMGBRv/+IgaWafwBA7BC7AU0DCOP0PJtJVrDcjOwnmZNrg
         Ojasv/Y0KrsbmmBAoCcBxfdVq4ZcgmBa5/orhxZpr9SPBFAnHCoytBjJh2tiMPu4CDSU
         aP051dg1nXEUVUdWBfLf6IjagPq7RhzFKfZhyDfqAlWAK4cCWkfC3FdDXkv8Bk6hhd3i
         H3GBW6QMIK7LVb4n40xlBrmQ/RP+cweJBkP2X/G2MqmYDo6sKHkFFxjSpTe2UulbBM8w
         uwoPupBrCbncz52+cywpp53rtIWsD255o8DL2G9wdl66IDRhfJDsNJPp3c9YpsS30Xjm
         LdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAtK7Zk8PyaaL2KGK3kPqF4OjS65bLvo7hShFbPeFVg=;
        b=tcOX3K7mS3Ppob4bNADwDL4jAcdgPQOVd7DeNbPtC4/j6anVI6JFBGDc7Gc5EpkKQL
         bAWXiszLLWK39+fK9AKBiIoWfQTbTftXyksIIW6lj/Yo+r9RTzrHhYcBsMywuOlgjZtp
         GBMnd1VMG6k0uF811xvZuFsnQS7ENJ3kZMZPCuVQETKFuwMPJ7V2+f3DVVaZvzyeshQZ
         WVHHfC4Ztt0FUXP1eU45BOoXAXGtO06LiiTzWvIUf1LZtjYrCD4VaMwuq1TbdtPIs+cD
         OKuzsH1NC19VByOHgVmWtrlsw6gX0xBYLfXYsrBmis/3EqjCI+tLilHG56yplmptlLrw
         nGuQ==
X-Gm-Message-State: AO0yUKUIPEqGEMDJ3BeRTpF7OMRURkR1OJEyAFB8L5hqbwHbKwGEBQJj
        lsH8+fYQnF/9uRYNhuQ/E4pt
X-Google-Smtp-Source: AK7set+EMzHa12KqUL/NDb86FlILLUHVMy1zN2cY1AOIncUop4kjqpuG9W/BS9q6kMU3yX+iB5T5Pg==
X-Received: by 2002:a62:62c6:0:b0:5a8:aa1d:30e9 with SMTP id w189-20020a6262c6000000b005a8aa1d30e9mr2605831pfb.18.1677602897942;
        Tue, 28 Feb 2023 08:48:17 -0800 (PST)
Received: from localhost.localdomain ([103.197.115.185])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b00476dc914262sm5908792pgp.1.2023.02.28.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:48:17 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/16] arm64: dts: qcom: sc7280: Fix the PCI I/O port range
Date:   Tue, 28 Feb 2023 22:17:39 +0530
Message-Id: <20230228164752.55682-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
References: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
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

For 1MiB of the I/O region, the I/O ports of the legacy PCI devices are
located in the range of 0x0 to 0x100000. Hence, fix the bogus PCI address
(0x40200000) specified in the ranges property for I/O region.

Fixes: 92e0ee9f83b3 ("arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arm-msm/7c5dfa87-41df-4ba7-b0e4-72c8386402a8@app.fastmail.com/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index bdcb74925313..99845c79a8c4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2077,7 +2077,7 @@ pcie1: pci@1c08000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
 			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

