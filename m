Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF9512814C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 18:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfLTRUv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 12:20:51 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:36976 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727509AbfLTRUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 12:20:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576862450; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=r7+777Bq/auiINnXBCY0CkWxtdqQsdfrcvKYf1wNfLY=; b=n9EErcRc0zyuZUKMAYiea/Y4clwaJuwhlVHmYyvBf41A4cr8MEbUFqNMCDJWgdo3eUqwM0g8
 ZfGjt8fTgmUxVgCD0yHtZoB5HpU+X6BCbuUkfO9aWefCvgv8ibqUazKtS5mL6hn2UFWT/6Lp
 qvgeOHQNj2dr9491gIkz6drEdqg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfd02ec.7f9f6a4a6298-smtp-out-n03;
 Fri, 20 Dec 2019 17:20:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 69CC4C4479F; Fri, 20 Dec 2019 17:20:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 470B1C433A2;
        Fri, 20 Dec 2019 17:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 470B1C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, tsoni@codeaurora.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/3] dt-bindings: soc: qcom: apr: Add protection domain bindings
Date:   Fri, 20 Dec 2019 22:50:18 +0530
Message-Id: <20191220172019.11774-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191220172019.11774-1-sibis@codeaurora.org>
References: <20191220172019.11774-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add optional "qcom,protection-domain" bindings for APR services. This
helps to capture the dependencies between APR services and the PD on
which each apr service run.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/soc/qcom/qcom,apr.txt | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
index db501269f47b8..f87c0b2a48de4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
@@ -45,6 +45,12 @@ by the individual bindings for the specific service
 			12 - Ultrasound stream manager.
 			13 - Listen stream manager.
 
+- qcom,protection-domain
+	Usage: optional
+	Value type: <stringlist>
+	Definition: Must list the protection domain service name and path
+		    that the particular apr service has a dependency on.
+
 = EXAMPLE
 The following example represents a QDSP based sound card on a MSM8996 device
 which uses apr as communication between Apps and QDSP.
@@ -82,3 +88,56 @@ which uses apr as communication between Apps and QDSP.
 			...
 		};
 	};
+
+= EXAMPLE 2
+The following example represents a QDSP based sound card on SDM845 device.
+Here the apr services are dependent on "avs/audio" service running on AUDIO
+Protection Domain hosted on ADSP remote processor.
+
+	apr {
+		compatible = "qcom,apr-v2";
+		qcom,glink-channels = "apr_audio_svc";
+		qcom,apr-domain = <APR_DOMAIN_ADSP>;
+
+		q6core {
+			compatible = "qcom,q6core";
+			reg = <APR_SVC_ADSP_CORE>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+		};
+
+		q6afe: q6afe {
+			compatible = "qcom,q6afe";
+			reg = <APR_SVC_AFE>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			q6afedai: dais {
+				compatible = "qcom,q6afe-dais";
+				#sound-dai-cells = <1>;
+
+				qi2s@22 {
+					reg = <22>;
+					qcom,sd-lines = <3>;
+				};
+			};
+		};
+
+		q6asm: q6asm {
+			compatible = "qcom,q6asm";
+			reg = <APR_SVC_ASM>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			q6asmdai: dais {
+				compatible = "qcom,q6asm-dais";
+				#sound-dai-cells = <1>;
+				iommus = <&apps_smmu 0x1821 0x0>;
+			};
+		};
+
+		q6adm: q6adm {
+			compatible = "qcom,q6adm";
+			reg = <APR_SVC_ADM>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			q6routing: routing {
+				compatible = "qcom,q6adm-routing";
+				#sound-dai-cells = <0>;
+			};
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
