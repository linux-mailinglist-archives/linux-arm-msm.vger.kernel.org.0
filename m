Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3A8269F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgIOHNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:25 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:15289 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgIOHNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153980;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=HxVJjTPxayzkFaFUKL1OUXNwEm0n9mKWmJs+7jClXGs=;
        b=WI2bJSkC293F7WUKym/uTThyVRlQQliyyzQ3J8bXDkx9pV4xusqHqqQYEutuhNrDO+
        1s3Qw/2u/6euhela2D+9xp1bRrkW+qnvHkYelfGtjbVZwQmVlMM8tXrS5fRNgKxgN/pP
        yL5HUn3X/OdKNblPi6U8dK4NQEkXo4sPX2vzlT6nmWtkGXyb22Dj6ISuVbyzLjLU3wg9
        sykkCZxCCQlR+LNAfYLp6cz1b8/EpJxiNNmGQPMdpJJLfZSxESmHA38PNlr8UAfi0BGs
        QfiaiXRD76SowEjQWNnDe7W1G244inUeX4v7E0e5D2+Wtw0hKIuKmEy8zQGbFS4yKtqa
        U+hA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7Cwrdq
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:12:58 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 03/14] arm64: dts: qcom: pm8916: Remove invalid reg size from wcd_codec
Date:   Tue, 15 Sep 2020 09:12:10 +0200
Message-Id: <20200915071221.72895-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tha parent node of "wcd_codec" specifies #address-cells = <1>
and #size-cells = <0>, which means that each resource should be
described by one cell for the address and size omitted.

However, wcd_codec currently lists 0x200 as second cell (probably
the size of the resource). When parsing this would be treated like
another memory resource - which is entirely wrong.

To quote the device tree specification [1]:
  "If the parent node specifies a value of 0 for #size-cells,
   the length field in the value of reg shall be omitted."

[1]: https://www.devicetree.org/specifications/

Fixes: 5582fcb3829f ("arm64: dts: apq8016-sbc: add analog audio support with multicodec")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index c3f62090aff7..636ef9db9a14 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -127,7 +127,7 @@ pm8916_vib: vibrator@c000 {
 
 		wcd_codec: codec@f000 {
 			compatible = "qcom,pm8916-wcd-analog-codec";
-			reg = <0xf000 0x200>;
+			reg = <0xf000>;
 			reg-names = "pmic-codec-core";
 			clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
 			clock-names = "mclk";
-- 
2.28.0

