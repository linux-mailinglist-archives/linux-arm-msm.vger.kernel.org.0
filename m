Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5901BDA55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 13:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgD2LHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 07:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726797AbgD2LHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 07:07:53 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3790BC03C1AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 04:07:53 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g13so1983225wrb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KJmebWLDjLh8vCDBka3zVT6nvvCa+5XmuntIjuQhiRE=;
        b=a8bAvr4tStYxSiUIDr6CBH1RpXcjAMY6BYfytKrGJMS3014kO0oblUdosbqFinyAsn
         /y7zsjtKhwO/CCEzsfFbCbo9oamzSyyaSqYgbX9Y8pM7M6wTXDaSR7LIPlhWDD3NBQCe
         Yx81Yuh5JvZAMajTarm3aG00aEUr3wES/l62cTslRFXyitByx+FCrtFh3mU/orHyrIis
         N80oRdH4FhllSfLWsF3mLu5eSEiJ4QsuwCpZpM/CF6Y70ixk7UE73F7/GKxKE1nsfwYp
         +gS+wxjIHW08Rkpppp7y4Ht3pHTK7ParjBdVZf77zGNqIi/A1VxpVpmru3bLauvJyHzy
         2UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KJmebWLDjLh8vCDBka3zVT6nvvCa+5XmuntIjuQhiRE=;
        b=cJ5JVmw4RzyaMrlB9BTHEepktVoNZDBKMNXaFyv7R/IhADV8p6NsG5TllNi9kObYz2
         8iVwcCuoxWvt+T2GfNPyAc0UpeTAAPDWVRujemKZoyVfkVA3MZVz83fBFGTYQ+skce4Y
         ncuQ/J5x+mLsq0SwTXoonROxbo6XBywPKH/2pVZ96tnqqXGLbxoChmHH1nxoFML8vt+L
         KPAxdbEK+lcBJIJe88ShEhevHIsQ4NHQmiIyR+dY5x4JRmUeuGB0HCyXYr6dJEPGcrxt
         9DM0CJeeQdfmWwhvVz/zZKF3h8u5QrxUK1adGV1gDIcax/HkSuSfz1/zYEU3VD/5T7Lx
         zrtA==
X-Gm-Message-State: AGi0PuYzlxSHzEnTslKodiDFPkRoOOfHqap8nwVnbtAhqvZw5RYGJ68n
        EpIWH4KmAigTY/W7Cx2fg1qV8A==
X-Google-Smtp-Source: APiQypIz3/hA+7TRshIH/ZVdn0UyHlwF6q8tWlAm9hqsVhDplySuS0IVFw3daGFhG17P0Yof3jG+0g==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr37857274wrr.162.1588158471948;
        Wed, 29 Apr 2020 04:07:51 -0700 (PDT)
Received: from localhost.localdomain ([2a0e:b107:830:0:47e5:c676:4796:5818])
        by smtp.googlemail.com with ESMTPSA id u7sm7679963wmg.41.2020.04.29.04.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 04:07:51 -0700 (PDT)
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
Subject: [PATCH net-next v4 3/3] ARM: dts: qcom: ipq4019: add MDIO node
Date:   Wed, 29 Apr 2020 13:07:27 +0200
Message-Id: <20200429110726.448625-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429110726.448625-1-robert.marko@sartura.hr>
References: <20200429110726.448625-1-robert.marko@sartura.hr>
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
Changes from v3 to v4:
* Change compatible to IPQ4019

Changes from v2 to v3:
* Correct commit title

 arch/arm/boot/dts/qcom-ipq4019.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b4803a428340..8b72a149bc33 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -578,6 +578,34 @@ wifi1: wifi@a800000 {
 			status = "disabled";
 		};
 
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
+
 		usb3_ss_phy: ssphy@9a000 {
 			compatible = "qcom,usb-ss-ipq4019-phy";
 			#phy-cells = <0>;
-- 
2.26.2

