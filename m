Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F696B04C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjCHKkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjCHKkV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:40:21 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2689CFC9
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:40:20 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso831269wms.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678272018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AROI/tjMFfPnWcGbgejV93q7I8+DDtZkPpKGekOFje0=;
        b=55+wbjaAZC++56lCkeffC5qxVDk5por5b7MVu9k0NYiH3ucpnW8s0o8k+OQ6RuLEnN
         GDDBaONSzh8472XE4SMV4ttWE/QgKmmIBpBQsK5OF9hVWmAwLwpcgJlBW6VyePL73H8e
         PslwiFNNP4NVY5hd3ixCM0Y0QQmYpy/Z3VJSW055aPsmHl3znAKXXjTlHJsMIICRCMi0
         pHmVIQS46qozosJoD8sCm1apn8S0MPd+nc4g72+GgM5R8lFl1DIyrOKDE67g75B+gVCA
         9q3i4TcpkTVmxLvPst371oOswD7rduGNA7/iYKn6FHTbHsyC/7k7btHVYyGM1ZZpOVcu
         qpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AROI/tjMFfPnWcGbgejV93q7I8+DDtZkPpKGekOFje0=;
        b=61SqNuBLBIawQGCR2SE9grNQXygapuBwtu+N0/xjNUtpITcYT8cfMb87n5KvVdnmI3
         +TvwnG3uDqi3LZGSrThBKemvhRUYUrgG+p0g86Ueou1oc+DGb3nEK48/GfCvmKRfr+WZ
         KmoEjUt+kDP3Dp4Z1Ineiaix6uhxDbHb7mN69UYtkRZQS7NlWiOn5F+IZ8d0l88YjkaZ
         56TkAUFiLgZs899KqVNUHe9D1WwYHKTF+bPFI3vUj3a8BZRK/9FWvQ/U1CMzxRR/FXyK
         W/c01CE8qa3mFuG/1js/zH15eQF0ytg3vtmPbnBW96hukcL44Bup5W4/FXJBXUBEPYAk
         zymA==
X-Gm-Message-State: AO0yUKX2xwnYg7Mcmd/M7JnyVV5ICylVzrJYLTgAzJdqFYhd2SYHDzjL
        dTPvxVusGmtreXD93sOVWlYDjA==
X-Google-Smtp-Source: AK7set+X7b24X/6+T2kGBFdyBpd/aLdfW3UNW37shaF8FcWsQgON6LDSoydJHdbPnBAcc9SdMDnwEw==
X-Received: by 2002:a05:600c:3c9c:b0:3ea:bc08:b63e with SMTP id bg28-20020a05600c3c9c00b003eabc08b63emr15964755wmb.2.1678272018709;
        Wed, 08 Mar 2023 02:40:18 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2326:fd4c:82e3:7e07])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003eb0d6f48f3sm20664135wmn.27.2023.03.08.02.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:40:18 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 5/9] arm64: dts: qcom: sa8775p: add the spi16 node
Date:   Wed,  8 Mar 2023 11:40:05 +0100
Message-Id: <20230308104009.260451-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308104009.260451-1-brgl@bgdev.pl>
References: <20230308104009.260451-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the SPI controller node for the interface exposed on the sa8775p-ride
development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index d65e7826f1d7..992864e3e0c8 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -504,6 +504,27 @@ qupv3_id_2: geniqup@8c0000 {
 			iommus = <&apps_smmu 0x5a3 0x0>;
 			status = "disabled";
 
+			spi16: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c18: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00890000 0x0 0x4000>;
-- 
2.37.2

