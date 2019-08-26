Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 270409CF55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 14:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731631AbfHZMQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 08:16:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:38216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731709AbfHZMQm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 08:16:42 -0400
Received: from localhost.localdomain (unknown [122.178.200.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F03FC2186A;
        Mon, 26 Aug 2019 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566821801;
        bh=hnznFt9S7TVw1/KfY6zUnuJXYTwixNogOEE40VUowrI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0sXyZYigBh4TrJe6smGL37q+Ee/L9BzKwt9ObXenB8R9ItN0fP72Ya6im9Af78p1s
         eETHxBqaG0Zfq9c/rseZUACBZl/EqNi0e1MgAXf/YTMusk5oZt+CenH1qI5hzeOd3V
         p8WImPQnWrqKNAalY9GfLWv5JZdXZNdEawioIaXY=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] dt-bindings: clock: Document SM8150 rpmh-clock compatible
Date:   Mon, 26 Aug 2019 17:44:52 +0530
Message-Id: <20190826121453.21732-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826121453.21732-1-vkoul@kernel.org>
References: <20190826121453.21732-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM8150 rpmh-clock compatible for rpmh clock controller
found on SM8150 platforms.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
index 8b97968f9c88..365bbde599b1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
@@ -6,7 +6,9 @@ some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
 other hardware subsystems via RSC to control clocks.
 
 Required properties :
-- compatible : shall contain "qcom,sdm845-rpmh-clk"
+- compatible : must be one of:
+	       "qcom,sdm845-rpmh-clk"
+	       "qcom,sm8150-rpmh-clk"
 
 - #clock-cells : must contain 1
 - clocks: a list of phandles and clock-specifier pairs,
-- 
2.20.1

