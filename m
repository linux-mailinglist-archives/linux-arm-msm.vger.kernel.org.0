Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A61358ABE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbhDHRFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbhDHRF3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:05:29 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74963C061763
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:05:17 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ep1-20020a17090ae641b029014d48811e37so1733852pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ip5PiCXeJMTF74L2XmShdZvP7VmFmojAvEXdIoCfk54=;
        b=d7ilNP+IchuW7BTBlUdFQzLfcwKxQNapgKuWmNBWWi+M190BDNF1B7FD9yCpsWPz15
         icMifBOpt4dP4a7QmC68zbmJMz4zz8uKpFAR4CMzJL8kkh6zEYH1YRNO/JK6vdajDJrj
         t6o8XVxZvblSk3Rgc/l3us48ZMQxXOZgiYByvAf1Aawevlxd1P8asOXTc60o1pZVr4LN
         ljdEvjB+kuAFrlKXEC6/AiP8BrHYeeaJj8DOK91Id59oztmm3bONpHxMnjivPQc98Vkz
         L92JSSqAWuBTr9+LByVISyVQYjWdOcF7vVCazcPBpH1iuTbqXslAFTVvbyc2n9xJJ5pG
         8WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ip5PiCXeJMTF74L2XmShdZvP7VmFmojAvEXdIoCfk54=;
        b=M2DX9F6oKwzExA09q4AwRglCnoKseGsicptvVHjZRGXY/xKOnW6yluF89CHlrw6WgI
         DRQZZRuUtw9Qlapq3SOfwHf/kPauXbAuXe8QV7SpLzafBJiDWCpOIvkoaBesCEZH80t1
         /i+SqWY5DqMY4wl8kzLFcW2z0GjtclDuS2qendzFObQ2xrvUGpS5Zo+qa0v7+ZFYX63c
         En9uqSIkLhmbPuIz6nWC/J89WBYG/HGb0QgGTsG2rUwn/DOLCloMYWippb3/SUcxrdID
         1q0ePCael9ix5+5OOi5u9AREvuMSZQc+h99TCePmewZFwT2tVH+zbvAfKFWvHGiKARrb
         lZUA==
X-Gm-Message-State: AOAM530RscAWpWwaC7hoFiljfar4R6/JUAg96c3SWYY1r8EASLDl6WDZ
        pgUBAgbifwvZDjytmkhRFdYA
X-Google-Smtp-Source: ABdhPJykbQ/yfM7yBa1HYViUp0h2zDnOgzGsPmDKCG3YeerqEmk2a28Iy5lBQGdG8JK7KSp9/txtOA==
X-Received: by 2002:a17:90b:1b42:: with SMTP id nv2mr9441228pjb.190.1617901516943;
        Thu, 08 Apr 2021 10:05:16 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id y194sm65183pfb.21.2021.04.08.10.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:05:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/15] ARM: dts: qcom: sdx55: Add CPUFreq support
Date:   Thu,  8 Apr 2021 22:34:45 +0530
Message-Id: <20210408170457.91409-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add CPUFreq support to SDX55 platform using the cpufreq-dt driver.
There is no dedicated hardware block available on this platform to
carry on the CPUFreq duties. Hence, it is accomplished using the CPU
clock and regulators tied together by the operating points table.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 8112a5283ce2..20cb2c903a91 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -53,6 +53,35 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
 			enable-method = "psci";
+			clocks = <&apcs>;
+			power-domains = <&rpmhpd SDX55_CX>;
+			power-domain-names = "rpmhpd";
+			operating-points-v2 = <&cpu_opp_table>;
+		};
+	};
+
+	cpu_opp_table: cpu-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-345600000 {
+			opp-hz = /bits/ 64 <345600000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+
+		opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+			required-opps = <&rpmhpd_opp_turbo>;
 		};
 	};
 
-- 
2.25.1

