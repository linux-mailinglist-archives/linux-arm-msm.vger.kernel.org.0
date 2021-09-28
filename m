Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09EFC41ADE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 13:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240364AbhI1Lfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 07:35:38 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:17450 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240353AbhI1Lfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 07:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632828656;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=DJ9Li0Jn+PEFHade/dtMX8uifwhfEBll3zWaq2035FE=;
    b=bIAwxlyP4GPhYFZLXu11CntS+BIlVBwWO9+wnrN3Wk99UBq8GSLTHVt7EA5mVUMGmu
    8nkz0MpcAiIm1xWIbDBMeOwztNUyHvhL9jABxDmosvL8qrEhSHbYyHqyiY2M/NlLUsrE
    ue18QruAhiAuvIgVuDwNgaSmvY/gN1Lt5gq5k1x/e1JVVuHJqrGbkFf4IRdIGLbrk2Oo
    nINQpv8NPdN8DGiqIqJQiStRwrQ5hOMRezJfaaXzXw9kzs7doGXzluz0Lz6Lir0mEZhx
    GPDoZc/5Hgw/BuEJ+R5B74NUfcnXdGPY1tetUDh39oWXzaxRf76PWZQjlYTxUVPZdzfU
    veUg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SBUtkIs
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 13:30:55 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/3] arm64: dts: qcom: pm8916: Add pm8941-misc extcon for USB detection
Date:   Tue, 28 Sep 2021 13:29:44 +0200
Message-Id: <20210928112945.25310-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928112945.25310-1-stephan@gerhold.net>
References: <20210928112945.25310-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At the moment, USB gadget mode on MSM8916 works only with an extcon
device that reports the correct USB mode. This might be because the
USB PHY needs to be configured appropriately.

Unfortunately there is currently no simple approach to get such an
extcon device during early bring-up. The extcon device for USB VBUS
(i.e. gadget/peripheral mode) is typically provided by the charging
driver which is almost always very complex to port.

On pretty much all devices with PM8916, the USB VBUS is also connected
to the PM8916 "USB_IN" pad, no matter if they use the linear charger
integrated into PM8916 or not. The state of this pad can be checked
with the "USBIN_VALID" interrupt of PM8916.

The "qcom,pm8941-misc" binding exists to expose an "usb_vbus" and/or
"usb_id" interrupt from the PMIC as an extcon device.

Add a &pm8916_usbin node to pm8916.dtsi which can be used as simple
extcon device for devices that are currently lacking a proper charger
driver.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 42180f1b5dbb..48c6c9cca53b 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -41,6 +41,14 @@ watchdog {
 			};
 		};
 
+		pm8916_usbin: extcon@1300 {
+			compatible = "qcom,pm8941-misc";
+			reg = <0x1300>;
+			interrupts = <0x0 0x13 1 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "usb_vbus";
+			status = "disabled";
+		};
+
 		pm8916_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-- 
2.33.0

