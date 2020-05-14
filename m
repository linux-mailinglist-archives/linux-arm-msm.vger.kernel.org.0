Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9221D2DA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 12:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgENKzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 06:55:00 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:12045 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726908AbgENKy7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 06:54:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589453699; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=IFw+MdK9cB0nOb0XyjKcs2qAJSm5K1ae8zeof47RqpI=; b=aJxoHdV/Cp6NhJqQVQFBdebOM1gkT5jVytV0tg37tGJw9C26E4Yo+BYyzMzMFuF9T5Ndm3+l
 5u1RMS2Cnpczn3wq8e6jPEwtTTB2tnnfNtfYBydQHnp9sX26ylwA2LH792QSp9C/vvQjkhxy
 vMjIy6QQAL5gjEfzrjAIxHEN1Pw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd237d.7f2e20d0c340-smtp-out-n05;
 Thu, 14 May 2020 10:54:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B44C1C44792; Thu, 14 May 2020 10:54:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D4B6C44791;
        Thu, 14 May 2020 10:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D4B6C44791
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org, mka@chromium.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 6/6] dt-bindings: drm/msm/gpu: Document gpu opp table
Date:   Thu, 14 May 2020 16:24:19 +0530
Message-Id: <1589453659-27581-7-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update documentation to list the gpu opp table bindings including the
newly added "opp-peak-kBps" needed for GPU-DDR bandwidth scaling.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 .../devicetree/bindings/display/msm/gpu.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 70025cb..48bd4ab 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -79,6 +79,34 @@ Example a6xx (with GMU):

 		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;

+		gpu_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-430000000 {
+				opp-hz = /bits/ 64 <430000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				opp-peak-kBps = <5412000>;
+			};
+
+			opp-355000000 {
+				opp-hz = /bits/ 64 <355000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				opp-peak-kBps = <3072000>;
+			};
+
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				opp-peak-kBps = <3072000>;
+			};
+
+			opp-180000000 {
+				opp-hz = /bits/ 64 <180000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				opp-peak-kBps = <1804000>;
+			};
+		};
+
 		qcom,gmu = <&gmu>;

 		zap-shader {
--
2.7.4
