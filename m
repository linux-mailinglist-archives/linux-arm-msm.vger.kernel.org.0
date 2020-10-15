Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF6228F88B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 20:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgJOS21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 14:28:27 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:39433 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728042AbgJOS2Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 14:28:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602786503; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rDeJ6kFzGikaYfJINP8Lyb+YRivli/t+4J2ePfYRWTc=; b=Zb70+fq/QwmQg8MLSdTCxhvsMXPWh5KTmwMfUvpYt3hNwHPaJD8ViRTZy1jemFjiBNMpeVgS
 AEHI56y5LZjDxLz1hubZkz1qxhU+yWTs2St8b1mv0kyiLZxBPKYBmtJGn+zH2WFjIyzB4i5A
 N7oEpb5uB8MCF1DMwYvuBU4UyjY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f8894bde9e942744c4869d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Oct 2020 18:28:13
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 47177C433CB; Thu, 15 Oct 2020 18:28:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B85C4C433FE;
        Thu, 15 Oct 2020 18:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B85C4C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, evgreen@chromium.org,
        dianders@chromium.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, swboyd@chromium.org, mka@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180-trogdor: Fixup modem memory region
Date:   Thu, 15 Oct 2020 23:57:56 +0530
Message-Id: <1602786476-27833-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The modem firmware memory requirements vary between 32M/140M on
no-lte/lte skus respectively, so fixup the modem memory region
to reflect the requirements.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi         | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi
index 44956e3165a1..469aad4e5948 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi
@@ -9,6 +9,10 @@
 	label = "proximity-wifi-lte";
 };
 
+&mpss_mem {
+	reg = <0x0 0x86000000 0x0 0x8c00000>;
+};
+
 &remoteproc_mpss {
 	firmware-name = "qcom/sc7180-trogdor/modem/mba.mbn",
 			"qcom/sc7180-trogdor/modem/qdsp6sw.mbn";
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bf875589d364..92a1fe114da8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -39,7 +39,7 @@
 		};
 
 		mpss_mem: memory@86000000 {
-			reg = <0x0 0x86000000 0x0 0x8c00000>;
+			reg = <0x0 0x86000000 0x0 0x2000000>;
 			no-map;
 		};
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

