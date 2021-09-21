Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B82413619
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 17:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhIUPYj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 11:24:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:23636 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233837AbhIUPYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 11:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632237787;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Mn6STB2mKFNw5lkE3KQV6CgCSU0VfjctWesLRX+6DBE=;
    b=RE33oTpygs0xOUtNx4RhF7qHZs7gCpirkFNKgj4drZ96qExytbSbzU/hBpwiCfytI4
    tzzyMFuzsOhUW2+EP1cBEHhffUAHEmBVUrHb8H8wCvxaBU97gIrEhRcHzKfGR4Bd5VPo
    tpGR1dmzUT0CwN3MTe2DEw6pDkgGOHpDhiC1/3K0488ulgo0F8vs4Gq8TaiQjym5oBMk
    0DbH5XYEZPNxH7OF2zEsz0WH49lTOCbqDuB999WeThB65Caq/m6OrD3MZ8jsFKzsP6wJ
    KVChTpjyWISTMGYjEv7ujOOBnpqE07IU0gfMYM46zL9u51yS6uhk59CeKEjKfL+NbBlo
    0hDA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFOATg=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8LFN7ARN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 21 Sep 2021 17:23:07 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916: Add "qcom,msm8916-sdhci" compatible
Date:   Tue, 21 Sep 2021 17:21:20 +0200
Message-Id: <20210921152120.6710-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921152120.6710-1-stephan@gerhold.net>
References: <20210921152120.6710-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to Documentation/devicetree/bindings/mmc/sdhci-msm.txt
a SoC specific compatible should be used in addition to the IP version
compatible, but for some reason it was never added for MSM8916.

Add the "qcom,msm8916-sdhci" compatible additionally to make the
device tree match the documented bindings.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 95dea20cde75..5879be0805b6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1420,7 +1420,7 @@ lpass_codec: audio-codec@771c000 {
 		};
 
 		sdhc_1: sdhci@7824000 {
-			compatible = "qcom,sdhci-msm-v4";
+			compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0x07824900 0x11c>, <0x07824000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
@@ -1438,7 +1438,7 @@ sdhc_1: sdhci@7824000 {
 		};
 
 		sdhc_2: sdhci@7864000 {
-			compatible = "qcom,sdhci-msm-v4";
+			compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
-- 
2.33.0

