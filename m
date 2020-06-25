Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D31520A4D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390712AbgFYSVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389648AbgFYSVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:42 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2C2C08C5DD;
        Thu, 25 Jun 2020 11:21:42 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dr13so6899864ejc.3;
        Thu, 25 Jun 2020 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yupj3iS3btyA2wZn0fmMTSkqzEVTX0a/axIV1WItg/k=;
        b=OQkOdBYV4hebeU5uEm1XpL7kx4xOFKteMmmJsWVY95CsisG0LCb0nokfsWs1O1yDIF
         F4wL/YFLnGbTmFYGKoqQGEQuJPa56CGYWvthwErBej6c722+ZrqenmDn1+NHadI5bks1
         R5SCCtVGKgtUhZIHGxmwBTHnry0q7Zy5C/GoiybTH+Suscii++SH7qk2xfBFOpNTNTcs
         TiYV7oaLylBKRjtZtTuFhC0sbgvdr4OZ6dAuLYwrZqGaOWwqCoyRQagQ2qmqQ6AYSdQS
         HOZfoS2DlxO0VRA8VXho5uppu5sYj48hD52K8OspPB2G2PU1jhgPx6RO6gDAjgzmtesP
         XBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yupj3iS3btyA2wZn0fmMTSkqzEVTX0a/axIV1WItg/k=;
        b=MuGZQ0YiJtqYKGDZColil8WP+eG2VIlL+DPp53I0dgCNOJAPYXwd5N/cP8jGDmPWvp
         j3Ka7CfH8jvoXNkxdG1AlR+ANCD/Gv2a3u58x1lPv4oEFU6oc5It13VZaWxmDN1laj8l
         PguN0S9du3n5Q2ak1juDOkALZz1pmu/L7VCNbJyA3W4T2TCcikfCVUq+kMSKb9XAsiNH
         cYsRquLI4v1V6BhT69Zd9YZiVR2MjRTc09DoqZY2ZkTxW62rp6EEXehsqtu2cYF2GhmU
         K6PxpAiUWmXc0cGhLvTKK1axkRlou2sc5+memUusmafnloIetWefMup5MCOSAFTckB0X
         I/Tw==
X-Gm-Message-State: AOAM530oznwJkf4x3rz0aqEbke5OBxpsfF8E3cQJzFypPPHxc3HNoIg0
        qnxbl+zYd3tLQOUQKkceEMs=
X-Google-Smtp-Source: ABdhPJzw2zYBphfNPvy208IquABAp7cP1b1jllZGFHZ7pI8TiV8RVqfTcecfRvJByfEZWyYGPKdJFA==
X-Received: by 2002:a17:906:2c43:: with SMTP id f3mr6324680ejh.38.1593109300833;
        Thu, 25 Jun 2020 11:21:40 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:40 -0700 (PDT)
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
Subject: [PATCH v3 07/13] arm64: dts: qcom: msm8992: Add SPMI PMIC arbiter device
Date:   Thu, 25 Jun 2020 20:21:11 +0200
Message-Id: <20200625182118.131476-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
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

