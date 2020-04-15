Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4CB1AAADE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 16:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371011AbgDOOvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 10:51:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:39605 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S371010AbgDOOve (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 10:51:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586962293; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jy7eWzV8K3wnMtijAWqnksrw5Tls6vZ8a6QOTRFFS/I=; b=kdIx1tv/iJXN/n0mzG/BSj518wao7t7h4NGir4J/FKUb4kpoYGDFYwh/FB5zGHI+YQNIcdjj
 I+RI5PMYrcJBRjJA7NTYqo2WCBvLBws8/lqJHItqUYRUlKItQSP4G0ydASeIZzOK4Uj3XN6b
 Fu5njwKhSk0IdXDaHiK3OxCeR+c=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e971f75.7fadc4c653b0-smtp-out-n05;
 Wed, 15 Apr 2020 14:51:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E585BC432C2; Wed, 15 Apr 2020 14:51:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86278C433F2;
        Wed, 15 Apr 2020 14:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86278C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: Replace halt-nav with spare-regs
Date:   Wed, 15 Apr 2020 20:21:09 +0530
Message-Id: <20200415145110.20624-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200415145110.20624-1-sibis@codeaurora.org>
References: <20200415145110.20624-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

7C retail devices using MSA based boot will result in a fuse combination
which will prevent accesses to MSS PERPH register space where the mpss
clocks and halt-nav reside. However accesses to conn_box_spare0 in TCSR
register space is still permitted so rename the binding appropriately to
qcom,spare-regs and drop all accesses to the MPSS PERPH register space.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 88dfa3fc15f78..607957ad32e7b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -79,7 +79,7 @@ on the Qualcomm Hexagon core.
 		    "snoc_axi", "mnoc_axi", "qdss"
 	qcom,sc7180-mss-pil:
 		    must be "iface", "bus", "xo", "snoc_axi", "mnoc_axi",
-		    "mss_crypto", "mss_nav", "nav"
+		    "nav"
 	qcom,sdm845-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "prng"
@@ -173,16 +173,12 @@ For the compatible string below the following supplies are required:
 
 For the compatible strings below the following phandle references are required:
   "qcom,sc7180-mss-pil"
-- qcom,halt-nav-regs:
+- qcom,spare-regs:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: reference to a list of 2 phandles with one offset each for
-		    the modem sub-system running on SC7180 SoC. The first
-		    phandle reference is to the mss clock node followed by the
-		    offset within register space for nav halt register. The
-		    second phandle reference is to a syscon representing TCSR
-		    followed by the offset within syscon for conn_box_spare0
-		    register.
+	Definition: a phandle reference to a syscon representing TCSR followed
+		    by the offset within syscon for conn_box_spare0 register
+		    used by the modem sub-system running on SC7180 SoC.
 
 = SUBNODES:
 The Hexagon node must contain two subnodes, named "mba" and "mpss" representing
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
