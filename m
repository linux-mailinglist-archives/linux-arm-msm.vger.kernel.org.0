Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97CB3307C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbhCHGIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:08:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:44524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234609AbhCHGIm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:08:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27EB364FBD;
        Mon,  8 Mar 2021 06:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183722;
        bh=/CeJdUJeX6AzkcxokTjS78sV28+b0Nvhszn2Hx+GpZk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m325upgEWevvIESd2lc9YST9Psf26kvVvRmFNNl7g6I9ONwWUQndp/tKuo+bL0nlW
         9LOLS4Ikt1dPAaO9hcigpP/RPsP/QgMIc1lXc3/Gt6RLS5sxYrsUEWrgKF21xdXU2e
         t/sJLrgRkYWmgLQDKQfursbtmO4kvewZiXfWCLrV/uTSj1F4oRWUj78M1I+/WbFD3P
         nMePMqF2wo+b4mmpgiwEAWXd4p58vXt7tDqiYjlOHibhyrX8TqiIk7zlHRL9Apml0F
         bG9oRArzZjdDFPqEpEKPTZAIEC3cOKczIizOgDWLJeDM85lg0edyBXdKayUDdAQSEl
         XxnTl5YFSdzSw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] arm64: qcom: msm8916: don't use empty memory node
Date:   Mon,  8 Mar 2021 11:38:10 +0530
Message-Id: <20210308060826.3074234-3-vkoul@kernel.org>
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

arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml: /: memory:
	False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5353da521974..4c155735fbc9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -25,10 +25,10 @@ aliases {
 
 	chosen { };
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
-		reg = <0 0 0 0>;
+		reg = <0 0x80000000 0 0>;
 	};
 
 	reserved-memory {
-- 
2.26.2

