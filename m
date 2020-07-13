Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4864E21CE60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 06:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgGMErO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 00:47:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33881 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgGMErN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 00:47:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594615633; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=D1cJQYMG1BKUOtpcDCFa52YY0VbzOKffRSGeoyv72S0=; b=n8mQNgvIPnY2ORWLlxpN9XZW9x1jUn0jTgHmiwPysndJUr71GlAJwAFCJEitXH0luredMxnL
 N+uMcaWi5Jwbav7k+c+D+kl8q+CdF5KAVVmnZiZB8D4YMffTRGs5P3pVYbafwswtBhxrwfUo
 XJmqH6BDRm7HE7q92DfsXr6uSeU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f0be73e166c1c5494460b09 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 04:46:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9EABBC433C6; Mon, 13 Jul 2020 04:46:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF583C433C8;
        Mon, 13 Jul 2020 04:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF583C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     devicetree@vger.kernel.org
Cc:     dianders@chromium.org, evgreen@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Add missing properties for Wifi node
Date:   Mon, 13 Jul 2020 10:16:26 +0530
Message-Id: <1594615586-17055-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The wlan firmware memory is statically mapped in
the Trusted Firmware, hence the wlan driver does
not need to map/unmap this region dynamically.

Hence add the property to indicate the wlan driver
to not map/unamp the firmware memory region
dynamically.

Also add the chain1 voltage supply for wlan.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
Changes from v1:
- Add the wifi mac alias

This patch is created on top of the change by
Douglas Anderson.
https://lkml.org/lkml/2020/6/25/817

Also the dt-bindings for the chain1 voltage supply
is added by the below patch series:
https://patchwork.kernel.org/project/linux-wireless/list/?series=309137
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 472f7f4..c042d61 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -19,6 +19,7 @@
 
 	aliases {
 		bluetooth0 = &bluetooth;
+		wifi0 = &wifi;
 		hsuart0 = &uart3;
 		serial0 = &uart8;
 	};
@@ -391,10 +392,12 @@
 
 &wifi {
 	status = "okay";
+	qcom,msa-fixed-perm;
 	vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
 	vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l11c_3p3>;
 	wifi-firmware {
 		iommus = <&apps_smmu 0xc2 0x1>;
 	};
-- 
2.7.4

