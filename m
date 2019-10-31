Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21D68EB7A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbfJaS6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:58:12 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42136 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729317AbfJaS6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:58:12 -0400
Received: by mail-pl1-f195.google.com with SMTP id j12so1143957plt.9;
        Thu, 31 Oct 2019 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g44ZD74TUZ7KzjCPRGfZgsLxhbY0OttrjL0keUiMuBU=;
        b=ITWE8t9WxqmLqjli294CA1/i0ioCxLI9TD6JyHcThxGeIR0Ea3+rFoeB0qRn1uzN98
         gXvCPGv+o9il3+EgajJ394+gUpjY2DMu7Zn1Cbcs0yZnndSObR5hVVKWPc6itscTVwMz
         TkiufB9Nd4iDR+II7N0AdNBEVH2CE7F+2EcD1Kv7Dki2rnAmXAQhZyvHDMfcaq3XnB+Y
         JFAROMTMwV1nVwCDlJ1BHSBHggwqD1h/sjiQb7CkSTpqfKA6+FKg6miLZffD7d4PGjps
         WFKi6XyAOw5d5gEw5S6Fx3aoVL4Gav+siCMo27+Othb4smtAsfg6ArzUz9H988NeSaRl
         /JLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g44ZD74TUZ7KzjCPRGfZgsLxhbY0OttrjL0keUiMuBU=;
        b=I5nEXsS8mQvDK4yHs++JyaKQvp5ucVnVXnlbtfkzjEziKEQg2sDMWKW0QONC8JKuJm
         MMPwxz6o4fYqEqi8lys/rGs6EGOz/g3eWDYLx2MBbrNZ0CdAfOYN/cf+g76cG8TxqCAQ
         K1VnnC4lsNFV8rMQoOzWRsYz4AdJ303tmnRQOqa2tsazFcwECK+vzozX4rlw2sEBmaIr
         0biMozX5uDAZtA+dZm9DBazyTBr0BvMuhP4/N/7Uq5+pImaTB+4nVDsI9MbpjbtVpvTH
         mDEg3CaWmydpqlwNrj9zwuoAfA/I5O4lCRJF3knsDSSVFWJkvKm/ORbr6+dGeaBhHQSC
         tDzA==
X-Gm-Message-State: APjAAAW4LC3BTIT1l91/h1tf3c/z2yEslM3oLIJMVxX1iFnRissWdk3D
        vLvfkEdah+gS7TXaC/BqVds=
X-Google-Smtp-Source: APXvYqzSTeVFCOXIhq/1Bm0UwakTN0YmPqM+wdFeWRnm9mET9r+56fPshH4KYjlvYcoJgzl+ZMEGiA==
X-Received: by 2002:a17:902:14f:: with SMTP id 73mr8133684plb.87.1572548291257;
        Thu, 31 Oct 2019 11:58:11 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 127sm4902942pfw.6.2019.10.31.11.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 11:58:10 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     agross@kernel.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: msm8998: Add gpucc node
Date:   Thu, 31 Oct 2019 11:58:06 -0700
Message-Id: <20191031185806.15602-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com>
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8998 GPU Clock Controller DT node.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 6e7bddd1e0fc..a4d9b792eb6e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+#include <dt-bindings/clock/qcom,gpucc-msm8998.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1000,6 +1001,19 @@
 			#interrupt-cells = <0x2>;
 		};
 
+		gpucc: clock-controller@5065000 {
+			compatible = "qcom,msm8998-gpucc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x05065000 0x9000>;
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GPLL0_OUT_MAIN>;
+			clock-names = "xo",
+				      "gpll0";
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x06002000 0x1000>,
-- 
2.17.1

