Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44AD691E22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 09:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfHSHll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 03:41:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbfHSHll (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 03:41:41 -0400
Received: from localhost.localdomain (unknown [122.182.221.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 924E8204EC;
        Mon, 19 Aug 2019 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566200500;
        bh=lQZiulkfKhPqRLl9JCGmbJd87pnD79zb+VGOit3ZwcI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y606qtAriKjK7JHFHN/KXXZNNuEHPF2hoXABt7Z5mOyjMJuNJ1Ml/NZVgYxSBSyRr
         g8SPFHZ7hd3KqToh/fy0vXxs49m8seQVwosds+vD0tjdGpEzblXx/DxTuIdkqYq/dr
         ZuVoqt4yNJ5ea705uVEcORpMDiTLN2uL4mJ5pxZo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clock: Document the parent clocks
Date:   Mon, 19 Aug 2019 13:09:44 +0530
Message-Id: <20190819073947.17258-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819073947.17258-1-vkoul@kernel.org>
References: <20190819073947.17258-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With clock parent data scheme we must specify the parent clocks for the
rpmhcc nodes. So describe the parent clock for rpmhcc in the bindings.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
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

