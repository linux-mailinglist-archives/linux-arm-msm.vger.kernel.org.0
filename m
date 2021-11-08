Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 314044479BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 06:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237633AbhKHFJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 00:09:20 -0500
Received: from mx1.riseup.net ([198.252.153.129]:51784 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237591AbhKHFJN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 00:09:13 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnfGS0X77zDyXD;
        Sun,  7 Nov 2021 21:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636347984; bh=K5vDMa0Ne6mTpxBaAxuZyyGfLLkx3Tc6wlKfMsZa1U4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XSGGKqpl6b8KTAQz6QEc2hvQaCKsKh5FqSUhGTtlfYzQflQZ+5rnSMFhNZPX6p/NC
         IcXc9VLzk4nuW2Y6v/kZ4XmH/EGLrFHCHr88pN/oqFjiQU+wQ51OLZwNx5vnRTrECW
         R3CQ5boDGLSHKjNhpgaWcDXdi+3/3z5aI2BozsCw=
X-Riseup-User-ID: 1899880FAC68F45CD3A6AF87F87BA411A9EE06C59302762C6587E83DAEB5C927
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnfGN5cWvz5vj2;
        Sun,  7 Nov 2021 21:06:20 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org,
        Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v2 6/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
Date:   Mon,  8 Nov 2021 12:03:35 +0700
Message-Id: <20211108050336.3404559-7-danct12@riseup.net>
In-Reply-To: <20211108050336.3404559-1-danct12@riseup.net>
References: <20211108050336.3404559-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This lets the user sees the framebuffer console.

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by: Martin Botka <martin.botka@somainline.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 8fd4d1732d94..122b487f197b 100644
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
@@ -62,6 +76,11 @@ ramoops@a0000000 {
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

