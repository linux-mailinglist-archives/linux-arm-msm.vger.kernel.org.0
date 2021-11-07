Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D213444757A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 21:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbhKGUII (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 15:08:08 -0500
Received: from mx1.riseup.net ([198.252.153.129]:37442 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236387AbhKGUIH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 15:08:07 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnQ3M60JbzF3gL;
        Sun,  7 Nov 2021 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636314959; bh=ddEC6H45Hu/66fHyjU3jKy0aj4quwFprpB3NaYBSfw4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bSTwb8ZwBIHlxZoUUiIlyBfDTsxKSalSD8ibIVLMxxFqPPqFsPZSyW+UT0hSXzn8d
         T8fi/sR1X2y7PAp//uAjaYSZRNa9UrFDBD3TuiujGLZA05QPKnxch/D6sClxF+IMHO
         HxvmvdkXQWg5wAbBOucIp2SXtyeFIbNHmrzo2Gl4=
X-Riseup-User-ID: 75FA984DF7A6379CF0BF32107ABA5ED5580AAEA0763DF99F2B92FAA1DAFAF5B1
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnQ3J5Vxhz5vj2;
        Sun,  7 Nov 2021 11:55:56 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Subject: [PATCH 6/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
Date:   Mon,  8 Nov 2021 02:55:10 +0700
Message-Id: <20211107195511.3346734-7-danct12@riseup.net>
In-Reply-To: <20211107195511.3346734-1-danct12@riseup.net>
References: <20211107195511.3346734-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This lets the user sees the framebuffer console.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 30e564927cd7..d6599881f1ac 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -23,7 +23,21 @@ aliases {
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
+			status= "okay";
+		};
 	};
 
 	vph_pwr: vph-pwr-regulator {
@@ -64,6 +78,11 @@ ramoops@a0000000 {
 			ftrace-size = <0x0>;
 			pmsg-size = <0x20000>;
 		};
+
+		cont_splash_mem: cont-splash-region@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x23ff000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.33.1

