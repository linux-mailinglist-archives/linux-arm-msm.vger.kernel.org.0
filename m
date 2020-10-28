Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE7F29E200
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 03:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgJ2CFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 22:05:13 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:23201 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727106AbgJ1Vil (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 17:38:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603921121; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=H308bgHtNMckRynOpOEBssH/vo6aQHBFl+tdwdPWVmU=; b=TEgs4JZVu3d+5ntx+iYqvQb2dliNGZigC+gZYh2m9GuOgG3YZffBZq81WRzjKSrXifFBFrZ5
 0ob/5TtyGkQBhvqchi602lUeKdLAuDJ/fwiTBJ4XN0Cek0U4y1ou6euiL2uz9PibdmNdXRKz
 HUMVo+4aZIuHDiEOlDmBMcoVqu4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f9974bd38c6e4004525b9e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 13:40:13
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26736C43395; Wed, 28 Oct 2020 13:40:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BECEC433A0;
        Wed, 28 Oct 2020 13:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6BECEC433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     robh@kernel.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jcrouse@codeaurora.org, mka@chromium.org, robdclark@gmail.com,
        dianders@chromium.org
Subject: [PATCH v3 3/3] dt-bindings: drm/msm/gpu: Add cooling device support
Date:   Wed, 28 Oct 2020 19:09:54 +0530
Message-Id: <1603892395-3570-3-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603892395-3570-1-git-send-email-akhilpo@codeaurora.org>
References: <1603892395-3570-1-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add cooling device support to gpu. A cooling device is bound to a
thermal zone to allow thermal mitigation.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 1af0ff1..090dcb3 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -39,6 +39,10 @@ Required properties:
         a4xx Snapdragon SoCs. See
         Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
 
+Optional properties:
+- #cooling-cells: The value must be 2. For details, please refer
+	Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.
+
 Example 3xx/4xx:
 
 / {
@@ -61,6 +65,7 @@ Example 3xx/4xx:
 		power-domains = <&mmcc OXILICX_GDSC>;
 		operating-points-v2 = <&gpu_opp_table>;
 		iommus = <&gpu_iommu 0>;
+		#cooling-cells = <2>;
 	};
 
 	gpu_sram: ocmem@fdd00000 {
@@ -98,6 +103,8 @@ Example a6xx (with GMU):
 		reg = <0x5000000 0x40000>, <0x509e000 0x10>;
 		reg-names = "kgsl_3d0_reg_memory", "cx_mem";
 
+		#cooling-cells = <2>;
+
 		/*
 		 * Look ma, no clocks! The GPU clocks and power are
 		 * controlled entirely by the GMU
-- 
2.7.4

