Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94967247AA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgHQWpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:45:41 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:25587 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728427AbgHQWpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:45:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597704337; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=QHnpMKHzC7+yvTWFxmZI2JScuBtzKLvqMeZlKO1uvCI=; b=qC67EZfjZos6fdlU8IosfHU0O9d5Qyd7BQ1WKCIrPV+XOV2VnOlUCixdukD/A2bNMlQu86fd
 BAKnw8mzfs13FDQZd/l9riNkzpbCb6yGl0EsBUWgnSxyD7e1y4QtKISkSP8gOurHy2eYdprD
 vN5dG8352UIMwl0aR9VVhpQG5as=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f3b08902b87d66049a61a90 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 22:45:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E1A6C433A0; Mon, 17 Aug 2020 22:45:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5BBFC433CB;
        Mon, 17 Aug 2020 22:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5BBFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     devicetree@vger.kernel.org
Cc:     swboyd@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v1] arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt node
Date:   Mon, 17 Aug 2020 15:45:27 -0700
Message-Id: <20200817224527.28532-1-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This node defines alternate DP HPD functionality of GPIO.

Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index bf2f2bb1aa79..9f97cf5dd9ab 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1457,6 +1457,20 @@ pinconf-sd-cd {
 					drive-strength = <2>;
 				};
 			};
+
+			dp_hot_plug_det: dp-hot-plug-det {
+				pinmux {
+					pins = "gpio117";
+					function = "dp_hot";
+				};
+
+				config {
+					pins = "gpio117";
+					bias-disable;
+					input-enable;
+					drive-strength = <2>;
+				};
+			};
 		};
 
 		gpu: gpu@5000000 {

base-commit: 62975d27d647a40c58d3b96c29b911fc4f33c310
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

