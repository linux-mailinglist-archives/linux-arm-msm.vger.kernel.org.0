Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A934710D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 15:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241137AbjEYNjI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 09:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241331AbjEYNi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 09:38:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F20E1A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 06:38:53 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3093a7b71fbso2072926f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685021931; x=1687613931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYY0GKMhXttuAw6paI9M2TLIWSmFkEjM7aIwjpOH6i4=;
        b=lSI8NUoRqt6sKOtFjbYKQ1EpPdFGZy/OFcz/WK8bRYRwVMgzWirE6Opr2uEfXhx144
         tqynAAgPY3KXxJglbouzD+2ETgPUOolPGFy7rYQVgXsAX3g4IoMNW7kCrUvpoKDenmQn
         QNH/1oQlrMFBLSBbyZU9xc/+P3tYQ7ZwO3aIQFJxThanQdjePsdrNAA8iXIJ36IW8038
         BTquGyNO+19LB46JVbRVD6ZMAJOvZ8bIb4pYs+93nDqvKXOJybmuAB+0oGIHwUS989Th
         OeYicGaffL5atnDCrex6ZH21zZbXd/NtwfoJBsd0U6S8ay21wXlgOLhZKNJWMLV10B25
         sqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021931; x=1687613931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYY0GKMhXttuAw6paI9M2TLIWSmFkEjM7aIwjpOH6i4=;
        b=fkTZb1K/ZHObRpi2aDpMRy0BBvqmkEcwuZy5e1PN+sGQ4Wuj9aREa3+MKlgaGrFtMb
         PTdw8LyLJROLbvd3BSMuN3o+SMijk8+AcXeoBM5fCizmLWogrQwL2tR2rxmSj72uHzen
         Dn9linnw+4MeAJYzHL+uwirIGAlq4leIgtOzh9a5gg5fPkNIvxOx+reGi6q6di6dqFbA
         sXNWZn+RFVoWGFUS21xrRY5kj3/CzeV74HZgZUaodNS2ZSyKgiT1L1UFarEZqKwoQ+8+
         UfNDgCnttjPI2fde82AsCMxGSn4UJMZrjkj/hDS3vuYGlkgEVExSakbnZAn82ZvCOorl
         WDyg==
X-Gm-Message-State: AC+VfDwREbjWxsRsEnrKg4IXGSQFi/NasrJGbpDrRpRaIfGI+WVeHgk9
        UhO5gyxIgF5vsKZ9V1EaHJjKOg==
X-Google-Smtp-Source: ACHHUZ4M6wuEjcnPvpWnV0GLbaB0cZOJUD9jaRh4/36ksFHmdC2KlwnVtAWh764uCxd278x2mXEmZQ==
X-Received: by 2002:a5d:574d:0:b0:309:54b6:33b0 with SMTP id q13-20020a5d574d000000b0030954b633b0mr2621683wrw.44.1685021931808;
        Thu, 25 May 2023 06:38:51 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d6551000000b00301a351a8d6sm1803641wrv.84.2023.05.25.06.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:38:51 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org
Cc:     andersson@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/4] soundwire: qcom: set clk stop need reset flag at runtime
Date:   Thu, 25 May 2023 14:38:12 +0100
Message-Id: <20230525133812.30841-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WSA Soundwire controller needs an full reset if clock stop support
is not available in slave devices. WSA881x does not support clock stop
however WSA883x supports clock stop.

Make setting this flag at runtime to address above issue.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 1d2a105cb77f..b6c3fadc9090 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -617,10 +617,14 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 
 		sdw_extract_slave_id(bus, addr, &id);
 		found = false;
+		ctrl->clock_stop_not_supported = false;
 		/* Now compare with entries */
 		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
 			if (sdw_compare_devid(slave, id) == 0) {
 				qcom_swrm_set_slave_dev_num(bus, slave, i);
+				if (slave->prop.clk_stop_mode1)
+					ctrl->clock_stop_not_supported = true;
+
 				found = true;
 				break;
 			}
@@ -1623,15 +1627,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	/* Clk stop is not supported on WSA Soundwire masters */
-	if (ctrl->version <= SWRM_VERSION_1_3_0) {
-		ctrl->clock_stop_not_supported = true;
-	} else {
-		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
-		if (val == MASTER_ID_WSA)
-			ctrl->clock_stop_not_supported = true;
-	}
-
 #ifdef CONFIG_DEBUG_FS
 	ctrl->debugfs = debugfs_create_dir("qualcomm-sdw", ctrl->bus.debugfs);
 	debugfs_create_file("qualcomm-registers", 0400, ctrl->debugfs, ctrl,
-- 
2.21.0

