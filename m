Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2EA269F58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgIOHNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:06 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:30218 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgIOHNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153978;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=SwqktXM4Q2qZ1ZQhpAuzvlHwleRHKB+K7gmVsNzVt1I=;
        b=g9IDxVWbh+s2a6HQECh+bLqcKnVeav0MOTrf3u3ANKQqbF8h8phUhACq+QnRNiEcMa
        2CpKo314tqZim3khTzw8DRFsq3dqvZtq3lBYkGf+FrLww40fsfGNnbftin7fkuty98Z1
        USzQDv/HB7DnKsbNrhUwfNacerexHG8Gknr7b4RQODdQMW4A0BrklJLsaOBnje+rHciZ
        0fB1BacPg8Zc2b/6uYZCv5Sk0PXRPAtmO7IhxWzG1Yw5O2LdoaMYcPPSuYXWs6swMZhK
        Y9kUwJ4EnNL6ZbW3Zm5TIg5zPA3WJIAcDbmABR4Pr/DvIC2dV61N+kO4d5KCn5gDErdK
        +3FA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7Curdn
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:12:56 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 01/14] arm64: dts: qcom: msm8916: Configure DSI port with labels
Date:   Tue, 15 Sep 2020 09:12:08 +0200
Message-Id: <20200915071221.72895-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

&dsi0 -> ports -> port@1 -> endpoint already has the "dsi0_out" label,
so we can use it for configuring instead of replicating the entire
node hierarchy. Looks like I missed that when converting the boards.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi            | 12 +++---------
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts | 12 ++++--------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index d9af1a3785d8..3c7f97539390 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -292,15 +292,9 @@ ov5640_ep: endpoint {
 	};
 };
 
-&dsi0 {
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&adv7533_in>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&adv7533_in>;
 };
 
 &lpass {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 410c7d199f96..086f07ead5cb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -44,15 +44,11 @@ panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port@1 {
-			dsi0_out: endpoint {
-				remote-endpoint = <&panel_in>;
-				data-lanes = <0 1>;
-			};
-		};
-	};
+&dsi0_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel_in>;
 };
 
 &msmgpio {
-- 
2.28.0

