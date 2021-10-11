Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 016E04287AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 09:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbhJKHdy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 03:33:54 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57110
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234455AbhJKHdx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 03:33:53 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BA89240000
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633937512;
        bh=XwHbWdp7VVwQ/yycSh88XsBspIrkx9lp92AdUBkvmF8=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=vNvYQN/o9SY69ky2ld9Dwi7jjXmcrd032m0fIvdhmCbEc/TajrcOg60ftavWKQGnx
         XzzOtlXeLmZy8gFONZxu5h4kyD/wN+TScOAjDASeHj2ElQDWfv7IehHAZ48+avDYPr
         j9/WX+dlQhjnIV2kAF1cb3hiymYYnHIXNvghz4ADCHBxjHQHS9o/h8q+z/HcDYm8dT
         U207tIOq4kSDWAIKXuRrMbCz0nPiKQ9B4XrjczHDSuaoNyoCnJV4u6EkgWB1j2mDMY
         UrDrJYZrTwQWpnSc/NdJN4hqvbmUTPTRRye04/WqA8F540INOCSH7PteXnwYl0RIqD
         bo6I2ovYFn/SQ==
Received: by mail-ed1-f71.google.com with SMTP id d3-20020a056402516300b003db863a248eso3045127ede.16
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 00:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XwHbWdp7VVwQ/yycSh88XsBspIrkx9lp92AdUBkvmF8=;
        b=HVSg/jx9AIs7plRfs1UTAi7bRH7V0LsVKrSDlANQsdpY7zK0SQ41PsYjgvrjWLbEvf
         zZhdzy0OVWrZOrpWEVGic2y2ZBH36k3XQszQlaQPR5KjpRGt6H+PVBx9oVGu8If6fF5I
         iO7YxpyWXEGJQIaXaYmWFXOAxOLW7fhaO8z4AQ0g2F3AF6FoFWgkVZGrkUc3V/DfHxHI
         88mlhX4Gbyf8pznFC5QVwXUkbHyPjj2chHPLW+8XdZu0iKpu+pLnx8jMQLUsL8AVUzL+
         xB3XeF+u8iSCaaAvb7pDyhF4j0EwSvdsXFap1dCcyY+DVi4ASM8fHF6CgnYPoptYO8j6
         Qe6Q==
X-Gm-Message-State: AOAM530TYeuzkQ5yn2mXjqjCZ0FH5TA7G2BURYd4tLEt0rr0BhDscHpo
        vKMG2lQUPeXnBcCPjy7QmpFf8MESOZH7jyl0/V8v8WQXkM0W4ZaODolH0I7Vo7YSitU7eTpQdgs
        8TXxvorxS7SBU0OiRDcw/JQCuSyV6Ru6az8tEeymA4fk=
X-Received: by 2002:a05:6402:5215:: with SMTP id s21mr34199911edd.113.1633937512229;
        Mon, 11 Oct 2021 00:31:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywCR4sOtwh0YCcCUI9FHmKswBlDB3H3/tQT8Wk1uf3GQGN52eB0kGY3pjRUV8qGtdaaS42gQ==
X-Received: by 2002:a05:6402:5215:: with SMTP id s21mr34199896edd.113.1633937512032;
        Mon, 11 Oct 2021 00:31:52 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id dt4sm3054377ejb.27.2021.10.11.00.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 00:31:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] arm64: dts: qcom: msm8996: move clock-frequency from PN547 NFC to I2C bus
Date:   Mon, 11 Oct 2021 09:31:43 +0200
Message-Id: <20211011073143.32645-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Although the early NXP NCI NFC bindings required the clock-frequency
property, it was never used by the driver and it is actually a property
of I2C bus, not I2C slave.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index d239b01b8505..01e573f0dfbf 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -185,12 +185,12 @@ &adsp_pil {
 &blsp2_i2c2 {
 	status = "okay";
 	label = "NFC_I2C";
+	clock-frequency = <400000>;
 
 	nfc: pn548@28 {
 		compatible = "nxp,nxp-nci-i2c";
 
 		reg = <0x28>;
-		clock-frequency = <400000>;
 
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.30.2

