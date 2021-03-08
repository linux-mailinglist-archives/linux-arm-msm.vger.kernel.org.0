Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D923307F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbhCHGJz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:44708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234711AbhCHGJX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4D4465142;
        Mon,  8 Mar 2021 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183763;
        bh=ltNqCWPmhua8yJY6ItfV1CHFPpzCJDbXdDadfv3wEig=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HIlyX7QvcyXSVges5cLDyoK7dY9ga+Wj2DoJlDwNWdy2iqeyK1hHbsd1JEuqrOSSO
         9O7+QEIIM3f1+tiK1x5evukKzejldPrRSO9v5MmjsMj0ZJfzozfIL95wfDW+BK7JOk
         dGpuOPDGUeLsp80NhaASmqoDt6ul4YFEO68xuhlUEWC8HRO1j+szcpCciI55uy37rK
         DmLiUFb9umdM2i5xs0Q7h+me05TAhAeP5T9pvsAq48oahbyC+fhBBjkOKRPes/9RTs
         1rBeTabKvg7AWNGlPlM4roecSMT36QRCdorjDh43ys3Ol4srQ+ppoForqZtwNhkRPG
         srGqPulOmi45w==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/18] arm64: qcom: sdm660: don't use empty memory node
Date:   Mon,  8 Mar 2021 11:38:23 +0530
Message-Id: <20210308060826.3074234-16-vkoul@kernel.org>
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
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index a1133f23593a..077abcb195ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -208,10 +208,10 @@ scm {
 		};
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

