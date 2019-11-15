Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97270FDBD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfKOK7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:59:36 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34162 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfKOK7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:59:36 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B906A6039F; Fri, 15 Nov 2019 10:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573815575;
        bh=w4QH9kjVmgewfG3c+BF4ktAbybKdDQvOQoZ4mmz6X9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lDQs1qaaT9XX3UpHPH/gEKCml9WLCpNMY2KmSpv2OBD+Aw5FNJ8PO2zbFj/QXR2E5
         M6BiCaGaASMn1gmUXTmUwvr7BbmQtK0PALM1OXlldkOxCiosLTUNDwD+nvgoqlQom0
         HKVDdjP9h1tU/7Sy7MtZMXEicPthW7OubH/ULb0s=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C63F60B10;
        Fri, 15 Nov 2019 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573815575;
        bh=w4QH9kjVmgewfG3c+BF4ktAbybKdDQvOQoZ4mmz6X9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lDQs1qaaT9XX3UpHPH/gEKCml9WLCpNMY2KmSpv2OBD+Aw5FNJ8PO2zbFj/QXR2E5
         M6BiCaGaASMn1gmUXTmUwvr7BbmQtK0PALM1OXlldkOxCiosLTUNDwD+nvgoqlQom0
         HKVDdjP9h1tU/7Sy7MtZMXEicPthW7OubH/ULb0s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C63F60B10
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
Subject: [PATCH 1/2] dt-bindings: msm: Rename cache-controller to system-cache-controller
Date:   Fri, 15 Nov 2019 16:29:11 +0530
Message-Id: <83394ae827ce7c123228b749bcae2a2c470e88a4.1573814758.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DT schema checks for the node name 'cache-controller' and enforces
that there has to be a cache-level associated with it. But LLCC is
a system cache and does not have a cache-level property and hence
the dt binding check fails. So let us rename the LLCC cache-controller
to system-cache-controller which is the proper description and also
makes the schema happy.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index 558749065b97..79902f470e4b 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -47,7 +47,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    cache-controller@1100000 {
+    system-cache-controller@1100000 {
       compatible = "qcom,sdm845-llcc";
       reg = <0x1100000 0x200000>, <0x1300000 0x50000> ;
       reg-names = "llcc_base", "llcc_broadcast_base";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

