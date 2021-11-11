Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9804F44D049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 04:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbhKKDU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 22:20:29 -0500
Received: from mx1.riseup.net ([198.252.153.129]:56402 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232783AbhKKDU0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 22:20:26 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HqRjY0NHzzF4mY;
        Wed, 10 Nov 2021 19:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636600657; bh=8TauUxZkiNg5ppZozh5OULeODk29ED0rFMX86FlIqf0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KpJeXd0LIC8oZPhQqnc50hc9GCpWhJrX+JJ3zfLLEgFeOvW/vh5olmO60aO4XGsZ8
         6o1HCZzMGAmIjHd9N0IubtxBYF1CFqpAEGUBTdjiWM+NqEi0KydRFcWj8suI8FYgwg
         avCtVNwgHshUa6So1uO245yb2jfchvU+rVEsOy3Q=
X-Riseup-User-ID: CCCA4FE7A3D4480E008B516950091965B64F715DC42B61FD00C1F9D47186F5C5
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HqRjT72jrz5vVT;
        Wed, 10 Nov 2021 19:17:33 -0800 (PST)
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
Subject: [PATCH v3 4/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add PWRKEY and RESIN
Date:   Thu, 11 Nov 2021 10:16:31 +0700
Message-Id: <20211111031635.3839947-5-danct12@riseup.net>
In-Reply-To: <20211111031635.3839947-1-danct12@riseup.net>
References: <20211111031635.3839947-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the volume down key as well as the power button.

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by: Martin Botka <martin.botka@somainline.org>
Reviewed-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index a6e3062dd520..729b71407c36 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -53,6 +53,16 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
 &rpm_requests {
 	pm660l-regulators {
 		compatible = "qcom,rpm-pm660l-regulators";
-- 
2.33.1

