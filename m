Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62B59188697
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 14:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgCQN57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 09:57:59 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:37201 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgCQN57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 09:57:59 -0400
Received: by mail-wr1-f50.google.com with SMTP id 6so25796933wre.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJ6WBkhO3K4OzsJINoEYvBbfmbxMU3iYiQ/cJbW0xDo=;
        b=g961w6HILHFqpDyFSns33LU0XmgMSPUSxr8P9etyj+evR/2wwGCLVQH4uB+PHcuCDK
         PWKNLyUII/jas7FoO5LE1NTUjtXDk9k0Y6EIViorMQdTN0ZxBaoiFJPhf4v4Nf/3zy00
         FUsYD0x7uD/JUu7epLOzCdGFP/lxPbQ9xS+PHV++AcJlwIJmZOMLGJBQOeApI5/GdreX
         wts8dEJX0Xb9e8PHe/hVQYGyfAgnMSeoM9F5bATTBxbI/V6N+xCjRiXNfZXBYs6Os0Mc
         IIl5YLQUegLfCoiRILfuOOi9bsro62LdEKBED9EPrpEU/oCp+UteuSqYXeEgaqKglkTG
         O+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJ6WBkhO3K4OzsJINoEYvBbfmbxMU3iYiQ/cJbW0xDo=;
        b=cNt0M/5xRX8AJxQl3wqfMqMaoZ1+/3UBxJQJnxX9koPhwIFBw9iVoet+MvNhQKfhHZ
         M3gJYbkWBrURnD6/fKpGolj+AhRjLBUJrQU8IVekIyFK/r+gBN0LXqPrtVjyvl3XV6c1
         yM7SO2GzS1ihE2jZR0ExFg7bep9BREJ1lfp6cp4oBme3rJzj8aWy2g+Z/i1DC3t+Vckw
         1SVlgxsFDFf4wPBAfIFOKwwcL19LIVorRY7hHcQTm5N3G90yciZtvpUAsvW2nqmIuZoV
         TMVsjPzHrxxvLfLLa6Tf7IOgLliWxhJIe6DNLk1eh5DM5XsH/jKEplg30dN4+Ae51wHR
         wkuw==
X-Gm-Message-State: ANhLgQ0LmSqHtjtmMWJX6p7Lj+QZ/Osjxp73RW3RwAi9gnVBEvLsygd/
        Y+j4z0ZkQB8VoECbXpu0783zOA==
X-Google-Smtp-Source: ADFU+vuEQpGGjN2Y6PiGYYhYPKWhI4pKxDM+6JY/eVnr92WFJO7DQJ+ODChwu2MU9pQRB6o9WKPrXw==
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr6279100wrp.91.1584453476447;
        Tue, 17 Mar 2020 06:57:56 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:84f7:5c25:a9d8:81a1])
        by smtp.gmail.com with ESMTPSA id r3sm2976558wrn.35.2020.03.17.06.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 06:57:55 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, maxime@cerno.tech,
        Anson.Huang@nxp.com, dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 4/6] arm64: dts: sdm845-db845c: Add pm_8998 gpio names
Date:   Tue, 17 Mar 2020 14:57:38 +0100
Message-Id: <20200317135740.19412-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317135740.19412-1-robert.foss@linaro.org>
References: <20200317135740.19412-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pm_8998 GPIO trace names. These names are defined in
the 96boards db845c mezzanine schematic.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Move gpio-names to previous reference to pm8998_gpio label


 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a6b6837c3d68..efb0086e2aa1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -365,6 +365,34 @@
 };
 
 &pm8998_gpio {
+	gpio-line-names =
+		"NC",
+		"NC",
+		"WLAN_SW_CTRL",
+		"NC",
+		"PM_GPIO5_BLUE_BT_LED",
+		"VOL_UP_N",
+		"NC",
+		"ADC_IN1",
+		"PM_GPIO9_YEL_WIFI_LED",
+		"CAM0_AVDD_EN",
+		"NC",
+		"CAM0_DVDD_EN",
+		"PM_GPIO13_GREEN_U4_LED",
+		"DIV_CLK2",
+		"NC",
+		"NC",
+		"NC",
+		"SMB_STAT",
+		"NC",
+		"NC",
+		"ADC_IN2",
+		"OPTION1",
+		"WCSS_PWR_REQ",
+		"PM845_GPIO24",
+		"OPTION2",
+		"PM845_SLB";
+
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
 		function = "normal";
-- 
2.20.1

