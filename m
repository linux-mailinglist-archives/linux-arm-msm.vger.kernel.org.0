Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EEB6A5D85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjB1QtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjB1Qs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:48:59 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71381ACC5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:29 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id h8so7779601plf.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMT86nrHzPSxGBZ/YRk6XzVa5pJnZzZgLjUIgo1IxaY=;
        b=jB7oDfWPSVXMCVhZ8ADgU4e/79nxugqvjsVsgURBen7juf5SVLLNxZb+Lv/oJG9LDN
         7KYfj/y2TV1MvrMP4vSF4I0jsLE4YNzLU8KAc0jkKEppBXDzFWF7za8h2Ja6WjB/wPjd
         SxSgilddX1BzgCc8wQXoLEkSo4BOoZox9N5rvQ0NHlZDrDGHK7dEFD/c5n5VXpcyB6F3
         ZOwlEGcdhwfaibyQO149ZBkbG5rX/Ktfyzb9UxnEdI3RnnaL5vsJFsWzwC8fi5yrsJrO
         U5PKQZaB9PTbZQX6NPFOFaZBil+QLXHQh00YQquDQnULF7p2hcwyIA5ilhiWrbMZ+AFu
         DXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMT86nrHzPSxGBZ/YRk6XzVa5pJnZzZgLjUIgo1IxaY=;
        b=C6vKbHkhDEPv74mi+yPiT8Wy9crycGgJ/V0bxgIJDRrbwhiAh0CNCmpEMLUxZRUNYt
         PtLc8oC24bIFF6VcUsqHrrdP4PTulF46/Um8UCvVNWtrwZAgzUE9/9myJ1JB/h7/FEqb
         5zfk5vD3VXbCAyMcmvE0Qfj4/S+FR2rCvte0DT5prMrnwOIPMz1+rFVbtmCNrLDj3qJ5
         DhoDLo+2OFfCbnEAZZZeuTEkKbPIaI3cMEkAQIZGCeSDExTog1heeBlVVeVOEX4Ih2cD
         owNy49n2CsvwL0dbAC2Wxzph3D+8iqhODm3Z0z/bCSpX9wTA/omuZ44oXOEpv6M2jzxg
         BCDQ==
X-Gm-Message-State: AO0yUKUm1Al6JDe/B60Q7JV+1YZ0diuQ5IC5iC9U1fhbTvdyvndGGiF7
        MAY7Uc7FdaQoHQDHxWkUvNl3
X-Google-Smtp-Source: AK7set8zXiJfpcgDrVai6bi7LBJ1wYBlTcU8UqO/WJSalZli3hBweb42oqi/cm1f/ev4xPWFV+3M8A==
X-Received: by 2002:a17:90b:4a8d:b0:233:ee70:800 with SMTP id lp13-20020a17090b4a8d00b00233ee700800mr3996519pjb.37.1677602909262;
        Tue, 28 Feb 2023 08:48:29 -0800 (PST)
Received: from localhost.localdomain ([103.197.115.185])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b00476dc914262sm5908792pgp.1.2023.02.28.08.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:48:28 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 06/16] arm64: dts: qcom: ipq6018: Fix the PCI I/O port range
Date:   Tue, 28 Feb 2023 22:17:42 +0530
Message-Id: <20230228164752.55682-7-manivannan.sadhasivam@linaro.org>
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

For 64KiB of the I/O region, the I/O ports of the legacy PCI devices are
located in the range of 0x0 to 0x10000. Hence, fix the bogus PCI address
(0x20200000) specified in the ranges property for I/O region.

While at it, let's use the missing 0x prefix for the addresses.

Fixes: 095bbdd9a5c3 ("arm64: dts: qcom: ipq6018: Add pcie support")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arm-msm/7c5dfa87-41df-4ba7-b0e4-72c8386402a8@app.fastmail.com/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index bbd94025ff5d..9ff4e9d45065 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -738,8 +738,8 @@ pcie0: pci@20000000 {
 			phys = <&pcie_phy0>;
 			phy-names = "pciephy";
 
-			ranges = <0x81000000 0 0x20200000 0 0x20200000 0 0x10000>,
-				 <0x82000000 0 0x20220000 0 0x20220000 0 0xfde0000>;
+			ranges = <0x81000000 0x0 0x00000000 0x0 0x20200000 0x0 0x10000>,
+				 <0x82000000 0x0 0x20220000 0x0 0x20220000 0x0 0xfde0000>;
 
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
-- 
2.25.1

