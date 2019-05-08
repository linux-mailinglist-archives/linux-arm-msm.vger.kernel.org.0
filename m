Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA8E16F00
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 04:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfEHCUs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 22:20:48 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:46258 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbfEHCUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 22:20:47 -0400
Received: by mail-yw1-f66.google.com with SMTP id a130so9376733ywe.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 19:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ELPN95of+YiOXZ1OxQ8uPptCoKBLr4pqVfRwM3q7Rn4=;
        b=cscdb65Ju8PNF/KJxd7OgJitjE7xvD2hH+EOqa3yAm/uFo29RFZ0ERGQbKoqO0q9Gq
         zSwcdpJVS5MsuUm/T8tKqVO3RfOIRDRu5aQiqGPIbWM18R952ENHLGhUQnm83PGMmKe1
         EgQal7cm7LlxCvwcYlSTCmJV/MZWGEpist0neYA/7IBRuJwhjlrEQrfw3vvlriUP+kyt
         3ufU5Byby6hWfhMlfD6/MXxpxE2IMyTU78S9/Al7YONQFjUnpwRgxHFDjbL+q1E9jWGB
         FbPBL34cfSR80zIQPoIudRAqVdHiqB7GENsCrGdtBelXwbdTlCXzzjvovHf7d/0iMlgm
         YwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ELPN95of+YiOXZ1OxQ8uPptCoKBLr4pqVfRwM3q7Rn4=;
        b=m3ubMZlo1h0Df3e4DRo8quFOybaDCRMjDYHOp6hGSGWbouV1pb3fjcCWIjijAky2a4
         s6t2khwDeFSPDicpe3jHoS+6Y2G/dW9yXRvIGXNrojrsf3QaoUpIs+aFwMRDz47WZRRF
         5XJAwjtx/2LNgzvM1l6wKUx8Lzu9b/ijzLsqWgOjYpjogHpmF3Bu8pB/Vpa77p2xVOvh
         zZQ/28976PIOua61KnvtfuhtHllEpFDqmpa6KfJ8qA8YFLdyhrUntZFzYduQhMYZH3p9
         VRhh+NNGKRXiMOx5Vl98bx0T2UyskaxwH3QXv8PnyDnH2P67ERwAiWte+nBmy69dvrF3
         CVpA==
X-Gm-Message-State: APjAAAVrRhJcYxAmlYxqHQDEZRnAdWkuzOoXfqEjrsBNzTFXcxHdCUTZ
        NxYH6HBnVBqG6BTveErwBpNSUQ==
X-Google-Smtp-Source: APXvYqzvOq6p0lda62atGvMBmnBlPHx7Zw5jRgRsJ+HkkunEAVkvajT5fwLabmYeGsoo85gnyPLuTA==
X-Received: by 2002:a0d:e6c1:: with SMTP id p184mr9009462ywe.201.1557282047160;
        Tue, 07 May 2019 19:20:47 -0700 (PDT)
Received: from localhost.localdomain (li931-65.members.linode.com. [45.56.113.65])
        by smtp.gmail.com with ESMTPSA id s4sm1168116yws.48.2019.05.07.19.20.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 19:20:46 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 09/11] arm64: dts: qcom-msm8916: Update coresight DT bindings
Date:   Wed,  8 May 2019 10:19:00 +0800
Message-Id: <20190508021902.10358-10-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508021902.10358-1-leo.yan@linaro.org>
References: <20190508021902.10358-1-leo.yan@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CoreSight DT bindings have been updated, thus the old compatible strings
are obsolete and the drivers will report warning if DTS uses these
obsolete strings.

This patch switches to the new bindings for CoreSight dynamic funnel,
so can dismiss warning during initialisation.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 423dda996b5d..de49ec110fc2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1172,7 +1172,7 @@
 		};
 
 		funnel@821000 {
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x821000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
@@ -1285,7 +1285,7 @@
 		};
 
 		funnel@841000 {	/* APSS funnel only 4 inputs are used */
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x841000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-- 
2.17.1

