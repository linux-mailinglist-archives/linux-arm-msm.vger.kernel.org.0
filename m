Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85068726ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 06:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfGXEug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 00:50:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:58108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbfGXEug (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 00:50:36 -0400
Received: from localhost.localdomain (unknown [171.76.105.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C12F7227BF;
        Wed, 24 Jul 2019 04:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563943835;
        bh=Fam9FD2jC0zlN1Ro9Vuo4IyhDEfAbHi13xAq1hJbJD4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r9nASOr636dVCYUNx6yuwPJfemzTeOBWDlO+cEMtO7ibDyyrjznjOhd7XHk9fQNpp
         h1p45Qmud1uhw2WxF6OwKDeuoaPSvoQCnV6dWsXC9NwcwgeWbJdWasZT0IpIqREU+Y
         Hhf+e5FsoGQofLW1He9wEg5lQ35QAI0loJfEk9Jw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v2 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
Date:   Wed, 24 Jul 2019 10:19:02 +0530
Message-Id: <20190724044906.12007-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724044906.12007-1-vkoul@kernel.org>
References: <20190724044906.12007-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We get a warning about missing unit name for soc node, so add it.

arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 601cfb078bd5..e81f4a6d08ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -620,7 +620,7 @@
 		method = "smc";
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
-- 
2.20.1

