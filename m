Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F48772EC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 21:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjHGTf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 15:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbjHGTfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 15:35:24 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0341737
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 12:35:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so25756075e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 12:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691436921; x=1692041721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9wiaophR7Nm0xfj/SveV5mw+f2Uqt1y0hy6jmmlZXY=;
        b=vfk+G5vjRxTB+3Asp5KhvlGGmBR/ElouEbnHwWraQ8WWiHREdSAgBtfpRHWB5BSXGo
         Q2fbgUc1SE3Gn4Gcsho7UlfOFDfvr4AgxQeSh8I57u6EuBMT75NmqYj9LCV9DwcnODf1
         6PDaI7+HUhxhU5xJXGpCp6RR4AZPjGQzAjlqYbl4ANEzapYS+GaTnuXpxhlSUrTXvSGM
         TyZ4ldtCHkTRkTWq9SIbC02JyPYDuRwWnZ+my7quocWuMrtaAmDjBWISXdbTDCI4UoAp
         HH70Xtx90qgOcAR8tUvKMa1TCppW36uvg8bx3sQhcsITLzSVsynlRaN1s+XQnbLGg6Pz
         rY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691436921; x=1692041721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9wiaophR7Nm0xfj/SveV5mw+f2Uqt1y0hy6jmmlZXY=;
        b=OE2DLSyXAHI5yG87kH7WGH7szpx1YJ6if436GbeDfrhx0XEnIZbTzbVouzOfGmaxz2
         fbTTc+gvrwBcjuNM7Me899HcxFeWHIo0XBXsEMGk4tybIItdcM52GV+qfyn9wpdBE94Q
         iN0b2aI2indl+Y/kzsDpnapbOnIh6sfAd0J12lJ7RYEBj964CRZdWHMz1foLpNof5Pd1
         SugM4gAKA2tvHRm/RY010BhK2iD+58O35tOZTBPbUCxZHavWb4KXEeli57Z27IIcwsit
         hBmGUFUzmwrj7f/Lb/hrhCp3GfjDX996/x9Z+OyrPJqGCSQTBlvEyRYcg+OL4wYQ7IZK
         yGxA==
X-Gm-Message-State: AOJu0Ywi/CqFAAUaz3/bKo7YNdrNfMsAm2vVLg99vFBkNBsxd78uG92i
        ICtUGouHQeImega0xT5ANBvbPw==
X-Google-Smtp-Source: AGHT+IHmZAD9unOxHbaeT93WIWcImU0NXNeoEV7iu/aV4mSF9d0YVCtpnqDHQFt5j2pGHSFn3GKGnw==
X-Received: by 2002:a7b:cbd6:0:b0:3fc:5a3:367c with SMTP id n22-20020a7bcbd6000000b003fc05a3367cmr6670972wmi.32.1691436920814;
        Mon, 07 Aug 2023 12:35:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b3d6:9e6:79d9:37cd])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm16061488wmc.0.2023.08.07.12.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 12:35:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/9] arm64: dts: qcom: sa8775p: add a node for EMAC1
Date:   Mon,  7 Aug 2023 21:35:00 +0200
Message-Id: <20230807193507.6488-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807193507.6488-1-brgl@bgdev.pl>
References: <20230807193507.6488-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a node for the second MAC on sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 38d10af37ab0..82af2e6cbda4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2325,6 +2325,40 @@ cpufreq_hw: cpufreq@18591000 {
 			#freq-domain-cells = <1>;
 		};
 
+		ethernet1: ethernet@23000000 {
+			compatible = "qcom,sa8775p-ethqos";
+			reg = <0x0 0x23000000 0x0 0x10000>,
+			      <0x0 0x23016000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC1_PTP_CLK>,
+				 <&gcc GCC_EMAC1_PHY_AUX_CLK>;
+
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "phyaux";
+
+			power-domains = <&gcc EMAC1_GDSC>;
+
+			phys = <&serdes1>;
+			phy-names = "serdes";
+
+			iommus = <&apps_smmu 0x140 0xf>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <16384>;
+
+			status = "disabled";
+		};
+
 		ethernet0: ethernet@23040000 {
 			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23040000 0x0 0x10000>,
-- 
2.39.2

