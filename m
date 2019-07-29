Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E59278B49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 14:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbfG2MG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 08:06:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37004 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387637AbfG2MGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 08:06:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E1BDB609F3; Mon, 29 Jul 2019 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402014;
        bh=byY3yzm7EeDUwstjRVjXWjSdqPq5cLPo51uz9hawt30=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gXDemjpmO46gznhDpKH9yeHAYsn5yMB91sPKEQUiVEjOEUoUALwIQ0fZC1xt9a5aT
         AZfuGq0iA88y1QFYV2WUBpVTmu4LkGpYGLr9XZml73tHizfOekCNnTfsz3sZarT+l7
         pBMAiJYSilEeZgaATMTWaVhm38s6rDgU/BINA5fE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46B8F609CD;
        Mon, 29 Jul 2019 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402014;
        bh=byY3yzm7EeDUwstjRVjXWjSdqPq5cLPo51uz9hawt30=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gXDemjpmO46gznhDpKH9yeHAYsn5yMB91sPKEQUiVEjOEUoUALwIQ0fZC1xt9a5aT
         AZfuGq0iA88y1QFYV2WUBpVTmu4LkGpYGLr9XZml73tHizfOekCNnTfsz3sZarT+l7
         pBMAiJYSilEeZgaATMTWaVhm38s6rDgU/BINA5fE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46B8F609CD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/6] dt-bindings: firmware: scm: Add SM8150 and SC7180 support
Date:   Mon, 29 Jul 2019 17:36:29 +0530
Message-Id: <20190729120633.20451-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729120633.20451-1-sibis@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SM8150 and SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 41f133a4e2fa7..5282ad3fc79d0 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -17,6 +17,8 @@ Required properties:
  * "qcom,scm-msm8998"
  * "qcom,scm-ipq4019"
  * "qcom,scm-sdm845"
+ * "qcom,scm-sm8150"
+ * "qcom,scm-sc7180"
  and:
  * "qcom,scm"
 - clocks: Specifies clocks needed by the SCM interface, if any:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

