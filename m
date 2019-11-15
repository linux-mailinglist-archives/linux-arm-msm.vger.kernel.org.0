Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F584FDBDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfKOK7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:59:41 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34662 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfKOK7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:59:41 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AE31C60FF6; Fri, 15 Nov 2019 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573815580;
        bh=0CeatUUu67cKJ94G83JIPHr0HFJ4KEzJ4osRSG1ecA8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MbhIYZC/CmHN/SFZ+/poSf1wICUKN9RjcBdQ96yjCDds8bxGya3LDEbYNjZTZSMRY
         QajOQbAE/0Q6LbUNEeqRqQKfZ5BHeKvJejiBrqBI1Yb+6MjthXq4zLzymaDf47z90e
         YLp8mN8Nuu5hwTI7EVANMXr898IEpF9oEKY7psDs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C74760E0D;
        Fri, 15 Nov 2019 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573815580;
        bh=0CeatUUu67cKJ94G83JIPHr0HFJ4KEzJ4osRSG1ecA8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MbhIYZC/CmHN/SFZ+/poSf1wICUKN9RjcBdQ96yjCDds8bxGya3LDEbYNjZTZSMRY
         QajOQbAE/0Q6LbUNEeqRqQKfZ5BHeKvJejiBrqBI1Yb+6MjthXq4zLzymaDf47z90e
         YLp8mN8Nuu5hwTI7EVANMXr898IEpF9oEKY7psDs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5C74760E0D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 2/2] arm64: dts: sdm845: Update the device tree node for LLCC
Date:   Fri, 15 Nov 2019 16:29:12 +0530
Message-Id: <a2bb92de65e90768bf1d6b8c0b7fbd43cba704d2.1573814758.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

LLCC cache-controller was renamed to system-cache-controller
to make schema pass the dt binding check. Update the device
tree node to reflect this change.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..250b65e8f7e5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1357,7 +1357,7 @@
 			};
 		};
 
-		cache-controller@1100000 {
+		system-cache-controller@1100000 {
 			compatible = "qcom,sdm845-llcc";
 			reg = <0 0x01100000 0 0x200000>, <0 0x01300000 0 0x50000>;
 			reg-names = "llcc_base", "llcc_broadcast_base";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

