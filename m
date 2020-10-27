Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF3529BE61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 17:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1812886AbgJ0Qqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 12:46:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:43466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1812030AbgJ0Qp1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 12:45:27 -0400
Received: from localhost.localdomain (unknown [122.171.48.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CFD821707;
        Tue, 27 Oct 2020 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603817126;
        bh=4v7zh27ORsfciMvsOcyrT5ZixmMtvVq8qNjjQ0wj2sk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=02ziPW6Lllo+x2kbbGoroTrrlTt5D8Jv1QjlDymoUeeqVQQV6CVkXAlw2MWZsQedK
         fZKAz1JHYyZgm+3rLKEvQhG3ugxJBJL30Hi3nEbrGSN4uXJ4E7xjA+Wy2A1LnR7x4c
         WGnDumw/GPIZZvEKAGajVsEV027lpOjje8bPg9YE=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: sdm845: Fix dma node name
Date:   Tue, 27 Oct 2020 22:15:03 +0530
Message-Id: <20201027164511.476312-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027164511.476312-1-vkoul@kernel.org>
References: <20201027164511.476312-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DMA controller binding describes the node name should be dma-controller
and not dma, so fix the node name

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 40e8c11f23ab..ba60fb398c0b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4484,7 +4484,7 @@ msi-controller@17a40000 {
 			};
 		};
 
-		slimbam: dma@17184000 {
+		slimbam: dma-controller@17184000 {
 			compatible = "qcom,bam-v1.7.0";
 			qcom,controlled-remotely;
 			reg = <0 0x17184000 0 0x2a000>;
-- 
2.26.2

