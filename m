Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD23E2EF202
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 13:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbhAHMHq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 07:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbhAHMHA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 07:07:00 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8959AC061265
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 04:05:19 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id cw27so10960314edb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 04:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=khUEAN43PZx69IDMiT3hZbQBo1OGuATV3IzNHnjy7Cs=;
        b=TrIItpPljwgJLUx7ZF2ooo4CIAWUE0Vp8sowkArpC1OsHOcxWXHzx1Zs6HM+yR6Gk5
         AFP/KGB3XaVEO3fxN+HVQQP1IRHJUvB3QF8FXGS4RBBFlJnzGi+thborS5rD/7fkzjP/
         Vmvtj7RQw5Bc1Wp190H8XvJLte6ykH6ufu2evVy4kwbxTZMHKSaVzIgmPIAxoo8bf7kW
         +Q8kCg9PPFa1qSQvLRwfr0U4qehsfbJFrx0mHHucN8Xg4z5knPn4ehST80djUtm/jmWF
         V5VnYmxBg4l7I5bambYDoNI5imGjRz60zTYjsdQAokIYTuF8bmw1aNiB3vy8jZZOBYZp
         qYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=khUEAN43PZx69IDMiT3hZbQBo1OGuATV3IzNHnjy7Cs=;
        b=RmezZXoeGTQMC8CtU4MA6BXc/Dj8Saa2W8NBRlRdFuYei5KYpFLC7aDhrP+PMNLxJh
         t/xcR8oVYsDWI6C8Irp7pAevt9vBPP/M1LdtesF1VbgzBPTkNzUG185RPAt6B+T7dajF
         pyQniLY35UFv/y3o/Y9K48jgD6BSHa6ibLXDwtWZFJgzGs2DUKFpAFOOnluDom+rIufW
         AO+/hylTUJ5IX/TEZILb5laMc6LxVlUGJ+/HHaatYNi57EYqMWesJ3VRqmhmP4vYWPwO
         PWjXMxjZhHYOCClPUDxVF6yFKdLwey9qq0C0Fq7c8FQUscrlsxQR0MSwX6lyRBvwonY2
         lapw==
X-Gm-Message-State: AOAM533AUaJ/yM83QuFjtYXKrS3HmnJreCdSj8/7Ab5tGCirQlnv3mS2
        MP3jOq91FMIAl/HgcRucrWl8oA==
X-Google-Smtp-Source: ABdhPJzepZq2sA5qliOClWwvtvPBYv3ntbtLxfp9VCDTJiRbJrUGUFCGJPdnLzW5tjF/u7SRV+ZGhg==
X-Received: by 2002:a50:8744:: with SMTP id 4mr4924862edv.362.1610107518289;
        Fri, 08 Jan 2021 04:05:18 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:05:17 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 12/17] media: dt-bindings: media: qcom,camss: Add bindings for SDM845 camss
Date:   Fri,  8 Jan 2021 13:04:24 +0100
Message-Id: <20210108120429.895046-13-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for qcom,sdm845-camss in order to support the camera
subsystem on SDM845.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../devicetree/bindings/media/qcom,camss.txt  | 51 +++++++++++++++----
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,camss.txt b/Documentation/devicetree/bindings/media/qcom,camss.txt
index 498234629e21..276c5d0c25cb 100644
--- a/Documentation/devicetree/bindings/media/qcom,camss.txt
+++ b/Documentation/devicetree/bindings/media/qcom,camss.txt
@@ -9,6 +9,7 @@ Qualcomm Camera Subsystem
 		- "qcom,msm8916-camss"
 		- "qcom,msm8996-camss"
 		- "qcom,sdm660-camss"
+		- "qcom,sdm845-camss"
 - reg:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -18,19 +19,21 @@ Qualcomm Camera Subsystem
 	Value type: <stringlist>
 	Definition: Should contain the following entries:
 		- "csiphy0"
-		- "csiphy0_clk_mux"
+		- "csiphy0_clk_mux"	(not 845)
 		- "csiphy1"
-		- "csiphy1_clk_mux"
-		- "csiphy2"		(8996 only)
+		- "csiphy1_clk_mux"	(not 845)
+		- "csiphy2"		(8996 & 845)
 		- "csiphy2_clk_mux"	(8996 only)
