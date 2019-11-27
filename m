Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91ED210B210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 16:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbfK0POH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 10:14:07 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:48553 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727133AbfK0PNd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 10:13:33 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Nov 2019 20:43:25 +0530
IronPort-SDR: QVme6SLviMrHy975AmdNIohJhyVzHGlbWtEQFUjEhmi/fAE7tw+3TpSxJeXnsj0J1UxdkV+5GR
 /dtmG+dRnFSkYb2N5NCvSnTlDjA4ALMM+RXVY4mArvzoz8fXQXjVLgVvpNcariRM9hR9RAQYfx
 Re8kKdbQCIoLAzjtsIPkhbFM110qdH4tpdVXBCWtGF2OZdQTdj+1rIJ9nZDq1y60DaH2418cNL
 CqKjXUT34ML2P2fQUOlERc4OIG9cnlE4MARjLrcf2TaFOm4D0SCR3BAfo/tjIO1WX5t3hICUKJ
 RvQi1cG/1uNAHaEZ5zulixFK
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Nov 2019 20:42:58 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id CA1263981; Wed, 27 Nov 2019 20:42:55 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V3 07/10] clk: qcom: Add WCSSAON reset
Date:   Wed, 27 Nov 2019 20:42:51 +0530
Message-Id: <1574867574-2216-8-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
References: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
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

