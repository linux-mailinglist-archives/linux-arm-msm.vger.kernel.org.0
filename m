Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06F7100E01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfKRVnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:35 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:43032
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbfKRVnf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113414;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=qKe7ucjKRGNYVzcBF20GIH7nwfy1VcJPUTW1DnoKsSI=;
        b=dZ44xRLMoeRhJG/FuOMS4ozvdwpwKbEfOfS00rZqOacRJYzvS8gAro06sQsKCwOb
        0+fHFWTzNqH0nQJBnhhx7fGTQ2Fm0mDt4PwuNoFwDa/1va0Cr4lhLcntQ0NAw74CMyy
        FFA0XOOnMt43mWqiXpaefQpVIlARVshrLKRSOm98=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113414;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=qKe7ucjKRGNYVzcBF20GIH7nwfy1VcJPUTW1DnoKsSI=;
        b=UmV/oqGhtjTGYug2c/vemyxuYAORa8gfAPFq+ekfg7dvM24ES6fYNJysNUJUzD1r
        2TlFjzoMCzembthvs37axC8ESqiWxo4vudN5kHIn5Ie+3uLwvYiJEkhPix7h6Iqbv5X
        oJRO0Licno81TEx50540ViD9PbRthg4Nwas627Bs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2405C58C22
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 06/16] dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5 PAS
Date:   Mon, 18 Nov 2019 21:43:34 +0000
Message-ID: <0101016e80788d28-7370e0e3-7380-4cc7-9233-40b9fd76e8f3-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add power-domain bindings for Q6V5 PAS on MSM8974/MSM8996/QCS404/SDM845
SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/remoteproc/qcom,adsp.txt         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 292dfda9770d7..fea25b8b050ed 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -67,6 +67,29 @@ on the Qualcomm ADSP Hexagon core.
 	Definition: reference to the px regulator to be held on behalf of the
 		    booting Hexagon core
 
+- power-domains:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to power-domains that match the power-domain-names
+
+- power-domain-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: The power-domains needed depend on the compatible string:
+	qcom,msm8974-adsp-pil:
+	qcom,msm8996-adsp-pil:
+		    must be "cx"
+	qcom,msm8996-slpi-pil:
+		    must be "ss_cx"
+	qcom,qcs404-adsp-pas:
+		    must be "lpi_cx"
+	qcom,qcs404-cdsp-pas:
+	qcom,qcs404-wcss-pas:
+		    must be "mx"
+	qcom,sdm845-adsp-pas:
+	qcom,sdm845-cdsp-pas:
+		    must be "cx", "load_state"
+
 - memory-region:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

