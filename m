Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31ACC3C76C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 20:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbhGMTAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 15:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhGMTAg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 15:00:36 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A47C0613DD;
        Tue, 13 Jul 2021 11:57:46 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id f17so31834188wrt.6;
        Tue, 13 Jul 2021 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9vIDstN0NsKzFsmaUf5+bwtolpKaUoz3uhWSCSOs4DQ=;
        b=HKi0RlThWZOJC+WSQaGs/zq763ifjHH8duWrGwoIRmKNKAKG90qB4Wz36I1nJpAYmr
         tg3CBWXxBuJqTt1qn37TscMgvtR9wlEL19tt5kXsSp6D08jI/l3bcGEegBay2vNDi/Cx
         2cu6cvagOMUKWu8cxSGB4p9FHTHm2OW+FbWV+ZHMPmBuw7G/BU8N4gxoQ1BiVyQKPAOs
         kmBMbbnIu9cbdYUtkh8fKepfq/ya8TwkXXh7NCwLCP+CInSZyNaz4LjSbzvJBz8Yw4Tc
         ey+Vzp8erxoV9wgA5NYMAAW7E5Rz6t9mEHElSkfjE9UnGWEAtk/EDoJmvJg39NC3FTtt
         B+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9vIDstN0NsKzFsmaUf5+bwtolpKaUoz3uhWSCSOs4DQ=;
        b=rfNZxL+bFFCS9PbtPgpSdMW766P7at9X5nMhhuqICn8CZF0PfBOs8fRgVlEhmJfBif
         dAMpLaQgVCaJMumuZyHEH5FFVv8CfB/yylLeUz9at7RKN//QbV6JK/8P7ixSQLW1Si/o
         ze7wWsnUOYLJ2bY2k3x5epqRN5FazbXXJgabpAS/kNXE/0qrE38gO+a5IGTejRTFV3cX
         fNLVL9osihPNH4rxjmx6WpII3/AtFGeucLV2NTrYLDJUXFR6DAJDO+2Om8TJXoAMKEz9
         /uz9+V4vz/MqRS2YV7AgsWMK1YTQj95EWAY+3xDw34LRWy7H+1U2O1SWbojP+MhMNVy0
         WhFw==
X-Gm-Message-State: AOAM532bADjL73dNY/NoKd4Y+9Qj4j4Ds03etcWRVVK4LOe2VUWvSQIg
        Qw+NmvdFaZWWksXU611R7anzQZxVJh8FiQ==
X-Google-Smtp-Source: ABdhPJxLbyJh4/KQ42u0wb1NT3v5JYOlO2Sg/tku/EaylaQPN224OlZc1QOfICb8V0fL1FC+3jwSaQ==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr7766348wri.168.1626202665011;
        Tue, 13 Jul 2021 11:57:45 -0700 (PDT)
Received: from dell5510.suse.de (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id l24sm3077971wmi.30.2021.07.13.11.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 11:57:44 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping
Date:   Tue, 13 Jul 2021 20:57:34 +0200
Message-Id: <20210713185734.380-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713185734.380-1-petr.vorel@gmail.com>
References: <20210713185734.380-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

cont_splash_mem has different memory mapping than generic from msm8994.dtsi:

[    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000003400000, size 12 MiB, limit 0xffffffffffffffff
[    0.000000] cma: CMA: reserved 12 MiB at 0x0000000003400000 for cont_splash_mem

This fixes boot.

Fixes: 976d321f32dc ("arm64: dts: qcom: msm8992: Make the DT an overlay
on top of 8994")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 5c6e17f11ee9..1ccca83292ac 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -10,6 +10,9 @@
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
 
+/* cont_splash_mem has different memory mapping */
+/delete-node/ &cont_splash_mem;
+
 / {
 	model = "LG Nexus 5X";
 	compatible = "lg,bullhead", "qcom,msm8992";
@@ -42,6 +45,11 @@ ramoops@1ff00000 {
 			ftrace-size = <0x10000>;
 			pmsg-size = <0x20000>;
 		};
+
+		cont_splash_mem: memory@3400000 {
+			reg = <0 0x03400000 0 0x1200000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.32.0

