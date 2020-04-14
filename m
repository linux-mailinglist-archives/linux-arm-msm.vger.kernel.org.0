Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376EB1A88E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 20:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503659AbgDNSOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 14:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503654AbgDNSOb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 14:14:31 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E2EC061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:14:30 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t14so2367596wrw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JkyvlKP4pHrJ8AdiuVHbCpIXULnDIYo0wPYklEdrEI0=;
        b=i3/RJsjOiDyODApqcCHy5k6pUbD94Xgeu24o+JvyJIO0/hUev+OnyeoBeZUgiakGf8
         cp1FGWJ2T3J5BY1mSv0W+CQD8k6aIy13OhLWPyvd5Oir5QAl47ngBE9vCogp28eH8FFu
         Kr03rbEX2PcMMC7gxtPsrcLvZY3Qj+IlDw70oBumA/eMaZBjBNF/ISO0zfnTl787SSs+
         fC05nyPsgEObHjd9uYNHw6MRJtN69fmlMOikk5tkQhbTgqalmG1MvrKL1xcQ6n51LLHr
         +lQaCzUSSvF/GP/5639o77troTwlp4ZsiEl0z1wfoTkQJWNNzdgPzH8Y9QeMeL3jU7qe
         jFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JkyvlKP4pHrJ8AdiuVHbCpIXULnDIYo0wPYklEdrEI0=;
        b=InjS5S8tGqOAmcdhfTom17tmPxsTIro+nHP6dDWmLFnYpIfdPaC5wxnNk3jm9N16TF
         FAoygqhOTZQjOKnPZfxAXnW0HXVjBwpzKrreWqesv8unHJlJ8P97p356uyKdFPHov9Gc
         tAM+8PyFivUgr4v7nolAP41oxhxcPMO4ua0zHyklUSuXiiof67QNR1dSMRRMh+vOiIEt
         UnBnnCWPtTSM20SvzuZ1H7xE573gP9wFt6sSPdcnkvFIotKVpnFC7Vin/zYuyNi44zWM
         49G88+MDezr0FXibcjfROmQ5vc4znwrmNID6jsjLCJ82X48XpjyoA7B/WpysJCozyjQb
         1qJw==
X-Gm-Message-State: AGi0Pua9aJiSKcrSGRldWLrrrN3Sv9PDaQJwNkZqt9QnXlS73pqhKoJm
        u5YiKovtQhVKX5FShPBrM9Fd5A==
X-Google-Smtp-Source: APiQypKuhwoq30JHZAbW4ywOg0qHXXSg5sZ8KHXcL7JXIhJgwQOYdAIWuzx+IL/PNq9ZS+9GksFmwg==
X-Received: by 2002:a5d:4306:: with SMTP id h6mr24048996wrq.234.1586888069502;
        Tue, 14 Apr 2020 11:14:29 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-22.xnet.hr. [88.207.97.22])
        by smtp.googlemail.com with ESMTPSA id w12sm5387763wrk.56.2020.04.14.11.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:14:29 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Christian Lamparter <chunkeey@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 3/3] dts: ipq4019: add MDIO node
Date:   Tue, 14 Apr 2020 20:10:16 +0200
Message-Id: <20200414181012.114905-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414181012.114905-1-robert.marko@sartura.hr>
References: <20200414181012.114905-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the necessary MDIO interface node
to the Qualcomm IPQ4019 DTSI.

Built-in QCA8337N switch is managed using it,
and since we have a driver for it lets add it.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b4803a428340..80d0a69e9fed 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -578,6 +578,34 @@ wifi1: wifi@a800000 {
 			status = "disabled";
 		};
 
+		mdio: mdio@90000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "qcom,ipq40xx-mdio";
+			reg = <0x90000 0x64>;
+			status = "disabled";
+
+			ethphy0: ethernet-phy@0 {
+				reg = <0>;
+			};
+
+			ethphy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+
+			ethphy2: ethernet-phy@2 {
+				reg = <2>;
+			};
+
+			ethphy3: ethernet-phy@3 {
+				reg = <3>;
+			};
+
+			ethphy4: ethernet-phy@4 {
+				reg = <4>;
+			};
+		};
+
 		usb3_ss_phy: ssphy@9a000 {
 			compatible = "qcom,usb-ss-ipq4019-phy";
 			#phy-cells = <0>;
-- 
2.26.0

