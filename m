Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E3D447572
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 21:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236390AbhKGUIF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 15:08:05 -0500
Received: from mx1.riseup.net ([198.252.153.129]:34688 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236381AbhKGUIF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 15:08:05 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnQ325Yr3zDyXD;
        Sun,  7 Nov 2021 11:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636314942; bh=Zok29VGxLNbCS2SSOfCqSks7d0rR86LWsOTAyuVRHE4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nZoI5M+MJXYGLEeTGUxeF3O856MGXX5tlA5nfBJTKmOTrd2RJlvqLp9o2AziEoi5B
         UybxVVCN9brm04WNUAp/ZHp30MJWxX69eBjKPBRx08+JuXu3rej1xf0WdiYP6soX+N
         iyL3pnhZucQ2cTsqeAjIjj+phYiUIRHEYKX6IS7s=
X-Riseup-User-ID: 77F8FC23B2FEF10E81837EA7EBDDE1057B514602D2BCBEF68C901B1AD7F827C2
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnQ2z4N2wz5vj2;
        Sun,  7 Nov 2021 11:55:39 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Subject: [PATCH 1/7] arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
Date:   Mon,  8 Nov 2021 02:55:05 +0700
Message-Id: <20211107195511.3346734-2-danct12@riseup.net>
In-Reply-To: <20211107195511.3346734-1-danct12@riseup.net>
References: <20211107195511.3346734-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes eMMC/SD device number consistent.

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

