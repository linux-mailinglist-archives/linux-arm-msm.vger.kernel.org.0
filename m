Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329EC4609F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Nov 2021 22:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhK1VIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Nov 2021 16:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238829AbhK1VGv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Nov 2021 16:06:51 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228BFC0613F2;
        Sun, 28 Nov 2021 13:03:24 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id z7so4888680lfi.11;
        Sun, 28 Nov 2021 13:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S5yQeoYkT02gWrM8yVZlgUY3tAS7jjXSAv14FinuFIM=;
        b=b1zVyx69e4vsva+ojCLRHRjSLkzqFsVy4JDNie2Ir+DAAYPB24ljy3pAx7V6r0O5gB
         Jw6/bgC61RfNRcbTbxTsON2S3SuNKQpTyk/WfLRBkyC6WBOFMC7zG4LxOyiJluPopIB6
         9uul6kGZ/VankeLcnzub7B+tLBPrIVwkQ6hd1+AkSELvNDhl1/q25tM0tGuKqmkSjm0u
         FA8PD9nLUubzrXgxMm1zO1t8nzabuEM/cTTGToSLtA2vJHuaTQpJbZFTKvwoKXKUyyE9
         fPGR184U3CNo6Ul4SMagt4RQALuTlGG8Szh/iLdGJmE4yXnXrJBVbj+NfUDU6aBWt6jG
         tk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S5yQeoYkT02gWrM8yVZlgUY3tAS7jjXSAv14FinuFIM=;
        b=0lbPF4XS1I8hCXOnAsimWJQcpHmiilZXWhzaWlQ9Va+flI8vi79DGiuaGsLJBWYLuB
         Su4tBRuhHLvgkD39Gi5Tl6L2KmQSrTZnFyzZyoPteiJvbV9mr/Oai+mUO4tW4r14ukGB
         uPV5vQ7RQ+exui3v4uFk8BxGQ8WemGSFr8nO/XY3cza1ozFm2tygBww7LEYfLnsW2Hpg
         I9phsefuo1zGe7FGzKMHldbBeXPhNY6EWhK0kSBQmv9WcCwP2jnTKyGSRHje2HytP+Ui
         Jg9PJKE4ZAkdT84H3U/PzYtQdhXW/Y3BwbiykEe5OaLFtsZyq1iJ35o/vQ1pHsx5xYHH
         b80g==
X-Gm-Message-State: AOAM532yHSznKNzPs2sJjKI5XQED51nwWuoyUOksIaseJJQLuXiZkTTV
        c2TeIOefFnQqhmih5D/l/tFWIw8pFx4=
X-Google-Smtp-Source: ABdhPJxuoOvbCg8UPDK0M2uWSACK7xk5BX+//MyHmW7OFf3Met7Zr0uKkYrygguciU+y7YHHRpRi9w==
X-Received: by 2002:a05:6512:1284:: with SMTP id u4mr43478954lfs.342.1638133402495;
        Sun, 28 Nov 2021 13:03:22 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se. [155.4.221.129])
        by smtp.gmail.com with ESMTPSA id l18sm1099424lfc.97.2021.11.28.13.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:03:21 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] soc: qcom: aoss: constify static struct thermal_cooling_device_ops
Date:   Sun, 28 Nov 2021 22:03:17 +0100
Message-Id: <20211128210317.25504-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only usage of qmp_cooling_device_ops is to pass its address to
devm_thermal_of_cooling_device_register() which takes a pointer to const
struct thermal_cooling_device_ops as argument. Make it const to allow
the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/soc/qcom/qcom_aoss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 34acf58bbb0d..cbe5e39fdaeb 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -352,7 +352,7 @@ static int qmp_cdev_set_cur_state(struct thermal_cooling_device *cdev,
 	return ret;
 }
 
-static struct thermal_cooling_device_ops qmp_cooling_device_ops = {
+static const struct thermal_cooling_device_ops qmp_cooling_device_ops = {
 	.get_max_state = qmp_cdev_get_max_state,
 	.get_cur_state = qmp_cdev_get_cur_state,
 	.set_cur_state = qmp_cdev_set_cur_state,
-- 
2.34.1

