Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9183E9B7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 02:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhHLAJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 20:09:23 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:3966 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbhHLAJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 20:09:21 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 11 Aug 2021 17:08:58 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Aug 2021 17:08:56 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 05:38:26 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
        id 1F6AF220EC; Thu, 12 Aug 2021 05:38:25 +0530 (IST)
From:   Sankeerth Billakanti <sbillaka@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Subject: [PATCH v1 2/2] dt-bindings: Add SC7280 compatible string
Date:   Thu, 12 Aug 2021 05:38:02 +0530
Message-Id: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC7280 platform supports an eDP controller, add
compatible string for it to msm/binding.

Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 64d8d9e..23b78ac 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
+      - qcom,sc7280-edp
 
   reg:
     maxItems: 1
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

