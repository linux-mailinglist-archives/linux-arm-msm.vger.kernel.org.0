Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2772331BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 14:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgG3MOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 08:14:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15938 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgG3MOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 08:14:34 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 30 Jul 2020 05:14:33 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 30 Jul 2020 05:14:31 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 30 Jul 2020 17:44:06 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 40628218A1; Thu, 30 Jul 2020 17:44:05 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v8 4/4] remoteproc: qcom: wcss: explicitly request exclusive reset control
Date:   Thu, 30 Jul 2020 17:44:04 +0530
Message-Id: <1596111244-28411-5-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
References: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Govind Singh <govinds@codeaurora.org>

Use request exclusive reset control for wcss reset controls.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 3091b78..efb16a4 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -788,21 +788,21 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 	struct device *dev = wcss->dev;
 
 	if (desc->aon_reset_required) {
-		wcss->wcss_aon_reset = devm_reset_control_get(dev, "wcss_aon_reset");
+		wcss->wcss_aon_reset = devm_reset_control_get_exclusive(dev, "wcss_aon_reset");
 		if (IS_ERR(wcss->wcss_aon_reset)) {
 			dev_err(wcss->dev, "fail to acquire wcss_aon_reset\n");
 			return PTR_ERR(wcss->wcss_aon_reset);
 		}
 	}
 
-	wcss->wcss_reset = devm_reset_control_get(dev, "wcss_reset");
+	wcss->wcss_reset = devm_reset_control_get_exclusive(dev, "wcss_reset");
 	if (IS_ERR(wcss->wcss_reset)) {
 		dev_err(wcss->dev, "unable to acquire wcss_reset\n");
 		return PTR_ERR(wcss->wcss_reset);
 	}
 
 	if (desc->wcss_q6_reset_required) {
-		wcss->wcss_q6_reset = devm_reset_control_get(dev, "wcss_q6_reset");
+		wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
 		if (IS_ERR(wcss->wcss_q6_reset)) {
 			dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
 			return PTR_ERR(wcss->wcss_q6_reset);
-- 
2.7.4

