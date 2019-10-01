Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3549C4165
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 21:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfJAT4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 15:56:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57386 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfJAT4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 15:56:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B47C66118C; Tue,  1 Oct 2019 19:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569959804;
        bh=orDXO5+trawzKp2O78lZtQnDAbwOSc4c0DCVYkxy8uQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J043OAS88GXjw2MvPYsb7+RIDvqBHkxQ1EPFSutylgMHE8zGHPUZSLo4EoGAuMLYs
         AVkolk9PmWRm7KXgLMTwS83SPWc4ZYc8f7Qd2zKOvqUPATK27c35WmK5pN72uYd+6Y
         kETL8rVHYnwiHvlDtxqrfNPwTd/wLxSB7rj9lCmw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F11DB602CC;
        Tue,  1 Oct 2019 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569959804;
        bh=orDXO5+trawzKp2O78lZtQnDAbwOSc4c0DCVYkxy8uQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J043OAS88GXjw2MvPYsb7+RIDvqBHkxQ1EPFSutylgMHE8zGHPUZSLo4EoGAuMLYs
         AVkolk9PmWRm7KXgLMTwS83SPWc4ZYc8f7Qd2zKOvqUPATK27c35WmK5pN72uYd+6Y
         kETL8rVHYnwiHvlDtxqrfNPwTd/wLxSB7rj9lCmw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F11DB602CC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, marc.w.gonzalez@free.fr,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v6 2/6] arm64: dts: msm8998: Add xo clock to gcc node
Date:   Tue,  1 Oct 2019 13:56:33 -0600
Message-Id: <1569959793-8309-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GCC is a consumer of the xo clock.  Add a reference to the clock supplier
to the gcc node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index a0de62f10792..c926122566ae 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -743,6 +743,8 @@
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x00100000 0xb0000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
 		};
 
 		rpm_msg_ram: memory@778000 {
-- 
2.17.1

