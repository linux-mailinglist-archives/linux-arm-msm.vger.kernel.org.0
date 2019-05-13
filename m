Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A421B3E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 12:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbfEMKUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 06:20:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56400 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfEMKUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 06:20:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4439A608A5; Mon, 13 May 2019 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742849;
        bh=bOsp+69oWAjkbCbk4HGkpgA8bZks0hYFvuAcYpjzz9k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G1q511HOnEowEsVNGUHeNEbkQRrLHrp0cJKvb0lE9X6M4tLq0oxnPA82L7O02evCN
         PW7eLLAIYcv0vFd3Ogsx00RYNGALjdklHHrfn3m7GbRqOPoPxJYKefZcLTNwlfBcOY
         NQvy8+KUw7yKAKK+sewJ0scVmcmx1BEXmiMvMdhQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 753B260DAB;
        Mon, 13 May 2019 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742847;
        bh=bOsp+69oWAjkbCbk4HGkpgA8bZks0hYFvuAcYpjzz9k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GCcy/zojd6AKVi1+84zOK6fKEwnC9HLGvNJm0A27+NmpPPv3OEi6eSIb3g66W2q71
         hus2WEsAhHtb3xD9o+ddGoF99uSP4e6YdU2M4w/TVfmqZwxSbRvACc1EbVPtSw40vq
         Pu1axJPC2qtTnZWrvfovyjDme8VwrrwWDuIpCmGw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 753B260DAB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     david.brown@linaro.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        marc.w.gonzalez@free.fr, Rob Herring <robh@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 4/9] dt-bindings: power: Add rpm power domain bindings for qcs404
Date:   Mon, 13 May 2019 15:50:10 +0530
Message-Id: <20190513102015.26551-5-sibis@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
References: <20190513102015.26551-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add RPM power domain bindings for the qcs404 family of SoC

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
[sibis: Add supported rpmpd states for qcs404]
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
 include/dt-bindings/power/qcom-rpmpd.h        | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
index 980e5413d18f..172ccf940c5c 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
@@ -6,6 +6,7 @@ which then translates it into a corresponding voltage on a rail
 Required Properties:
  - compatible: Should be one of the following
 	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
+	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
 	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
  - #power-domain-cells: number of cells in Power domain specifier
 	must be 1.
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 87d9c6611682..450378662944 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -36,4 +36,26 @@
 #define MSM8996_VDDSSCX		5
 #define MSM8996_VDDSSCX_VFC	6
 
+/* QCS404 Power Domains */
+#define QCS404_VDDMX		0
+#define QCS404_VDDMX_AO		1
+#define QCS404_VDDMX_VFL	2
+#define QCS404_LPICX		3
+#define QCS404_LPICX_VFL	4
+#define QCS404_LPIMX		5
+#define QCS404_LPIMX_VFL	6
+
+/* RPM SMD Power Domain performance levels */
+#define RPM_SMD_LEVEL_RETENTION       16
+#define RPM_SMD_LEVEL_RETENTION_PLUS  32
+#define RPM_SMD_LEVEL_MIN_SVS         48
+#define RPM_SMD_LEVEL_LOW_SVS         64
+#define RPM_SMD_LEVEL_SVS             128
+#define RPM_SMD_LEVEL_SVS_PLUS        192
+#define RPM_SMD_LEVEL_NOM             256
+#define RPM_SMD_LEVEL_NOM_PLUS        320
+#define RPM_SMD_LEVEL_TURBO           384
+#define RPM_SMD_LEVEL_TURBO_NO_CPR    416
+#define RPM_SMD_LEVEL_BINNING         512
+
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

