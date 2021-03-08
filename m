Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E29123307F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234842AbhCHGJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:45066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234748AbhCHGJ3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC010651EE;
        Mon,  8 Mar 2021 06:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183769;
        bh=zSgOVMFY8TEvOvkrrdvGxzHOUOHPNBi2Hd3OzAt2IF0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bJHNJfhQX+8/bTtDPSwbspjy3W68iluHvTa9E7pX7n+Il5DYxfape24lyPGVTC8Dv
         od2hDufxtAWGPO8a/P5G0QzGtn6FWoFTvbq/0UnokN8dNIjJqvwqQgD0aAp3rubFBI
         M8BB9Nm43bE7TgNXR96BvXJwZOnEJBy5KEh6mwkNmRwgPB9eR0mTRqeM0kaoO8KMZI
         NN20MpS0k/6l7Eq4YyZDH2DhYTfAuK9sW5/gkqnb/jYzWQ3MzBzGqS/u8T2s976cdR
         xI6YdUbMrs6dE1I8Oqie1EsnRcwHC3gZWfmdc5JFdMH4QItSIXRFXE1wQeNPggUmNc
         BKXbJo02L6DLw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/18] arm64: qcom: sdm660: use reg value for memory node
Date:   Mon,  8 Mar 2021 11:38:25 +0530
Message-Id: <20210308060826.3074234-18-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

memory node like other node should be node@reg, which is missing in this
case, so fix it up

arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824, 0, 536870912]]}

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index e8c37a1693d3..cc08dc4eb56a 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -20,7 +20,7 @@ chosen {
 		stdout-path = "serial0";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x0 0x20000000>;
 	};
-- 
2.26.2

