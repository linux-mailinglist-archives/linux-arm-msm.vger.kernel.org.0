Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23EF31AAB60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 17:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371215AbgDOPGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 11:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S371209AbgDOPGa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 11:06:30 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804B5C061A10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 08:06:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k11so252856wrp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 08:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8TtIEgRLbMKaxN8HqryCW6P1Yi/XwB5nTXW1T20DG1M=;
        b=YOCDJs2WSuKYK+x9zLYcvbR+ACmGSMl9OaQRrdWn+l35nmYtXquQ595MAkZXgNQN9R
         KwiJF3hO+QJ3w2+wnKvhb+97hujZLrHuuaJvXe9haeWnnO7zQQkN2lI8fsmBzAOdtDTn
         8DiSK03sY+nHfXCNER9F4qBMpb6ujN/0aurZGY8Brt3jVPkpvU+y1ujODBVwnnadcnNe
         16+1fzTaFyqrDishfzFHXUAkxn4niCLmr/HbRKWUsvh0Fz0seJNpDdL64wK3X+wCpxnk
         6/ajk7RWDTwD1kKIIZSx3ssc9IeUioMTpwilr69nWEyhidQZeH/eHFN/ub/R1NmkL/D3
         oz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8TtIEgRLbMKaxN8HqryCW6P1Yi/XwB5nTXW1T20DG1M=;
        b=VnKKat+w16for935n8AAxO2DCvC11i3llolGC5sjMXmRfhbo3JfBaoNmUS5gzDMNKM
         nzlKmW9xO5Xysy/0sdIU1F04lHRqAVkXYZzKrrVwqcJeV7jFNX9fJ/xMw8d8+YtWyu6U
         crL3+vzBLjffcXqkcEZTogFpOJXu/4xiH/iishO8+hYw98IpkCvrwCA08KRAPTba546a
         AnCPhyhnolvPGtdosVHQC/h229YteP+O3P/HOT+5XMSWJjiXBsPhl6CB78sqS+xyU6oX
         LuddODVRzG0ewdA4oxdOxm9OSii+a0izoJu50Z7UhkYKNi6s9V7IdZgsWlEnddReQOpH
         mBuQ==
X-Gm-Message-State: AGi0PubZD4JKHeMg/Osrib6RfuRlKUS6MbV4w3LSaLJrP0j5hNqFea7C
        teuVFHU2Dgydu7rBiCNp/JnrNg==
X-Google-Smtp-Source: APiQypK+KRomLiiU9IvRMG3xUDN988/6mGDDVrRsYmJAFlDRmMf0ZExagqosCgmcxl0y625jdGpYDg==
X-Received: by 2002:adf:90ea:: with SMTP id i97mr29089874wri.123.1586963185191;
        Wed, 15 Apr 2020 08:06:25 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-108.xnet.hr. [88.207.96.108])
        by smtp.googlemail.com with ESMTPSA id s6sm22729988wmh.17.2020.04.15.08.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:06:24 -0700 (PDT)
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
Subject: [PATCH v3 3/3] ARM: dts: qcom: ipq4019: add MDIO node
Date:   Wed, 15 Apr 2020 17:02:48 +0200
Message-Id: <20200415150244.2737206-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415150244.2737206-1-robert.marko@sartura.hr>
References: <20200415150244.2737206-1-robert.marko@sartura.hr>
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
Changes from v2 to v3:
* Correct commit title

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

