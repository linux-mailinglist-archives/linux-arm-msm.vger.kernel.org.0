Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC7052CD25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 09:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbiESHdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 03:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbiESHdk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 03:33:40 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FFD939B9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:33:36 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id p4so6204674lfg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qWPTFii076kMh3spx07UDdhkutNF23nYc3TRhpsUjGU=;
        b=J7PQfDdwXyofHLtaxdaRupP6u/eH6BP2lL2t+Fqq+Q0MciM7VFeqt7k9dATO4OYp3J
         LKObqclwxes4bhLdMUyIz24QoTikkBTrlIw2CJ5milvwEvvuePVK7ljo0+xHlR/8NNFY
         /jC4ZxVcnZzr2rbsEeZUGqiw795MQSbQXLjH8FXzs/2IkfiFs1wap0sbzRu42mzTSBeP
         ZVN+nMj5KGWBCQc+L8cPOn92IPSD3zeHHGVSE4ladEqXQekTPNwlEaXUHcr0Y59B5f6R
         fuoSLnjigKl1Z37AwIPEYIZl98GZ66xc0PCQrbADlA+VBfAx3XB6K7tv2ROV+LqfAmbV
         7TXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qWPTFii076kMh3spx07UDdhkutNF23nYc3TRhpsUjGU=;
        b=JkkGp5CBjjKarcF8t5lTvnsW0nAYtBeLQra5QkeBLQztS7rWnZKKLlKEsuQqN3da2U
         h5NS6PkgeUV/P/a9cD9zceVY5mMJvbdJJufv1mPaC44lnD44a4ULbyOGL1N6mftcWT8k
         AFK1d0PZqucAGDsDI2/FdjmnxwWggLyHcc+wXt9KU0aqUty9doJ1S6SHbaqHpYKrD0Lg
         r9Xgt2GkwlMH94ppii3jiTgTVj3vXL56mYLCazvm+Ltx4lGVGP6X9RTLF01OWwiHKQxd
         YBDUtddScwi5AGxET0HGdRwg+vBEc3tGdYHHK7rCcswGtEoAr/cR0aeU8m4rLQoQymqx
         eqsA==
X-Gm-Message-State: AOAM532oL1iABLJxmys+c/ABvAyv7CQ4pYoOoyGeBX1pnuRMJxXoutTn
        8eY8V+u10607fjD0WCQ8Ds3uvH4Vu02e8PIP
X-Google-Smtp-Source: ABdhPJyZnvswo5nLJZ+ZWjSAifqug4KpIFoaZsRIfX0IUXe8RU4GMwQ2xYnT/pIqdk0DsfJh8Beyng==
X-Received: by 2002:a05:6512:1051:b0:473:b70c:941a with SMTP id c17-20020a056512105100b00473b70c941amr2364085lfb.238.1652945614854;
        Thu, 19 May 2022 00:33:34 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a16-20020a056512201000b0047255d21159sm187484lfb.136.2022.05.19.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:33:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] rpmsg: qcom: glink: remove unused name
Date:   Thu, 19 May 2022 09:33:29 +0200
Message-Id: <20220519073330.7187-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
References: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
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

The qcom_glink.name is read from DTS but never used further, never
referenced, so drop it.  This also fixes kerneldoc warning:

  drivers/rpmsg/qcom_glink_native.c:125:
    warning: Function parameter or member 'name' not described in 'qcom_glink'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

Changes since v1:
1. Split series per subsystem.
2. Add tag.
---
 drivers/rpmsg/qcom_glink_native.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 5bc5a0a6a8a7..72a1c0fd091d 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -98,8 +98,6 @@ struct glink_core_rx_intent {
 struct qcom_glink {
 	struct device *dev;
 
-	const char *name;
-
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox_chan;
 
@@ -1755,10 +1753,6 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	if (ret)
 		dev_err(dev, "failed to add groups\n");
 
-	ret = of_property_read_string(dev->of_node, "label", &glink->name);
-	if (ret < 0)
-		glink->name = dev->of_node->name;
-
 	glink->mbox_client.dev = dev;
 	glink->mbox_client.knows_txdone = true;
 	glink->mbox_chan = mbox_request_channel(&glink->mbox_client, 0);
-- 
2.32.0

