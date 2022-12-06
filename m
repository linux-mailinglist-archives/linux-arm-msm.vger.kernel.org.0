Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E939F644918
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 17:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbiLFQVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 11:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234173AbiLFQVb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 11:21:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C365C6266
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 08:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670343573;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=95B8jA1kUqCpFMTm4ShvxX3NFN/etc7ByfObmPR7SeM=;
        b=HoEgBGILOX89+l3cgYLqTzz7wVxtSm2uc+/ItLgWrY5tuI0STffYbG+h3L3bmrAfG/mRIR
        PaRLuAh9PGuM/quJZcS+VKAjp4iFQkzruL9UkovkPEYNd+57tpAeHyfpcFf+OQcHhhvrYy
        4uEx5Wby/SJpOkQCvaT43de5oDkfQ2U=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615--HCz0PgoOpKOOgxoMtVoEQ-1; Tue, 06 Dec 2022 11:19:32 -0500
X-MC-Unique: -HCz0PgoOpKOOgxoMtVoEQ-1
Received: by mail-qt1-f197.google.com with SMTP id j26-20020ac84c9a000000b003a7e6d38e01so5188469qtv.14
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 08:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95B8jA1kUqCpFMTm4ShvxX3NFN/etc7ByfObmPR7SeM=;
        b=gdIuAn4pG7D1j6lRBJXO5ThC724SoWRIrYWDHlvszSb17qIgcVvVGxJ0EXrN4Dq2Uu
         IqbtPu3GltK8+PGluo1RcD1165yrtyL1UWODyFVADTOk3TpXUnTqLYFvREUJE3trLp94
         qgkUKkwNSZtLxGWwFZSN+/xT+mOxMX7Fg/JDMmZDbgTyqS7LNcHRC130oQcnYcNaN0AQ
         nKShdauXwokYRx0Sz4jgsTDqG6+KU9xengy8vD4Q7Rc9Si2Fhhe8BsW7pAwdWGQQSe3p
         URALVLOBe/p23Uj2LvQq0sbBLA9buS7GHqyPF5EgFs8E0xV6JkVd3BQUNQAD7yER6Ztt
         O8bg==
X-Gm-Message-State: ANoB5pnK0rGCTjLpP5bd//PqYMsvMGXRfGSeVI44gauaFM/v4TmUJGaL
        f9T2kYL0je3tZzOYDoD9Eo83BJjc9hwj3jP6mOPFe4hw7t7bN+eVyjlDEfmmQPiKfZh6nIukC+w
        WdZua28fqrxBNVuJ7yqh6u94yOA==
X-Received: by 2002:ac8:7542:0:b0:3a5:c5c1:43ff with SMTP id b2-20020ac87542000000b003a5c5c143ffmr67114671qtr.312.1670343569299;
        Tue, 06 Dec 2022 08:19:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf49vR+++05b4uFXu6ATeKJjLwqI9dPd1rS6ITiN8XeTe9nr5JMY3djLwK4hc3bKkqjsD4KK3g==
X-Received: by 2002:ac8:7542:0:b0:3a5:c5c1:43ff with SMTP id b2-20020ac87542000000b003a5c5c143ffmr67114532qtr.312.1670343567557;
        Tue, 06 Dec 2022 08:19:27 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id d7-20020a05620a240700b006feba101f85sm5883529qkn.13.2022.12.06.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 08:19:27 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_shazhuss@quicinc.com,
        psodagud@quicinc.com, ahalaney@redhat.com, echanude@redhat.com
Subject: [PATCH v4] arm64: dts: qcom: sa8540p-ride: enable PCIe support
Date:   Tue,  6 Dec 2022 11:19:16 -0500
Message-Id: <20221206161916.315640-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the vreg_l11a, pcie3a, pcie3a_phy, and tlmm nodes that are necessary
in order to get PCIe working on the QDrive3.

This patch also increases the width of the ranges property for the PCIe
switch that's found on this platform. Note that this change requires
the latest trustzone (TZ) firmware that's available from Qualcomm as
of November 2022. If this is used against a board with the older
firmware, then the board will go into ramdump mode when PCIe is probed
on startup.

The ranges property is overridden in this sa8540p-ride.dts file since
this is what's used to describe the QDrive3 variant with dual SoCs.
There's another variant of this board that only has a single SoC where
this change is not applicable, and hence why this specific change was
not done in sa8540p.dtsi.

These changes were derived from various patches that Qualcomm
delivered to Red Hat in a downstream kernel.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Shazad Hussain <quic_shazhuss@quicinc.com>
---
Changes since v3:
- Move tlmm node to bottom of file and add PINCTRL comment (Johan)
- Collect Tested-by tags from Andrew and Shazad

Changes since v2:
- Dropped regulator-allow-set-load (Bjorn)
- Updated first member of ranges property to match downstream:
  s/0x32200000/0x40200000/ (Andrew)

Changes since v1:
- Add -state and -pins suffixes to tlmm (Krzysztof)

This patch depends on the following series that hasn't made it's way
into linux-next yet:

[PATCH v10 0/2] arm64: dts: qcom: add dts for sa8540p-ride board
https://lore.kernel.org/lkml/20221118025158.16902-1-quic_ppareek@quicinc.com/

I can't find the specific TZ firmware version that we have so that's why
I included the date instead.

 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 55 +++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index a5f87a8629d6..bb4afd3a9632 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -51,6 +51,13 @@ vreg_l7a: ldo7 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l11a: ldo11 {
+			regulator-name = "vreg_l11a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l13a: ldo13 {
 			regulator-name = "vreg_l13a";
 			regulator-min-microvolt = <3072000>;
@@ -139,6 +146,27 @@ vreg_l8g: ldo8 {
 	};
 };
 
+&pcie3a {
+	ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
+	         <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x20000000>,
+	         <0x03000000 0x6 0x00000000 0x6 0x00000000 0x2 0x00000000>;
+
+	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3a_default>;
+
+	status = "okay";
+};
+
+&pcie3a_phy {
+	vdda-phy-supply = <&vreg_l11a>;
+	vdda-pll-supply = <&vreg_l3a>;
+
+	status = "okay";
+};
+
 &qup2 {
 	status = "okay";
 };
@@ -215,3 +243,30 @@ &usb_2_qmpphy0 {
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
+
+/* PINCTRL */
+
+&tlmm {
+	pcie3a_default: pcie3a-default-state {
+		perst-pins {
+			pins = "gpio151";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio150";
+			function = "pcie3a_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio56";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
-- 
2.38.1

