Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C424D3A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 20:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiCITWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 14:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237696AbiCITWE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 14:22:04 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D414F113DA3
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 11:20:53 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id x4so3926390iop.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 11:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q42zjW8xahSVhGaNilfnj63EHK+Wikk3dCoDovWBQQY=;
        b=xvVcZ8t2hTLcYyaR8IdpNwhqebsi1HHxLkwIaDM05AD3lNV0N4AV12KaR0NWsN5GuQ
         pdX87gjBv0H+CKrPZ+nNI3Y1CdEM7ga8ZJKA6pfpf7tU5IuKIkiLC+VBTLutyyiWlE+7
         F7tJChmMw4gdInhfNtkjI0XJfVG2xMK14LP/L6QAkEBUaKr898KU7E0rxPJnYVRZXImV
         QtseXyJto1X7M7YjX3jJ8R2PjtZcDYj53/RHDbrRbEPlQaKvWj16VP35butKsdr6RMuy
         Untl7fwO6iB27zvzBwP+7A1quiRcAwNFJNjvPJ2Px8ntgSq96yBwRwuBqNv8dujSyoeK
         ddbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q42zjW8xahSVhGaNilfnj63EHK+Wikk3dCoDovWBQQY=;
        b=Uw6eoyxRhhmYeAUFtRHSCQvU3cY3mEHkPlsn59A8KKAHJ32B97UxZHUmo61ICl7JV9
         7Oad6+YxWLc4Ea0Jsw5p3XFwmCqXvrViY5xGlLjqcwseLde6C6SpQC3LO8eCTrDD3Noy
         ZtarZNCijpzaDqymtCK0o080YUpUDtehwSirVSSjgUSrbWSQcBexnNUYTjQxWN/ygcKc
         etm7+PhxWuVXvdCXC3NAPKS2ksMxnkARAmy5zqmEyRHwk+WtIIPdJku6wJXvkfyRoDa7
         sWvixTQeE77QbG3/NOL0VgAmivYfdpHMsQdb80Ms6emv8nj6ySRsKtzU5LqaX8JjM5sV
         2HKQ==
X-Gm-Message-State: AOAM531jN2+Z74GL/elj5x2mhctiryVgBH+CHQhDxTBBmm9bzkrA7eiS
        I3NM8W4OYnp7yQMq76JZ53E3PA==
X-Google-Smtp-Source: ABdhPJz9ICUaILN5z+iwfsY+OlIxZUZ6Tfiu+CkzHuqA9gUA/L8JZVq+gN3I234hfs6lurXOCK71Ug==
X-Received: by 2002:a05:6602:2d51:b0:645:a9f2:82f3 with SMTP id d17-20020a0566022d5100b00645a9f282f3mr885134iow.9.1646853653196;
        Wed, 09 Mar 2022 11:20:53 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id g8-20020a056602248800b006409fb2cbccsm1389182ioe.32.2022.03.09.11.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 11:20:52 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     djakov@kernel.org, bjorn.andersson@linaro.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 7/7] net: ipa: use IPA power device pointer
Date:   Wed,  9 Mar 2022 13:20:37 -0600
Message-Id: <20220309192037.667879-8-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220309192037.667879-1-elder@linaro.org>
References: <20220309192037.667879-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ipa_power structure contains a copy of the IPA device pointer,
so there's no need to pass it to ipa_interconnect_init().  We can
also use that pointer for an error message in ipa_power_enable().

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 8a564d72799da..16ece27d14d7e 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -71,7 +71,7 @@ struct ipa_power {
 };
 
 /* Initialize interconnects required for IPA operation */
-static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
+static int ipa_interconnect_init(struct ipa_power *power,
 				 const struct ipa_interconnect_data *data)
 {
 	struct icc_bulk_data *interconnect;
@@ -89,7 +89,7 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 		interconnect++;
 	}
 
-	ret = of_icc_bulk_get(dev, power->interconnect_count,
+	ret = of_icc_bulk_get(power->dev, power->interconnect_count,
 			      power->interconnect);
 	if (ret)
 		return ret;
@@ -123,7 +123,7 @@ static int ipa_power_enable(struct ipa *ipa)
 
 	ret = clk_prepare_enable(power->core);
 	if (ret) {
-		dev_err(&ipa->pdev->dev, "error %d enabling core clock\n", ret);
+		dev_err(power->dev, "error %d enabling core clock\n", ret);
 		icc_bulk_disable(power->interconnect_count,
 				 power->interconnect);
 	}
@@ -385,7 +385,7 @@ ipa_power_init(struct device *dev, const struct ipa_power_data *data)
 	spin_lock_init(&power->spinlock);
 	power->interconnect_count = data->interconnect_count;
 
-	ret = ipa_interconnect_init(power, dev, data->interconnect_data);
+	ret = ipa_interconnect_init(power, data->interconnect_data);
 	if (ret)
 		goto err_kfree;
 
-- 
2.32.0

