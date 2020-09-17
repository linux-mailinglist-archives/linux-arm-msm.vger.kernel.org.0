Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1590326D676
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 10:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgIQI0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 04:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgIQI0l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 04:26:41 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45942C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 01:26:41 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x18so740031pll.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 01:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Oi8lbN5PJDRQE+iSBWgwU9oDc6wIuFWvYfEWRaH/5pI=;
        b=M9H5ftN4oUtIuuJDpSKHEGjzTr2hAZfkTMzi1TYBt5HhoiYhKLQdpODJqOWZGu7KPO
         Qfh5YBhZ+xCfhBsQq0Z4wl+T3e4zywr675DlkDjpNs8/KUhYhYVMIv8n0wEU0V4kmaGX
         p+uDT85RvLumaoRSR+CjQaxLsoBPVcSjraQgWeSCWTgeHmKIgwTF/a0WQHwFzNOIN3Yq
         nmpaLDAEt63oFVY8dGVgOEzDP0GzqtXR9yIL4ic9Rs2tC3RWLdjU/dDhJi3kDOjPFvGH
         bqv3Lx3mTYbKoyKhMIoFqQBFeEC6QS8+cTQTGHo6Dx8TMnVB1i+aFGf8EYtJt+QEAssN
         KWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Oi8lbN5PJDRQE+iSBWgwU9oDc6wIuFWvYfEWRaH/5pI=;
        b=Orf2slXaJjQzJYvPP7xYrV2zHoZD/BbD4vcOAtgql2DVpQdOKAiC83xcC8jMjZjDx1
         DpW8hEjA0F8PRGfevEiKt+zuB9iNu+B67z+IsWfLET985o5C4MBL9zIyatlgz+LEncad
         Pl0Fo/i+wRDW/FLb3IBRKsiOk1AOlnZeNOpug2kRRlaPCcVE7QhHSLSJH+5oimMVNoYa
         Jlgm8b8Px4sUToUfPom3APisTGP/YPyYN+gNHO1lDgKtpo21iYKA6EahYFxgAW1AkGkP
         IpHwuKsMUQCDVKtxGfNt1n4t4rrtAzpkR0yQrOxwUHr++tknz3V/0s5UCDGFQlvyONKf
         gl/Q==
X-Gm-Message-State: AOAM530C1CcvSNPhHryme6WIsQAVen6blmYElxe2n3DCvuhz5EM00cLx
        tknwcT1vUfq36updJbtwawA4
X-Google-Smtp-Source: ABdhPJxyAvFUcLLGLA+PHHamxiaJgNx9inQLxxyB39a/BJ6NeF3R8QCWDEDUgz3MUXumpKfbrCmZHQ==
X-Received: by 2002:a17:90a:160f:: with SMTP id n15mr7325454pja.75.1600331200762;
        Thu, 17 Sep 2020 01:26:40 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id g129sm8233194pfb.9.2020.09.17.01.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:26:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: qrb5165-rb5: Add USB support
Date:   Thu, 17 Sep 2020 13:56:22 +0530
Message-Id: <20200917082622.6823-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917082622.6823-1-manivannan.sadhasivam@linaro.org>
References: <20200917082622.6823-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RB5 makes use of the two USB controllers onboard. USB0 is connected
to the Type C port and USB1 is connected to USB3.1 HUB which exposes
following downstream ports:

* 2 Type A ports
* 2 HS/SS ports on the expansion connector
* USB to LAN device

Hence, enable these two controllers with the required PHYs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 1528a865f1f8..e020013c1add 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -684,3 +684,49 @@
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 	vdda-pll-max-microamp = <18800>;
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l9a_1p2>;
+	vdda-pll-supply = <&vreg_l18a_0p92>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l9a_1p2>;
+	vdda-pll-supply = <&vreg_l18a_0p92>;
+};
-- 
2.17.1

