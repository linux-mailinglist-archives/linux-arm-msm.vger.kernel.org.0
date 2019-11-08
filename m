Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE20F4320
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 10:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730994AbfKHJ2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 04:28:49 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37286 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfKHJ2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 04:28:49 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 73B1C60A7E; Fri,  8 Nov 2019 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573205328;
        bh=MLIHNzrdqv2GzLSp8pq6NNnklz9uV3QqXwVDCJg7x38=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ldH8+egTMIrhFlJHipNDII27k3mYDqOveDY65ITB3j7tGu9kpYmx74xY45DDmHucx
         DtHbsYJiK4u+MgYlnNFl+hsGW4zZxU+4naq8uP28fSOXcOww8m/+AfzFIS20zCv2IA
         IGy9Yet5rk0DIcU81CMCvXAhlUgSp9iscFg1brT4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02AF160A66;
        Fri,  8 Nov 2019 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573205327;
        bh=MLIHNzrdqv2GzLSp8pq6NNnklz9uV3QqXwVDCJg7x38=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a0BS3keCJTMgexqxKVH8URSPtu7+6G/j8h2wz4pMhnRsWRRBjbwTNVKT5zXwiAU2M
         OiDmuNWw76C8pqQKLQxjPAxdXiow2ECTf23SF1LQNM5wn3Vz/ufhPYwC7URxP4B38Z
         XYv0aV0w9jjS7gkszJOVWiszfX27rTHtAX0YSuRA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02AF160A66
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 01/13] dt-bindings: qcom: Add SC7180 bindings
Date:   Fri,  8 Nov 2019 14:58:12 +0530
Message-Id: <20191108092824.9773-2-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191108092824.9773-1-rnayak@codeaurora.org>
References: <20191108092824.9773-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a SoC string 'sc7180' for the qualcomm SC7180 SoC.
Also add a new board type 'idp'

While at it, also sort the SoC and board names in
alphabetical order, and also fix the weird space
and tab combinations found in the file.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/arm/qcom.yaml         | 44 +++++++++++--------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e39d8f02e33c..529d924931f1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -24,28 +24,30 @@ description: |
 
   The 'SoC' element must be one of the following strings:
 
-  	apq8016
-  	apq8074
-  	apq8084
-  	apq8096
-  	msm8916
-  	msm8974
-  	msm8992
-  	msm8994
-  	msm8996
-  	mdm9615
-  	ipq8074
-  	sdm845
+        apq8016
+        apq8074
+        apq8084
+        apq8096
+        ipq8074
+        mdm9615
+        msm8916
+        msm8974
+        msm8992
+        msm8994
+        msm8996
+        sc7180
+        sdm845
 
   The 'board' element must be one of the following strings:
 
-  	cdp
-  	liquid
-  	dragonboard
-  	mtp
-  	sbc
-  	hk01
-  	qrd
+        cdp
+        dragonboard
+        hk01
+        idp
+        liquid
+        mtp
+        qrd
+        sbc
 
   The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
   where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
@@ -144,4 +146,8 @@ properties:
               - qcom,ipq8074-hk01
           - const: qcom,ipq8074
 
+      - items:
+          - enum:
+              - qcom,sc7180-idp
+          - const: qcom,sc7180
 ...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

