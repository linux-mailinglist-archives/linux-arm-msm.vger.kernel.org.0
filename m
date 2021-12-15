Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6785A475D8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 17:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244906AbhLOQeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 11:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244880AbhLOQeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 11:34:06 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC78EC06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 08:34:05 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id j17so22391804qtx.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 08:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0diK6zWMgOO/TArP/zyW7Q3OH2Ix/QmAaJD5h2ncz4A=;
        b=mc82jMSfzgK5zWR/xwVHCjSs6aqfCjK17wcc+NRsgWAPP/MLBuk7J312TQpVPXAAeX
         Kxp8w8JC1So1hoOvvJjK95W1BLOwlMWtSqUSWewA0Y6h73CwTgZc9chAi/0qWCFvmIhf
         VGow/I0BfZ9ac/zP11FSHtcxXJ209z6lfOnvg+nON6sNvahQj6MTB2QdfXy2licQiOLn
         iBZ7TFGYF2gBkqoQ0xJjm0g4alScvhCelHrjmZTQwT4KTfVdvfFkR+ZJIRF98vI/GqNI
         wZIM2TQl4jz4wTJV2YyTzf3oMIET3/rUL7sxMRM4ueQ1l4Nh/ZzZuK38/m1AtUnoSXiL
         9fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0diK6zWMgOO/TArP/zyW7Q3OH2Ix/QmAaJD5h2ncz4A=;
        b=65GltNAba/Ju02j1d+dkTs7tqWCHh579kzfFeBmJz52QMeXOkwjoBwRLQs2vn+zDM/
         b54m7hljvkCNe0l+GCguLnrBKaoEXfwO8l1IPoWCw2HF8tK0+tOstTmI5xkHQdJ4SWEg
         dnH6EIpjTGLCzzom2ZVCOPt0+j5YU4rzD0iyV6/JzvKMaV6AfO5ZT2KOcAIkj2c9lV8a
         9QPIGeoScf1DQVunMWb6Jnu3GonDdmD/JyVIpn0dzrm6nUAG4hD/Wz1yIbRfNPYGLjvu
         YhPW2Jl1mx6z6lod/pz09Pq/AkGH1w6nqk8YHV2Tvqzj8xAaormisgRjiiU0EjGbIyRw
         qerA==
X-Gm-Message-State: AOAM532pmeACUcIYBejxvaIrW6nS16PAm44y89FUX2hUjKgwhcQDYELU
        UK4qPhw33BY5/flDSQM+bFt07g==
X-Google-Smtp-Source: ABdhPJy350X5/5YWY27/YU/Cu5RtpyHJHn5jrsr6vBk8zWDP6mT8H5IiPECoRPx6TCZLAmQj2qUx7w==
X-Received: by 2002:a05:622a:1196:: with SMTP id m22mr13049290qtk.290.1639586044780;
        Wed, 15 Dec 2021 08:34:04 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id w10sm1824832qtj.37.2021.12.15.08.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:34:04 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Patch v2 2/3] arm64: dts: qcom: sm8150: Add support for LMh node
Date:   Wed, 15 Dec 2021 11:33:59 -0500
Message-Id: <20211215163400.33349-3-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215163400.33349-1-thara.gopinath@linaro.org>
References: <20211215163400.33349-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LMh nodes for cpu cluster0 and cpu cluster1 for sm8150 SoC.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 81b4ff2cc4cd..e755d7ab78dd 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3650,6 +3650,30 @@ cpufreq_hw: cpufreq@18323000 {
 			#freq-domain-cells = <1>;
 		};
 
+		lmh_cluster1: lmh@18350800 {
+			compatible = "qcom,sm8150-lmh";
+			reg = <0 0x18350800 0 0x400>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			cpus = <&CPU4>;
+			qcom,lmh-temp-arm-millicelsius = <60000>;
+			qcom,lmh-temp-low-millicelsius = <84500>;
+			qcom,lmh-temp-high-millicelsius = <85000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		lmh_cluster0: lmh@18358800 {
+			compatible = "qcom,sm8150-lmh";
+			reg = <0 0x18358800 0 0x400>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			cpus = <&CPU0>;
+			qcom,lmh-temp-arm-millicelsius = <60000>;
+			qcom,lmh-temp-low-millicelsius = <84500>;
+			qcom,lmh-temp-high-millicelsius = <85000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
 		wifi: wifi@18800000 {
 			compatible = "qcom,wcn3990-wifi";
 			reg = <0 0x18800000 0 0x800000>;
-- 
2.25.1

