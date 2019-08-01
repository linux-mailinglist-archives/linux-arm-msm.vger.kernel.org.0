Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC0037D8D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2019 11:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731281AbfHAJw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Aug 2019 05:52:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:45820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728654AbfHAJw1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Aug 2019 05:52:27 -0400
Received: from localhost.localdomain (unknown [122.178.237.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 388472087E;
        Thu,  1 Aug 2019 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564653147;
        bh=DibGEmcJUMbVDWiJr1W9ZE8KkrALqz9LOBPN915XToE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AKqzUMlUdPDQkPW70TCAmrQn6phDu8tgiXFEOgAp7k5jKII5S5SZo/0h9NdOJJVVC
         II4k/siMflk4POZQvY8HVunNayFNEdgR6fs9Gwlfh8ONPaLoML5ebRD7Umg+Yfpn0+
         eiQ2hUEhTZ9wYxqSz7YT3d+iJE83P82uP5tAhVUw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: pms405: remove reduandant properties
Date:   Thu,  1 Aug 2019 15:20:48 +0530
Message-Id: <20190801095049.13855-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801095049.13855-1-vkoul@kernel.org>
References: <20190801095049.13855-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

pms405@1 nodes specified unnecessary #address-cells/#size-cells but the
subnodes dont have "ranges" or "reg" so remove it

arch/arm64/boot/dts/qcom/pms405.dtsi:141.21-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pms405@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index a28386900a3b..ff4005186895 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -141,8 +141,6 @@
 	pms405_1: pms405@1 {
 		compatible = "qcom,spmi-pmic";
 		reg = <0x1 SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		pms405_spmi_regulators: regulators {
 			compatible = "qcom,pms405-regulators";
-- 
2.20.1

