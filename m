Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E656A1AEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 12:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjBXLBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 06:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjBXLAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 06:00:20 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D640963DCF
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 02:59:57 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id e9so11341993plh.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 02:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP9zGqgMaCSpCYlPZyiAEXYd/RguuzuuCZizAwTQ5gg=;
        b=J290LwTpIgWswetXj0xEmhbl8yf4qKAssmLQNkDWICvPbVim82qGquoaVCSAX4w99P
         yMij3+sbJdSID+dtp/Xcig6h52J05UtJDHhnQxXSGRRnrl5TNLC+AVjYiMrLD+jKHJe6
         vCE0LntanXhnMa2BBF3tzIykrPBVnk/e7DYyT3s3GDzoYP1YY1ceff5qV93YMpDPX8lT
         JqhXqsBpko7hwrWNoahh+zPKEN3F2QLQTFdvklHehV3SlZaO/kYQ0MisMKpEZ97JxseJ
         XKYP6vIxTc+emFFIIl3qZxd5Hvmn//9pKB0WWe1SA5WkQjpsxu02sUlTQ4BqdDkjWg1h
         jxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iP9zGqgMaCSpCYlPZyiAEXYd/RguuzuuCZizAwTQ5gg=;
        b=mexC5kDY/cJbL1NCfEY3VZ7IQW/ApFDEJ/MHXy2p0g6NKfDqzz1MLhRAt3gTp0robz
         +mDIEshiE/d82E1PXD5NKA5JvBZwNgA+yAQr+7uR3NDJiqqVnnns+QuHac558+8FhblY
         2+IlbqdLQT0T/7JdRod/5/Z4cUytT3TXvTKu907obUZdvfKf+7iTUVKMo5X8KmOmc8SX
         5SrHd7RdifxOM8Yz7zZIpuf92pv1vFk7R60OWZoO/UrwDqJM5C2CDToJ9MaCpdUUS/ps
         iEuPVq2JYRbv+e2bfQwDp/IdrA09WR4zqbS01dCgqrNc0/TRPobIM+sySvw7Ag+C3znW
         hmOw==
X-Gm-Message-State: AO0yUKVdkOylrBdTgf67vWxgCa787V2Pj9WgHy12CGYtwy/5q2pEFWqn
        z5Iz/Y5Vw9LEgLA55zd0ikoY
X-Google-Smtp-Source: AK7set/al4LL68/GfHadFZcZNnVLYVICQzL/FWVfgZtw28RaSGQNf8PxY3SlrDb97iTb6gmZ2AdN9w==
X-Received: by 2002:a17:90b:38ce:b0:232:d6d2:f847 with SMTP id nn14-20020a17090b38ce00b00232d6d2f847mr16452816pjb.17.1677236397300;
        Fri, 24 Feb 2023 02:59:57 -0800 (PST)
Received: from localhost.localdomain ([117.217.187.3])
        by smtp.gmail.com with ESMTPSA id gd5-20020a17090b0fc500b00233cde36909sm1263853pjb.21.2023.02.24.02.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 02:59:56 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 09/13] ARM: dts: qcom: sdx55-t55: Enable PCIe RC support
Date:   Fri, 24 Feb 2023 16:29:02 +0530
Message-Id: <20230224105906.16540-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224105906.16540-1-manivannan.sadhasivam@linaro.org>
References: <20230224105906.16540-1-manivannan.sadhasivam@linaro.org>
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

Enable PCIe RC support on Thundercomm T55 board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-t55.dts | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
index 7ed8feb99afb..6339af791b0b 100644
--- a/arch/arm/boot/dts/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
@@ -242,6 +242,23 @@ &ipa {
 	memory-region = <&ipa_fw_mem>;
 };
 
+&pcie_phy {
+	vdda-phy-supply = <&vreg_l1e_bb_1p2>;
+	vdda-pll-supply = <&vreg_l4e_bb_0p875>;
+
+	status = "okay";
+};
+
+&pcie_rc {
+	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &qpic_bam {
 	status = "ok";
 };
@@ -265,6 +282,31 @@ &remoteproc_mpss {
 	memory-region = <&mpss_adsp_mem>;
 };
 
+&tlmm {
+	pcie_default: pcie-default-state {
+		clkreq-pins {
+			pins = "gpio56";
+			function = "pcie_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio57";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-pins {
+		       pins = "gpio53";
+		       function = "gpio";
+		       drive-strength = <2>;
+		       bias-pull-up;
+	       };
+	};
+};
+
 &usb_hsphy {
 	status = "okay";
 	vdda-pll-supply = <&vreg_l4e_bb_0p875>;
-- 
2.25.1

