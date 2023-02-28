Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C326A5D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjB1Qss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjB1Qsm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:48:42 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C24F760
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:10 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso3509339pjr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Idewr/c6anuiFZ8W+ANFStw5VD2DBWot5T+luCDLkeE=;
        b=HaEDfnx9/yzRqav9tJjlQHDYW4Aqn7/xGfokNxMrpyWPm661fo87bSmbc3jTGwGJkg
         5KKX0H21UMvVlnT3IH50T5kUjKwG/vdQUJEqmXMcxYcYKv975/3A3t3QKo4KndgFVVVX
         Mk+boSqvyHOqYJX1nopulRW5/KQJXAkc8krfofbZmYxDQjmYV21Wh35o0aQlGxVvNY0+
         vq28EPjvWvULxyqLSXuV852Ib02Fwj6iG2WILIh5KZNBPVrU4qnAFhbeA2swWzgH9uXV
         25B2sAtPW8MHNU0k1joa4ok13CRc0MBbjPeTbio6ogEwtPG+d4H6yPQf3s8pTXqzFUAq
         Zy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Idewr/c6anuiFZ8W+ANFStw5VD2DBWot5T+luCDLkeE=;
        b=EGk1nmePT6HtCZekUMeODjj6Xv6FM0pWW3L2Rj62ROK8Ehrs7FbxBjo9HF+ayQernw
         uWypymTmc6ArcviH7Sd6ayLVCwInIMSAoaQx7htpZ24zj3h/RjFds4oCAMcg6+zXgXPx
         G4+6CoeUZyCJpEUKHiNcgpxGsPj6JuXjYh0+3zMH+eWig4KuIUDpzdSsZJFQs5Brso1v
         ToXt+tLkZi9k57ae/VDfb4FtICBJW5AmqSr2iv/VuzNgInc6JkAbzIQ/rKQkLBKuTvqU
         B1niVI3osiygQ+E/BbWghB6yDikDZ5KjmcY5sqwdrC1glomYOZLCgslf4sENu7dGOhVr
         mijg==
X-Gm-Message-State: AO0yUKXmD54QcF653vsXcnqLKMMjLg1/mQtspxiOAtS8uyD4zsj8VUGQ
        tEYUI2Dn0O4JbsHnzrqM7l+g
X-Google-Smtp-Source: AK7set8C0QfAqgl3jK8W5EJAII6wqS0FLRKYLHd/U6ullJGd+tsVTYAtVh8gl1PnzfvnOs0fFCJatA==
X-Received: by 2002:a05:6a20:3947:b0:cd:fe1b:df8 with SMTP id r7-20020a056a20394700b000cdfe1b0df8mr1489022pzg.56.1677602890307;
        Tue, 28 Feb 2023 08:48:10 -0800 (PST)
Received: from localhost.localdomain ([103.197.115.185])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b00476dc914262sm5908792pgp.1.2023.02.28.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:48:09 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 01/16] arm64: dts: qcom: sdm845: Fix the PCI I/O port range
Date:   Tue, 28 Feb 2023 22:17:37 +0530
Message-Id: <20230228164752.55682-2-manivannan.sadhasivam@linaro.org>
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

Fixes: 42ad231338c1 ("arm64: dts: qcom: sdm845: Add second PCIe PHY and controller")
Fixes: 5c538e09cb19 ("arm64: dts: qcom: sdm845: Add first PCIe controller and PHY")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arm-msm/7c5dfa87-41df-4ba7-b0e4-72c8386402a8@app.fastmail.com/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 479859bd8ab3..1c060ea960ff 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2292,8 +2292,8 @@ pcie0: pci@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0xd00000>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0xd00000>;
 
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
@@ -2397,7 +2397,7 @@ pcie1: pci@1c08000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
 			interrupts = <GIC_SPI 307 IRQ_TYPE_EDGE_RISING>;
-- 
2.25.1

