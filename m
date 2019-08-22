Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30B6999BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 19:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387708AbfHVRDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 13:03:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729506AbfHVRDH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 13:03:07 -0400
Received: from localhost.localdomain (unknown [171.61.89.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5B31233FE;
        Thu, 22 Aug 2019 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566493386;
        bh=lfVAKHj16esEkAReE/E5C9vGoxgfsaQfWvgRGQLgrNU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X8V+1z0ERRWQQ8HZ2RqqG0asDkIfuExM3QN3BZ4LFaVwBfiC+BrFmXkTkhTI1HRrG
         SGRT/wfPpYq0yDoCGyJVKnoyk2Xadqrv4JDYM02ArZL4K4wlZdEQYmE1uh5OVk+4xL
         uflDm/X68EGoXnW+kr3u0Me0G0yf9bLRm4nPwpAI=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: clock: Document the parent clocks
Date:   Thu, 22 Aug 2019 22:31:37 +0530
Message-Id: <20190822170140.7615-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822170140.7615-1-vkoul@kernel.org>
References: <20190822170140.7615-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With clock parent data scheme we must specify the parent clocks for the
rpmhcc nodes. So describe the parent clock for rpmhcc in the bindings.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
index 3c007653da31..8b97968f9c88 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
@@ -9,6 +9,9 @@ Required properties :
 - compatible : shall contain "qcom,sdm845-rpmh-clk"
 
 - #clock-cells : must contain 1
+- clocks: a list of phandles and clock-specifier pairs,
+	  one for each entry in clock-names.
+- clock-names: Parent board clock: "xo_board".
 
 Example :
 
-- 
2.20.1

