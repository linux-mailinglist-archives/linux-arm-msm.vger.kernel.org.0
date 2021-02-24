Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36163238BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 09:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbhBXIgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 03:36:04 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11671 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234489AbhBXIft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 03:35:49 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 24 Feb 2021 00:34:04 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 24 Feb 2021 00:34:01 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Feb 2021 14:03:33 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id B86CC3D1D; Wed, 24 Feb 2021 14:03:31 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 6/7] regulator: qcom-rpmh: Use correct buck for S1C regulator
Date:   Wed, 24 Feb 2021 14:03:11 +0530
Message-Id: <1614155592-14060-7-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use correct buck, that is, pmic5_hfsmps515 for S1C regulator
of PM8350C PMIC.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 2d0cd23..22fec37 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -910,7 +910,7 @@ static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
 };
 
 static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps515, "vdd-s1"),
 	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
 	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
 	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

