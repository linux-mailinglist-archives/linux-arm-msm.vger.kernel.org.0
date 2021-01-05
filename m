Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8452EA7F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbhAEJsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:48:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728746AbhAEJsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:46 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1024AC0617B9
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:14 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id x18so16087510pln.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=krR0mmg8e2WHKAWsbc9kCR1LNZ0LFktieOVnJDiTgLs=;
        b=Vdu21QJA3Iy2/nZZZOeEVMKiQz4yFRKfYNrXjhrfLO963YEjIeFU+IEF+zwk5jedo9
         y3tF8gnQjXmIiXxt+ykQ1wsN8Yigg651AyoeLXBsudLqcXBrnC5c0h0KKiCTmjXKF3Fg
         jO3TTQ/FReVwcYhcOex5OmXacYETTI6RjgTSwMMzrW5zDBiUgNAm9H50MfHnPFYTvRu8
         aJ6wgg7ChDbBTMz8mPnDHmQLRAySBAEVsyXIKhWy0FxxkNDSESRXIdPS8nKSVOrJ0e0o
         sPhTNyf3eWAG7Lxnbo3y9dcJwLbWMRjNnPP9/GNDoIFhkJAOO/2MFr79P3pC1gsSjbSj
         2gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=krR0mmg8e2WHKAWsbc9kCR1LNZ0LFktieOVnJDiTgLs=;
        b=ixUS4KctwWoyqAe067f2nPZz+Jz7KwXc+ry0/H7tnWwtOirus9ZbJvbP+t+RiL9PrV
         lHaSYQkBVbLDtCzRmSo5n8vdbpujFlA5TrVb5KWqjgPfSK32sKulh00PjuN4htkUe3un
         0hcGhg1oz4Nek7ZVKHlt15RnondDApVB++fksZl1UYPT86Qb7G4+47IfK/oqP60XccMO
         V5TXu+z2E5tG5jYLtPvIxht8jpN4wVvg9NTOlRrqguXKS5efGkiscZ6HC4Y62u36w2SU
         uv6G6uakkDYGJ2Rso3uEca//6sQuzsSIhxIu+5VdC5KclQOXquxiEPEIBPfgKztaXspq
         HT9g==
X-Gm-Message-State: AOAM530Gm11GFdWwPaTuOxZdkiGTvJczKB2tynwC+mdYNtRs4PmlGWdq
        jDRYvFHXwbuIckgXWC5UBCbD
X-Google-Smtp-Source: ABdhPJzilSIgGKfMzHm6OkFOFEHydpliOTxyesLprTKuYSDlpJUbZEw+fNiOUqFysjFkGpPxAUHHcg==
X-Received: by 2002:a17:903:2307:b029:dc:8e14:a92d with SMTP id d7-20020a1709032307b02900dc8e14a92dmr11760378plh.57.1609840033603;
        Tue, 05 Jan 2021 01:47:13 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:13 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/18] ARM: dts: qcom: sdx55: Add QPIC BAM support
Date:   Tue,  5 Jan 2021 15:16:27 +0530
Message-Id: <20210105094636.10301-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qpic_bam node to support QPIC BAM DMA controller on SDX55 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 622a63b0058f..1b9b990ad0a2 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -166,6 +166,18 @@ sdhc_1: sdhci@8804000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma@1b04000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x01b04000 0x1c000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmhcc RPMH_QPIC_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			status = "disabled";
+		};
+
 		tcsr_mutex_block: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0x1f40000 0x20000>;
-- 
2.25.1

