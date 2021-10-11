Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F778428A21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 11:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbhJKJu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 05:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235539AbhJKJu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 05:50:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B469C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 02:48:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p16so210511lfa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sXA6QwmITsjrRwNAqFVX/8z3VInDqhY9+HfUPlZSIMU=;
        b=RevfbEt51UnI/o9r3lnBJaz+lo2umTMSRJ25nu15DagEntnZgyqP8dIA/YtNW/OhEv
         h7XRkcTH2HzO+QgsxstXUReYbXuawg36h4rGMMFuzJRc7UpcPO+5U3raAIQE+jHeiI7t
         cUFdmKhY+h67G9Gjc8hvg7xARfuT9AmeNckotCNELl30tpbNryNOD1pcew8bYHPE4/gb
         HyzC/YPqBYF3vludDwn8cA2jn5HQHwjh+OwzAaPMOLZvv/7G914MQZFm0389uZSLD9zs
         jhCfuY8tSJQcsKh9rec6SyFxDc/0lSquf9qRAeNsv/N24vpoKxw9bwabYfzuinaz/UbY
         fLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sXA6QwmITsjrRwNAqFVX/8z3VInDqhY9+HfUPlZSIMU=;
        b=Ts8Wl2Yq/nunsfKk36V/oKvDaGxwy7ljQ0UXBwjLbeG/vkmids1pXSGZpwcEPGB3wa
         A5Z226+WvrOVw8LhB40A6OZZqI7DT1aQfLeP0gTm1/9hyYZsMHfFv+M3yJgNVdSEKL1w
         unodo957m6tLUpQ6JLFNx6ESlYc5/9j3xeHEajctrcjusr5BmKMJOmW1jkkPJMIA1GgZ
         Oa2si+4NFYoE0GUavrHE6lvwJ6+GDnjne//+Ru+r9fR0zSP+mWsyTJbgbQ6Dq5NPAK5/
         L2giaFH73g1qF/CO1KKlHv8Syc0EtMrePYqh1wZfd6xzIn4EgrQ7JQZ5UhosCHAWn8YZ
         u5vQ==
X-Gm-Message-State: AOAM533Q40r4Z3rWRa8IJoIKdWmtm3u7nkDDcpkHSGQ4rYdGkiqK4P5m
        E1gU4YLlZbWM/CDg9KzJI3T4UQ==
X-Google-Smtp-Source: ABdhPJxtJt3r5Vs+fGmC6w85nyS2flYyvGo6P5gdgPhrnm/2Ve6MWB2bJO2PpBOD8excDPxbWIvHNQ==
X-Received: by 2002:a05:6512:208d:: with SMTP id t13mr9466234lfr.261.1633945706853;
        Mon, 11 Oct 2021 02:48:26 -0700 (PDT)
Received: from localhost.localdomain (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id p9sm687138lfe.3.2021.10.11.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:48:26 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH] dts: qcom: msm8996: Add device tree entries to support crypto engine
Date:   Mon, 11 Oct 2021 12:48:22 +0300
Message-Id: <20211011094822.1580122-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The change adds description of Qualcomm crypto engine controller and
BAM associated with it. The change is inspired by commit 3e482859f1ef
("dts: qcom: sdm845: Add dt entries to support crypto engine.")

While performance of cryptographic algorithms executed on QCE is lower
than e.g. ones tinkered for ARM NEON, the offloaded execution would
make sense:

    # cryptsetup benchmark | grep aes
    aes-cbc        128b        71.0 MiB/s        71.9 MiB/s
    aes-cbc        256b        62.4 MiB/s        62.4 MiB/s
    aes-xts        256b        70.7 MiB/s        70.8 MiB/s
    aes-xts        512b        62.0 MiB/s        63.3 MiB/s

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 52df22ab3f6a..a03cbeb58246 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -705,6 +705,28 @@ tsens1: thermal-sensor@4ad000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		cryptobam: dma@644000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x00644000 0x24000>;
+			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_CE1_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely = <1>;
+		};
+
+		crypto: crypto@67a000 {
+			compatible = "qcom,crypto-v5.4";
+			reg = <0x0067a000 0x6000>;
+			clocks = <&gcc GCC_CE1_AHB_CLK>,
+				 <&gcc GCC_CE1_AXI_CLK>,
+				 <&gcc GCC_CE1_CLK>;
+			clock-names = "iface", "bus", "core";
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+		};
+
 		tcsr_mutex_regs: syscon@740000 {
 			compatible = "syscon";
 			reg = <0x00740000 0x40000>;
-- 
2.33.0

