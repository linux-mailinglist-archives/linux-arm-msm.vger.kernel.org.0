Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA867103ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 04:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfEACZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 22:25:41 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41190 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbfEACZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 22:25:41 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3F6EC608BA; Wed,  1 May 2019 02:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556677540;
        bh=gzQuKl0o/e3tySi7jEcUIRPo7BWItIraq2Tmj80meag=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MO1UKSl3UPGs79tnt/brtHCrNuUeMLWKYI38CtjSbB4ZaXA0lGcM43kwPWcD4nefN
         dAMQDvh7r9JjIOUl3Ji3t/YdO9Z9OHQZNet1yo+Dq6N4FJWFRiEG2T1baizBhB9gFm
         Fei3uND23EGQW3LtlieyVZgKZ+vKzhZKeO1djJNg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 052396074F;
        Wed,  1 May 2019 02:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556677540;
        bh=gzQuKl0o/e3tySi7jEcUIRPo7BWItIraq2Tmj80meag=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MO1UKSl3UPGs79tnt/brtHCrNuUeMLWKYI38CtjSbB4ZaXA0lGcM43kwPWcD4nefN
         dAMQDvh7r9JjIOUl3Ji3t/YdO9Z9OHQZNet1yo+Dq6N4FJWFRiEG2T1baizBhB9gFm
         Fei3uND23EGQW3LtlieyVZgKZ+vKzhZKeO1djJNg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 052396074F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org
Cc:     marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v3 2/6] arm64: dts: msm8998: Add xo clock to gcc node
Date:   Tue, 30 Apr 2019 20:25:31 -0600
Message-Id: <1556677531-29291-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GCC is a consumer of the xo clock.  Add a reference to the clock supplier
to the gcc node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 574be78..9c88801 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -709,6 +709,8 @@
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x100000 0xb0000>;
+			clock-names = "xo";
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
 		};
 
 		tlmm: pinctrl@3400000 {
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

