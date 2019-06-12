Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCB342F9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 21:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387892AbfFLTLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 15:11:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44370 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfFLTLD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 15:11:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E9C4860867; Wed, 12 Jun 2019 19:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560366662;
        bh=79Ex74BMthmSa3BqruOYYxbpDj6SWmYaaXQEPP+Ys7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FW2i/Ii5I4okEUzAjLKEC6RgG/3cF+mVfTWjv6WRM3m83jO+2dAtTLo88wNBuOSJK
         wECrmS6e22dP922EUBlWoBrqfI4EQ8VGZwGe8twVqTLKNNNGT2xnlNrXXlsQdBxn/Y
         tffW3uNYUKlBtzSnYlWtwiIABL0PN3xqqb2LL/6A=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A2FD602F4;
        Wed, 12 Jun 2019 19:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560366659;
        bh=79Ex74BMthmSa3BqruOYYxbpDj6SWmYaaXQEPP+Ys7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pNCppgpIfC+9nypzlIg30tVN/OX50ZN0lbc94OEtzIKjAH9ja6c047bQprFTqOz95
         08pwrcaQOXbzLLSVH3S88zZnxc0FriuT2GqyhyGJm6bUOWTErgh1PO0pbGSQpZgQgL
         N2j3i1fnKRfKTD69O/tMAHTtpyxmZ0ATIMyidgIw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A2FD602F4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v5 1/6] dt-bindings: clock: Document external clocks for MSM8998 gcc
Date:   Wed, 12 Jun 2019 13:10:48 -0600
Message-Id: <1560366648-5886-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560366600-5826-1-git-send-email-jhugo@codeaurora.org>
References: <1560366600-5826-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The global clock controller on MSM8998 can consume a number of external
clocks.  Document them.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index 8661c3c..7d45323 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -28,6 +28,16 @@ Required properties :
 - #clock-cells : shall contain 1
 - #reset-cells : shall contain 1
 
+For MSM8998 only:
+	- clocks: a list of phandles and clock-specifier pairs,
+		  one for each entry in clock-names.
+	- clock-names: "xo" (required)
+		       "usb3_pipe" (optional)
+		       "ufs_rx_symbol0" (optional)
+		       "ufs_rx_symbol1" (optional)
+		       "ufs_tx_symbol0" (optional)
+		       "pcie0_pipe" (optional)
+
 Optional properties :
 - #power-domain-cells : shall contain 1
 - Qualcomm TSENS (thermal sensor device) on some devices can
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

