Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7159414F888
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2020 16:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgBAPaa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Feb 2020 10:30:30 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:49344 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726668AbgBAPa2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Feb 2020 10:30:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580571028; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=RHHhicaTH9RuouOFtBe7AmBpXwqankHPMq8eW/hgkyk=; b=t0MEIkKKsKDjjhiK+4XLrRjY1xaBKlqVUPbocKHoB5/oByIu0ukz6NO0o1b/veEHdJCe+vj+
 uTP2K/L4ozEuIpG+GvEPK3emRdhBBWiSt73GVn++hGxiHr5sadzdImIgMQqfYUZOlMnSha1a
 Bumxo18tcEs3XKuGnAWOcbS9+14=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e35998e.7f067599ebc8-smtp-out-n02;
 Sat, 01 Feb 2020 15:30:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 821A8C447B5; Sat,  1 Feb 2020 15:30:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A531BC433CB;
        Sat,  1 Feb 2020 15:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A531BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 2/2] dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845, SM8150
Date:   Sat,  1 Feb 2020 20:59:49 +0530
Message-Id: <ff71077aa09c489b2b072c6f5605dccb96f60051.1580570160.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing compatible for watchdog timer on QCS404,
SC7180, SDM845 and SM8150 SoCs.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../bindings/watchdog/qcom-wdt.yaml           | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 5448cc537a03..7180c64f54fb 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -14,14 +14,19 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,kpss-timer
-      - qcom,kpss-wdt
-      - qcom,kpss-wdt-apq8064
-      - qcom,kpss-wdt-ipq4019
-      - qcom,kpss-wdt-ipq8064
-      - qcom,kpss-wdt-msm8960
-      - qcom,scss-timer
+    items:
+      - enum:
+          - qcom,apss-wdt-qcs404
+          - qcom,apss-wdt-sc7180
+          - qcom,apss-wdt-sdm845
+          - qcom,apss-wdt-sm8150
+          - qcom,kpss-timer
+          - qcom,kpss-wdt-apq8064
+          - qcom,kpss-wdt-ipq4019
+          - qcom,kpss-wdt-ipq8064
+          - qcom,kpss-wdt-msm8960
+          - qcom,scss-timer
+      - const: qcom,kpss-wdt
 
   reg:
     maxItems: 1
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
