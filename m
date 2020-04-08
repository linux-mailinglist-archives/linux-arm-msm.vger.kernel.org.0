Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F19C1A22B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgDHNLG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:11:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52461 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729077AbgDHNKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:10:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id t203so5073412wmt.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eyBGvPhV7TUH86tokQz7uJLxAaD+h2U61M1YV5bgXQs=;
        b=YR7kjZEDp8Dclxy+3WQjIozJps5zrdc4+YpZUIpjxeZLzDHIU344sV0qjc6I5pl5HS
         dkdFmg3wIS2EartLPHjLFXqCuhZ7hLhu5zLUe8eT5OY1hQwcQho3Koo5VZdAdUPC42D8
         BKEx2Ih8T9FQYlyYAbVNl4Q0K2CSJOrmYNWBuf3g+UVZaVMPh+uQ39NATJlcMFPmbevA
         9TFyoOZMfgAqk3zRxULaqOIu8HaSJY4k6FSeWBM6Bh1xa914KMROhcZ3qitfgcZl2t9x
         LGvT4y1l3mXC3aoE3JyNrZVS+HkWqZVomzaWEs9F3CR1owCjmrGC8D0k1Y/fbqypS7pA
         GzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eyBGvPhV7TUH86tokQz7uJLxAaD+h2U61M1YV5bgXQs=;
        b=qh2kGn2cxqXoXeoVE+SMcdhl4f8tzKWe/dT8Pax6Jv37EX9OYxtVyI84rOMsygePCj
         ncOxMJ/TdwZHBJxSf8olT6LExp/JiFSIB6R+DxU7leaxMDef6vswPK0EW26lbPFkNAJl
         S51Zh+RPeJ4mp8f0LWEsH8DNNor4bWdknGC3CzaIPNPy78lWiue3N9Vxecckdj76WWSY
         22+Y0uxyQHOkgMgkPt0F1xZjdwlNoKDUK3yKWFYtBqcGo5T4rswhShzwv6oZOZtoMaPW
         sljECilxyny/PB/8p7oJUT+gJolErCVPqggffVdu+DT5sQ44AA9QsPLBooxa7jjBIswy
         JMaA==
X-Gm-Message-State: AGi0Puas0T0tglY+C3bE/WfYcWFnsYJQJn07WWyB4ZKMfxhm6MXsP274
        vZO7AP5g6giaVtfQNGLL3lD2iQ==
X-Google-Smtp-Source: APiQypJNeoXs5y2t1gLKM6gDJw9wo7P2PspFCxzFWP5VVAB+XA/VWx9wysS6dw5QBKvX78ZXyqHxXQ==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr4663898wms.18.1586351451594;
        Wed, 08 Apr 2020 06:10:51 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:51 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 4/6] arm64: dts: sdm845-db845c: Add pm_8998 gpio names
Date:   Wed,  8 Apr 2020 15:09:57 +0200
Message-Id: <20200408130959.2717409-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408130959.2717409-1-robert.foss@linaro.org>
References: <20200408130959.2717409-1-robert.foss@linaro.org>
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
index 8644a2f6095a..5cd06ab97b9a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -412,6 +412,34 @@ &pcie1_phy {
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
2.25.1

