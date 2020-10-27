Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB40529BE66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 17:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1812894AbgJ0Qqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 12:46:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:43716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1812312AbgJ0Qpn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 12:45:43 -0400
Received: from localhost.localdomain (unknown [122.171.48.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6515621707;
        Tue, 27 Oct 2020 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603817142;
        bh=Q9RanN8iT0m1BiOGDnVGH4ZkRarcOsIEUsvKRd1xCJQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i+Ts+VHIfFZ2N3WZvl5joyqrw0Kr9Z0AGC1PQoPclf73n6HuKwNFmC9dkxuqx4LZB
         FzsdXQY7yhY5RZlwGhdVhE96USSP/Wrw7IdXdUNcQhW+iRLsSiPYxu8Pxh9DNmksdM
         ShpM/HaZ/P/wGRu30j3SsSGLNbEnRlOI9e1nhDAI=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: msm8996: Fix dma node name
Date:   Tue, 27 Oct 2020 22:15:08 +0530
Message-Id: <20201027164511.476312-7-vkoul@kernel.org>
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
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index fd6ae5464dea..7eef07e73e25 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1990,7 +1990,7 @@ dwc3@7600000 {
 			};
 		};
 
-		slimbam: dma@9184000 {
+		slimbam: dma-controller@9184000 {
 			compatible = "qcom,bam-v1.7.0";
 			qcom,controlled-remotely;
 			reg = <0x09184000 0x32000>;
-- 
2.26.2

