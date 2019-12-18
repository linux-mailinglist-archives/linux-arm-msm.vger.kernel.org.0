Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3418B124C9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 17:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbfLRQGl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 11:06:41 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:63178 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727500AbfLRQG0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 11:06:26 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Dec 2019 21:36:17 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 18 Dec 2019 21:35:49 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 7CD803C56; Wed, 18 Dec 2019 21:35:47 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V4 07/10] clk: qcom: Add WCSSAON reset
Date:   Wed, 18 Dec 2019 21:35:43 +0530
Message-Id: <1576685146-17135-8-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576685146-17135-1-git-send-email-gokulsri@codeaurora.org>
References: <1576685146-17135-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add WCSSAON reset required for Q6v5 on IPQ8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
changes since v1: none
---
 drivers/clk/qcom/gcc-ipq8074.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index e01f5f5..1e5758f 100644
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
1.9.1

