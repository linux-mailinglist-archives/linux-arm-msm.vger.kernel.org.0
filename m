Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F4144D050
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 04:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbhKKDUk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 22:20:40 -0500
Received: from mx1.riseup.net ([198.252.153.129]:34124 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233306AbhKKDUd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 22:20:33 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HqRjg6ZrQzDyKY;
        Wed, 10 Nov 2021 19:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636600664; bh=TTY9e8+tLz6bAHkA4/m+3pQrSMljSr4gAxpZh5sUHtY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FceAHeKMZyy5c29Tn1d49miIHqoEWifvJvyxnUmOn4salsYyzzJ6evZqC2reSZMO/
         Z0ZX35V6aEk5608Nyykn0fLUrzxKtIC1cdm1QMwCOnaxwwsbEpGuwQ5JTUxlTClEQl
         65Z/dIQAvOVSj5EWXFmxeQBRfQNviiKcGA1Fjhw0=
X-Riseup-User-ID: F51ED192DB77A9AA1626900D723A59EF81DFEDF932FD0004E1F940A4E518E09A
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HqRjc60hYz5vVT;
        Wed, 10 Nov 2021 19:17:40 -0800 (PST)
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
Subject: [PATCH v3 6/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
Date:   Thu, 11 Nov 2021 10:16:33 +0700
Message-Id: <20211111031635.3839947-7-danct12@riseup.net>
In-Reply-To: <20211111031635.3839947-1-danct12@riseup.net>
References: <20211111031635.3839947-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit enable the SD card slot and internal MMC.

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 456562cb6028..8de3e111f427 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -361,6 +361,25 @@ vreg_l19a_3p3: l19 {
 	};
 };
 
+&sdhc_1 {
+	status = "okay";
+	supports-cqe;
+
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+
+	vmmc-supply = <&vreg_l4b_2p95>;
+	vqmmc-supply = <&vreg_l8a_1p8>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	vmmc-supply = <&vreg_l5b_2p95>;
+	vqmmc-supply = <&vreg_l2b_2p95>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <8 4>;
 };
-- 
2.33.1

