Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130109CF4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 14:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731672AbfHZMQe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 08:16:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:37912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731592AbfHZMQd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 08:16:33 -0400
Received: from localhost.localdomain (unknown [122.178.200.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 645B62184D;
        Mon, 26 Aug 2019 12:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566821793;
        bh=Q7kiEkSXrf3gA7puG/o7zAZMeX+4Qx+gMA0f7vCks6g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KR1SGY6LYpLMg8NyMcu6nDx1CFdoBfef/yI9Ym3im5O/Q+MolbGw0Deq0TSwVt5Cu
         jthMgNuRXOylqkimoMO+/KeBfRjcaQUDFNgLfpgN4/SX98OjRDts+o1YDfYth3Fl5M
         U4d+fyba7gsQ9I7WNMVFb4tE7kMf0JjOSlMaJeis=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: clock: Document the parent clocks
Date:   Mon, 26 Aug 2019 17:44:50 +0530
Message-Id: <20190826121453.21732-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826121453.21732-1-vkoul@kernel.org>
References: <20190826121453.21732-1-vkoul@kernel.org>
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
+- clock-names: Parent board clock: "xo".
 
 Example :
 
-- 
2.20.1

