Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC04130DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 08:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgAFHIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 02:08:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:42388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726863AbgAFHIu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 02:08:50 -0500
Received: from localhost.localdomain (unknown [117.99.94.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B35DF21734;
        Mon,  6 Jan 2020 07:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578294529;
        bh=44oiUtfcaubKc2dXyAO0YR8fIfToGP2lW2jZ1pz+o68=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BSrfk4iPsNmCJT3YIROL/luxFKd7SAUeMLbVSzocX5TSDn8WUNgxpNdheISPfJf12
         lwpo8Dei+zrHohg6kgYDwzWLPFqaVlfEEVKIiAiXSFxUpi/RcqY8eoB/KVIRWCQSSK
         CWzwRVlNud/O0aHeh+acGAz3LVVxfPDv0ov+9V3c=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Can Guo <cang@codeaurora.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845: add the ufs reset
Date:   Mon,  6 Jan 2020 12:38:26 +0530
Message-Id: <20200106070826.147064-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106070826.147064-1-vkoul@kernel.org>
References: <20200106070826.147064-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the core UFS reset for sdm845

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..0c233afd7a5e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1374,6 +1374,8 @@ ufs_mem_hc: ufshc@1d84000 {
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_PHY_GDSC>;
 			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
 
 			iommus = <&apps_smmu 0x100 0xf>;
 
-- 
2.24.1