+		- "csiphy3"		(845 only)
 		- "csid0"
 		- "csid1"
-		- "csid2"		(8996 only)
-		- "csid3"		(8996 only)
+		- "csid2"		(8996 & 845)
+		- "csid3"		(8996 & 845)
 		- "ispif"
-		- "csi_clk_mux"
+		- "csi_clk_mux"		(not 845)
 		- "vfe0"
-		- "vfe1"		(8996 only)
+		- "vfe1"		(8996 & 845)
+		- "vfe_lite"		(845 only)
 - interrupts:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -41,14 +44,16 @@ Qualcomm Camera Subsystem
 	Definition: Should contain the following entries:
 		- "csiphy0"
 		- "csiphy1"
-		- "csiphy2"		(8996 only)
+		- "csiphy2"		(8996 & 845)
+		- "csiphy3"		(845 only)
 		- "csid0"
 		- "csid1"
-		- "csid2"		(8996 only)
+		- "csid2"		(8996 & 845)
 		- "csid3"		(8996 only)
 		- "ispif"
 		- "vfe0"
-		- "vfe1"		(8996 only)
+		- "vfe1"		(8996 & 845)
+		- "vfe_lite"		(845 only)
 - power-domains:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -67,27 +72,40 @@ Qualcomm Camera Subsystem
 		- "top_ahb"
 		- "throttle_axi"	(660 only)
 		- "ispif_ahb"
+		- "camnoc_axi"		(845 only)
+		- "cpas_ahb"		(845 only)
+		- "cphy_rx_src"		(856 only)
 		- "csiphy0_timer"
+		- "csiphy0"		(845 only)
+		- "csiphy0_timer_src"	(845 only)
 		- "csiphy1_timer"
-		- "csiphy2_timer"	(8996 only)
+		- "csiphy2"		(845 only)
+		- "csiphy2_timer_src"	(845 only)
+		- "csiphy2_timer"	(8996 & 845)
+		- "csiphy3"		(845 only)
+		- "csiphy3_timer_src"	(845 only)
+		- "csiphy3_timer"	(845 only)
 		- "csiphy_ahb2crif"	(660 only)
 		- "csi0_ahb"
 		- "csi0"
 		- "csi0_phy"
 		- "csi0_pix"
 		- "csi0_rdi"
+		- "csi0_src"		(845 only)
 		- "cphy_csid0"		(660 only)
 		- "csi1_ahb"
 		- "csi1"
 		- "csi1_phy"
 		- "csi1_pix"
 		- "csi1_rdi"
+		- "csi1_src"		(845 only)
 		- "cphy_csid1"		(660 only)
 		- "csi2_ahb"		(8996 only)
 		- "csi2"		(8996 only)
 		- "csi2_phy"		(8996 only)
 		- "csi2_pix"		(8996 only)
 		- "csi2_rdi"		(8996 only)
+		- "csi2_src"		(845 only)
 		- "cphy_csid2"		(660 only)
 		- "csi3_ahb"		(8996 only)
 		- "csi3"		(8996 only)
@@ -96,14 +114,25 @@ Qualcomm Camera Subsystem
 		- "csi3_rdi"		(8996 only)
 		- "cphy_csid3"		(660 only)
 		- "ahb"
+		- "slow_ahb_src"	(845 only)
+		- "soc_ahb"		(845 only)
 		- "vfe0"
 		- "csi_vfe0"
 		- "vfe0_ahb",		(8996 only)
+		- "vfe0_cphy_rx"	(845 only)
+		- "vfe0_axi",		(845 only)
+		- "vfe0_src",		(845 only)
 		- "vfe0_stream",	(8996 only)
 		- "vfe1",		(8996 only)
 		- "csi_vfe1",		(8996 only)
 		- "vfe1_ahb",		(8996 only)
+		- "vfe1_cphy_rx"	(845 only)
+		- "vfe1_axi",		(845 only)
+		- "vfe1_src",		(845 only)
 		- "vfe1_stream",	(8996 only)
+		- "vfe_lite_axi",	(845 only)
+		- "vfe_lite_cphy_rx"	(845 only)
+		- "vfe_lite_src",	(845 only)
 		- "vfe_ahb"
 		- "vfe_axi"
 - vdda-supply:
-- 
2.27.0

