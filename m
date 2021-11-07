Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A7B447575
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 21:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhKGUIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 15:08:06 -0500
Received: from mx1.riseup.net ([198.252.153.129]:34618 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhKGUIF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 15:08:05 -0500
X-Greylist: delayed 582 seconds by postgrey-1.27 at vger.kernel.org; Sun, 07 Nov 2021 15:08:04 EST
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnQ393zPSzDyS6;
        Sun,  7 Nov 2021 11:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636314949; bh=EvJNkWC7WStqzP8043NR3jmhKI30lKemFklLBeyCM64=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zyzq5ZkRMswtDzA4nsAiWrA+gnEq/E5U/caDFLVm8/O9mecYHtDZ3QAh9oiishjLm
         ua2njmfhMTD95EdzZE5L61lMFPe5wG+q7r4QG8x7RlHWbRJNTQcmnqBq94cXdifunE
         aNKgrFUL6i/eNRAeCd/GGlM614Bct0Ii2IWWHISQ=
X-Riseup-User-ID: 3CA882FE7982556A9D09C0A87ED279012AC4F6407DAFCB8E8B35535ACC62BECE
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnQ363b9mz5vj2;
        Sun,  7 Nov 2021 11:55:46 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Subject: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume down button
Date:   Mon,  8 Nov 2021 02:55:07 +0700
Message-Id: <20211107195511.3346734-4-danct12@riseup.net>
In-Reply-To: <20211107195511.3346734-1-danct12@riseup.net>
References: <20211107195511.3346734-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the volume down key.

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

