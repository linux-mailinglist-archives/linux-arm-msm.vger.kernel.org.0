Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636EA170537
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 18:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgBZRBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 12:01:08 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:56448 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727922AbgBZRBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 12:01:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582736468; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=OCqRqDgtQjU9m9r7VkcctgtcvnsWfPumqHu6C1d6TXs=; b=QTalESYqX92ru+SNqUmp1+Q0JcZA3/8KIoSh6cE9Idct9GNnNsBMl8ljfWc5erNmpmkzGlhd
 RC2uCwGTfpdT6IhPV1tjtoWv99AcDw4PWBV/2pRO5OjV/4w8m6HOexY0HWnAgTKLzaNtOYGC
 TGA5yKvRGqbXHa3qa+Ra2uNQyjY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e56a42b.7f1094545378-smtp-out-n02;
 Wed, 26 Feb 2020 17:00:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 69054C447A2; Wed, 26 Feb 2020 17:00:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54466C433A2;
        Wed, 26 Feb 2020 17:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54466C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsoni@codeaurora.org, vnkgutta@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 2/3] dt-bindings: soc: qcom: apr: Add protection domain bindings
Date:   Wed, 26 Feb 2020 22:30:00 +0530
Message-Id: <20200226170001.24234-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226170001.24234-1-sibis@codeaurora.org>
References: <20200226170001.24234-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm SoCs (starting with MSM8998) allow for multiple protection
domains (PDs) to run on the same Q6 sub-system. This allows for
services like AVS AUDIO to have their own separate address space and
crash/recover without disrupting the other PDs running on the same Q6
ADSP. Add "qcom,protection-domain" bindings to capture the dependencies
between the APR service and the PD on which the apr service runs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/soc/qcom/qcom,apr.txt | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
index db501269f47b8..f8fa71f5d84ba 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
@@ -45,6 +45,18 @@ by the individual bindings for the specific service
 			12 - Ultrasound stream manager.
 			13 - Listen stream manager.
 
+- qcom,protection-domain
+	Usage: optional
+	Value type: <stringlist>
+	Definition: Must list the protection domain service name and path
+		    that the particular apr service has a dependency on.
+	Possible values are :
+			"avs/audio", "msm/adsp/audio_pd".
+			"kernel/elf_loader", "msm/modem/wlan_pd".
+			"tms/servreg", "msm/adsp/audio_pd".
+			"tms/servreg", "msm/modem/wlan_pd".
+			"tms/servreg", "msm/slpi/sensor_pd".
+
 = EXAMPLE
 The following example represents a QDSP based sound card on a MSM8996 device
 which uses apr as communication between Apps and QDSP.
@@ -82,3 +94,41 @@ which uses apr as communication between Apps and QDSP.
 			...
 		};
 	};
+
+= EXAMPLE 2
+The following example represents a QDSP based sound card with protection domain
+dependencies specified. Here some of the apr services are dependent on services
+running on protection domain hosted on ADSP/SLPI remote processors while others
+have no such dependency.
+
+	apr {
+		compatible = "qcom,apr-v2";
+		qcom,glink-channels = "apr_audio_svc";
+		qcom,apr-domain = <APR_DOMAIN_ADSP>;
+
+		q6core {
+			compatible = "qcom,q6core";
+			reg = <APR_SVC_ADSP_CORE>;
+		};
+
+		q6afe: q6afe {
+			compatible = "qcom,q6afe";
+			reg = <APR_SVC_AFE>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			...
+		};
+
+		q6asm: q6asm {
+			compatible = "qcom,q6asm";
+			reg = <APR_SVC_ASM>;
+			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
+			...
+		};
+
+		q6adm: q6adm {
+			compatible = "qcom,q6adm";
+			reg = <APR_SVC_ADM>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			...
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
