Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2B24AA077
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 20:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234926AbiBDTvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 14:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234852AbiBDTvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 14:51:01 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005A4C06175A
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 11:50:57 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id z18so5771971ilp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 11:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d9+lLIbQQk6sLGoYu7PiXuh09aVQl9bHmfYbzTffMYE=;
        b=UW9iwpf9Z8Um162Z1+cdMye4SLMCbwHQaxbF5+QZIxIz9PQm1RsHVJ2uDepNrIzCXU
         6gXHVa+T6+fcWL4Vq+fx5SXkAftmSR8hVcAMxYZtKaNcDbGQRtcYX1ASqP69mk7geYev
         dPtoqgJYvXaqePLJoCPPAvpI1vh3tsucDSdqpNAaCkCiqfOvzd9BwysNt/LTofz+QU0e
         tFTRiaeMnd/SLYcGmRa36BMTAEMVnLwcM/HlfNKK6RkW5RIo8ytuXIVS0fhDO5ZjRHNo
         FjjRk7jxYVIL0+Q3XXooX327uIo4Jpy/3Jva6lXm7YfSqKnGqDfdVaW6TqIlZ+jVFCnZ
         URlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d9+lLIbQQk6sLGoYu7PiXuh09aVQl9bHmfYbzTffMYE=;
        b=Op8W91bv7c1/3r2HdEC21mbX8v74MsTdfcZ2n0Jq2LJ58rU9O+t++7YdYl+7rSSl0i
         nrayDBwZ2sQCbCmFWel8DwV8ShUfQnEzCYlnpOsLWodCVz0yxMrYGgH9I2JTO8+/7dji
         XL6/OYNyHjsk2Mk6s/tHOahHX3glaNaUE5Dq/vt6egjvbyJsBO0gaeC8U/E3L+nBLKH0
         ikC7y0TMRPySP0eO+c8dtf8AqP8e9MdD6IxXmXtccLFmCTm1du2ioUAdbZ7pYO4OCIAg
         v6HWU6Xs+NaiITD3aHF3kTLg9mheQ58qtZsZExZ0sqILBQhB53OOaEk2DM7tJZrsOawf
         nvMQ==
X-Gm-Message-State: AOAM533A7yaz3rit0LKte3qa86aYcT1YqUbXG8P1+LSYDmVlJ0usiHhq
        xbrvq1K6JxX/uJ445JD4OrhR4Q==
X-Google-Smtp-Source: ABdhPJxTqGwwgi18qKr7zXKCfAt8SrlpDioemQ93R/nHSxgtRR7KCCYjsG0cqq80VcTS8ddJe+SLuQ==
X-Received: by 2002:a05:6e02:170c:: with SMTP id u12mr360045ill.135.1644004257334;
        Fri, 04 Feb 2022 11:50:57 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id k13sm1417564ili.22.2022.02.04.11.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 11:50:56 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     djakov@kernel.org, bjorn.andersson@linaro.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 6/7] net: ipa: embed interconnect array in the power structure
Date:   Fri,  4 Feb 2022 13:50:43 -0600
Message-Id: <20220204195044.1082026-7-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220204195044.1082026-1-elder@linaro.org>
References: <20220204195044.1082026-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than allocating the interconnect array dynamically, represent
the interconnects with a variable-length array at the end of the
ipa_power structure.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index b1f6978dddadb..8a564d72799da 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -67,7 +67,7 @@ struct ipa_power {
 	spinlock_t spinlock;	/* used with STOPPED/STARTED power flags */
 	DECLARE_BITMAP(flags, IPA_POWER_FLAG_COUNT);
 	u32 interconnect_count;
-	struct icc_bulk_data *interconnect;
+	struct icc_bulk_data interconnect[];
 };
 
 /* Initialize interconnects required for IPA operation */
@@ -75,17 +75,12 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 				 const struct ipa_interconnect_data *data)
 {
 	struct icc_bulk_data *interconnect;
-	u32 count;
 	int ret;
-
-	count = power->interconnect_count;
-	interconnect = kcalloc(count, sizeof(*interconnect), GFP_KERNEL);
-	if (!interconnect)
-		return -ENOMEM;
-	power->interconnect = interconnect;
+	u32 i;
 
 	/* Initialize our interconnect data array for bulk operations */
-	while (count--) {
+	interconnect = &power->interconnect[0];
+	for (i = 0; i < power->interconnect_count; i++) {
 		/* interconnect->path is filled in by of_icc_bulk_get() */
 		interconnect->name = data->name;
 		interconnect->avg_bw = data->average_bandwidth;
@@ -97,7 +92,7 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 	ret = of_icc_bulk_get(dev, power->interconnect_count,
 			      power->interconnect);
 	if (ret)
-		goto err_free;
+		return ret;
 
 	/* All interconnects are initially disabled */
 	icc_bulk_disable(power->interconnect_count, power->interconnect);
@@ -105,15 +100,7 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 	/* Set the bandwidth values to be used when enabled */
 	ret = icc_bulk_set_bw(power->interconnect_count, power->interconnect);
 	if (ret)
-		goto err_bulk_put;
-
-	return 0;
-
-err_bulk_put:
-	icc_bulk_put(power->interconnect_count, power->interconnect);
-err_free:
-	kfree(power->interconnect);
-	power->interconnect = NULL;
+		icc_bulk_put(power->interconnect_count, power->interconnect);
 
 	return ret;
 }
@@ -122,8 +109,6 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 static void ipa_interconnect_exit(struct ipa_power *power)
 {
 	icc_bulk_put(power->interconnect_count, power->interconnect);
-	kfree(power->interconnect);
-	power->interconnect = NULL;
 }
 
 /* Enable IPA power, enabling interconnects and the core clock */
@@ -372,6 +357,7 @@ ipa_power_init(struct device *dev, const struct ipa_power_data *data)
 {
 	struct ipa_power *power;
 	struct clk *clk;
+	size_t size;
 	int ret;
 
 	clk = clk_get(dev, "core");
@@ -388,7 +374,8 @@ ipa_power_init(struct device *dev, const struct ipa_power_data *data)
 		goto err_clk_put;
 	}
 
-	power = kzalloc(sizeof(*power), GFP_KERNEL);
+	size = data->interconnect_count * sizeof(power->interconnect[0]);
+	power = kzalloc(sizeof(*power) + size, GFP_KERNEL);
 	if (!power) {
 		ret = -ENOMEM;
 		goto err_clk_put;
-- 
2.32.0

