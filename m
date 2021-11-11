Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC3344D052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 04:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbhKKDUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 22:20:42 -0500
Received: from mx1.riseup.net ([198.252.153.129]:37566 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232911AbhKKDUh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 22:20:37 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HqRjl2syLzF4mW;
        Wed, 10 Nov 2021 19:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636600667; bh=I/aKdEnoiBFbiFzC2dEs2OH2kvICILIFbb+XDL8pUHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nZZ7VLgnykRgh4S50VhSKAt9CVwuhObHR/dDmw8+hfO7tgHKAS+/oCykBQExuJoP3
         CoSXT6EawePVthZZZbEGvC3oqbcYMt3bYUKZ7KhPo67u/mNauUXX+oxpBsQMC9jB5A
         L78CvgQ0jwg1VyS3QQZGizLmPemWYbyI2z0PD7xI=
X-Riseup-User-ID: 0F508C3F93D0092647A4B9EA47CE91A5387A82371067F7314AEF16A127F36FBA
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HqRjh24Cjz5vVT;
        Wed, 10 Nov 2021 19:17:44 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: [PATCH v3 7/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
Date:   Thu, 11 Nov 2021 10:16:34 +0700
Message-Id: <20211111031635.3839947-8-danct12@riseup.net>
In-Reply-To: <20211111031635.3839947-1-danct12@riseup.net>
References: <20211111031635.3839947-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This lets the user sees the framebuffer console.

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by: Martin Botka <martin.botka@somainline.org>
Reviewed-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 8de3e111f427..712392545c2e 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -23,7 +23,20 @@ aliases {
 	};
 
 	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
 		stdout-path = "serial0:115200n8";
+
+		framebuffer0: framebuffer@9d400000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x9d400000 0 (1080 * 2340 * 4)>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
 	};
 
 	vph_pwr: vph-pwr-regulator {
@@ -61,6 +74,11 @@ ramoops@a0000000 {
 			ftrace-size = <0x0>;
 			pmsg-size = <0x20000>;
 		};
+
+		framebuffer_mem: memory@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x23ff000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.33.1

