Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC230DD8A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2019 13:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfJSLiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Oct 2019 07:38:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35398 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbfJSLiE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Oct 2019 07:38:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6979560E75; Sat, 19 Oct 2019 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571485083;
        bh=qy8qYMqNJcjgq8U59lAtJvh0eQpMrLxktgtMrQWmP9U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WQlMgJ16Oz9PuwRz+uqZwT9LhDCH75sxuHB4WUR7GeF8nzR4sWQT49werBjsaLCmN
         ZhMhx4CXwH9zCbXrXZiBka9nnUEfB6JZ146Npf8pnzr9XXBKRllx3TJuU408sYM0re
         hdoq+9esK5onQoA4Nyrk424GgB/ALUue6Bw4T3vs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4BA5F60E08;
        Sat, 19 Oct 2019 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571485067;
        bh=qy8qYMqNJcjgq8U59lAtJvh0eQpMrLxktgtMrQWmP9U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nk5GbAM+SnIm9kMUpVhhxKaoV33+Orl4rrrJ0iWy6X8Sq7MUZHcw5oXYxG5MijU9m
         q70mxBQ/Wdhh8UukN7qoS5VqB0VLi84zlmHgu0khPqfGAodmn0S5sHAg3r7lFzuVC8
         mBw8++3LUaPNkq0NOIGLk5QaaUL3198ns+x5+Qpo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4BA5F60E08
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
Subject: [PATCHv2 3/3] dt-bindings: msm: Add LLCC for SC7180
Date:   Sat, 19 Oct 2019 17:07:13 +0530
Message-Id: <de1bc7fe1edef4b43a2043fcfb20ec536285d344.1571484439.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC compatible for SC7180 SoC.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index 5ac90d101807..558749065b97 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -21,6 +21,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sc7180-llcc
       - qcom,sdm845-llcc
 
   reg:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

