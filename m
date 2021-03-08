Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809083307D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234722AbhCHGJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:44612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234616AbhCHGJB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C913A64FBD;
        Mon,  8 Mar 2021 06:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183741;
        bh=FGIHYmf7iT/D1XBipsUjl82nWI+R+H7YT3CuI8KD/t0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nc3q+CyALukDMpq3JDfoIh6D6hIiNrFWT8e2TYg4lOxL4Bg6DAD1NWRCI3z2muGPN
         N+XgX08Ne5050fPuXoNdc8+K9PZrSBkQN/h/jRSQH+KrXbyR2PcCvrujwGHTBI45re
         ZoKNWQM6lBS0b9HU85CoSLAalc/CLhC+I6ElTao4HSlnhEhZEfRs/Yw4vFbfp3d4J+
         GNDbt1sgf5IGrRFo7cBsaNWHDAdmYU3M2avDtQCLwxezoN9idocpRSV8fKirMr3t/Z
         5aTGtNjm8KxsUI57VmreiA6Gv7vwNJ/bqvbE2VJ17LOim3cJPoJ0drRGqx1q0EXD3U
         5cFeECcOGnPlQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/18] arm64: qcom: msm8994: don't use underscore in node name
Date:   Mon,  8 Mar 2021 11:38:16 +0530
Message-Id: <20210308060826.3074234-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have underscore (_) in node name leading to warning:
arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dt.yaml: clocks: xo_board: {'type': 'object'} is not allowed for {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[19200000]], 'phandle': [[26]]}
arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dt.yaml: clocks: sleep_clk: {'type': 'object'} is not allowed for {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[32768]]}

Fix this by changing node name to use dash (-)

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index f9f0b5aa6a26..6596559a82b7 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -15,13 +15,13 @@ / {
 	chosen { };
 
 	clocks {
-		xo_board: xo_board {
+		xo_board: xo-board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
 		};
 
-		sleep_clk: sleep_clk {
+		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
-- 
2.26.2

