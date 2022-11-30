Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FF063D995
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 16:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiK3Pic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 10:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiK3PiY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 10:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20C17B60F
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669822642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=vp7HSLV0g1sArLbbuGt4+ey86XMny/g9fUHlgrVx6TQ=;
        b=ESLdSlpT9Hc5vfIGyCQxiCH0gy4f/iUF1oaj3ob8Lw2D6j6uScv2PjS6eN6HssdSb5giNH
        kl3TRQAN26kiwM9so0jpO5sr3hzUUNiXI/9VJeOz39vMs/2sF9hDAvCUpSRwo3IHFFFkZ/
        sYRdD3jsx2aoR4pss7tnKhsQ7FG52L4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-yNUUMlgvPxe2oOgXXB-I8Q-1; Wed, 30 Nov 2022 10:37:21 -0500
X-MC-Unique: yNUUMlgvPxe2oOgXXB-I8Q-1
Received: by mail-qv1-f72.google.com with SMTP id ns11-20020a056214380b00b004c64784249eso26481410qvb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 07:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp7HSLV0g1sArLbbuGt4+ey86XMny/g9fUHlgrVx6TQ=;
        b=1XVMIBVF5Rh+70+Uuj//SjB1taOX80iGJ+kBOcdbx9vDNepwyKReKenmk+Z0xz7oW7
         pjjVNUKmrNMlTjdKNgMFrLMXEDZKYmPCiGGLfhMm+OT90jS2vPt/XZb2zs//Oq/lB71i
         Fzujlj4PaeGlr2I4TTt0hgD+g6wlcuLqbX0VsIf0nWTUWNbk+DOAUIoEUFEFhQJ402z3
         6dIa8Idoy9HCS6D+yA+Sk80aCxByAanKc0NSX946kSc6Afw+HG7uevY+Mm8ebNsO20Ak
         pCF5lDIlEXiz3MqMBLHh/l5NFv2kc6iFpKMWJCRly0EBOGOprPRcG4isk654yUwomo7m
         AQVA==
X-Gm-Message-State: ANoB5pm8n2hIIoiRwC5/cczPKzylsHsM8IlOhdsjY/Nx3fFR9JpJuFbD
        hyiaXZ119KVmBeUYbc3dIXLPZqmv4NZVE1v0809k/cbALrlFefgM7bgnAxdrzDftuj8w42wXxG3
        jAOOHCCsApNNUP0adJVEdBmf5Qw==
X-Received: by 2002:a05:620a:1649:b0:6fa:6eef:50c6 with SMTP id c9-20020a05620a164900b006fa6eef50c6mr39796708qko.44.1669822639859;
        Wed, 30 Nov 2022 07:37:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7fllA2S1bZ1/d/CFDmV04sKoI2eroN99zJFahvNSB+/B6oK5c5xqNvBeCUQo3Sf/DDwpj5Mg==
X-Received: by 2002:a05:620a:1649:b0:6fa:6eef:50c6 with SMTP id c9-20020a05620a164900b006fa6eef50c6mr39796680qko.44.1669822639572;
        Wed, 30 Nov 2022 07:37:19 -0800 (PST)
Received: from x1.. (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id ey24-20020a05622a4c1800b0039a55f78792sm970479qtb.89.2022.11.30.07.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:37:19 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_shazhuss@quicinc.com, psodagud@quicinc.com,
        ahalaney@redhat.com, echanude@redhat.com
Subject: [PATCH] arm64: dts: qcom: sa8540p-ride: enable PCIe support
Date:   Wed, 30 Nov 2022 10:37:10 -0500
Message-Id: <20221130153710.1369839-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
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
---
This patch depends on the following series that hasn't made it's way
into linux-next yet:

[PATCH v10 0/2] arm64: dts: qcom: add dts for sa8540p-ride board
https://lore.kernel.org/lkml/20221118025158.16902-1-quic_ppareek@quicinc.com/

I can't find the specific TZ firmware version that we have so that's why
I included the date instead.

 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index a5f87a8629d6..e953165f3b73 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -51,6 +51,14 @@ vreg_l7a: ldo7 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l11a: ldo11 {
+			regulator-name = "vreg_l11a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+		};
+
 		vreg_l13a: ldo13 {
 			regulator-name = "vreg_l13a";
 			regulator-min-microvolt = <3072000>;
@@ -139,6 +147,27 @@ vreg_l8g: ldo8 {
 	};
 };
 
+&pcie3a {
+	ranges = <0x01000000 0x0 0x32200000 0x0 0x32200000 0x0 0x100000>,
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
@@ -158,6 +187,31 @@ &remoteproc_nsp1 {
 	status = "okay";
 };
 
+&tlmm {
+	pcie3a_default: pcie3a-default {
+		perst {
+			pins = "gpio151";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq {
+			pins = "gpio150";
+			function = "pcie3a_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake {
+			pins = "gpio56";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 228 GPIO_ACTIVE_LOW>;
 
-- 
2.38.1

