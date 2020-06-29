Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FC420E8B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 01:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbgF2W0Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 18:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgF2W0Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 18:26:16 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D749C061755;
        Mon, 29 Jun 2020 15:26:15 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w6so18450736ejq.6;
        Mon, 29 Jun 2020 15:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uLrF+jjxF5OBkT9A4ZfGcSFTtJNvBwrUYxVPDIS2euc=;
        b=ljl6F57/XOyWQURIpW+SYGe4bHNcdPifrgDCw24RC+hnGGqwpRlyGiY/mzZuA4sSbx
         TeYo3z8Ufl89Li/087qtQtJ9yTEh++OJ9m71n+SXhpzAK2T4jGhl7JXDxspZyWsnKxBu
         k7P9M0GtxOH6/gRBRnh9oUvWtpzmGljW6RVoQ3oU9OPOlmiVnyvdkhXZAVXFvXUf/tCr
         Tzz4eNbn/yV6INdTYHThjjxpw+43Ld5UmMcnks2I9V2HJlS/jAGLCxbe9ppqLydxFDLg
         8MRFCWGFJ3/f7cwHeSirkNItjyDGoJY5aXLch5LHVxMUKjAivXcrodHjiWs9Zq1Gpc5A
         iGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uLrF+jjxF5OBkT9A4ZfGcSFTtJNvBwrUYxVPDIS2euc=;
        b=Af+WQLx3TfmbH2C3ZDRuyfL7mruSENAq54LDCIs1wOZXiHtH6tNKU7oBGNR48xrwmz
         qNJNkuPnhgC0jnrc2dqSsOdSfqwbO2s18Nrq7g6P6Is6F1IuFJF+Xk47PU1CiwXSktdF
         2rf3A/iuOzCK7Tu2ryWSXNoIFu1qYR27HtSSMR3Y7kXNRBK0QhNH2lURoWv7AbHpihR7
         NyEfTHDzWvcRkUC+4vebU+B/k3ry07g3KVNQzXC5TyADiWXer8w3OKShIGr7SpPG6W/X
         jrf4Z6hKEbpxv658FojQ9AMaxvuW7vYLsMrx/5fdzXAu4GrwEjchIRS0iDGAcwcIbYma
         fF8w==
X-Gm-Message-State: AOAM530ll0wd8ObgTeTBBNLjQ74DdfZzBEkFiEtHfGEy+G1eHulfpEmY
        wY0JGVtpB3h9BlFxNenHKSg=
X-Google-Smtp-Source: ABdhPJxu0f3tnqjZ6HdE27eVb1JqxXjsWLvQl9OFzp7badrN8VqEab5KFGVI1t8l0ZpWVCoHu0dtXA==
X-Received: by 2002:a17:906:12cd:: with SMTP id l13mr16230422ejb.96.1593469574315;
        Mon, 29 Jun 2020 15:26:14 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id y21sm592877ejo.4.2020.06.29.15.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 15:26:13 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH -next] arm64: dts: sdm630: Temporarily disable SMMUs by default
Date:   Tue, 30 Jun 2020 00:26:10 +0200
Message-Id: <20200629222610.168511-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There happens to be an issue between how kernel handles
qcom-smmuv2 and how the hypervisor would like it to be
handled. That results in the platform hanging completely
after the SMMUs are probed.

Hence, disable the SMMU nodes temporarily, until the
issue is rectified.

This has been overlooked by me in the initial
porting stage, as my defconfig has SMMU disabled.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 88efe8200c80..deb928d303c2 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -518,6 +518,8 @@ anoc2_smmu: iommu@16c0000 {
 				<GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
 		};
 
 		tcsr_mutex_regs: syscon@1f40000 {
@@ -749,6 +751,8 @@ kgsl_smmu: iommu@5040000 {
 				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
 		};
 
 		lpass_smmu: iommu@5100000 {
@@ -778,6 +782,8 @@ lpass_smmu: iommu@5100000 {
 				<GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
 		};
 
 		spmi_bus: spmi@800f000 {
@@ -1074,6 +1080,8 @@ mmss_smmu: iommu@cd00000 {
 				<GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
 		};
 
 		apcs_glb: mailbox@17911000 {
-- 
2.27.0

