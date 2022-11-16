Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A595162BF67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbiKPN1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbiKPN1U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:27:20 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475666557
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:27:18 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso1594343wme.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJfT8V+NqewZoYxYDtMjJqC1DFWvFQHR8X1dCFOjEZU=;
        b=f13k4pD/fvQANLAy4Rl4VRQrJZv7lW5CORV54ubO5IWhGt/hRPcUYi2jJoN+IdX406
         dDU2IYvCcFdRqWBHSt5QuCGFIdpflfsmPDT0o46CD5QUKdUs1m3tMYSTbIrFGQM8bTVu
         BKYcCbNvpT541em+NVMAEirV02oiVaUt8iJc9o0f20rvnzWTDkJWSJKTvztiIEocqIoI
         OSf8BqJvp5uK6swKAHvKHVif7Tzw7lbIV6VPBYBCKW68ZAabdX3DsWogzqB9QpPPIilC
         fZ0RGWVH6zfTgtl5dlVrZcOVLCttlnC/XftCQwfN60N83u4fM7PBI0o7TI/diI6UwRoZ
         a7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJfT8V+NqewZoYxYDtMjJqC1DFWvFQHR8X1dCFOjEZU=;
        b=Av/M1d6gQN4fLn1S4VayekZVWH0DG3Krurk8wsLktJi9PkSbHJCE/Y7q+2nnXiVUYt
         965juhOKAOBoioYU7yT9PktmR62tvweTXJajojgkZKlvilSilJQvCs9kOgL2J5ETH+ED
         O5n+EKSNi0Oo6xDWhyzHa1Q0c8mzkAmwzSe+mH4ioGenw0PoF8XEf6Z7QI4zTaHFgSkp
         h1LqUlwlZ1QnZoOynKapd4v328lnIDoZFZsPticvPvQvDPqpp+TuYx/TOdSS9yFggriL
         1VXuAhXjEOov+C+46O2HwbzUqsNLn5vu44KyTOMqYoCxCa4/IpYByCECG3Xnao5MLuDS
         Vz4A==
X-Gm-Message-State: ANoB5pkoEHr8HEOQAdgwTcZRZX42Vz4cc57G5kaIahcTYeAi/RHhytWX
        8a6iiYi6oZwwV2qbSgNPxWbruA==
X-Google-Smtp-Source: AA0mqf7B1X2HqsCe8qopaV8np3w9eMq+fXBTFFWnQguzWdyuqjsKpwmk9TCK/9xf66N21FewaPtgIA==
X-Received: by 2002:a05:600c:24b:b0:3cf:8e58:4a0c with SMTP id 11-20020a05600c024b00b003cf8e584a0cmr2092869wmj.199.1668605236617;
        Wed, 16 Nov 2022 05:27:16 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id k25-20020a05600c1c9900b003cf4d99fd2asm2425710wms.6.2022.11.16.05.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 05:27:16 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 2/2] arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater node
Date:   Wed, 16 Nov 2022 15:27:06 +0200
Message-Id: <20221116132706.2852434-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116132706.2852434-1-abel.vesa@linaro.org>
References: <20221116132706.2852434-1-abel.vesa@linaro.org>
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

Add the PMIC eUSB2 repeater node and add the usb-repeater
property to the eUSB2 PHY to allow it to be controlled by the
PHY driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 757cf4f7f195..539d75c0566f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -414,6 +414,11 @@ data-pins {
 	};
 };
 
+&pm8550b_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
 &uart7 {
 	status = "okay";
 };
@@ -429,6 +434,8 @@ &usb_1_dwc3 {
 &usb_1_hsphy {
 	status = "okay";
 
+	usb-repeater = <&pm8550b_eusb2_repeater>;
+
 	vdd-supply = <&vreg_l1e_0p88>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 };
-- 
2.34.1

