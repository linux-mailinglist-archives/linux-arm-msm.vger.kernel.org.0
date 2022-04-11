Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD03A4FBB4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 13:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345594AbiDKLvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 07:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345580AbiDKLvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 07:51:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A2721E3D
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:49:33 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bu29so26237365lfb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/6CFto7M8oZaCl7cm5R2A65FlhclhlqZYkEyXGEcxkg=;
        b=NOwyTfnNgzPqQpLy4Cr4YL62YQVyBgFIOMOlbqtNGsUO86YFi6G/XKGlzByYu9myX6
         6A3uH9RKckCTkUxgBtxAGmQCIDGXOuWPXmRO1wAmItJdcdqnOfZGG8jrO70wqpljuhpl
         rVJYMei0cDiBx9/MRfQNVI/A8rk8H3jRYu7fJxX6xSjbs+izySWxBxmfqsc2I0yLjvmS
         1Bx6XqSjss3Anuqxo9+CvEaVh0SL+T1562SAKeOarOlbHLHQDkAd2Op3WJt2RA+8Lswt
         KLriaqgVBwl7b/aTBNGa/mw4xjgnKqr8zGyqXoCYSABlvI9KRR9qs2dvrBnsywzLpp+z
         4ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/6CFto7M8oZaCl7cm5R2A65FlhclhlqZYkEyXGEcxkg=;
        b=4BLXMBIzVGzGKXQt6QJGI9hZpgUE2wKwFob0PTnjBRhw8ARFvPJp0BzJfLfsg0Duwt
         q9Nn5Izz9YxQhKoP1ZT8mfY2SFl9p+I9i7EUhDCfgUrS78DHaNr2FpgjZK8OEqPROsB/
         01nxsIwkfX0KWHCUKP7W2irPBmaM43S2OvAiz3C3jcR0A1hdvD0jAp3rKv65ya5Z6mBj
         bjvLGFpO44d1hYZ/bPNnVSa147NXW4BkGNt5aDN4OqVwYSi7z+PxDDQvAzajYHIWaoqs
         MZxYMTZJf826Jpi9dj8Tg4dfUtiLz8rMZzBMDdK0o4Iph2CgpIMn0TchblzHGAfyoQKA
         rWog==
X-Gm-Message-State: AOAM533bz0kolv+cGEp3AmEdYUvppvKJCp0H95iE/SXnfpL601ERvgOu
        uTjT9apkha10Uh/iRqFvMfwWhAtmb6B+pg==
X-Google-Smtp-Source: ABdhPJxMpGguGkJehVVepkmvquygZLb6Tr9Ost9vzYkV8QLaDFq07AlZF8kbTtvVDyeZXtdTHgTs3w==
X-Received: by 2002:a05:6512:3d0e:b0:46b:a6b4:9cdd with SMTP id d14-20020a0565123d0e00b0046ba6b49cddmr2673851lfv.322.1649677771540;
        Mon, 11 Apr 2022 04:49:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y21-20020a05651c021500b0024b5d56484dsm587973ljn.83.2022.04.11.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 04:49:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sm8250: provide additional MSI interrupts
Date:   Mon, 11 Apr 2022 14:49:26 +0300
Message-Id: <20220411114926.1975363-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411114926.1975363-1-dmitry.baryshkov@linaro.org>
References: <20220411114926.1975363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 each group of MSI interrupts is mapped to the separate host
interrupt. Describe each of interrupts in the device tree for PCIe0
host.

Tested on Qualcomm RB5 platform with first group of MSI interrupts being
used by the PME and attached ath11k WiFi chip using second group of MSI
interrupts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a7a7375893cc..ad22a921db7e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1808,8 +1808,15 @@ pcie0: pci@1c00000 {
 			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
 
-			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "msi2", "msi3", "msi4", "msi5", "msi6", "msi7", "msi8";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-- 
2.35.1

