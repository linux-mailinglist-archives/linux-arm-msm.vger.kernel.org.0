Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6883A2EAAD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730311AbhAEM3G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730307AbhAEM3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:29:05 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A663CC061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:39 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id l23so1609108pjg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ShXu7/U7Beq0uWc9RaEN3HI3oScB32KORyGyOVEnVV0=;
        b=RHu4kMxc6AzHLy/zzx6vh7UJIyQtFXBt+A/Fxyq0b9PxSCboILqTeuUu0Xe4MZznd4
         drYlYhMgyPx9TKMEw1GUVh918DvWAc+dc6eLesDwoTH/kr87QUk7XPVqmdVUO6WecZnN
         vHvozS08ewOEliZ4Q+XMSYHqCeuNLlN+wBpq8hMq30yJKguNFEPevlJhMWOZGSeIVMpl
         p47BwbUFLItbfZ7WS4fh5QeQ+FXySoR0wdLSn8xmINB5Jo6SkubX7T7NVk0H+EitaSxt
         vxfKMfV2P2//uSVRn7/CTzZtP6JYAyTGQOXwCoPxr/bXEnKIsZb3Xu2ZCuzcG43gLwOE
         PH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ShXu7/U7Beq0uWc9RaEN3HI3oScB32KORyGyOVEnVV0=;
        b=ItloNMrGHvbKzHK+ROuWYSm4Ec2J9JSmSnUFAyOL8ywvDXG981LIE46Z/hKUAQVM/A
         Pi+rxmG7pgM05VDKt4OtVkUGc3J8SWxIgWBQoUle7zbD0ZEB5Pbnd3ihLbuLSdWOgTDn
         NmKWy+tiMjlEE+aA1K/BF0J5ZX+byvtpOHpfXAMnQeIuUWTvt5J+A9MGSZ0Nk3Jo6aqw
         pkrtpg0EJRwKhpMmMlhFMgSJ2ycZDs6nGFgqDbc3LdgV0ZXWRp0DoZL5kieH+WGD2v2V
         z55G3HADnz+GuLenoDvTLZg6+xpwBIvluXLEJoiUqvcf/bLsvQ0A3irmyJcZ1qKNXZih
         43Tg==
X-Gm-Message-State: AOAM5326Sx/r9t447OscfGgAjBPyKvtzCZ/QSw+5uklRQ8nC6WMqj5ec
        nqkJa2TS0mV1nlW+Tw7DUB8h
X-Google-Smtp-Source: ABdhPJyfzQ0WJsrQK/rFzYMTCG1Uhe7fsH1p3wH4H0HACtztkBqMci7IerPbXoTYEVmG0P5u2SwtkQ==
X-Received: by 2002:a17:902:b203:b029:dc:973:3ad0 with SMTP id t3-20020a170902b203b02900dc09733ad0mr76213782plr.44.1609849659228;
        Tue, 05 Jan 2021 04:27:39 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:38 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 13/18] ARM: dts: qcom: sdx55: Add spmi node
Date:   Tue,  5 Jan 2021 17:56:44 +0530
Message-Id: <20210105122649.13581-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds SPMI node to SDX55 dts.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 1a6947753972..f3864471ba4c 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -226,6 +226,25 @@ pdc: interrupt-controller@b210000 {
 			interrupt-controller;
 		};
 
+		spmi_bus: qcom,spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0c440000 0x0000d00>,
+			      <0x0c600000 0x2000000>,
+			      <0x0e600000 0x0100000>,
+			      <0x0e700000 0x00a0000>,
+			      <0x0c40a000 0x0000700>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sdx55-pinctrl";
 			reg = <0xf100000 0x300000>;
-- 
2.25.1

