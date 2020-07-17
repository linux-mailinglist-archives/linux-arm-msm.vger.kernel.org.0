Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCF6223C9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 15:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgGQN35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 09:29:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30134 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgGQN34 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 09:29:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594992595; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qvFYV5gSdJN7uGe/5cfb+tk9FUbHSiqsuZE2Uf3f6Vs=; b=nOJgcJ0XYqVrMbo9kQ9CUm4GIE1AOLVxHBtNDtAjK1FvpcphT+0Nm88JFMTCxEuTcQi8gMAT
 ggLGVkar6wNoie6IkgOF1tcoG69m137B05pFLW2kRjl1JTr67x9Ks+5vvMMTBbbao5vMO/sD
 hhPI1vUxmqA3VQy/e2FL5eg8U5E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-west-2.postgun.com with SMTP id
 5f11a7d3ee86618575f31dc5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 13:29:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E314EC433AF; Fri, 17 Jul 2020 13:29:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 65EA4C433CA;
        Fri, 17 Jul 2020 13:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 65EA4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org, devicetree@vger.kernel.org,
        mka@chromium.org, saravanak@google.com, sibis@codeaurora.org,
        viresh.kumar@linaro.org, jonathan@marek.ca, robdclark@gmail.com,
        bjorn.andersson@linaro.org
Subject: [PATCH v6 1/6] dt-bindings: drm/msm/gpu: Document gpu opp table
Date:   Fri, 17 Jul 2020 18:59:34 +0530
Message-Id: <1594992579-20662-2-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594992579-20662-1-git-send-email-akhilpo@codeaurora.org>
References: <1594992579-20662-1-git-send-email-akhilpo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sharat Masetty <smasetty@codeaurora.org>

Update documentation to list the gpu opp table bindings including the
newly added "opp-peak-kBps" needed for GPU-DDR bandwidth scaling.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 .../devicetree/bindings/display/msm/gpu.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index fd779cd..1af0ff1 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -112,6 +112,34 @@ Example a6xx (with GMU):
 		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
 		interconnect-names = "gfx-mem";
 
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

