Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83CE6108F6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 14:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfKYN7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 08:59:53 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37549 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbfKYN7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 08:59:52 -0500
Received: by mail-lf1-f67.google.com with SMTP id b20so11111725lfp.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 05:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wJXgU1Ng7cyLAs4JFhWANoeuEktL+F9+1MeqR48Alzc=;
        b=jY4XKY/91dQiNFPe3L28KbxvxKBrbFtLaZUgSfddAtxodbkHZ/5fHWRIsna8DA7F5H
         miUjEE5uOvc5q98pK6uq7K1CFVeJNxQVGYLF/8tUhfoBQFknfL42uEI3ux8tT8A5SJkE
         suN+xr+gBO5ofHQDROHoK47oIsE6kTvX5JFZ6+toL498YiRRb8hI9KaVo0gj3KUYIu/c
         VW/lgGSdP6dhTZ6H4lT2ERz58FjnvUYva+MBYjt+j78jMD0l71zjGKD4vK0IZm/7vdJc
         hBlSiFQvqSMgCDISmW/RItDQrV9pPchpHpmY89mzDj/9+HBCY6m5NFfi09aA3iJlDMRz
         9I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wJXgU1Ng7cyLAs4JFhWANoeuEktL+F9+1MeqR48Alzc=;
        b=IT1ay90WqqrZL7epWGjNez44PC0DmR+wxbozbQrI6pQElgkAsEylbNxWOOulPQqVzg
         8IjSnmwTw+hR6BE4qDO/PUqXM4Pv0PoagkYco26Gj/CHTeh9eykwu5rIKbC3l3qFRSBr
         DcKTVx//gQDtMHHUrqd/Iww76xBPBbNSxZ6ijfhMBf48k89YcN7s1rvjvDfFaOCU+KaD
         SD4j8Z1dyzxBOJJv7A4ajyhRbF8C2lfV+3jnzUICrtEzy+LS8ncie5QR7ov8Tl1Hos60
         H4XNd4JDQcO5n1UcGJkxMRTfEuehkgpfRC3VaCF99UDCSk8U481TRIjL7sDpqzRVqA/H
         9VMA==
X-Gm-Message-State: APjAAAV35IQBtuaFWPWlKRVamgQotENvDRPol7Zu+3mD7r/lWZ2Tm+fb
        yaVAyExELgeaqM7bscmtPRUBTg==
X-Google-Smtp-Source: APXvYqz3x/As1OKwSedf76XPDYruYgbzSqZRbTQCUjUICqB818J+1El2T/CtYyY7mD7TaivthOYGaA==
X-Received: by 2002:ac2:5a08:: with SMTP id q8mr20791341lfn.106.1574690390726;
        Mon, 25 Nov 2019 05:59:50 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id g11sm3688529lfb.94.2019.11.25.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:50 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] clk: qcom: apcs-msm8916: silently error out on EPROBE_DEFER
Date:   Mon, 25 Nov 2019 14:59:08 +0100
Message-Id: <20191125135910.679310-7-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125135910.679310-1-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

If devm_clk_get() fails due to probe deferral, we shouldn't print an
error message. Just be silent in this case.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
Changes since v2:
-New patch. (This change was previously part of another
patch in this series.)

 drivers/clk/qcom/apcs-msm8916.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index a6c89a310b18..46061b3d230e 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -79,7 +79,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	a53cc->pclk = devm_clk_get(parent, NULL);
 	if (IS_ERR(a53cc->pclk)) {
 		ret = PTR_ERR(a53cc->pclk);
-		dev_err(dev, "failed to get clk: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get clk: %d\n", ret);
 		return ret;
 	}
 
-- 
2.23.0

