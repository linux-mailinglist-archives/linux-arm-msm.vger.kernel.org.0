Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B94530929E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 09:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbhA3Ivc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 03:51:32 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:20533 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbhA3Fag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 00:30:36 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 21:20:32 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 21:20:30 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jan 2021 10:50:14 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 4BBE621A09; Sat, 30 Jan 2021 10:50:14 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v8 6/9] dt-bindings: clock: qcom: Add reset for WCSSAON
Date:   Sat, 30 Jan 2021 10:50:10 +0530
Message-Id: <1611984013-10201-7-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611984013-10201-1-git-send-email-gokulsri@codeaurora.org>
References: <1611984013-10201-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
index 8e2bec1..9b1c42b 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
@@ -366,5 +366,6 @@
 #define GCC_PCIE1_AHB_ARES			129
 #define GCC_PCIE1_AXI_MASTER_STICKY_ARES	130
 #define GCC_PCIE0_AXI_SLAVE_STICKY_ARES		131
+#define GCC_WCSSAON_RESET			132
 
 #endif
-- 
2.7.4

