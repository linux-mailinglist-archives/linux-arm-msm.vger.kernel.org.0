Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1234479BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 06:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237640AbhKHFJN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 00:09:13 -0500
Received: from mx1.riseup.net ([198.252.153.129]:49040 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237622AbhKHFJE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 00:09:04 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnfGN35fKzF43l;
        Sun,  7 Nov 2021 21:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636347980; bh=rq6wlb+rwlCGlsNlbNPlJC7Dd9i447YFd/T7vPgDiCw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VXfHvL234SZ2VankqbBdk/7wJLMAIj7xacM8AAz1S4JHrGOByDQqfM7aOMv+RAXCI
         YK1M1Uwpk5DZZrBUQNWh7bFz4DAjqfVb2PRBmIIWvX/RdolUd7y8pwezqGoHB/Uzod
         WuKEUzsOfc0aA20+mndaxRqEzeeJHm42ksuLH/78=
X-Riseup-User-ID: AC3783CCB4B5A571438A1ED7EEA85EDD00F54B255541A44BE900D85461F8280D
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnfGK14tlz5vj2;
        Sun,  7 Nov 2021 21:06:16 -0800 (PST)
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
Subject: [PATCH v2 5/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
Date:   Mon,  8 Nov 2021 12:03:34 +0700
Message-Id: <20211108050336.3404559-6-danct12@riseup.net>
In-Reply-To: <20211108050336.3404559-1-danct12@riseup.net>
References: <20211108050336.3404559-1-danct12@riseup.net>
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
index ab814dc8a875..8fd4d1732d94 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -362,6 +362,25 @@ vreg_l19a_3p3: l19 {
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

