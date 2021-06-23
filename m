Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98EB3B196F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 13:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhFWMAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 08:00:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49378 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhFWMAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 08:00:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624449484; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=AHMt0GzCvHn4hyYD7cdhM7SJoQ7X95tIMSwPoZD5d7s=; b=jbyG9iTmfMSVGq+8tleX9/L0E9OijYr2f9vBrDtk+EUw3Ozs9SF6A71XF8c51l9D9cdD9sFK
 +kyrCn2eYoW/CE1sJ8pZ+PEqCE8GxL3wJiqXmZomJjy/sq46Ug7Q5GyIUZI2/7kzCkReACqn
 uANeSiEeGxDIexuQ03WM9W81QGc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60d321cadc4628fe7eb49d98 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 11:58:02
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11E66C4338A; Wed, 23 Jun 2021 11:58:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00A2DC433D3;
        Wed, 23 Jun 2021 11:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00A2DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2] clk: qcom: gcc: Add support for a new frequency for SC7280
Date:   Wed, 23 Jun 2021 17:27:51 +0530
Message-Id: <1624449471-9984-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a requirement to support 52MHz for qup clocks for bluetooth
usecase, thus update the frequency table to support the frequency.

Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
[v2]
 * Update commit message and subject "Add"/"bluetooth".

 drivers/clk/qcom/gcc-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index ef734db..6cefcdc 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -716,6 +716,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s2_clk_src[] = {
 	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
 	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
 	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(52174000, P_GCC_GPLL0_OUT_MAIN, 1, 2, 23),
 	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
 	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
 	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

