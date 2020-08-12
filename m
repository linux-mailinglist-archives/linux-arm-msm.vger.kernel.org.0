Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F83C24282D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 12:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgHLKWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 06:22:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:54048 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726525AbgHLKWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 06:22:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597227773; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qdWJj+YFiq/6Q8Qq5gxz1zII2UH/kdDISNfbcizm23s=; b=Bboj5vOXHg2XdQydQZdOi4dk0ClxLu/Dctg9boKQvLWKw02wo6Xi5t9SXxcKcEhgIeQfRBXU
 I+1Epranjxerj82KmEQRheIH5bsyHe5rPwY+COph2oDswLCL+z5EOygn9zpE/lFccvsADRa/
 FjPeMRdmVsX6PrjCQ1kJ+onW0b8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f33c2fc247ccc308cc5e622 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 10:22:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D706C43391; Wed, 12 Aug 2020 10:22:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EDB26C433C6;
        Wed, 12 Aug 2020 10:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EDB26C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, john.stultz@linaro.org,
        amit.pundir@linaro.org, tdas@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] arm64: dts: sdm845: Fixup OPP table for all qup devices
Date:   Wed, 12 Aug 2020 15:52:10 +0530
Message-Id: <1597227730-16477-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This OPP table was based on the clock VDD-FMAX tables seen in
downstream code, however it turns out the downstream clock
driver does update these tables based on later/production
rev of the chip and whats seen in the tables belongs to an
early engineering rev of the SoC.
Fix up the OPP tables such that it now matches with the
production rev of sdm845 SoC.

Fixes: 13cadb34e593 ("arm64: dts: sdm845: Add OPP table for all qup
devices")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577..eca81cf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1093,8 +1093,8 @@
 		qup_opp_table: qup-opp-table {
 			compatible = "operating-points-v2";
 
-			opp-19200000 {
-				opp-hz = /bits/ 64 <19200000>;
+			opp-50000000 {
+				opp-hz = /bits/ 64 <50000000>;
 				required-opps = <&rpmhpd_opp_min_svs>;
 			};
 
@@ -1107,6 +1107,11 @@
 				opp-hz = /bits/ 64 <100000000>;
 				required-opps = <&rpmhpd_opp_svs>;
 			};
+
+			opp-128000000 {
+				opp-hz = /bits/ 64 <128000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
 		};
 
 		qupv3_id_0: geniqup@8c0000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

