Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945794479B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 06:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbhKHFIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 00:08:51 -0500
Received: from mx1.riseup.net ([198.252.153.129]:34818 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231238AbhKHFIu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 00:08:50 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnfG56w55zF2Hd;
        Sun,  7 Nov 2021 21:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636347966; bh=Tb9BXhWjM8ETEr9rbF//OKUG6q3GkHqxrZkAdfraSgU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EVJef3BjMX85NLaJnpavwZ36fN19nTi+pumLR6OtGnQsAlRan5cx3ukS0+tkZhxs4
         D9L3NVFz2eMaEUCNAW8tRQ2DUrx25lRdMz11nKV1hZwdEJoQD3lC0XQB4Znv3pP/5W
         gH5IybqPv41djUrQ7OodffDfUqRi4nWyk4G85CTo=
X-Riseup-User-ID: 9AE33FBEF1815754132AFF61DA6028071E609353EB7373F4C84C48852C10E225
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnfG243q5z5vj2;
        Sun,  7 Nov 2021 21:06:02 -0800 (PST)
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
Subject: [PATCH v2 1/7] arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
Date:   Mon,  8 Nov 2021 12:03:30 +0700
Message-Id: <20211108050336.3404559-2-danct12@riseup.net>
In-Reply-To: <20211108050336.3404559-1-danct12@riseup.net>
References: <20211108050336.3404559-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes eMMC/SD device number consistent.

Reviewed-by: Martin Botka <martin.botka@somainline.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 3e0165bb61c5..b75bb87ed290 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -19,6 +19,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc1 = &sdhc_1;
+		mmc2 = &sdhc_2;
+	};
+
 	chosen { };
 
 	clocks {
-- 
2.33.1

