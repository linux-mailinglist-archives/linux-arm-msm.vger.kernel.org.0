Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62375213718
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 11:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgGCJDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 05:03:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:5970 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgGCJDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 05:03:20 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 03 Jul 2020 02:03:19 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 03 Jul 2020 02:03:17 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 03 Jul 2020 14:32:54 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 02D7C21697; Fri,  3 Jul 2020 14:32:52 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V6 04/10] remoteproc: qcom: Add ssr subdevice identifier
Date:   Fri,  3 Jul 2020 14:32:46 +0530
Message-Id: <1593766972-29101-5-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593766972-29101-1-git-send-email-gokulsri@codeaurora.org>
References: <1593766972-29101-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add name for ssr subdevice on IPQ8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 948d533..31fee8d 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1166,6 +1166,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
+	.ssr_name = "q6wcss",
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
 	.need_mem_protection = true,
-- 
2.7.4

