Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25AE3100761
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 15:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfKRO2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 09:28:01 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:42390
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727146AbfKRO2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 09:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574087280;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=vQhmqsPW3fNET/tidnk/RNtP6UsJe6nuRmIFtEn4V5s=;
        b=G5yeZRbTZwpmAAS6taI6KeGsd0sNweUJyHeqZaI3m51S9ztK9qG00+gS7NAWoco+
        1HhmcsHASvL1n0Sk2tGvEcJuQkaE3o6B+HvUK2+uEHjLd/2Q0cQhu5uwps/xnk0hTd7
        9yzegXke609XdIqWfEaihLNaxs9QbweoJhltYYS4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574087280;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=vQhmqsPW3fNET/tidnk/RNtP6UsJe6nuRmIFtEn4V5s=;
        b=BpUrfmcBwjFULKnGLFjxC4HklxQwQEn5IKxb47DfBi6l8Kg2asTPyu5flt1CbEiY
        FpBF0CD4e0qEcqbj84RWEqRkK9/kzD0xX/GEe1WGCCZaqhSpXK3zNpMu9QxKp/FiDl6
        xkJhmkotauz3EwBvQq93TQxmmxaQrDH49r0kx4HA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25055C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, tsoni@codeaurora.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/3] dt-bindings: soc: qcom: apr: Add protection domain bindings
Date:   Mon, 18 Nov 2019 14:28:00 +0000
Message-ID: <0101016e7ee9c5b2-94a0dc24-2f52-4cc3-acd9-0f44f2c7e118-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118142728.30187-1-sibis@codeaurora.org>
References: <20191118142728.30187-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add optional "qcom,protection-domain" bindings for APR services. This
helps to capture the dependencies between APR services and the PD on
which each apr service run.

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

