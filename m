Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEDF3307E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbhCHGJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:44652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234707AbhCHGJK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2750064FBA;
        Mon,  8 Mar 2021 06:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183750;
        bh=qKcyX46rWnNHB1lObb0O4trFwvVe5WnvWwCU7JZAhEE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X1HWtjvrK7yQ1T6chTQ2LLELwAcUx8QVpw4bRsQXw1o13jPqluplApf3qM7vhuLVX
         +jirUVvJvKjwSSySe0qoQ8iHYQGgK9dkVtkXv1BSrXeuq+OQDQcJV3nwgHPtDXzObg
         CCwyH2an/sjTRD4HDi0FDovNZLx74kjhrbzCfiUP0pAAxWwfIw1IIJOJnTEaCpqxmf
         pOkFMibXSACZ5cAQZGKrSjay6lTQslYqepvYrKp5LNUO3mMsu9fAlsJ3oDvLhlq+NU
         /K7md28mWMD9F5CSWYHih9Cg+zu+ZqbFolVrZ7g/RwnTJyD6sq90fDAnrQKv92kqNf
         AYnbiLLM7uptw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/18] arm64: qcom: sdm660: don't use underscore in node name
Date:   Mon,  8 Mar 2021 11:38:19 +0530
Message-Id: <20210308060826.3074234-12-vkoul@kernel.org>
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
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 4abbdd03d1e7..a1133f23593a 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -16,14 +16,14 @@ / {
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

