Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEE78D31A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 14:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfHNMba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 08:31:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:53910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfHNMba (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 08:31:30 -0400
Received: from localhost.localdomain (unknown [171.76.115.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15E8D2084D;
        Wed, 14 Aug 2019 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565785889;
        bh=w9HQPoZIgpONwPkioEJV5bg1Lcnny8iuloWY0frHzRo=;
        h=From:To:Cc:Subject:Date:From;
        b=L1693v/RQ38L2/soaB+G6KsLFJMf8wYLVrLOFmBnx3vYkKOTVkOwh2lMeEMOpCsUl
         mnLmkXkPNWCRxhhh+YHB89VXypUhbEhpIDA/n/3sRTyPudeyJl1lofNTq2ilCIKR5T
         eF6lV6OFKbrdoYZXNhBs4H9hmRVWDt20RGNW1k44=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Document SM8150 rpmh-clock compatible
Date:   Wed, 14 Aug 2019 17:59:57 +0530
Message-Id: <20190814122958.4981-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM8150 rpmh-clock compatible for rpmh clock controller
found on SM8150 platforms.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
index 3c007653da31..82dee80cdbf3 100644
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
 
-- 
2.20.1

