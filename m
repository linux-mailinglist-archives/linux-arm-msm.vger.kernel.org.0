Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B0B3307E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbhCHGJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:44668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234708AbhCHGJO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45B8F64FBA;
        Mon,  8 Mar 2021 06:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183753;
        bh=6HEyuOMaC1HWY+ExybGMJE+ucVUOlQSu351C9NdQnEE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VgWjjFJwsr6Zx9hjzR020xtbtgO3MPgYoD1M8Y91Z7SjaRsMBxVdziLF1D48lwTiZ
         rruC9K64QSkScgjC/tV7ZOKLg3AbOu/bD7bXFKJ3jRWRr0MD6Dqgk8KVU2kpy3HUUq
         2zRrOuTKMJZS3zrJDVc7OzolauCOafb621YbotzY+YMRkj6UrW60eBBQegbD0WBecv
         nU3Zv0Qb3IoDDdi42mqzyTCZoALzr/a7213y8fNpyh3/aUhIpU5QGyYZ1GlyTHW2Wq
         GSTwUkyASuNGn6fbqxCcGMh9UfuOPJpYqmwdEm5udOEI9CTSgnF/qLTMsIIjdfsAJJ
         RQyVeFsn+adug==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/18] arm64: qcom: msm8996: don't use empty memory node
Date:   Mon,  8 Mar 2021 11:38:20 +0530
Message-Id: <20210308060826.3074234-13-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We expect bootloader to full memory details but passing empty values
can give warning, so add a default value

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 957487f84ead..0e2df537fb69 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -133,10 +133,10 @@ tcsr_mutex: hwlock {
 		#hwlock-cells = <1>;
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
-		reg = <0 0 0 0>;
+		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
 	psci {
-- 
2.26.2

