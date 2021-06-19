Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788AC3ADAE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 18:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhFSQaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Jun 2021 12:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbhFSQaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Jun 2021 12:30:11 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2D3C061574;
        Sat, 19 Jun 2021 09:27:59 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id hv20so15043265ejc.12;
        Sat, 19 Jun 2021 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lW8P034mJuoO9/n8/vxpCs/CxHgMLpd5lKfr+WkihzU=;
        b=u/6/X5PEqtIAiinN1SY9A4nz7A6SKbkQhloYdjTkrsxOcmsTK2hY1/lTjbvPuep63S
         YeY1qCKc/bx2jBHa/UkyyqUQ/WHZ2nPwQObOQRNgdDUPF5vtNkFGVRE+0XrNt5wq3b15
         WVcwWcaAT7zjd836Khee+M9H4dsjA+kQziowM0iPGSFs6S+QfgunqWtCkz1gMldybKL1
         6+D9R/cyXyLnV9AOv1TopZSP6Zea2dtw2hecC5q8yiOj+TnnmNdrZ22swgfhlsJQnqk1
         85HsKRGPUdZwha7y/EfM0g6pqSl7jmY49lsYKgRnLLTNJM3zbU9Df7C/J37F8cA2XbF0
         hN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lW8P034mJuoO9/n8/vxpCs/CxHgMLpd5lKfr+WkihzU=;
        b=qxnXuLYQGpiMMMW1Ut93Lt7ZRlNKKn8rjxcmEUjb4M78nfv34pWCStyxmYULTs/Wpk
         BGK4AbBb/ur1Yqe29QhsdLiuytnVel1QSOSRCd5vnilQ9/Pg/p6TVbZW/mLmYrAuIngv
         aVcQuE/tXu4z+JmCgh4h1uqUD3dmUar5Ho0J4JN3oeY2m8bCSrCCcw7DxXW7OlWmjwiT
         9GUdusMu6xfpcuEenSAZpWXHLhPMby6TjyC7qB6fQ0tEETF4kAqYNaMGuA3nT/ZndLtt
         W482ZuztjpmkDogQllAcUwIsTqy41Fy/DHtvD6KwrbCx/2VHCuM2EGT921Z9wLZaRLHi
         c38A==
X-Gm-Message-State: AOAM530YfgL43FGdYmWGNN+C3GeeYdC1hT8Am2Ya4/M36X9vkJDIJObz
        +yKoMtbRzERuMntbyJiXlwI=
X-Google-Smtp-Source: ABdhPJyZLGWOIqEaT70/yOHvoyck69CYgikbWxSnZqgXMjUImvlXeCa33X/vUeLi67D3AKKnlLK+Ag==
X-Received: by 2002:a17:907:c16:: with SMTP id ga22mr16448264ejc.116.1624120077787;
        Sat, 19 Jun 2021 09:27:57 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-202.xnet.hr. [88.207.99.202])
        by smtp.googlemail.com with ESMTPSA id s11sm7399248edd.65.2021.06.19.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 09:27:57 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] arm64: dts: ipq8074: Add QUP6 I2C node
Date:   Sat, 19 Jun 2021 18:27:51 +0200
Message-Id: <20210619162751.2336974-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add node to support the QUP6 I2C controller inside
of IPQ8074.
It is exactly the same as QUP2 and QUP3 controllers.

Some routers like Xiaomi AX9000 and Netgear RBK850
use this bus.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index a5b16e151485..07404cdbf697 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -455,6 +455,21 @@ blsp1_i2c3: i2c@78b7000 {
 			status = "disabled";
 		};
 
+		blsp1_i2c6: i2c@78ba000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x078ba000 0x600>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <100000>;
+			dmas = <&blsp_dma 23>, <&blsp_dma 22>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		qpic_bam: dma-controller@7984000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07984000 0x1a000>;
-- 
2.31.1

