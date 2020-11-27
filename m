Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16532C6607
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 13:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbgK0Mva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 07:51:30 -0500
Received: from z5.mailgun.us ([104.130.96.5]:28797 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729755AbgK0Mva (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 07:51:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606481489; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Wvgu5LNknKKtzh44u0u14MyyrMp6TkmWb5YLGVhgF2s=; b=AQDRf7hXXHLxZVYjqCdojJwbyDpJ3v9fKPj+GlA010dvZ55E3uPXt7OALM9RRAEIvA1WGS1k
 +jvKeCmEBa7RR1llhd2Su+sgbQeMHFOa2fqiHRN573/thG9UNqZHR64fj0FWfsiDtYWDXW9C
 UEoPtf6H8ZTynHYqNPXJHsCMgsw=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fc0f621e714ea65018d5bb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 12:50:41
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B2D8C433ED; Fri, 27 Nov 2020 12:50:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C964C43463;
        Fri, 27 Nov 2020 12:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C964C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     robh@kernel.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jcrouse@codeaurora.org, mka@chromium.org, robdclark@gmail.com,
        dianders@chromium.org
Subject: [PATCH v2 3/3] arm: dts: sc7180: Add support for gpu fuse
Date:   Fri, 27 Nov 2020 18:19:46 +0530
Message-Id: <1606481386-22867-3-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606481386-22867-1-git-send-email-akhilpo@codeaurora.org>
References: <1606481386-22867-1-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for gpu fuse to help identify the supported opps.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6678f1e..8cae3eb 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -675,6 +675,11 @@
 				reg = <0x25b 0x1>;
 				bits = <1 3>;
 			};
+
+			gpu_speed_bin: gpu_speed_bin@1d2 {
+				reg = <0x1d2 0x2>;
+				bits = <5 8>;
+			};
 		};
 
 		sdhc_1: sdhci@7c4000 {
@@ -1907,52 +1912,69 @@
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
 
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "gfx-mem";
 
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
+				opp-825000000 {
+					opp-hz = /bits/ 64 <825000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <8532000>;
+					opp-supported-hw = <0x04>;
+				};
+
 				opp-800000000 {
 					opp-hz = /bits/ 64 <800000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					opp-peak-kBps = <8532000>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-650000000 {
 					opp-hz = /bits/ 64 <650000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-565000000 {
 					opp-hz = /bits/ 64 <565000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					opp-peak-kBps = <5412000>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-430000000 {
 					opp-hz = /bits/ 64 <430000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <5412000>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-355000000 {
 					opp-hz = /bits/ 64 <355000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <3072000>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-267000000 {
 					opp-hz = /bits/ 64 <267000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <3072000>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-180000000 {
 					opp-hz = /bits/ 64 <180000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 					opp-peak-kBps = <1804000>;
+					opp-supported-hw = <0x07>;
 				};
 			};
 		};
-- 
2.7.4

