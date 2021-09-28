Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9464B41ADCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 13:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240354AbhI1Lcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 07:32:45 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:23935 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240355AbhI1Lcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 07:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632828655;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qY3mbrX+1Mme37XGkKJNHUCNmq5BBHE84YApRenh6s8=;
    b=opp/PZ2PIWNA2em4W2QbM21CMV5CUZodxPNWFqIRmFt/PKbomxk8tvwBZgbO/ZKsQD
    3pvOa5JrzcQnPfdK8KfAnyZxs0IidtAw5P00xLk6oO8lJ4NoR6tg9lSPg8uhIeB8KxTj
    ub43YoqoTsbbEJ3DNyQ5Wp3/pplX8it6ByjoxVpFuEodpxFaaIb3GPYSqsspn7UhAcLg
    vUXNb6YJkZ3zodqSFVYttvfY33h6kfZjFciEWBUZj9E0RSOY4Ybim5XrNcYIS1ws0jdT
    AH5S62u+XAs56v2zO53xPlWtfYBRZWY18GGbY4+/axA8mgMkFmBp+pX0E2i3MqP011ss
    u2Eg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SBUskIr
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 13:30:54 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3] arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
Date:   Tue, 28 Sep 2021 13:29:43 +0200
Message-Id: <20210928112945.25310-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While removing the size from the "reg" properties in pm8916.dtsi,
commit bd6429e81010 ("ARM64: dts: qcom: Remove size elements from
pmic reg properties") mistakenly also removed the second register
address for the rtc@6000 device. That one did not represent the size
of the register region but actually the address of the second "alarm"
register region of the rtc@6000 device.

Now there are "reg-names" for two "reg" elements, but there is actually
only one "reg" listed.

Since the DT schema for "qcom,pm8941-rtc" only expects one "reg"
element anyway, just drop the "reg-names" entirely to fix this.

Fixes: bd6429e81010 ("ARM64: dts: qcom: Remove size elements from pmic reg properties")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index f931cb0de231..42180f1b5dbb 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -86,7 +86,6 @@ adc-chan@f {
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>;
-			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
-- 
2.33.0

