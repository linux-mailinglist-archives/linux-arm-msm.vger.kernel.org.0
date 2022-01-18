Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE0F4914B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 03:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244566AbiARCXn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jan 2022 21:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245050AbiARCWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jan 2022 21:22:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E8DC061773;
        Mon, 17 Jan 2022 18:22:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AF4E7B8123A;
        Tue, 18 Jan 2022 02:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8536EC36AF3;
        Tue, 18 Jan 2022 02:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642472565;
        bh=Md8Dqx+nRGL3CMsNgmIymZvqhFYYV4XirqyagqB0JFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hf2O7R1DG1Bbyv9mj/5ZZn992AwX4zZ94s+n/r4p4qzuAXSULIq5+vqfEme6coMB/
         UOb3boP2jAHcKy+V7MjPXW8dORfid1VE5zETGqROahw4llOooj2/qhu2mv/EWKKg5u
         bQpBi9ETngIK7PAJGnbGtuf1IAkcjT3S0H0V3sl1rw9XOQ7cYQGSOUK5qcb4eUtqD9
         /6aGnPblH7rOCWpJfomo+0NpHa7v4O081PXs0akLo05hULi8mg6L6b3dRsnzu2vVeG
         TEgEesqootSBe/earWcJM+x30bfDkpXU8j2oH4b8KggYbUfSHSlLHs19zVq+67bWOi
         y+Duify/4BLmw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sasha Levin <sashal@kernel.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 056/217] arm64: dts: qcom: sm8350: Shorten camera-thermal-bottom name
Date:   Mon, 17 Jan 2022 21:16:59 -0500
Message-Id: <20220118021940.1942199-56-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

[ Upstream commit f52dd33943ca5f84ae76890f352f6d9e12512c3f ]

Thermal zone names should not be longer than 20 names, which is indicated by
a message at boot. Change "camera-thermal-bottom" to "cam-thermal-bottom" to
fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20211114012755.112226-6-konrad.dybcio@somainline.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a8c040c564096..c13858cf50dd2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2447,7 +2447,7 @@ camera1_alert0: trip-point0 {
 			};
 		};
 
-		camera-thermal-bottom {
+		cam-thermal-bottom {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-- 
2.34.1

