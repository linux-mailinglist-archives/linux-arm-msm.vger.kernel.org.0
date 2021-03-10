Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B586433353C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 06:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhCJF0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 00:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbhCJF0Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 00:26:16 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87254C061763
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 21:26:16 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so6832115pjg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 21:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zXfGW3C/eyJGoM/FwxHjQxTW8J2zzfoCdheICm9OVYg=;
        b=n6VbBrQ13srYdvKCmulXAHcEeJR8T0zB9pKat/yMjFByjcRhu15QJB2rqWkhNJSnaJ
         n5wZDSD9yzInpstrl4NovgtW0j2VGCMfWDdwo+nI2j1DC0U9nKuoT6LiOql1x1TxnfRx
         4tDKsdn+UhUCDok7rz1Ptso28KE7FvysykznoNzl+haxh13Tr/5y4fQtsXa+4Vs5lPBW
         WdgPHPwU9j4G1Dkz1tGveA5yqcUwvT6avACKxvQNWzku4jBkXLIcacjnGh2FxbxDqZUT
         y1WCel1Kh4PM4p0XkkhkuAhhXITRXBh3xKIbKLlSAchr1NSL+ApnlZqqhkC6QCV8FKpk
         zpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zXfGW3C/eyJGoM/FwxHjQxTW8J2zzfoCdheICm9OVYg=;
        b=NYDGtcG73OG4P7C7mshzdHHtWWHY26shpzVmEZh5g1ZlaqlNMNF2jTsZ7uGBaPGEXr
         03nZByPKNVrjvAha7/jt5/pmocNQWWizSRPH9OJpksiSjrsJ3JFY+2cydFQk5ds3vZ69
         5LWNpWn/VApoB2Tv7dL1y7LqyW/5ws/4VoHHurJPWg7szgJyWEwdox9ohOlE4L5t1tHN
         ZHP85EgdQyVD1bwtYTbLQvNlR+/dE/gjFI2f0OAm/KIdMGz4uHN0C1axPNt31vwdRW0e
         LyBtFukSVOigDzx43b7ggudcLeVT/7tkYLtlH5a+bNd6okNiC2hEJoYBQySZWVc6M2bA
         hyGQ==
X-Gm-Message-State: AOAM53213lcRJxcLd94cgBEBw+q4NzPbtsW+d3TkniO1QmBaAy+jEF4v
        3GOHlfK3uWAuneV+LH0WYlaUFk4JF30lTvVU
X-Google-Smtp-Source: ABdhPJzm27HUg4lrkThEsU9SV8JMIoKlbjldZ5rkx3DceISLNo35RQECDjMsR+evkGoULAU5rGDjSw==
X-Received: by 2002:a17:902:da81:b029:e5:de44:af5b with SMTP id j1-20020a170902da81b02900e5de44af5bmr1492283plx.27.1615353975983;
        Tue, 09 Mar 2021 21:26:15 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:9f4:a436:21bd:7573:25c0:73a0])
        by smtp.gmail.com with ESMTPSA id g7sm13915224pgb.10.2021.03.09.21.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:26:15 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 8/8] arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.
Date:   Wed, 10 Mar 2021 10:55:03 +0530
Message-Id: <20210310052503.3618486-9-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
"sm8250.dtsi".

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..4f7482dbc2bf 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3744,6 +3744,42 @@ cpufreq_hw: cpufreq@18591000 {
 
 			#freq-domain-cells = <1>;
 		};
+
+		cryptobam: dma@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmhcc RPMH_CE_CLK>;
+			clock-names = "bam_clk";
+			num-channels = <2>;
+			qcom,num-ees = <1>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely = <1>;
+			iommus = <&apps_smmu 0x584 0x0011>,
+				 <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x592 0>,
+				 <&apps_smmu 0x598 0>,
+				 <&apps_smmu 0x599 0>,
+				 <&apps_smmu 0x59F 0>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,crypto-v5.5";
+			reg = <0 0x01dfa000 0 0x6000>;
+			clocks = <&gcc GCC_CE1_AHB_CLK>,
+				 <&gcc GCC_CE1_AHB_CLK>,
+				 <&rpmhcc RPMH_CE_CLK>;
+			clock-names = "iface", "bus", "core";
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x584 0x0011>,
+				 <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x592 0>,
+				 <&apps_smmu 0x598 0>,
+				 <&apps_smmu 0x599 0>,
+				 <&apps_smmu 0x59F 0>;
+		};
 	};
 
 	timer {
-- 
2.29.2

