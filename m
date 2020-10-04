Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A8D2829A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 10:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJDIlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 04:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDIlY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 04:41:24 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6962C0613CE;
        Sun,  4 Oct 2020 01:41:23 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 77so7321467lfj.0;
        Sun, 04 Oct 2020 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEsJIY5ZYdNMQbMQdR+B2QPd4cZJDvY/3CSXM30PvhM=;
        b=f8zMQyyk/sk/SwisbiwA5SYMdWi9bwxyX4acOvy7ZWYK7V2QuGszDOp3oH5X6RCNAG
         cBQTP7KEdhouIuA1bd1zhiH9R1ZGahnoGuxkLJsvcQe37+VbmqTP01tB5HIAkyA8hKFi
         EEoU5KjDZYwfHTyDDzaauKsC1qECuBSNm7fvYqXwq0jH7aazVxrB0iS4tyFINjRSH0qD
         TmzmoJqFBveT+poXlRiOOq8+B8BSCfz5q2t2S5W11T66AszQSt3o6WDyazGGLHUfAtX2
         feUAzz70JhtdeThT7ZH2eRqnxgOfJweUZtRvC/rwHWqJB5YJyYWDaOeUc9CaTmlRD5GT
         7Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEsJIY5ZYdNMQbMQdR+B2QPd4cZJDvY/3CSXM30PvhM=;
        b=sOsqlxkc8InoHEi9ESRg/eMWz2TA+Q4Et4vNF4ctpFo615z6m4PktVA9dm/tBH5AlC
         i2Yc8FCEpOpCpfJQgI4sEoKCpX1Y+3QMq8c/HoCtNIPo53E+F1wqD9+MKM1aIWPUNWMc
         Ve/Q3dKRDTVTJNOI4mMKiwAybNCHx79Wh6H8Wd9JWwEvPr/dCV7qoyf04obYMVkEbMr+
         qYuS8r7NzL+Rc/DFmC1Kx6/AnXuAbZShrsVzc6zQzimevojGy10d4ncFJ1/SQdOzcfpU
         fPh9V/uJgvEYY0rQkfjO6Gtp1oZSXFpvC7BQ08youGmhWtQr1d0N/GE8Ic+HtCEdrHkg
         fi6g==
X-Gm-Message-State: AOAM530kpJzNQqg6Q9lb4iUEFXZ1AXkXWDqy+QE3ArHUcJZznLeGMIgD
        MHrnIVmCbFS6SQwws388VQWP8s4YwAo=
X-Google-Smtp-Source: ABdhPJyPwUzX9Bgb6IZRisyvtF38Oe4wYPI9ABwWsSrX3TcMmWt6gISQ6XlNHrOKkLM6RRwLyfkuPQ==
X-Received: by 2002:ac2:4203:: with SMTP id y3mr3491558lfh.52.1601800882241;
        Sun, 04 Oct 2020 01:41:22 -0700 (PDT)
Received: from localhost.localdomain (host-5-58-109-138.bitternet.ua. [5.58.109.138])
        by smtp.gmail.com with ESMTPSA id f78sm415263lfd.271.2020.10.04.01.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 01:41:21 -0700 (PDT)
From:   Vladimir Lypak <junak.pub@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vladimir Lypak <junak.pub@gmail.com>
Subject: [PATCH] soc: qcom: socinfo: add soc ids for msm8953 variants
Date:   Sun,  4 Oct 2020 11:22:24 +0300
Message-Id: <20201004082223.324019-1-junak.pub@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SoC IDs for MSM8953, APQ8053, SDM(SDA)450, SDM(SDA)632.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index b44ede48decc..d21530d24253 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -218,13 +218,19 @@ static const struct soc_id soc_id[] = {
 	{ 251, "MSM8992" },
 	{ 253, "APQ8094" },
 	{ 291, "APQ8096" },
+	{ 293, "MSM8953" },
+	{ 304, "APQ8053" },
 	{ 305, "MSM8996SG" },
 	{ 310, "MSM8996AU" },
 	{ 311, "APQ8096AU" },
 	{ 312, "APQ8096SG" },
 	{ 318, "SDM630" },
 	{ 321, "SDM845" },
+	{ 338, "SDM450" },
 	{ 341, "SDA845" },
+	{ 349, "SDM632" },
+	{ 350, "SDA632" },
+	{ 351, "SDA450" },
 	{ 356, "SM8250" },
 	{ 402, "IPQ6018" },
 	{ 425, "SC7180" },
-- 
2.24.1

