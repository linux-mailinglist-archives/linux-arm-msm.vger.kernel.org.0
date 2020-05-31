Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28521E995E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgEaR20 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgEaR2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ACEC05BD43;
        Sun, 31 May 2020 10:28:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q11so9213937wrp.3;
        Sun, 31 May 2020 10:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9TO7nnliwJlSsn51XKaW5XuOB7aPWbYeAyLQkeVBImQ=;
        b=d9midsoaiYvS88rum3YvTBalfWDVj3OOygRqb434PN8vAvygr/hphoO5V1D07jy+Oo
         hWeBrDU/CcbrykODUP4XubXWEpDEhaTaTj8Apsa0L9879HxnfcMu3BrGThsUq8vwFNnh
         vNFEE1nEX/K5XUSFGXkkExXAgJW+AyP6V0B0eb9/2dSwqHQT1yq2LRu2xJkO8LMIW8/k
         AUnFm4GS80V7HzWLnrPB7PwhXLm/T7hTyP2nPBH5skKzEsdDpdtl0G4aTV3TT8YIbQQQ
         DeADl/gx128HKxV5z9AEW5Y4dSjxLD1iN0ot+rvXx8rC4c9pVwXmlebGv6yKNtBm5HhY
         NIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9TO7nnliwJlSsn51XKaW5XuOB7aPWbYeAyLQkeVBImQ=;
        b=Fhtlvafp5PrdsGznwxpFiqF3Bedir/1Mril2RHPEZqif0+FeWg09xuF7fxI73J1u+u
         mFYbdzrYUUDIvTPkdDmyFWtUyv+FEW0SU/QHCzMOILRAayEYvAHeoWk/qGDHiGoO+G72
         dk48qRmr1Naw6ry61O+JHfD/6ZTYezUosX9o/8rQRBl8V4PHKCz4aDd319wMCxq6gZVq
         EhW9L/fAXIOPqIS9vymR3FLLLF3+zaUIeyisylRE7LhH1xF2s9LtgLZP+rKhYk+zRF9A
         LLsrAocT428qfXLYRMDh46l3Jc24D8RO1aHbwXdiQWcfR45YpeFoTZtzGLnyhzF2OdAd
         j4NA==
X-Gm-Message-State: AOAM531kBFZ+o1xz79MmxvswBSVDMwSqbreQuw5nnVLUDv/sOHFaKdFV
        y+PhzN2VBBvCVbyKiQOE1Kg=
X-Google-Smtp-Source: ABdhPJzLMtVGpTAcvvPyL7N65Zg4Rs9KGEzClsOgZHSc33HdKUSx/CLbITAePf6qt8tDM5HHoVHIPQ==
X-Received: by 2002:a05:6000:87:: with SMTP id m7mr18431912wrx.306.1590946103428;
        Sun, 31 May 2020 10:28:23 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:23 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] arm64: dts: msm8992: Add a BLSP I2C2 node
Date:   Sun, 31 May 2020 19:27:58 +0200
Message-Id: <20200531172804.256335-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for the second I2C interface
on msm8992 which seems to be used mostly for touchscreen
devices.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index ff745905525c..395f4c325c2f 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -333,6 +333,21 @@ sfpb_mutex_regs: syscon@fd484000 {
 			compatible = "syscon";
 			reg = <0xfd484000 0x400>;
 		};
+
+		blsp_i2c2: i2c@f9924000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9924000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c2_default>;
+			pinctrl-1 = <&i2c2_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	memory {
-- 
2.26.2

