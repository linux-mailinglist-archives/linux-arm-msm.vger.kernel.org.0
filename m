Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AEA37A05E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 09:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhEKHKe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 03:10:34 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:47430 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhEKHKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 03:10:33 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B6u44A140114;
        Tue, 11 May 2021 07:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Mibl25RnqWxYpC/GFaO5Ls5UQcgAmI0Xvt4CjXK5M4g=;
 b=syIFOcbEQP5VpLEs0/9+Z8gwfXky7cdPUEmVv3M5qy4A500TfmGL4cLBtB+PlmnAI2vR
 GibOjevX9AYg/y9clG8JiA9gpA9Ev2yYRpBzLIr0XNvIw3BzXQzbnuvF+V3fORS9d6nQ
 5ecv8yDwtUEThhqJOFod1xfMXQiqETe9JdmBaxx5scRupMriBJ7vrLuFVoEs07UX4wYy
 Qt3LaN/njn/qSQVEwCoopwRUybHToPygMQQ2UKkqB5nmO1F+CvPlUcVEEkIzsR4M+WIF
 hvtfsju9jD6VnKTGcXMO1Uiey4aJwyfzSnFfke7T8xFS9AN16vuMO/cNAlD0Xkvq1HBy Wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 38e285cvnx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:09:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B6toFY000830;
        Tue, 11 May 2021 07:09:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38e5pwqj3b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:09:21 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14B72Osn026089;
        Tue, 11 May 2021 07:09:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 38e5pwqj2v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:09:20 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14B79GL4024914;
        Tue, 11 May 2021 07:09:18 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 May 2021 07:09:16 +0000
Date:   Tue, 11 May 2021 10:09:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: qcom: cleanup some dev_err_probe() calls
Message-ID: <YJotlJBJ1CVAgvMT@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: jIWi1qqxZ-LroHYhOiPYS0431XlE8Odm
X-Proofpoint-ORIG-GUID: jIWi1qqxZ-LroHYhOiPYS0431XlE8Odm
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110053
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dev_err_probe() function prints an error message if the error
code is not -EPROBE_DEFER.  If we know the error code in is -ENODEV
then there is no reason to check.  Conversely, we do not need to
check for -EPROBE_DEFER before calling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/qcom/apcs-sdx55.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
index d0edabebf9c2..ee3fbe755f72 100644
--- a/drivers/clk/qcom/apcs-sdx55.c
+++ b/drivers/clk/qcom/apcs-sdx55.c
@@ -57,7 +57,7 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
 
 	regmap = dev_get_regmap(parent, NULL);
 	if (!regmap) {
-		dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
+		dev_err(dev, "Failed to get parent regmap\n");
 		return -ENODEV;
 	}
 
@@ -82,9 +82,7 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
 	a7cc->pclk = devm_clk_get(parent, "pll");
 	if (IS_ERR(a7cc->pclk)) {
 		ret = PTR_ERR(a7cc->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err_probe(dev, ret, "Failed to get PLL clk\n");
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to get PLL clk\n");
 	}
 
 	a7cc->clk_nb.notifier_call = a7cc_notifier_cb;
-- 
2.30.2
