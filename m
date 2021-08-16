Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7827D3EDCFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 20:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhHPSTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 14:19:05 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:35237 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhHPSTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 14:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629137909;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=AznCJfz7pjBHUHNAOFyh/I2e/Tpk12We1aGuUn7suH4=;
    b=onJdTRlLdeKk+2DpnCgeIPCQebq0lVsajM+3Cj0VUwhGIQEcFpSrBCGzflVLPNWnIK
    r55mFn7gw3KmuA6p2BEd9EvMcv8dsriYpp/auR8tiqyxvHxQEFXjjnO7iBfP9QQXURoF
    yOq0EomW/qOGZep+ACn0hMeGQ/1TcF3NamyWeGpdqNg2T0lQJH315Tq0ZgB0eTFpNxej
    j5BfKbXpfV96HvkOB5YJ/xMklm4y/MioVoXSkNbN5iGtmz0hJ672vzAbC7CSZqA8eaED
    Clg2LIAnL/VMxM7axBnN5SghkYkJBIMpLCOwKYd581hsyAoQVT6rG71kVQvNhBWuiFif
    +tSA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr1eFSKSfA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id L01e9cx7GIIS3vJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 16 Aug 2021 20:18:28 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>
Subject: [PATCH] arm64: dts: qcom: msm8916: Fix Secondary MI2S bit clock
Date:   Mon, 16 Aug 2021 20:18:10 +0200
Message-Id: <20210816181810.2242-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At the moment, playing audio on Secondary MI2S will just end up getting
stuck, without actually playing any audio. This happens because the wrong
bit clock is configured when playing audio on Secondary MI2S.

The PRI_I2S_CLK (better name: SPKR_I2S_CLK) is used by the SPKR audio mux
block that provides both Primary and Secondary MI2S.

The SEC_I2S_CLK (better name: MIC_I2S_CLK) is used by the MIC audio mux
block that provides Tertiary MI2S. Quaternary MI2S is also part of the
MIC audio mux but has its own clock (AUX_I2S_CLK).

This means that (quite confusingly) the SEC_I2S_CLK is not actually
used for Secondary MI2S as the name would suggest. Secondary MI2S
needs to have the same clock as Primary MI2S configured.

Fix the clock list for the lpass node in the device tree and add
a comment to clarify this confusing naming. With these changes,
audio can be played correctly on Secondary MI2S.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: 3761a3618f55 ("arm64: dts: qcom: add lpass node")
Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 3f85e34a8ce6..fbff71263951 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1384,11 +1384,17 @@ sound: sound@7702000 {
 		lpass: audio-controller@7708000 {
 			status = "disabled";
 			compatible = "qcom,lpass-cpu-apq8016";
+
+			/*
+			 * Note: Unlike the name would suggest, the SEC_I2S_CLK
+			 * is actually only used by Tertiary MI2S while
+			 * Primary/Secondary MI2S both use the PRI_I2S_CLK.
+			 */
 			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
 				 <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
 				 <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>,
 				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
-				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
 				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
 				 <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>;
 
-- 
2.32.0

