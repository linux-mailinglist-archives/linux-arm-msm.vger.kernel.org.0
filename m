Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E1816C6D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfEGUlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:41:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53276 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbfEGUk7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:40:59 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 805516119F; Tue,  7 May 2019 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261658;
        bh=xBvD6VP3TkBtyf8cYqhK8l+cP1on9J0F2DdO4YFTSu0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KC07UvY9acDQerQWVtHH0RB50vHChxgt5x5HaBF6psqqNalQX3ynXwGVh690Jq3nz
         R7ZhimI6+C/soz+heEh80UQX9BgrKFyCM7nwZvf6eYOMlMzREoqAlNq9qKlnYt+eb8
         hMqJ7ny13/Xf7o7NpIjwA/TF4ig31rA8r0IdYa7o=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9D18611D1;
        Tue,  7 May 2019 20:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261657;
        bh=xBvD6VP3TkBtyf8cYqhK8l+cP1on9J0F2DdO4YFTSu0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V8MyBrlivpVn+v7xg2lzLNxWgnte2VuQIS0ZbSjtgHsguOGD3jeJRu/WKnLQ2UqCO
         JLTNkcDNCPF+4CL98QrKScp9aL4g4iXxfe9KunahbEkYLdhtoBzhJa+ty28k+pGznt
         ObPNsa8JauzKisWqFWUJuK0WaHT0zVRB+zna7yQs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9D18611D1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
Subject: [PATCH v5 07/11] dt-bindings: sdm845-pinctrl: add wakeup interrupt parent for GPIO
Date:   Tue,  7 May 2019 14:37:45 -0600
Message-Id: <20190507203749.3384-8-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SDM845 SoC has an always-on interrupt controller (PDC) with select GPIO
routed to the PDC as interrupts that can be used to wake the system up
from deep low power modes and suspend.

Update the sdm845 pinctrl device bindings to reference the PDC wakeup
interrupt controller and the GPIO PDC interrupt map.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 79 ++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
index 665aadb5ea28..895832127193 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
@@ -53,7 +53,6 @@ pin, a group, or a list of pins or groups. This configuration can include the
 mux function to select on those pin(s)/group(s), and various pin configuration
 parameters, such as pull-up, drive strength, etc.
 
-
 PIN CONFIGURATION NODES:
 
 The name of each subnode is not important; all subnodes should be enumerated
@@ -160,6 +159,84 @@ Example:
 		#gpio-cells = <2>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		wakeup-parent = <&pdc_intc>;
+		irqdomain-map = <1 0 &pdc_intc 30 0>,
+				<3 0 &pdc_intc 31 0>,
+				<5 0 &pdc_intc 32 0>,
+				<10 0 &pdc_intc 33 0>,
+				<11 0 &pdc_intc 34 0>,
+				<20 0 &pdc_intc 35 0>,
+				<22 0 &pdc_intc 36 0>,
+				<24 0 &pdc_intc 37 0>,
+				<26 0 &pdc_intc 38 0>,
+				<30 0 &pdc_intc 39 0>,
+				<31 0 &pdc_intc 117 0>,
+				<32 0 &pdc_intc 41 0>,
+				<34 0 &pdc_intc 42 0>,
+				<36 0 &pdc_intc 43 0>,
+				<37 0 &pdc_intc 44 0>,
+				<38 0 &pdc_intc 45 0>,
+				<39 0 &pdc_intc 46 0>,
+				<40 0 &pdc_intc 47 0>,
+				<41 0 &pdc_intc 115 0>,
+				<43 0 &pdc_intc 49 0>,
+				<44 0 &pdc_intc 50 0>,
+				<46 0 &pdc_intc 51 0>,
+				<48 0 &pdc_intc 52 0>,
+				<49 0 &pdc_intc 118 0>,
+				<52 0 &pdc_intc 54 0>,
+				<53 0 &pdc_intc 55 0>,
+				<54 0 &pdc_intc 56 0>,
+				<56 0 &pdc_intc 57 0>,
+				<57 0 &pdc_intc 58 0>,
+				<58 0 &pdc_intc 59 0>,
+				<59 0 &pdc_intc 60 0>,
+				<60 0 &pdc_intc 61 0>,
+				<61 0 &pdc_intc 62 0>,
+				<62 0 &pdc_intc 63 0>,
+				<63 0 &pdc_intc 64 0>,
+				<64 0 &pdc_intc 65 0>,
+				<66 0 &pdc_intc 66 0>,
+				<68 0 &pdc_intc 67 0>,
+				<71 0 &pdc_intc 68 0>,
+				<73 0 &pdc_intc 69 0>,
+				<77 0 &pdc_intc 70 0>,
+				<78 0 &pdc_intc 71 0>,
+				<79 0 &pdc_intc 72 0>,
+				<80 0 &pdc_intc 73 0>,
+				<84 0 &pdc_intc 74 0>,
+				<85 0 &pdc_intc 75 0>,
+				<86 0 &pdc_intc 76 0>,
+				<88 0 &pdc_intc 77 0>,
+				<89 0 &pdc_intc 116 0>,
+				<91 0 &pdc_intc 79 0>,
+				<92 0 &pdc_intc 80 0>,
+				<95 0 &pdc_intc 81 0>,
+				<96 0 &pdc_intc 82 0>,
+				<97 0 &pdc_intc 83 0>,
+				<101 0 &pdc_intc 84 0>,
+				<103 0 &pdc_intc 85 0>,
+				<104 0 &pdc_intc 86 0>,
+				<115 0 &pdc_intc 90 0>,
+				<116 0 &pdc_intc 91 0>,
+				<117 0 &pdc_intc 92 0>,
+				<118 0 &pdc_intc 93 0>,
+				<119 0 &pdc_intc 94 0>,
+				<120 0 &pdc_intc 95 0>,
+				<121 0 &pdc_intc 96 0>,
+				<122 0 &pdc_intc 97 0>,
+				<123 0 &pdc_intc 98 0>,
+				<124 0 &pdc_intc 99 0>,
+				<125 0 &pdc_intc 100 0>,
+				<127 0 &pdc_intc 102 0>,
+				<128 0 &pdc_intc 103 0>,
+				<129 0 &pdc_intc 104 0>,
+				<130 0 &pdc_intc 105 0>,
+				<132 0 &pdc_intc 106 0>,
+				<133 0 &pdc_intc 107 0>,
+				<145 0 &pdc_intc 108 0>;
+		irqdomain-map-mask = <0xff 0>;
+		irqdomain-map-pass-thru = <0 0xff>;
 
 		qup9_active: qup9-active {
 			mux {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

