Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2076141D5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 09:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408582AbfFLHQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 03:16:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45980 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403831AbfFLHQZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 03:16:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 18DEB60265; Wed, 12 Jun 2019 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560323784;
        bh=jKTJ9ZrZ6EFrkiwQkIMVckjzgUxXO6La0Ii8Ot5rqEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ojTbSggAy0YXRJvvIBe8Egg4ggrE7DrLaIF7D3vM1KuEcKp1Ud/bYth1DGhryV4PP
         S4ipiJa2Cwb02jTT/UHbZ+vZyTAp73GUg7XTJcr1dUDaqFmrEtul2C1xXRVq3BtUxJ
         LOV4kG7SnqKPvgf1jABURIYc4wC2xdjFkNIM7YCo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DF9660DAB;
        Wed, 12 Jun 2019 07:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560323783;
        bh=jKTJ9ZrZ6EFrkiwQkIMVckjzgUxXO6La0Ii8Ot5rqEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W8usSLa8PJFP9GOoYaVgym2ZNLcyks5Bh/JQnF1ZcfwOl3yeFiTQE/SqSdN82nBAE
         DqshXc8mF7tK2uhUC5J1i8dEw5SZj4VGZS0wl03Xt8fT2lYtaeHK8nKGwpQRHW40nL
         6BQj40xQNR9d9gRHZbVI0C/ZIuLkFsOsbe1s6lmQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DF9660DAB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, will.deacon@arm.com,
        robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, david.brown@linaro.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v3 4/4] arm64: dts/sdm845: Enable FW implemented safe sequence handler on MTP
Date:   Wed, 12 Jun 2019 12:45:54 +0530
Message-Id: <20190612071554.13573-5-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
In-Reply-To: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Indicate on MTP SDM845 that firmware implements handler to
TLB invalidate erratum SCM call where SAFE sequence is toggled
to achieve optimum performance on real-time clients, such as
display and camera.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 78ec373a2b18..6a73d9744a71 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2368,6 +2368,7 @@
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
 			#iommu-cells = <2>;
+			qcom,smmu-500-fw-impl-safe-errata;
 			#global-interrupts = <1>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

