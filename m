Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801FCB4C9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 13:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfIQLLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 07:11:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41776 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfIQLLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 07:11:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D64B361572; Tue, 17 Sep 2019 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568718694;
        bh=7hIzB6oKTC4MP+D6C/cxdS77AS6O7AIX6SIn4jlVxQQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m5HK3mEFb8cVsPASZOOm9mTVH0LXDkEdbRejx1iKENpEpzyphZafcBI4wMYxTvr0O
         MsFnVdYgMNQXUNn87lnVoYL82NVGnZEpK0PSSt5fxKy/qQXPZ2oWzykr2Ys99cyhZr
         7Fk0+ABvWDOv8T7Z5X6tOPKgEMI/FQ18Oy4q8Qwg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 49928607F4;
        Tue, 17 Sep 2019 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568718694;
        bh=7hIzB6oKTC4MP+D6C/cxdS77AS6O7AIX6SIn4jlVxQQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m5HK3mEFb8cVsPASZOOm9mTVH0LXDkEdbRejx1iKENpEpzyphZafcBI4wMYxTvr0O
         MsFnVdYgMNQXUNn87lnVoYL82NVGnZEpK0PSSt5fxKy/qQXPZ2oWzykr2Ys99cyhZr
         7Fk0+ABvWDOv8T7Z5X6tOPKgEMI/FQ18Oy4q8Qwg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49928607F4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH V3 3/3] arm64: dts: sdm845: Add interconnect properties for USB
Date:   Tue, 17 Sep 2019 16:40:49 +0530
Message-Id: <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate USB DT nodes with interconnect properties.

Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fcb9330..e4885f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1837,6 +1837,12 @@
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&rsc_hlos MASTER_USB3_0
+					 &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC
+					 &rsc_hlos SLAVE_USB3_0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: dwc3@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
@@ -1881,6 +1887,12 @@
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 
+			interconnects = <&rsc_hlos MASTER_USB3_1
+					 &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC
+					 &rsc_hlos SLAVE_USB3_1>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_2_dwc3: dwc3@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

