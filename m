Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55697181813
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 13:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbgCKMfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 08:35:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34099 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729418AbgCKMfN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 08:35:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id x3so3079217wmj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0S8YiKSlFY8C2wfSnfYCKEk3w9krt/5PEihft8xMBGs=;
        b=iLwUXOrjXX1JgooKK4C1Ej7aG++N6vBTyANbdSesx4J5LANkA4rttAdfoN3Cl9OWKN
         MK8FbGS80ejPexHaTTEhYRZed+ckS3C6aTIXTWQoEcjAesHoSKfGdtfNIVffBZmNij0t
         +c2hNFirdEnegtp+oJcHVUXtcCiOFQ1TIXBLoKbywdKv2X4tr3zE+Jm0Jr6KfhgZ9Hdn
         FQwJX8RDzIZLP0muodqY9eAC77ehypRz/hCnqognQa2LPPREWDxA1l8jr+KkOTWZORaS
         +0M7U1ItFDSyfQdvkdvSylEi4p8LuqqNHh2RTBb26xVVV85ZQnPO8I3Gec63XEFl93md
         8W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0S8YiKSlFY8C2wfSnfYCKEk3w9krt/5PEihft8xMBGs=;
        b=Fjqx06uhz/weyiUGGivoLT32/i7LlxICXL4JhWtwlsbf5/tNpuCQPRjNkaY+UiLWzd
         CYkvw+1BYPFOv6l51Xb+phfEr1DGqE1bSPQfn91YPc1x136N1amV0IEd6+TO1F+WqE4M
         csBKLuvG6+BlCPR48CJNiEN8LSDruF98UQNbLHFZEJZ/c3qa++/7SAqJ15QBjl9F/BgD
         pxzWux/M0aMY5P2sIQ36DmQEw0cc4f84MAPLaTlgFV2XvNMURV7q2hELEcnGMX3h49f3
         94tJCYpn+wQo4NxYnnBu1DxoMGR6d9ZBJYyoQvOwdwngD96dum4/r3gibS3m5K1u+spI
         g26w==
X-Gm-Message-State: ANhLgQ0v2RfsCPHCqDHgB44EYoWnVc6ujPMJ24e/F30yAGMn2NT+r5kM
        /dbnUhzGhcsDL6ysca/nZUV2nA==
X-Google-Smtp-Source: ADFU+vtnJUfH6dtY/lJKtuEbOdGr7AEex8lhT/SZQ0KZ7Kab7Njaq1yaVX/R+8xktDk/P5+P/+x86w==
X-Received: by 2002:a7b:c8d5:: with SMTP id f21mr3670765wml.60.1583930111399;
        Wed, 11 Mar 2020 05:35:11 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:9087:3e80:4ebc:ae7b])
        by smtp.gmail.com with ESMTPSA id m25sm7822732wml.35.2020.03.11.05.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:35:10 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        maxime@cerno.tech, leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v1 4/6] arm64: dts: sdm845-db845c: Add pm_8998 gpio names
Date:   Wed, 11 Mar 2020 13:34:59 +0100
Message-Id: <20200311123501.18202-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311123501.18202-1-robert.foss@linaro.org>
References: <20200311123501.18202-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pm_8998 GPIO trace names. These names are defined in
the 96boards db845c mezzanine schematic.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a6b6837c3d68..e8c056d02ace 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -584,6 +584,36 @@
 	};
 };
 
+&pm8998_gpio {
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
+};
+
 &cci {
 	status = "ok";
 };
-- 
2.20.1

