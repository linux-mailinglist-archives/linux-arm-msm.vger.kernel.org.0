Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 597BA65AD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbfGKPs0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:48:26 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:55881 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729148AbfGKPsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:48:24 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jul 2019 21:11:32 +0530
X-IronPort-AV: E=McAfee;i="6000,8403,9314"; a="10317411"
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2019 21:11:11 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 3E74935D0; Thu, 11 Jul 2019 21:11:09 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 07/12] clk: qcom: Add WCSSAON reset
Date:   Thu, 11 Jul 2019 21:11:03 +0530
Message-Id: <1562859668-14209-8-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add WCSSAON reset required for Q6v5 on IPQ8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 39ade58..06092f8 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -4685,6 +4685,7 @@ enum {
 	[GCC_PCIE1_AXI_SLAVE_ARES] = { 0x76040, 4 },
 	[GCC_PCIE1_AHB_ARES] = { 0x76040, 5 },
 	[GCC_PCIE1_AXI_MASTER_STICKY_ARES] = { 0x76040, 6 },
+	[GCC_WCSSAON_RESET] = { 0x59010, 0 },
 };
 
 static const struct of_device_id gcc_ipq8074_match_table[] = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

