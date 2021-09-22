Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA1D4150E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 22:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237286AbhIVUC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 16:02:58 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:30551 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbhIVUCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 16:02:40 -0400
X-Greylist: delayed 87309 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Sep 2021 16:02:40 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632340852;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=tj9hav2P35+GuDckfzJk3R5QgnH8BuC8JGWAe6zUaf4=;
    b=eayHNoTtR6c/ev/4/Rz3+8eSqsoeXa98di2dg4xhqYQgFgkGocKwRrZ8jEbbmh7HP5
    fmM0WbWLPQDhzeB6Sn9B0K20Hnnnh1nX728XVbkyKavJjMLh7IReiGpHjzJi6KgbXhye
    uJ0cVFv1uASj0Lsz7k6AzLPvRLgjWVPOgILa2az+le0kWq/Z9g8uei4EcvWVFM1ZHZvp
    J5YhvlyFokG1rzJTZxviUZ4P7IleNRdP679Z/q5T9SPntebpTuyMr+B2GnDrXRe0BES7
    p4C9lp7k4nUtSQz9XuSYqEwJTZw2p3ZDSbKqMKScSV4K6oDriqQlW+hhS2hrXth7zSln
    2Lrg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFSIIYI="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8MK0pJjd
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 22 Sep 2021 22:00:51 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] arm64: dts: qcom: apq8016-sbc: Clarify firmware-names
Date:   Wed, 22 Sep 2021 21:58:53 +0200
Message-Id: <20210922195853.95574-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 0f6b380d580c ("arm64: dts: qcom: apq8016-sbc: Update modem and WiFi
firmware path") added "firmware-name"s to the APQ8016 SBC (DB410c) device
tree to separate the (test key)-signed firmware from other devices.

However, the added names are a bit confusing. The "modem" firmware used by
DB410c is actually a simplified version for APQ8016 that lacks most of the
modem functionality (phone calls, SMS etc) that is available on MSM8916.
Placing it in "qcom/msm8916/modem.mbn" suggests that it supports all
functionality for MSM and not just the reduced functionality for APQ.

Request the firmware from "qcom/apq8016/modem.mbn" instead to clarify this.
Do the same for "wcnss.mbn" for consistency (although the WCNSS firmware
works just fine on MSM8916).

Finally, add a "_sbc" suffix to the WCNSS_qcom_wlan_nv.bin firmware file.
It seems like the nv.bin firmware is somewhat board specific and can
therefore vary a bit from device to device. This makes it more clear
which board it is intended to be used for.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
The new "firmware-name"s have not been in a kernel release yet and
have also not been submitted for linux-firmware yet so I think it is
still fine to change this.

I realized this while starting to make some packaging changes for this
and I think the new names are a bit clearer than the current ones. :)
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 351c68d29afb..0e4a1f004021 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -308,7 +308,7 @@ &mdss {
 &mpss {
 	status = "okay";
 
-	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mbn";
+	firmware-name = "qcom/apq8016/mba.mbn", "qcom/apq8016/modem.mbn";
 };
 
 &pm8916_resin {
@@ -319,7 +319,7 @@ &pm8916_resin {
 &pronto {
 	status = "okay";
 
-	firmware-name = "qcom/msm8916/wcnss.mbn";
+	firmware-name = "qcom/apq8016/wcnss.mbn";
 };
 
 &sdhc_1 {
@@ -403,7 +403,7 @@ &wcd_codec {
 };
 
 &wcnss_ctrl {
-	firmware-name = "qcom/msm8916/WCNSS_qcom_wlan_nv.bin";
+	firmware-name = "qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin";
 };
 
 /* Enable CoreSight */
-- 
2.33.0

