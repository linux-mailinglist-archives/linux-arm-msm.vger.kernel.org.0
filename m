Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385A120A47B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407053AbgFYSN1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407048AbgFYSN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:26 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA10C08C5C1;
        Thu, 25 Jun 2020 11:13:26 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id b15so4932878edy.7;
        Thu, 25 Jun 2020 11:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yupj3iS3btyA2wZn0fmMTSkqzEVTX0a/axIV1WItg/k=;
        b=Dj73FoZVKxdm1g69pVvz98txhJShOUZ+RgO3PE8PmnfXFN1db4+hA0yIu5qjkOo68k
         tljiL1MdmsGNW71Bx9ryFPvz9aPBXGsAmn9MK0PYT+dQArwmXOPa/DnRLO3cn3dznmkq
         lpk8HxP2W9Nyg6qgvrJR9h7GPBWza5Xn+6FJtg+T+MUdaZdIlt5F6RuhVsez5rN5Ljya
         gMLBlMMSD5LCh9+WriwRcrxwbIj5qBMCkUvW5JLx16wwR4IRMi4XclH6yk0shG0cFA82
         UyH+Wx/skzLpleB6Fj4Aj7Kpzv5y5RVlgbNdwExg9QcVzPogzS+sEMzrUG9WLEePL1vq
         /twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yupj3iS3btyA2wZn0fmMTSkqzEVTX0a/axIV1WItg/k=;
        b=W7KxqceJUm1MJaM8cnXgag4nMsrZFUmzjp3T/GCtj3QRW8lE9ljVO6qJFApn5qtuAB
         r6xgYVWme/is2X44lPEx65ZIkQbwkfzfkP6o8gYXMYeuT2j+DjfSzGjd2bvpxS8pMNDa
         G2F6OVQZ6TrO0YGV+7uURANlj8o1JWfHepWz7LumFA52KEcLgpA9Ap6MW0cZqHbEYa5w
         DjHTPiWtMH8LLaebLo36wYZFu9+v2S0QkDCnNjNdbQ0choEphcCpaiWefbOGNVDMVtlv
         sRe+NgAJ34coiWRXE4khDLuJuqxE66ce0nckOLpYg4QiFxt6vgNTacSaJpK8mMd2/1dt
         dXiA==
X-Gm-Message-State: AOAM532fsUeE3yHIv4f79ZkyCHrVbbxHfamCQMjD6VlaR0ekLI9N+p3Z
        6Xorl4pP2T355PSEUnodXdM=
X-Google-Smtp-Source: ABdhPJxYXDfFaN1fDqyjyqU9RIfTFOKukKEWb++irF4nI8dvShJy1z6Eac0gO4gpUoXHvDNFSPntyQ==
X-Received: by 2002:a50:cd53:: with SMTP id d19mr14489420edj.300.1593108804924;
        Thu, 25 Jun 2020 11:13:24 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:24 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] arm64: dts: qcom: msm8994: Add SPMI PMIC arbiter device
Date:   Thu, 25 Jun 2020 20:12:55 +0200
Message-Id: <20200625181303.129874-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SPMI PMIC arbiter device to communicate with PMICs
attached to SPMI bus.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index aee33ed61858..acce7be22e50 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -290,6 +290,22 @@ restart@fc4ab000 {
 			reg = <0xfc4ab000 0x4>;
 		};
 
+		spmi_bus: spmi@fc4c0000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0xfc4cf000 0x1000>,
+			      <0xfc4cb000 0x1000>,
+			      <0xfc4ca000 0x1000>;
+			reg-names = "core", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
 		sfpb_mutex_regs: syscon@fd484000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.27.0

