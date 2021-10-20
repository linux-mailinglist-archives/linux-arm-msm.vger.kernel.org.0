Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1530B434AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 14:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhJTMQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 08:16:57 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4402 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhJTMQ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 08:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634732082; x=1666268082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NDa9KEOle5Dvn0boViSDp3mupUuPQQnHaePh4Ug4R4E=;
  b=b1Y8BuxepWhvlK5edrCtihec4nlli3naC7nnXvjDQWWBwBxT2dsMmYRS
   XsvVcI9f8AqQwFFjWu4FTFYBLHYOi3rErKAWWZrVYZvu11sUzqZvdm9jj
   zOEX/qktt2CX7guBWlasnKQ7Zs0KSCGUglyHV5UIdiBeekBktIHB/d9DW
   E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 05:14:42 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Oct 2021 05:14:41 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
  by ironmsg01-blr.qualcomm.com with ESMTP; 20 Oct 2021 17:44:27 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
        id 5E91420E29; Wed, 20 Oct 2021 17:44:26 +0530 (IST)
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH v2 2/2] dt-bindings: Add SC7280 compatible string
Date:   Wed, 20 Oct 2021 17:44:11 +0530
Message-Id: <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sankeerth Billakanti <sbillaka@codeaurora.org>

The Qualcomm SC7280 platform supports an eDP controller, add
compatible string for it to dp-controller.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 63e585f..ab2bb1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
 
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

