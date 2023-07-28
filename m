Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9D1C7665E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 09:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbjG1H5v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 03:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234534AbjG1H5q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 03:57:46 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA6135A5
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 00:57:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9338e4695so27463381fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690531062; x=1691135862;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0egf4lvYdcuItu5sen9yx+hMceloBrv5HDtWkj+EBQ=;
        b=dS3PNhWJYTk9cprQeaGLT67v18rkYMVG8OD1eutt+f164WQIPznvCQMs7Si18TZqga
         41LKjZwbhGquP/773V+3Vgg+t5yUvegeP4iKWSKuv2M+Hf++5IGdh6BZruuA+Tal36xD
         6M6l1dohtyWMfZdJpQsIdrhHjoYPlkg71FMgddsgM2IVxZa7wMjQAPJO7REo247krxQ9
         BhS8nE+gdvHKQleh2noz0hKehulWCCFpLKNZCZVlkGPHyE/O7/D1kqPveRZMDz/vE8uw
         xfsNZ9h9/JbSN4iosvgAdkXzl3uZe3stDsJlYoq2UW3aJIRXtF/93v31NK9c9JAkRucj
         sT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690531062; x=1691135862;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0egf4lvYdcuItu5sen9yx+hMceloBrv5HDtWkj+EBQ=;
        b=BmcHrfO0ZZj5ku1UbkSxpVJLB9RaqFc7SXd//VDLh606DGNP5r4cX25fOtB+mm3fnE
         30G4npWVJsqS/N13F8oKntap2fZaiU3xBSbCHNziVwSrTkTKeFRmYpM03IKGoWad4ery
         f5Kq+w0A4vtlL3Ss6zB9ypGWjQZ/PZJ88z+3gaahhcrnu14wAYrrT4P7SLX2Ie2cvf9L
         36ORf6izojKTstAUBNAruRuJ5ZIIq/9wLYsGrejofbIQVTKWCCQ+L44HdmPXQuslApMl
         +H3NeX2pR1W2m6BFq/BEPJt9qnYzHQTHw/3sKfblshH7CfskBQKF014WRd+k4jEbaK7X
         A/jA==
X-Gm-Message-State: ABy/qLY6sfH8+XVATy0/ptzSCfk0ObytjUvyl6vbRnc7h0hbDlxV+wnx
        IzSSqJmyTbDLp17kW0LB+jt+Ew==
X-Google-Smtp-Source: APBJJlExEQ4pj7ugLoNByUG8EtzPoAPNQAMl1O8D7AkLZ3lHhZRhnffSaaDkTHoh4VybbisqyXWvzw==
X-Received: by 2002:a2e:8052:0:b0:2b7:2066:10e1 with SMTP id p18-20020a2e8052000000b002b7206610e1mr1073206ljg.0.1690531062110;
        Fri, 28 Jul 2023 00:57:42 -0700 (PDT)
Received: from [192.168.1.101] (abxi112.neoplus.adsl.tpnet.pl. [83.9.2.112])
        by smtp.gmail.com with ESMTPSA id b9-20020a2e9889000000b002b9b90474c7sm812128ljj.129.2023.07.28.00.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 00:57:41 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 28 Jul 2023 09:57:38 +0200
Subject: [PATCH v3] clk: qcom: reset: Use the correct type of sleep/delay
 based on length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-qcom_reset-v3-1-5958facd5db2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPF0w2QC/4WNywrCMBQFf0Wy9kpepK0r/0NE0uTaBmpSkxqU0
 n837c6NLufAmZlJwugwkeNuJhGzSy74AmK/I6bXvkNwtjDhlAtacQVTGJ2Bhwn3a8SEE0hZV42
 hoq6MIuXW6oTQRu1NX47+OQxlHCPe3GvrnC+Fe5emEN9bNrN1/VHIDCg03KKyAqWpzGlwXsdwC
 LEjqy3zfwYODKRWyFpmqRTNl2FZlg8k00lNCAEAAA==
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690531060; l=1668;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=KmWdb1cFJ5NCkxYQVBMw/8dqUkNhoXKd6PZJInnl0sk=;
 b=5ex5l4lNbpCLd6R/8kOSv9yzeJmaFT0DCt2kcnOoNuiA0y2TM42MwY7xpad/DVo/0JpqjJo5P
 ADVi7622fQhClBiG34qwptIDGxNnP2l+BEjaVBhjtu5DNOwN4gIIkff
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the fsleep() helper that (based on the length of the delay, see: [1])
chooses the correct sleep/delay functions.

[1] https://www.kernel.org/doc/Documentation/timers/timers-howto.txt

Fixes: 2cb8a39b6781 ("clk: qcom: reset: Allow specifying custom reset delay")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Let the toggle include a bigger delay and make sure it's using the
correct function to achieve that.
---
Changes in v3:
- Improve the commit message
- Link to v2: https://lore.kernel.org/r/20230726-topic-qcom_reset-v2-1-4a6e1b1d0439@linaro.org

Changes in v2:
- Drop the "allow bigger delay" until there's a user
- Use fsleep instead of open-coding effectively the same
- Fix the fixes tag
- Link to v1: https://lore.kernel.org/r/20230726-topic-qcom_reset-v1-0-92de6d3e4c7c@linaro.org
---
 drivers/clk/qcom/reset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
index 0e914ec7aeae..e45e32804d2c 100644
--- a/drivers/clk/qcom/reset.c
+++ b/drivers/clk/qcom/reset.c
@@ -16,7 +16,8 @@ static int qcom_reset(struct reset_controller_dev *rcdev, unsigned long id)
 	struct qcom_reset_controller *rst = to_qcom_reset_controller(rcdev);
 
 	rcdev->ops->assert(rcdev, id);
-	udelay(rst->reset_map[id].udelay ?: 1); /* use 1 us as default */
+	fsleep(rst->reset_map[id].udelay ?: 1); /* use 1 us as default */
+
 	rcdev->ops->deassert(rcdev, id);
 	return 0;
 }

---
base-commit: 451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
change-id: 20230726-topic-qcom_reset-44879c0387c6

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

