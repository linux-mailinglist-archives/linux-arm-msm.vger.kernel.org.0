Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF83C1D55D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 18:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgEOQXU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 12:23:20 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:20901 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726263AbgEOQXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 12:23:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589559798; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=E3JOrY4A58gZsnsClzyUNWC3fBr+ONS0bBEOUGfz3Ts=; b=wBYC/QWZ9J7x5WxPr/5d4A0FmP/7KNGrDLBCihmoZXYhpy5/VddziqMr29E9B2PaOKeDukU/
 G0o7rCthx0nzIqDSrIgmfteBg15NxXkv03JSVxb8nlwBaME+YeE19AQIgauQi4z1ZGhSanVw
 Uldwbi1GOp/sk/6guU5Z6ulelG0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebec1e5.7f82d1213030-smtp-out-n05;
 Fri, 15 May 2020 16:23:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5730CC4478F; Fri, 15 May 2020 16:23:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1046C433D2;
        Fri, 15 May 2020 16:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1046C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Tingwei Zhang <tingwei@codeaurora.org>,
        coresight@lists.linaro.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv3 2/2] dt-bindings: arm: coresight: Add support to skip trace unit power up
Date:   Fri, 15 May 2020 21:52:33 +0530
Message-Id: <7b69c9752713ce22f04688e83ec78f8aa67c63dc.1589558615.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1589558615.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1589558615.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tingwei Zhang <tingwei@codeaurora.org>

Add "qcom,skip-power-up" property to identify systems which can
skip powering up of trace unit since they share the same power
domain as their CPU core. This is required to identify such
systems with hardware errata which stops the CPU watchdog counter
when the power up bit is set (TRCPDCR.PU).

Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/coresight.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index 846f6daae71b..e4b2eda0b53b 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -108,6 +108,13 @@ its hardware characteristcs.
 	* arm,cp14: must be present if the system accesses ETM/PTM management
 	  registers via co-processor 14.
 
+	* qcom,skip-power-up: boolean. Indicates that an implementation can
+	  skip powering up the trace unit. TRCPDCR.PU does not have to be set
+	  on Qualcomm Technologies Inc. systems since ETMs are in the same power
+	  domain as their CPU cores. This property is required to identify such
+	  systems with hardware errata where the CPU watchdog counter is stopped
+	  when TRCPDCR.PU is set.
+
 * Optional property for TMC:
 
 	* arm,buffer-size: size of contiguous buffer space for TMC ETR
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
