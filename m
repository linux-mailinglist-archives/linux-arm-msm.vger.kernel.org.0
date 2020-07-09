Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6913821A86A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 22:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgGIUBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 16:01:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:22657 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbgGIUBp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 16:01:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594324904; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=8iidDXtODABGvQpH1ZOjB+bZqANOW83DMaIoVI6ViP4=; b=wGq+g0t/874+MfGTKSMopqaGR9D2yrKs9iQS8GtITAwdDRcJhUciN7KLMN5e0jnNWTuHczLv
 Fd0mt1p3fuP6MA4fJv0tyCX2JpOkKpXzDUn9+2I9ol/nITeKgcCkICWJvrEhiWMQxLz9OkGI
 VaY7CBBDchmX5eRaAbe0orcP5c4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f07778c9f03943e5cec6c06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 20:01:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85D56C43395; Thu,  9 Jul 2020 20:01:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81213C433C6;
        Thu,  9 Jul 2020 20:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81213C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org, devicetree@vger.kernel.org,
        mka@chromium.org, saravanak@google.com, sibis@codeaurora.org,
        viresh.kumar@linaro.org, jonathan@marek.ca
Subject: [PATCH v4 6/7] arm64: dts: qcom: sc7180: Add interconnects property for GPU
Date:   Fri, 10 Jul 2020 01:30:26 +0530
Message-Id: <1594324828-9571-7-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sharat Masetty <smasetty@codeaurora.org>

This patch adds the interconnects property to the GPU node. This enables
the GPU->DDR path bandwidth voting.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 31b9217..a567297 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1470,6 +1470,8 @@
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
 
+			interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-- 
2.7.4

