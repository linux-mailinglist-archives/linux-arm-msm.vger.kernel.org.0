Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0370444D041
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 04:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhKKDUS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 22:20:18 -0500
Received: from mx1.riseup.net ([198.252.153.129]:49936 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232001AbhKKDUQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 22:20:16 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HqRjL5yPRzF4mW;
        Wed, 10 Nov 2021 19:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636600647; bh=Tb9BXhWjM8ETEr9rbF//OKUG6q3GkHqxrZkAdfraSgU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lOspmUKOKb4TgfVoHJfotckRvFbtbX8bPWkUN33uWcUxlDZ+2NPEwnjtGLFRAwBSR
         1jMOB+bMJp9z+iEl7ze86bedf4gdtPaHhTJ6ErmCAW+kSxcTZOWv4YaeWfwVPJpUQ5
         A1qx8Hfm/bXYL3qR1KfDXQcx2z/GwpJ7IKcwSF6c=
X-Riseup-User-ID: 7AED29257AFD94FB1930A1A0AEC5A228E2C0E4FD3AABC1EF80977A3FD538E06E
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HqRjH4qKYz5vVT;
        Wed, 10 Nov 2021 19:17:23 -0800 (PST)
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
Subject: [PATCH v3 1/8] arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
Date:   Thu, 11 Nov 2021 10:16:28 +0700
Message-Id: <20211111031635.3839947-2-danct12@riseup.net>
In-Reply-To: <20211111031635.3839947-1-danct12@riseup.net>
References: <20211111031635.3839947-1-danct12@riseup.net>
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

