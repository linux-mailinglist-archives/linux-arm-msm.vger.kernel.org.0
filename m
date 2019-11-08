Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02731F5963
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 22:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbfKHVNa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 16:13:30 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34174 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfKHVNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 16:13:30 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7F3B260F36; Fri,  8 Nov 2019 21:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573247609;
        bh=2AurMBg7hvejscEwK1G6HZ2mBPopZUAdowPTlBi21Y0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TAKb0ZJE3uWajWWKKjxZZiqBN5MXoWUv6YyYV1M5DUJzgyw4RhFFfVMs/pnXAJqIR
         O6sc1yKFvw2Etnb+GejzdNCik8+lbSIPxznpZSnTV0quCXtjG+AFssv9jSrTkgXDGL
         49YGAxvW7qB597YFO27HWtzbTxQoYYzurD21og0w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 41CD860D95;
        Fri,  8 Nov 2019 21:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573247609;
        bh=2AurMBg7hvejscEwK1G6HZ2mBPopZUAdowPTlBi21Y0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TAKb0ZJE3uWajWWKKjxZZiqBN5MXoWUv6YyYV1M5DUJzgyw4RhFFfVMs/pnXAJqIR
         O6sc1yKFvw2Etnb+GejzdNCik8+lbSIPxznpZSnTV0quCXtjG+AFssv9jSrTkgXDGL
         49YGAxvW7qB597YFO27HWtzbTxQoYYzurD21og0w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 41CD860D95
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v7 2/6] arm64: dts: msm8998: Add xo clock to gcc node
Date:   Fri,  8 Nov 2019 14:13:19 -0700
Message-Id: <1573247599-19937-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org>
References: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GCC is a consumer of the xo clock.  Add a reference to the clock supplier
to the gcc node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c6f81431983e..2f0d4366724b 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -793,6 +793,18 @@
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x00100000 0xb0000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "usb3_pipe",
+				      "ufs_rx_symbol0",
+				      "ufs_rx_symbol1",
+				      "ufs_tx_symbol0",
+				      "pcie0_pipe";
 		};
 
 		rpm_msg_ram: memory@778000 {
-- 
2.17.1

