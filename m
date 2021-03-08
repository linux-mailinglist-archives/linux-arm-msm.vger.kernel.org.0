Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A933307DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbhCHGJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:44636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234706AbhCHGJH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A46065142;
        Mon,  8 Mar 2021 06:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183747;
        bh=OiQCBCJSpENOJ02ifIukpX0Q4P5sv75owsQDZHNKCfE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LxgUeBIoJ/2oXKMobHOVmIDb00EBKs21rpdDH+fSfkwfn2LFMt53OkuFPY8gwzdk2
         OtmNScEKhfRGqPMI8bsfD4AnedW+TjYzh0+SWtXdAx6lAK74jaaZrRrLELdxqPZMjz
         vD9kL5JQuscaSSq91i7P7u18EKctYT44HQ5xNgREMiDud548bYqSDcogH8Tqxg6HVO
         JL71AYRo6zuo4cSjc0LTRC4YZdAsfEaAMxI90u9GXkbB7/N/L7WRj/z14P4JOkfudx
         eJsKWYF2ni7QKMP8wmS/DrQuvWnNaKgLOzeZD0jI/9SSqSz6v8E8Uue9839nnsOkxJ
         ZVCjqhrHVz/7Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/18] arm64: qcom: sdm630: don't use underscore in node name
Date:   Mon,  8 Mar 2021 11:38:18 +0530
Message-Id: <20210308060826.3074234-11-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have underscore (_) in node name so fix that up as well.

Fix this by changing node name to use dash (-)

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index f91a928466c3..5a7cf85d0cf1 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -17,14 +17,14 @@ / {
 	chosen { };
 
 	clocks {
-		xo_board: xo_board {
+		xo_board: xo-board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
 			clock-output-names = "xo_board";
 		};
 
-		sleep_clk: sleep_clk {
+		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32764>;
-- 
2.26.2

