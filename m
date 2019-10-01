Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF32DC415F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 21:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfJATzc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 15:55:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57068 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfJATzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 15:55:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A9914608CE; Tue,  1 Oct 2019 19:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569959730;
        bh=SMDemZ2jylVYp7M9zz2KtCfeo8/M/DyZIh4zWvUoaXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gATveY+u+Zce5NUUZ82zPiiaEgz3TRzOtf+YQCZPpFiY7KbD4328LyfhlCI78y4O9
         QFq6o7beiiS/0oWNZrJ57DpplccTt4x3pfmkZv+aOagfQb5nzSFiOXmMbm8CRfFwQJ
         JuVQ6jPU4bqGCsA1UEs0TdLpgIoutNEzPJHJY4aM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BCA2608CC;
        Tue,  1 Oct 2019 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569959727;
        bh=SMDemZ2jylVYp7M9zz2KtCfeo8/M/DyZIh4zWvUoaXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q7t6f140Pr8KBse4yp5CrKLpQVDmyrooCGkTjmSN1+CrzScn6X1vzpGDOZRqfTX3/
         FlRL7N6oyAoTZX5M5pXpQQWzbF3N+ADFy230Kc5sygvhPrihCPQsS1JLLJarHbVJEz
         3UVPSEKvqN86ZFDMj8WRK6jmxWX/Fdh+TM/ZdAMk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9BCA2608CC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v6 1/6] dt-bindings: clock: Document external clocks for MSM8998 gcc
Date:   Tue,  1 Oct 2019 13:55:18 -0600
Message-Id: <1569959718-5256-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The global clock controller on MSM8998 can consume a number of external
clocks.  Document them.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index d14362ad4132..32d430718016 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -29,6 +29,16 @@ Required properties :
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
2.17.1

