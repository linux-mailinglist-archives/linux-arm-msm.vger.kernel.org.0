Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14A935EFE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 10:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344304AbhDNIkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 04:40:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60414 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350180AbhDNIir (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 04:38:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618389506; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=jyUb42qJgomuB7pQkbu5JzcZ0Y3XJSuvxS8VVPF5vLU=; b=E0Cs0XIWdiYExgOr7oouF5nengQGEYU8JinT9wbIGLZ+Q9Zaw0JWACjz2xafBPO47Sh34o7q
 1AIq3QMJ4YdC9pkKa+zPKYx5vAZeQM9RiD9or4d6VlWABFrw/PXD+SxGrHbfKnwNxei9qHnC
 pJwQVQjKrIp063D+R1oe9KBcA70=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6076a9ee9a9ff96d95a070a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Apr 2021 08:38:06
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D3D30C433ED; Wed, 14 Apr 2021 08:38:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE6CCC433CA;
        Wed, 14 Apr 2021 08:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE6CCC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V3 4/4] arm64: dts: qcom: sm8150: Add Data Capture and Compare(DCC) support node
Date:   Wed, 14 Apr 2021 14:02:05 +0530
Message-Id: <ac5c413a4f2987a6812d6baaa95a3a83e53c5f43.1618387606.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1618387606.git.schowdhu@codeaurora.org>
References: <cover.1618387606.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1618387606.git.schowdhu@codeaurora.org>
References: <cover.1618387606.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the DCC(Data Capture and Compare) device tree node entry along with
the addresses for register regions.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index e5bb17b..7d4bb28 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -654,6 +654,12 @@
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		dma@10a2000 {
+			compatible = "qcom,sm8150-dcc", "qcom,dcc";
+			reg = <0x0 0x010a2000 0x0 0x1000>,
+			      <0x0 0x010ad000 0x0 0x3000>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

