Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7855D1BF3C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 11:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgD3JHk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 05:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726902AbgD3JHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 05:07:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CEAC08E934
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 02:07:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k1so5913249wrx.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6LWNLbbug+kOK8gudRYkqI8/+G2DNYHCHmidemuCiQE=;
        b=iBd84ggDJFof8EZ9qo1Y9VkaE8gV3w9MJt68Q8FVbP1s/YM6DhBWT0hmczB4LiYEy3
         f1V3v2oIzHUBrQbwtstbpxFS9mdASa3Xg6lBd2LdZE69f5A6ELeckgB7G839Acuo79RJ
         93ZTkskH0/a+B3I+RLSEwUodVDJNpZ8AXUVuLbEtFrICcLOpZjmTB2F8i59o7UIwE4o2
         am7TT3Cc0nIz7yNbl4qQ2EN39ecAoiGYX+S6V+sKLWAzj6PFSXI+eODNb0fTqEiwZOqD
         djnaIf1vO5blvwnioGU6WPedeOlA/TUR/KhKct+hTNMepKHLBwm/16rPDrTvodw1Ojs+
         G6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LWNLbbug+kOK8gudRYkqI8/+G2DNYHCHmidemuCiQE=;
        b=WeXoEefLUYSmJpVDX4k84ZnENwIhW1jtKZlY5Cr5wOXhuybvYGouVuUlKRJIFEaAon
         hJ0q63zIUg6PP+/6EtktNw+Th4kfE+AlP0kdZet2/Bn7VUTkfl/G04sByTB3whukdeaJ
         eao2jtaxrzz8/zSJpniibd6VfPWRRJwwjnZontcl5HIiDTpMw1w1Vt/ccZY3QM3afIu3
         T1ctPZk67pEpkRmUkX9GJk38ZoWUSTRLeC6M2m1BOrgwn7KkKfB8jzMAGs5CgxGPiqIY
         YObX9KB8t3ALqfHauSpil+hIcgfkb7sGnSZpQsRQSbwkD/7U6QCzGeVxbGfmSPERuLj9
         qIQA==
X-Gm-Message-State: AGi0PuZcWdXdIzU7O0Id2oenrLvKAhx6Gri3Z0HTLmppeUUrbtsINEtW
        SwOwTdSAKdloxQESLnbDKI2nsg==
X-Google-Smtp-Source: APiQypJAebwircJDFu+JA5JJ5LW0VuZ9H0Q8lJtahQqO+fkp//ZcxyC6MDxBPskPjtY7bZeajZKGHA==
X-Received: by 2002:adf:bb0d:: with SMTP id r13mr2861094wrg.251.1588237656263;
        Thu, 30 Apr 2020 02:07:36 -0700 (PDT)
Received: from localhost.localdomain ([2a0e:b107:830:0:47e5:c676:4796:5818])
        by smtp.googlemail.com with ESMTPSA id t20sm10962025wmi.2.2020.04.30.02.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:07:35 -0700 (PDT)
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
Subject: [PATCH net-next v5 3/3] ARM: dts: qcom: ipq4019: add MDIO node
Date:   Thu, 30 Apr 2020 11:07:07 +0200
Message-Id: <20200430090707.24810-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430090707.24810-1-robert.marko@sartura.hr>
References: <20200430090707.24810-1-robert.marko@sartura.hr>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v4 to v5:
* Rebase to apply on net-next

Changes from v3 to v4:
* Change compatible to IPQ4019

Changes from v2 to v3:
* Correct commit title

 arch/arm/boot/dts/qcom-ipq4019.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index bfa9ce4c6e69..b9839f86e703 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -576,5 +576,33 @@ wifi1: wifi@a800000 {
 					  "legacy";
 			status = "disabled";
 		};
+
+		mdio: mdio@90000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "qcom,ipq4019-mdio";
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
 	};
 };
-- 
2.26.2

