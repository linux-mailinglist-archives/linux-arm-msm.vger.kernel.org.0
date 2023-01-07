Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9B14660E38
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 12:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjAGLMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 06:12:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjAGLMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 06:12:42 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FD76DB85;
        Sat,  7 Jan 2023 03:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673089957;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=eI9dDHLw+NifOSgBtTCXKqdveBpO0iOLFL2hjPQN34Y=;
    b=XlWYOsXBtNSEUBDNJnVErUsdnlLJp7OzEysfef3NEVqK9BiBiWLt8GyFSzWVQcZI2c
    PGOR2wjCPvGwr+he6i8dduZ5G+g/xIAnf2M1R1tcn+UxShHz6Boxrf0ZD3QkZoRbMeNb
    MXek1jNQhEOIelokTmTu2LLT1hkp7ygfswqe8EhT1dMU4CpZjGRi1AzpMxWSTlgVEUpe
    Ukcw7HeXWJnn2Skej5D+kR5uU+8bCDSyO7KAe9mzBbLrTTahJbDFh2jF0nOA8wGAIERA
    tMHIUaisHmDv2i2rQvXDGSzlXyGU1H7aLirTVpTCm6HSyvepPQUXhg7tAsYt1VMo4dcH
    Mwcg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweFKMuQ=="
X-RZG-CLASS-ID: mo01
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z07BCatJD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 7 Jan 2023 12:12:36 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] arm64: dts: qcom: msm8916: Enable blsp_dma by default
Date:   Sat,  7 Jan 2023 12:09:57 +0100
Message-Id: <20230107110958.5762-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230107110958.5762-1-stephan@gerhold.net>
References: <20230107110958.5762-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding the "dmas" to the I2C controllers prevents probing them if 
blsp_dma is disabled (infinite probe deferral). Avoid this by enabling 
blsp_dma by default - it's an integral part of the SoC that is almost 
always used (even if just for UART).

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 4 ----
 arch/arm64/boot/dts/qcom/msm8916.dtsi    | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index ef5b39ba1238..c52d79a55d80 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -169,10 +169,6 @@ led@6 {
 	};
 };
 
-&blsp_dma {
-	status = "okay";
-};
-
 &blsp_i2c2 {
 	/* On Low speed expansion */
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index ffb4ce8935b3..98da982548a1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1522,7 +1522,6 @@ blsp_dma: dma-controller@7884000 {
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
-			status = "disabled";
 		};
 
 		blsp1_uart1: serial@78af000 {
-- 
2.39.0

