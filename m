Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCEF1ADFCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 16:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgDQO0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 10:26:33 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:34873 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726065AbgDQO0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 10:26:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587133593; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=x86bACcWwyiPyc4OKrVA8+tJ0fW/beo73TgHQ5I1XPc=; b=Iyar8rDdOwzqi2Fq7iA9itCxmtXNdxMbsDCJ3s5faznT+ZXfXmN2wzFFqQxBfL+E6Z53HpOF
 hq+5PJCrOZwUDEH5Rh4IQxo+Mnmfg3aLoC9a6iScN9BGqK1aOhGazqrlm/H61iFF/OyXVfy/
 8N2OJCc9D5/rploJnFv22/ZZVbA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99bc94.7f996d13e030-smtp-out-n01;
 Fri, 17 Apr 2020 14:26:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF5B0C432C2; Fri, 17 Apr 2020 14:26:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1789C44788;
        Fri, 17 Apr 2020 14:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1789C44788
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/5] dt-bindings: remoteproc: qcom: Add SC7180 MPSS support
Date:   Fri, 17 Apr 2020 19:56:01 +0530
Message-Id: <20200417142605.28885-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200417142605.28885-1-sibis@codeaurora.org>
References: <20200417142605.28885-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MPSS PAS support for SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 9938918b2fea3..22604d2cd3f87 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -15,6 +15,7 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,qcs404-adsp-pas"
 		    "qcom,qcs404-cdsp-pas"
 		    "qcom,qcs404-wcss-pas"
+		    "qcom,sc7180-mpss-pas"
 		    "qcom,sdm845-adsp-pas"
 		    "qcom,sdm845-cdsp-pas"
 		    "qcom,sm8150-adsp-pas"
@@ -46,6 +47,7 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sm8150-slpi-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,qcs404-wcss-pas:
+	qcom,sc7180-mpss-pas:
 	qcom,sm8150-mpss-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
 		    "shutdown-ack"
@@ -106,6 +108,7 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sm8150-adsp-pas:
 	qcom,sm8150-cdsp-pas:
 		    must be "cx", "load_state"
+	qcom,sc7180-mpss-pas:
 	qcom,sm8150-mpss-pas:
 		    must be "cx", "load_state", "mss"
 	qcom,sm8150-slpi-pas:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
