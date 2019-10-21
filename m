Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20DE2DE4E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbfJUG4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:56:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34712 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUG4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:56:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3C2F760159; Mon, 21 Oct 2019 06:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640967;
        bh=mnS/WtBKi30gkw2o/gG63261keoEXJ/H73siZfUNDpQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UhV3fnE5fzczCoYOUC70TAYzNIyaHjo8YggT1LXt/P9NZgSV53eY55s2JmL33PJVR
         a0HwQDB7fWNts/lKSPMyEoUHJEzISWA6QTslzKCRvdA26Mp4thR6YAKg7MIPJgoiKS
         w0Z5tILONi7o9SwUYhXWFexyYZ3Hu0Ruck7uXS2o=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3AF560159;
        Mon, 21 Oct 2019 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640966;
        bh=mnS/WtBKi30gkw2o/gG63261keoEXJ/H73siZfUNDpQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PTqiXrfiYCes5cjfyU/z6yk8ItJEqU7L3Iz9hVWJSggqVhVvBuNY2sXgYr/BAPl6+
         pWB/J5T4f1Uqr1zvv1uzZEAfdrVLerbVGb0ySpiNUkjUVHLY3HWS2USD/T4mT8BGVF
         RCW5XL6j+3BqSy01N6EapOtdQsYu8j4Bzb5Ml7Do=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3AF560159
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 01/13] dt-bindings: qcom: Add SC7180 bindings
Date:   Mon, 21 Oct 2019 12:25:10 +0530
Message-Id: <20191021065522.24511-2-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021065522.24511-1-rnayak@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a SoC string 'sc7180' for the qualcomm SC7180 SoC.
Also add a new board type 'idp'

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
v2: Added Vinod's Reviewed-by:

 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e39d8f02e33c..0a60ea051541 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -36,6 +36,7 @@ description: |
   	mdm9615
   	ipq8074
   	sdm845
+  	sc7180
 
   The 'board' element must be one of the following strings:
 
@@ -46,6 +47,7 @@ description: |
   	sbc
   	hk01
   	qrd
+  	idp
 
   The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
   where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

