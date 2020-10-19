Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF6B2927FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 15:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgJSNOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 09:14:52 -0400
Received: from z5.mailgun.us ([104.130.96.5]:36576 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727955AbgJSNOu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 09:14:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603113289; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=EDT6u1q6ACEvrBc2BppeDYMdoHFAYde7oPctSzlqmv4=; b=YYOQCoH9MadfRT35Mam++br342aVCtjAmqJd+HrDcl/I7jdqN8w28fcFEJazQ9zy99y6/8H5
 UTKbaWT+GnNS/GodfpLrEHWYiAnK3tNh9qSrREAaPocwV4zSV1mKPNYqwlTbuQYsPyC+jdmz
 sqqIpmoxCB0uBsKrQ5X53/dVW1A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f8d9149588858a304e4373f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 13:14:49
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2E2CC43382; Mon, 19 Oct 2020 13:14:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E4E74C433FF;
        Mon, 19 Oct 2020 13:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E4E74C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
Subject: [PATCH v2 3/3] dt-bindings: drm/msm/gpu: Add cooling device support
Date:   Mon, 19 Oct 2020 18:44:28 +0530
Message-Id: <1603113268-21161-3-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603113268-21161-1-git-send-email-akhilpo@codeaurora.org>
References: <1603113268-21161-1-git-send-email-akhilpo@codeaurora.org>
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
index 1af0ff1..a496381 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -39,6 +39,10 @@ Required properties:
         a4xx Snapdragon SoCs. See
         Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
 
+Optional properties:
+- #cooling-cells: The value must be 2. Please refer
+	Documentation/devicetree/bindings/thermal/thermal.txt for detail.
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

