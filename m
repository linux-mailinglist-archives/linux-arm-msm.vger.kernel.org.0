Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A390269F64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgIOHNd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:33 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:16916 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgIOHN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153983;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=vkwRvM5H2pDc2vz6rEAge5LXIDGnjljGTT9YCUGZT4E=;
        b=GMPK3UstZsuHns87L6ADxsMyzWDQLYgk3iNcAVOcDPRJBn3mLw4ANe2jC9PEqz7CIV
        ojuXtlWttmK1gI3ohiJ2HHA1oAnFUOeATkBjkOigGE/jiwvnv826snIBQg4NkDhe3A6r
        TRvyiuFkcU2r3mnQHgVuVa2oOwaQZ1A166Ff4JChMatOdRkAE4shLcOT4BvrL1n0E0Ki
        TJV3ABK2F6LkwCZiy0z04POBYQQiScLV3uasEJ7XMnnvh8iuI79fO9gcYiCDfq6d1RCp
        73/+offdTpujGIsGLYuIQaWYIG9D0e0RPzDsD2C85cO/iizGMe9PnLPoG4pMJJcFZWuO
        u2jA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7D1rdv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:13:01 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 08/14] arm64: dts: qcom: msm8916: Add MSM8916-specific compatibles to SCM/MSS
Date:   Tue, 15 Sep 2020 09:12:15 +0200
Message-Id: <20200915071221.72895-9-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Over the time, the SCM and MSS driver were refactored to use
SoC-specific compatibles. While the generic compatibles still work
correctly, add the MSM8916-specific compatibles so they are actually
used somewhere.

For SCM this will ensure that we actually manage to obtain all
three of the specified clocks, since those are required on MSM8916.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index eca3cd94d3d5..b2669643a12d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -392,7 +392,7 @@ smem {
 
 	firmware {
 		scm: scm {
-			compatible = "qcom,scm";
+			compatible = "qcom,scm-msm8916", "qcom,scm";
 			clocks = <&gcc GCC_CRYPTO_CLK>,
 				 <&gcc GCC_CRYPTO_AXI_CLK>,
 				 <&gcc GCC_CRYPTO_AHB_CLK>;
@@ -1162,7 +1162,7 @@ dsi_phy0: dsi-phy@1a98300 {
 		};
 
 		mpss: hexagon@4080000 {
-			compatible = "qcom,q6v5-pil";
+			compatible = "qcom,msm8916-mss-pil", "qcom,q6v5-pil";
 			reg = <0x04080000 0x100>,
 			      <0x04020000 0x040>;
 
-- 
2.28.0

