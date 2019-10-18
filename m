Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69613DC6B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 15:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408694AbfJRN5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 09:57:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47794 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404643AbfJRN5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 09:57:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EF48D611BD; Fri, 18 Oct 2019 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571407063;
        bh=Z9QUer5RoaSbIwfPWwdpc0lD2Veyk1wUP4npdE2dGPk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WvnzHPE8PS4bDMKZpUM08Jurvz5xtb16pB/g5RJPqVdpJeEwaTletvZlV+Mh4JzJZ
         Z4h8UHRfL3mWtPVg4r5tOWQQdD5zyZdYTR18rs0Zqi4x/YKtdoRNvm0sgr+q+cbtfT
         XezUWNZjnHksdfpEW6OwiLc2k8HT4qEdeDbzHaYc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 864F5611CF;
        Fri, 18 Oct 2019 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571407063;
        bh=Z9QUer5RoaSbIwfPWwdpc0lD2Veyk1wUP4npdE2dGPk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WvnzHPE8PS4bDMKZpUM08Jurvz5xtb16pB/g5RJPqVdpJeEwaTletvZlV+Mh4JzJZ
         Z4h8UHRfL3mWtPVg4r5tOWQQdD5zyZdYTR18rs0Zqi4x/YKtdoRNvm0sgr+q+cbtfT
         XezUWNZjnHksdfpEW6OwiLc2k8HT4qEdeDbzHaYc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 864F5611CF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: msm: Add LLCC for SC7180
Date:   Fri, 18 Oct 2019 19:27:09 +0530
Message-Id: <30f419d1612a3912e323287a96daa2b4fbe3dacd.1571406041.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1571406041.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571406041.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC compatible for SC7180 SoC.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
index eaee06b2d8f2..f263aa539d47 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
@@ -11,7 +11,9 @@ Properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be "qcom,sdm845-llcc"
+	Definition: must be one of:
+		    "qcom,sc7180-llcc",
+		    "qcom,sdm845-llcc"
 
 - reg:
 	Usage: required
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

