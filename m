Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E544F1C541F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 13:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbgEELNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 07:13:21 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29277 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728869AbgEELNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 07:13:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588677200; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ngKeYnR9lLVGbCVrsiWZkZYm3GJ2jFZWG4yZhTv6H4I=; b=L5WhsXqNlkKrGxrcCkWed2klUaL7JqPJC4gdQfVAcDMmLyoO7Yodl9O8Ax9rjJD8jb/3njuB
 CBdoT3HxM/ScMpACRiD5tbco4DbKZuPqitESaXHyx6hTs29VxxS7HxtXCgMgO9z2vQphOudK
 Mnadq77bivmq5p/EJar1vdIGFic=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb14a3f.7f190c821f10-smtp-out-n04;
 Tue, 05 May 2020 11:13:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 19F4FC44791; Tue,  5 May 2020 11:13:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: manafm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BF3FC43637;
        Tue,  5 May 2020 11:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9BF3FC43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=manafm@codeaurora.org
From:   Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: thermal: tsens: Add zeroc interrupt support in yaml
Date:   Tue,  5 May 2020 16:42:04 +0530
Message-Id: <20200505111204.963-3-manafm@codeaurora.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505111204.963-1-manafm@codeaurora.org>
References: <20200505111204.963-1-manafm@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add 0C (zeroc) interrupt support for tsens in yaml.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 2ddd39d96766..8a0893f77d20 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -52,12 +52,14 @@ properties:
     items:
       - description: Combined interrupt if upper or lower threshold crossed
       - description: Interrupt if critical threshold crossed
+      - description: Interrupt if zeroC threshold is crossed
 
   interrupt-names:
     minItems: 1
     items:
       - const: uplow
       - const: critical
+      - const: zeroc
 
   nvmem-cells:
     minItems: 1
@@ -168,8 +170,9 @@ examples:
                  <0xc222000 0x1ff>;
 
            interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
-                        <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
-           interrupt-names = "uplow", "critical";
+                        <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 510 IRQ_TYPE_EDGE_RISING>;
+           interrupt-names = "uplow", "critical", "zeroc";
 
            #qcom,sensors = <13>;
            #thermal-sensor-cells = <1>;
-- 
2.26.2
