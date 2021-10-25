Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0502A439397
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 12:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbhJYKZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 06:25:43 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:12600 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbhJYKZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 06:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635157396;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Fy42elwEpviDijX512I4cw68sqrNUYVZKufzeqy+KAQ=;
    b=OtmLOZxGm5XyUEsIv9ee1lOk8Z+iD+Y5+G9DybsFhfwv+nHD8WszHYe6ceYVi3SLS9
    nu4OBZW4TvweA62AbtvFwPZzLzVEpPU2QkLjfplkuiluvJPSbtHvFYGYjDJNht1U1gt3
    oHHHKI9lO5E3fKqdi2wFxqwzr3dC0nwMOg2E2gzwDETPlbf/yzAlqdwLshSYAP1USbi/
    wYNcJmnREyYJc42yHOfbYGf1l6ML1IFP5VBbvBOVfJ/LsEiaSZA8YQ/F51ypkpBJdmQ0
    MTRluFDLny8RBxOyssXeGTMjlif4CaUhj8/EevdSYyLXIXdbsfjW0qPsiLOqE7gPyYkZ
    jdig==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2YPaQ"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9PAND8Nw
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 25 Oct 2021 12:23:13 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Luca Weiss <luca@z3ntu.xyz>,
        Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: [PATCH] arm64: dts: qcom: Add missing 'chassis-type's
Date:   Mon, 25 Oct 2021 12:22:24 +0200
Message-Id: <20211025102224.23746-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the "chassis-type" to msm8916-samsung-serranove and
sm7225-fairphone-fp4 that were posted before the patch that added the
chassis-type to existing device trees, but merged after it.

Also, looks like sdm636-sony-xperia-ganges-mermaid was missing in
commit eaa744b1c101 ("arm64: dts: qcom: add 'chassis-type' property")
so add it there as well.

Cc: Luca Weiss <luca@z3ntu.xyz>
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts         | 1 +
 arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts | 1 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts              | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index a78f87a5bf4f..58dfbfff4c7d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -23,6 +23,7 @@
 / {
 	model = "Samsung Galaxy S4 Mini Value Edition";
 	compatible = "samsung,serranove", "qcom,msm8916";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &blsp1_uart2;
diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
index bba1c2bce213..b96da53f2f1e 100644
--- a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
+++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Sony Xperia 10 Plus";
 	compatible = "sony,mermaid-row", "qcom,sdm636";
+	chassis-type = "handset";
 
 	/* SDM636 v1 */
 	qcom,msm-id = <345 0>;
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 8d6fd22873e0..a6937642736e 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -15,6 +15,7 @@
 / {
 	model = "Fairphone 4";
 	compatible = "fairphone,fp4", "qcom,sm7225";
+	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
 	qcom,msm-id = <434 0x10000>, <459 0x10000>;
-- 
2.33.1

