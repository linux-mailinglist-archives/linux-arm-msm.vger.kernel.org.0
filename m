Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D34D5108D6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 13:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbfKYMAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 07:00:03 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:1231 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727148AbfKYMAC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 07:00:02 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2019 17:29:59 +0530
IronPort-SDR: DjLMkUQ55vwMHrheiFK8/tOMOjON+m3bXs8uHpnZu0DZqqyiQ8STF1RMzC/Ylk/keVRAvSIMDE
 MttHmuWjF1VDaV8QrILwl8rVcLwGFMj7JqZpC4P1V0IADqW8DFfCmpZK58Mjkpx0t+g2drgEbG
 xx9icSEPz2sLkIhBdTtyGd0WwSJxR1ojtuWRK9WKtvYYPluJ3RitiNkVViawtBix3uSNc99HMu
 SVQmi5H6qOIvZHC9JZ0mU2osbwC8pwhhpuihoLa9sBshxpnIlmEkNoZgKZqoGbJO4o0+RukAj8
 OJ3j97szcHyng6dJGk6urcJ0
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2019 17:29:38 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 9E7E6432B; Mon, 25 Nov 2019 17:29:37 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org, dhar@codeaurora.org,
        jsanka@codeaurora.org, chandanu@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH 1/4] dt-bindings: msm:disp: add sc7180 DPU variant
Date:   Mon, 25 Nov 2019 17:29:26 +0530
Message-Id: <1574683169-19342-2-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
References: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible string to support sc7180 dpu version.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index a61dd40..551ae26 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible: "qcom,sdm845-mdss"
+- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
@@ -41,7 +41,7 @@ Optional properties:
 
 MDP:
 Required properties:
-- compatible: "qcom,sdm845-dpu"
+- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
 - reg: physical base address and length of controller's registers.
 - reg-names : register region names. The following region is required:
   * "mdp"
-- 
1.9.1

