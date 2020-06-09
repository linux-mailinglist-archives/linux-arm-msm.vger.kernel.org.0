Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8041F4882
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 22:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgFIU7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 16:59:15 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:19098 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728053AbgFIU7L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 16:59:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591736350; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=w98NvCRSqsgrCEWuhZkp5a80F1qEDmyKmBRdGBNIFfs=; b=qh85qsk3Lbxfae/qAjQ+4ezDqvEU3ccibqNZ9ZwGBtW5nHbtpUzWJXJ1+SlshdCxcEVOKROI
 HrpAXtIPMNyG6NViOcd7O2pR0JtYVj+2UdRTYhYDZnbvcQD+YSmuvGy0UG0Fx7+xmL4QqQyr
 x+t0xWcek5Xnb3T3EbfY3eRrJRY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5edff8146bebe35deb64f5c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 20:59:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66A01C433CB; Tue,  9 Jun 2020 20:59:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23808C433C6;
        Tue,  9 Jun 2020 20:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 23808C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, bryan.odonoghue@linaro.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 3/3] arm64: boot: dts: qcom: pm8150b: Add node for USB type C block
Date:   Tue,  9 Jun 2020 13:58:51 -0700
Message-Id: <20200609205851.30113-4-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609205851.30113-1-wcheng@codeaurora.org>
References: <20200609205851.30113-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8150B has a dedicated USB type C block, which can be used for type C
orientation and role detection.  Create the reference node to this type C
block for further use.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 40b5d75..7364d6b 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -22,6 +22,13 @@
 			status = "disabled";
 		};
 
+		qcom,typec@1500 {
+			compatible = "qcom,pm8150b-usb-typec";
+			reg = <0x1500>;
+			interrupts =
+				<0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		adc@3100 {
 			compatible = "qcom,spmi-adc5";
 			reg = <0x3100>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

