Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4905A2C967B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 05:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgLAE0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 23:26:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:33598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728118AbgLAE0R (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 23:26:17 -0500
Received: from localhost.localdomain (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA7B920796;
        Tue,  1 Dec 2020 04:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606796736;
        bh=k5S93RwtUuSKsKq34Q8HTWVl3/OBRYQRgm7ZmE5SZ0Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dIXasq65bZ1qjl9v5TYBmWHy7qZnE3agNsmifGYSozoFaMtqM5bZhdHUaaVfCooXM
         VBhQmggnGX5pXXfq+zGzHYCRZBnGCJ0/8gJxXq4HoOWD1JYIpp3Lv4EDPlKNKDHFZO
         vqCmqIb9CIGiibjgSo1LDA09dLXeWu7bz45j2tww=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: db845c: Enable gpi_dma0 node
Date:   Tue,  1 Dec 2020 09:55:20 +0530
Message-Id: <20201201042520.2116271-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201042520.2116271-1-vkoul@kernel.org>
References: <20201201042520.2116271-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

gpi_dma0 can be used for spi and i2c transfers on db845c, so enable it

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 7cc236575ee2..0653468f26ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -418,6 +418,10 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
 &gpu {
 	zap-shader {
 		memory-region = <&gpu_mem>;
-- 
2.26.2

