Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677C44479B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 06:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237636AbhKHFJK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 00:09:10 -0500
Received: from mx1.riseup.net ([198.252.153.129]:42314 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231947AbhKHFI5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 00:08:57 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnfGF14QPzF3K9;
        Sun,  7 Nov 2021 21:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636347973; bh=Bc10+pHBcFMLLVxlXuOSikB0TKg9+cWYR/znkPfiBU4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C2rDVBK++G+kEVXaIqoAg1iB50DUgYV5CVCPp/nqAlCAA0rO+jf38tQMGja4i8mfv
         yB+DKNkUG3VSPa+0J/ry15aq0hpClXDYnk5OxgQdOnpqDSwJl6C4pKnF3uuC8JC4k/
         esuzWpYwIJUl/5hwZC+eUz+Awuzpn/3Q6tW5WMmE=
X-Riseup-User-ID: 10E61440B16203EEFCA1E22B595C6255A6334DD061B45B45BD2DFE572E3957D3
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnfG96Gd0z5vj2;
        Sun,  7 Nov 2021 21:06:09 -0800 (PST)
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
Subject: [PATCH v2 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume down button
Date:   Mon,  8 Nov 2021 12:03:32 +0700
Message-Id: <20211108050336.3404559-4-danct12@riseup.net>
In-Reply-To: <20211108050336.3404559-1-danct12@riseup.net>
References: <20211108050336.3404559-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the volume down key.

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by: Martin Botka <martin.botka@somainline.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 365a03b56cde..28408240735b 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -51,6 +51,16 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&pon {
+	voldown {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		bias-pull-up;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
+};
+
 &rpm_requests {
 	pm660l-regulators {
 		compatible = "qcom,rpm-pm660l-regulators";
-- 
2.33.1

