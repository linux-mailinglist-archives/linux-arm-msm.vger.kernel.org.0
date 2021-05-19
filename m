Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FC1388859
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 09:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241357AbhESHpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 03:45:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34093 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240732AbhESHpa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 03:45:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621410251; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=acAobIy0qt2MWLfcT4zE1Y3oS2Emzp0ePyjcVtSitB8=; b=WuvWY/UXh9AU4rtUyXj7QvVJHh7yw1XsQcrAxZY9eElrJncHnOZJYR9k6BhC+uNZCshPzSy7
 RXy+kT7I2Jyst/wOEkfKMdltNbKa1+XazgUPulQXgH4w3wYxQ9ala8N0wddNcFNuCDZ0f4A6
 0iotkN6CpH1cOU2tdPzpuh60SOk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60a4c1c67b9a7a2b6cee04b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 07:44:06
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2241C43460; Wed, 19 May 2021 07:44:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82FC2C43460;
        Wed, 19 May 2021 07:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82FC2C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v8 5/5] arm64: boot: dts: qcom: sm8150: Enable dynamic TX FIFO resize logic
Date:   Wed, 19 May 2021 00:43:58 -0700
Message-Id: <1621410238-31395-6-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
References: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the flexible TX FIFO resize logic on SM8150.  Using a larger TX FIFO
SZ can help account for situations when system latency is greater than the
USB bus transmission latency.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 51235a9..8f532cb 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2275,6 +2275,7 @@
 				iommus = <&apps_smmu 0x140 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				tx-fifo-resize;
 				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

