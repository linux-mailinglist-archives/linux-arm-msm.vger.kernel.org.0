Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13653307CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbhCHGIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:08:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:44558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234616AbhCHGIt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:08:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C93B64FBD;
        Mon,  8 Mar 2021 06:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183728;
        bh=x88xgCfsyQspV4xvGjG2lJoGWwyFLPHujbBYoMCkjG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t68/+dUcxLpG7Q3O9n2KB+BUdvJUSCOPP5LDiDy47GjpBSOFySEhp/7vd3K+ZYYDd
         B+RIcprs/bxxLgM+iKHXr/x6SySixys32f2kvoRAnD4/IXuXVQ36ukqlk68E9CMYLU
         YIjaseP6nYmsPiSxnmj9fJTJcedDAaLOvDaPewECC312v75u/n36n7hPCrqJ15CcTV
         V9ctI+eEWBoEG45mH8w9eImvRNFfQnw7ejbQOknSpELbvnyl8XqeI79Mq0Aeh6pg3l
         TwUNn0m8bEWw6SyOfMdLGYzdg8PI55Tyh9SboGAjuBmWprLPUKXxfqSoyRXwOYSFg0
         u6RNp0bgyh92A==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/18] arm64: qcom: msm8994: don't use empty memory node
Date:   Mon,  8 Mar 2021 11:38:12 +0530
Message-Id: <20210308060826.3074234-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We expect bootloader to full memory details but passing empty values
gives warning, so add a default value

arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dt.yaml: /: memory:
	False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index f49d442d2edf..f9f0b5aa6a26 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -149,10 +149,10 @@ scm {
 		};
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
-		reg = <0 0 0 0>;
+		reg = <0 0x80000000 0 0>;
 	};
 
 	tcsr_mutex: hwlock {
-- 
2.26.2

