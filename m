Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55B348455D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 09:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbfHGHKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 03:10:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47626 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727663AbfHGHKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 03:10:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0AD756118E; Wed,  7 Aug 2019 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565161821;
        bh=pXD6hCjI7T3VH/lpQFaZgcWecErr6WJ8KUuzIkwObmw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J53jB2szvC3yFhXD/Trtk+jbO3e99YZ/AodDxg1+yuzvgXihnAqOFShUuway6vJXD
         A61kTWBkbOnLow2LJxbTingExmnxR4bt1PoHP17JFsgD9T2d6dhWNDtsctjpjDCX6P
         sBHC2tvUQ1stucjn7jhApunumR70O/FPL6AZppZo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2210A61155;
        Wed,  7 Aug 2019 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565161819;
        bh=pXD6hCjI7T3VH/lpQFaZgcWecErr6WJ8KUuzIkwObmw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NJXjoJgvgk15wr+Qp4Qq7KsMkI6xiynvBhCDCb0AaQwXANssXf6+lhWjWR0KfyJ3J
         hc/lbvxccetmLpqR52gQdQ5LMmhgtDBV1bP4Bj8b5JCcVHhT2jhg3zCj0a8eBPUNJt
         XCIdTh0hDiMXEccz6P+PZNju07aaYB/KMitJXpKg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2210A61155
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/7] soc: qcom: smem: Update max processor count
Date:   Wed,  7 Aug 2019 12:39:51 +0530
Message-Id: <20190807070957.30655-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807070957.30655-1-sibis@codeaurora.org>
References: <20190807070957.30655-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update max processor count to reflect the number of
co-processors on SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index f27c00d82ae49..bef8502625f96 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -84,7 +84,7 @@
 #define SMEM_GLOBAL_HOST	0xfffe
 
 /* Max number of processors/hosts in a system */
-#define SMEM_HOST_COUNT		10
+#define SMEM_HOST_COUNT		11
 
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

