Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFAD458094
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237259AbhKTVqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:46:17 -0500
Received: from mx1.riseup.net ([198.252.153.129]:35072 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236757AbhKTVqO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:46:14 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HxRq22wK7zDxdG;
        Sat, 20 Nov 2021 13:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637444590; bh=WzkZEcD5avE32e0su8uiWwZNX6ahY7VDSnX4dX0g7U0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T0XrAfJOnBfFqCcARwCt/iwyAkwue807mqyMBneKp1KW3IP6Y/RqnielgyBeQXksd
         WYKGyj+usWMn9PiThRrQIAz5j+gJEbiN6BLoA3S1UL21wS3+HlVkRiwMB3e9rZyYfx
         3zzUwOv36aukfoeIKCBFnmykwoWMQmm9xZZWUIhw=
X-Riseup-User-ID: 38C260EA064F2808479180D3F9FE42A45A8678165BE6A6C8E291158A89D10926
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HxRpz0MF8z5vkF;
        Sat, 20 Nov 2021 13:43:06 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 7/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
Date:   Sun, 21 Nov 2021 04:42:26 +0700
Message-Id: <20211120214227.779742-8-danct12@riseup.net>
In-Reply-To: <20211120214227.779742-1-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This lets the user sees the framebuffer console.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index d30cdc6c160a..45e58714af71 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -22,7 +22,20 @@ aliases {
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
@@ -60,6 +73,11 @@ ramoops@a0000000 {
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

