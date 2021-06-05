Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430EA39C782
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 12:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhFEKmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 06:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEKmq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 06:42:46 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EDEBC061768
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jun 2021 03:40:58 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id r11so14024835edt.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jun 2021 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hj3/Nk+tqYRB1c5ojPz5XgdR7/8/e5iUg8MA/Htec1o=;
        b=ZyCuiia6imOYMBfDloSPJqp1YVwUtFj4UtM+6NJnEYdt9nB7GuzJzRtP391xT9A7AG
         kki7mUZ/mb7g0esRxTYp7ZH/iG0KyHISO3cD7uGlxYIT28+vRcVmZ5yUaSKnQlyglTJQ
         Lt8pJi2bVKJGhBjUIagF1fL20VfYm8GdVRDSZy6AsPY26eYs3PqExwEVwRDu+Tbsyner
         OGpQfrfRwBWrBuMkJcIF22HRKd0Hnmzd5YvGeMaH11wnaixT0T0YDg+tZzW0g/Ip4h+k
         8nDrPDBxld2cKHLTT7jgH1+eZdNNj1vkRbVYsh85sh36dG3IDN4Zbg/hae0bbMTiOrpB
         +a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hj3/Nk+tqYRB1c5ojPz5XgdR7/8/e5iUg8MA/Htec1o=;
        b=UGpb0rLd+qoiQzBTnZp6HTs49MvTGF7mZdIU5s6ZnSPJS+297PAnjS7+HOMcH7oosu
         xmXhumrIy2urk4K96BsQXJngOOMNnc7dPx0sDmd148+n/PUs7vfMt7w+uro7nAkYxqTh
         Y4zUSCKuFIXiF4gmoeBsVIkzXasGJgDdd4nQ9MbHTNdbNdHcKS6WYsmGaxSMyNMgg7Ix
         mzD/aq1r6I9Q0bsM4pur5XvVk8RTI1NJPtSeWztL/TdLNkmhg4u5yz+FWdlWFnFv3VEX
         IAFGmd8y3KhdFlrhYfEa6dzVSbybqwznyg40xiFvIm9xBs3YBUDzVRyjRHrrb1VxKaIR
         rQyA==
X-Gm-Message-State: AOAM530gG1ngU4aCbaZ91zgBkl5QI4Tw07P+CKoYy8In8q82O4UvWv5i
        lZqx9uCr4pjxsXA0zb2DtdAv9Q==
X-Google-Smtp-Source: ABdhPJyE6j2DVkqFkGJfEn2XqF01kE5lQ5IRImg8mwauc2KXepuf/4gtvnDwnX7MeMrDSLt6OE9JYA==
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr9714418edz.159.1622889656790;
        Sat, 05 Jun 2021 03:40:56 -0700 (PDT)
Received: from PackardBell (192038129059.mbb.telenor.dk. [192.38.129.59])
        by smtp.googlemail.com with ESMTPSA id gx28sm3991353ejc.107.2021.06.05.03.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 03:40:56 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 315d7738;
        Sat, 5 Jun 2021 10:40:53 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2] clk: qcom: smd-rpmcc: Add support for MSM8226 rpm clocks
Date:   Sat,  5 Jun 2021 12:40:40 +0200
Message-Id: <20210605104040.12960-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for rpm smd clocks, PMIC and bus clocks which are required
on MSM8226 for clients to vote on.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 drivers/clk/qcom/clk-smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 295fc08edd..8bced53b49 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -914,6 +914,7 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 };
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
-- 
2.25.1

