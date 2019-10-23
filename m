Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F01ABE1534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 11:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390670AbfJWJCp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 05:02:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41682 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390380AbfJWJCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 05:02:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4D5186087F; Wed, 23 Oct 2019 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821364;
        bh=H3K/p5Nd/IErHMiHrvlWQlFJ9DJTBQ5fShmQbLBtkxM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TKGm0J68Fwzlg22QjwzMe23LTxwXd5ayeI0pEz2QXIr3mkhgnJ8VTW9eyl6iKtUfw
         /GvrNBxwCGmz2OJpKV+jSg6XLHhfeIM561XPJ0Uc2L2nx3aMX7T+S5lAQev+P+0gDc
         javUy5HMiaLp23jhzLHAG4oinwwPV0B/JFfvKVcQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48F9F602E0;
        Wed, 23 Oct 2019 09:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821363;
        bh=H3K/p5Nd/IErHMiHrvlWQlFJ9DJTBQ5fShmQbLBtkxM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ijXsFS4Ii1aIJgX0Jd5STR7e+Op1vN/aPVV5QmKjsfOZM7y9bCG+BKQKd6BbkZ8+R
         n0ui0HnB1YdsRwh7oaZgD70hSoeG7rt0yKmSrzqCtP7SzkBYz7XkSEo3FZeJdTlqmB
         TRcU8mFgfuGF+40J3UgWGPScXuEfScaM5y+GMc9M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48F9F602E0
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 01/11] dt-bindings: qcom: Add SC7180 bindings
Date:   Wed, 23 Oct 2019 14:32:09 +0530
Message-Id: <20191023090219.15603-2-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191023090219.15603-1-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
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

