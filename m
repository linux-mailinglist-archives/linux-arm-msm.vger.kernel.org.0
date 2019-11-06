Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81264F0F37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731291AbfKFGvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:51:23 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45610 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731287AbfKFGvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:51:22 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7A1FA61060; Wed,  6 Nov 2019 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023081;
        bh=XhlVak7vAHchCweRbldbZW7TvFyoJCIcZR3y7pWOCkM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oQH9PY3m9/8Bb2ELiUUhZCjGW973H+Ip6/AMstc3Rithq1cqWSuUEyb+yIC+uTUHA
         8nEcvkmXahdhNYyu1kX90vFj3CW/QzCNG6lVA3uNt2Gn8mr1i5WuUfVMukr5dWE+Vs
         RMPc/5VtQy2vrURNOY8xsIZkt9tEb/n+i5U4FdH8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A171612DE;
        Wed,  6 Nov 2019 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023080;
        bh=XhlVak7vAHchCweRbldbZW7TvFyoJCIcZR3y7pWOCkM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g9WiSJbM3Fgcbb0uKe+FU4VYx6ciZcJMfF3iy3y7EzVhcJyIwa9/pykgDZI5daFsH
         jZWNNoViQUwLKPrzouattLsnajKGZEnRDSkKOM2OX1cClHs+O7VIlsseLNmMdWu0pc
         0boSyPb96o+549DPNAEHi3H4+rCZdWo7G23/hcZM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A171612DE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH v4 08/14] dt-bindings: qcom,pdc: Add compatible for sc7180
Date:   Wed,  6 Nov 2019 12:20:11 +0530
Message-Id: <20191106065017.22144-9-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106065017.22144-1-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for sc7180 SoC from Qualcomm.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 8e0797cb1487..1df293953327 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -17,7 +17,8 @@ Properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: Should contain "qcom,<soc>-pdc"
+	Definition: Should contain "qcom,<soc>-pdc" and "qcom,pdc"
+		    - "qcom,sc7180-pdc": For SC7180
 		    - "qcom,sdm845-pdc": For SDM845
 
 - reg:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

