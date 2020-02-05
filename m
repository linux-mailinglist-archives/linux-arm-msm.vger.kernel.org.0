Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28C0715268E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 08:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgBEHBy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 02:01:54 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:34774 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726386AbgBEHBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 02:01:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580886113; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FAAy3O1hxyU0/+fvL1xrHaa2WdkrwTdW+HGQMimJI18=; b=PiZYNMCUK/13eBrMSzk2fIkjJjUW9pIdeT6ptAP+qLe4gzsCL1jvWJsLk7soZMneEZP6k1o3
 1Quoq4CZ1HnwHR6DZs01rxHRyTNASu87EViijNlM2AeOuKuKbTI04Nr+S8egF97L94HQptLX
 qNh/isot7JOFPbvgSNP6US88xsY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a6860.7ff3e069f110-smtp-out-n03;
 Wed, 05 Feb 2020 07:01:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 12AFFC447A3; Wed,  5 Feb 2020 07:01:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61BF6C43383;
        Wed,  5 Feb 2020 07:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61BF6C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jcrouse@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 1/3] dt-bindings: clk: qcom: Add support for GPU GX GDSCR
Date:   Wed,  5 Feb 2020 12:31:35 +0530
Message-Id: <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

In the cases where the GPU SW requires to use the GX GDSCR add
support for the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 include/dt-bindings/clock/qcom,gpucc-sc7180.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gpucc-sc7180.h b/include/dt-bindings/clock/qcom,gpucc-sc7180.h
index 0e4643b..65e706d 100644
--- a/include/dt-bindings/clock/qcom,gpucc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,gpucc-sc7180.h
@@ -15,7 +15,8 @@
 #define GPU_CC_CXO_CLK			6
 #define GPU_CC_GMU_CLK_SRC		7
 
-/* CAM_CC GDSCRs */
+/* GPU_CC GDSCRs */
 #define CX_GDSC				0
+#define GX_GDSC				1
 
 #endif
-- 
1.9.1
