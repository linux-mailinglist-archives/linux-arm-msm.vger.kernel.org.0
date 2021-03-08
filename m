Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F903307F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbhCHGJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:45080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234768AbhCHGJc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0216564FBA;
        Mon,  8 Mar 2021 06:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183772;
        bh=fp+9b5wserWc5MQbPnYHMfgQKjCT0MkFgK2BFn8shGw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n4FmGUAiVJIdi8c7/WKqUDKigZhoRbNu5+S1DCvYml61K3BqjDU/cy9Zfdwb8bRLM
         22X5yuo0QUW65XmexFHZKxTiNMFUAFps55trM6Jg2d0PlwOVDvcreTSNcYJUBw5BJw
         SQ9QKFCePyc+w5Fj8idi7dxs4hvOGCDlOFb20bVmABVoFr+ujQy7MkPOzyKbe05yl2
         qksaMEk0oKefIGYjZkAhfV4mMAsjKodcUz3Zb1l8gw6SX3o/M1nSjP7pSCDwTZY9ZT
         hB0kL1G6YZ5r0GaqernP3sB/mQshoH9odAeng3NibHPIEVTg98LS9ErxBjglyTZp2W
         uEzA/a2qK199g==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 18/18] arm64: qcom: ipq6018: drop '0x' from unit address
Date:   Mon,  8 Mar 2021 11:38:26 +0530
Message-Id: <20210308060826.3074234-19-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Nodes need not contain '0x' for the unit address. Drop it to fix the
below warning:

arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml: reserved-memory:
'memory@0x60000' does not match any of the regexes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9fa5b028e4f3..23ee1bfa4318 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -151,7 +151,7 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		rpm_msg_ram: memory@0x60000 {
+		rpm_msg_ram: memory@60000 {
 			reg = <0x0 0x60000 0x0 0x6000>;
 			no-map;
 		};
-- 
2.26.2

