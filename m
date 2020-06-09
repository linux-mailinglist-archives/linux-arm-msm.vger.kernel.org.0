Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E351F4733
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 21:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389312AbgFITk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 15:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389297AbgFITkk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 15:40:40 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEDDC08C5C9
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 12:40:39 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id n141so22059767qke.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xhsbcv6ELYs8gtPa7Zn2QEWCa6cPXNXWT2fgZku/yEM=;
        b=Uw+KzPzOaqBIlyyAEazcDBTydcQvlpNfQHYQNwVPBNq2ynBZwbsVyd5y8Qr5PsdHAn
         zdVMjtvxpvBBJ8KzyVx3nq+AC1mp+DlaHAg0XWcYIsT1PMyhtDhpED/wfXT78Fxx1cNF
         OqOVr8V3c1wqCui1QBge5TWaUHCiwXrs9ZPNWsBcrxIUW8v1e7PICTO1uOnvoL2dS1c4
         CS4+Y2PfVKU7gOTRdI6k18rDscn952InsaGF+r9j2Mq7MYMtPoMQAIQdmawG8TMeg7Zu
         +rTabLAql/e5IqPMSnk+E7cQpFyu/7IJ+hdmJaiWU/8J2nCyy7WwFkTuv/m+4LK0nTs3
         FSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xhsbcv6ELYs8gtPa7Zn2QEWCa6cPXNXWT2fgZku/yEM=;
        b=G95EXB3AN67/2GiTG1JZQd9G68LN5F0d4vR3zkgmbu6fH93dHLV1Ygsf5ssRDrnaCY
         n7ZAluHWVEvTGYVwQRRI5KZH5d5fDSWDyYWbCQmlTrZYAakq31hmazjP6OWpYIk51r3G
         XyPxOWt+N7ZExxzYtVjT/oiHdq7ILnyydfmESzhDYepau9LDRSn5L+uij6PNnxBkHXG7
         w8IJbassu+bC7tB14JTQVviv5cCL+sbLA1yJOjXKattQK5H27zjB44rux3nFi3zdCy0Z
         FxLRvs6hC/4n+T5+LlARnYU+Ay0Zjye4pMo6+/ILeE7dGQWLkDWynJVFyjjuHYNllTXV
         vZ8A==
X-Gm-Message-State: AOAM53140pemk7CGS1k4QIzKV7mKX9DWfYVvKTePRMAdRbr7EY+v7KsT
        HEG6mxgib8XSebEu5bf5DveLPw4YCpafLQ==
X-Google-Smtp-Source: ABdhPJy6lTAflgRnSHpZVTx3Z6KE7cW5oFIiORIVj7tAXTrZSAMfzhaLj0wfhk608cOXcqojcODG1w==
X-Received: by 2002:a37:9581:: with SMTP id x123mr28672959qkd.163.1591731638458;
        Tue, 09 Jun 2020 12:40:38 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v8sm10513181qto.21.2020.06.09.12.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 12:40:37 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/8] arm64: dts: qcom: sm8250: add apps_smmu node
Date:   Tue,  9 Jun 2020 15:40:22 -0400
Message-Id: <20200609194030.17756-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200609194030.17756-1-jonathan@marek.ca>
References: <20200609194030.17756-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the apps_smmu node for sm8250.

For UFS, now that the kernel initializes the iommu, the stream mappings
set by the bootloader are cleared. Adding the iommus property is required
so that new mappings are created for UFS.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 107 +++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 2f99c350c287..035f4552a0ff 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -323,6 +323,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 
+			iommus = <&apps_smmu 0x0e0 0>, <&apps_smmu 0x4e0 0>;
+
 			clock-names =
 				"core_clk",
 				"bus_aggr_clk",
@@ -428,6 +430,111 @@ tlmm: pinctrl@f100000 {
 			wakeup-parent = <&pdc>;
 		};
 
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,sm8250-smmu-500", "arm,mmu-500";
+			reg = <0 0x15000000 0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			interrupts =    <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.26.1

