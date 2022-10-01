Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4117A5F1E36
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 19:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiJARLE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 13:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJARLE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 13:11:04 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129D45A2ED
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 10:11:03 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id e10-20020a05600c4e4a00b003b4eff4ab2cso6741197wmq.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gTWeyuBeEhL5q970/uX9nPUe0s0gUyxTu1xA+Ah5iEY=;
        b=g2uBr9Pp7Fg69xveOwl6IoppzylYHg7FU3wX/3x9b9enW8WtrSH8jJG8KUxOIZ1vC3
         pj/fRv4vdZv69Gzw5ElJkxGBhmkDMEGX97R27fYIqz0DYuVgBT7NLJjoj1t3kDdM9LQw
         5GZe4hk13JZqO44HGPsxhUE30grWO/3HWoZeHfbPwZATTYGWQc8PmL0ciwYHWPosNrEL
         CEzi7nH3NNFl8ssq+axjQ9f9UDfSjEEjQW+EvCATYo9ydeA0ny4wdXvLwHaexjzFRW+n
         qN8qM0Ah65Zts8b+0dDlan/kcZpdZO10UdON80GiQV9vWCOtk6pxwVWsYwE+Sy/dFbsv
         49xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gTWeyuBeEhL5q970/uX9nPUe0s0gUyxTu1xA+Ah5iEY=;
        b=GrlxE7406yL2ZU8otxHSMhy/x0xi30MAU+ZyiqfR1iTv0/C87rlyPt9wGyRjRl5+1+
         z4AOY0TUGnWcm366hJu8PZU5/zvyxv2MJwHr4jk9k3E0AhhkoZzjh0ZQzNULsA4uiEJe
         1LJ3LR/a7NG1tEWnKL970suBMM2iLyUOU0LWWg7npmc5XyPwUUWBB68SpMxR1JjQt76Q
         D0zBJWNLprEWsLW0/XTsS2NbpX3zei6i5NCQIIfvQSMp+L5jyhDEv+ModIf0PgG2dsFq
         2oQsA4RZCPjV54RZRPWXqUQPdtp4C1oyFbadvXgP3nQIrX4Vz15f0aARkGTh1xp1Zw3j
         JC3w==
X-Gm-Message-State: ACrzQf3L+G7lhqsr1UNt3o7VfqkEl72vlosztPFi8XFT5da3+nTSCinq
        CK7/NNfyGQZvA6/KNXRkJ/tOCw==
X-Google-Smtp-Source: AMsMyM6PVEI2wRzKAZUo9Jw5t15nBqPVD0/JQK7uj8wZtBbsWSr8KGTkcVdVWHn6vc0IlIiARd7R7Q==
X-Received: by 2002:a7b:ce97:0:b0:3b3:4136:59fe with SMTP id q23-20020a7bce97000000b003b3413659femr2236430wmj.24.1664644261573;
        Sat, 01 Oct 2022 10:11:01 -0700 (PDT)
Received: from radium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id h40-20020a05600c49a800b003b49ab8ff53sm5817641wmp.8.2022.10.01.10.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 10:11:00 -0700 (PDT)
From:   Fabien Parent <fabien.parent@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        rafael@kernel.org, viresh.kumar@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Fabien Parent <fabien.parent@linaro.org>
Subject: [PATCH 1/3] cpufreq: qcom: fix memory leak in error path
Date:   Sat,  1 Oct 2022 19:10:25 +0200
Message-Id: <20221001171027.2101923-1-fabien.parent@linaro.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If for some reason the speedbin length is incorrect, then there is a
memory leak in the error path because we never free the speedbin buffer.
This commit fixes the error path to always free the speedbin buffer.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 863548f59c3e..3bd38acde4b9 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -213,6 +213,7 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
 	int speed = 0, pvs = 0, pvs_ver = 0;
 	u8 *speedbin;
 	size_t len;
+	int ret = 0;
 
 	speedbin = nvmem_cell_read(speedbin_nvmem, &len);
 
@@ -230,7 +231,8 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
 		break;
 	default:
 		dev_err(cpu_dev, "Unable to read nvmem data. Defaulting to 0!\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto len_error;
 	}
 
 	snprintf(*pvs_name, sizeof("speedXX-pvsXX-vXX"), "speed%d-pvs%d-v%d",
@@ -238,8 +240,9 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
 
 	drv->versions = (1 << speed);
 
+len_error:
 	kfree(speedbin);
-	return 0;
+	return ret;
 }
 
 static const struct qcom_cpufreq_match_data match_data_kryo = {
-- 
2.37.2

