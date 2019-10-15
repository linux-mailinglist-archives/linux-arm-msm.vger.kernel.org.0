Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E627D7356
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbfJOKeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:34:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59952 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfJOKeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:34:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9CAAC609DD; Tue, 15 Oct 2019 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571135663;
        bh=ipx93KNUsWLuK5QhXOH6UsF1jjlvnu3cf5ewEtkc8xE=;
        h=From:To:Cc:Subject:Date:From;
        b=nN69mRPuvU6MwjqRENm+BfpiUu2wf49z/z7/YxTKYZwuZK4y7BdsVr63UjPf2azxj
         KKBPHIdvCAqNccRHeBK1Cke7LP1Ug+MIEeUwFZ+dlsgncO31GsmcIZ7FkMC6gqNTEn
         ecujUqRAAhixLhbW6dSParVfyBJ5Ymko1hj54eKw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B99860790;
        Tue, 15 Oct 2019 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571135662;
        bh=ipx93KNUsWLuK5QhXOH6UsF1jjlvnu3cf5ewEtkc8xE=;
        h=From:To:Cc:Subject:Date:From;
        b=IluT4+IBEYEQYauz2yp0XVRapDqKPd6AtkhqvVKIg05mWqQuruW1IoluwH10rXEKm
         vXEVwFhkSL/4SxD0jwlp/xzrDHtIHFmdHeH0LTaO8Ar6htl4e/YMj4KFsPmEB7RN8I
         x9oK+tUVqFU7uiha9C5G0X+zX5zoW6PRhzZMDulM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B99860790
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: qcom: Add SC7180 bindings
Date:   Tue, 15 Oct 2019 16:03:57 +0530
Message-Id: <20191015103358.17550-1-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a SoC string 'sc7180' for the qualcomm SC7180 SoC.
Also add a new board type 'idp'

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e39d8f02e33c..0a60ea051541 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -36,6 +36,7 @@ description: |
   	mdm9615
   	ipq8074
   	sdm845
+  	sc7180
 
   The 'board' element must be one of the following strings:
 
@@ -46,6 +47,7 @@ description: |
   	sbc
   	hk01
   	qrd
+  	idp
 
   The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
   where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

