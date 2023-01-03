Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1220A65C511
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 18:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238011AbjACRbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 12:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237815AbjACRbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 12:31:10 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5C510A2
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 09:31:09 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bt23so29943663lfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sO6SUqVw2xTFajMx+hD52rACWsikx2Bdie3aQKKgmBc=;
        b=sKT+ErZCG/vn8T8T/vb65Fv0rvNz2/3BkseTSV4iep6x/XE5PHNAgjU624UL7ldCeV
         G4MggSBTBA4AXVD8rQNQGoVxaOUhmXC40r3hKoNAJ1E8Qr3lFDqUSWUBMmw2XeUJKgKD
         viiRbda3KxDvIPIHRBmjkflp0adm5ZUqZzxFYLLPY9oD7pZ5ywVKbozmbtuKTOwh0Cej
         9iF67YNTnNc2wWdDU8bQsDt7w4+LtK1nrq4Cnoh7Qmuri7Chy+ZAYB90P/neW5wCNSLD
         7xMX7mrOquJD7gMkG6j5MX/JRVhzLr2P/QDItCAw6fQLbXVWuqZCqKwTIgB96zLyCUNJ
         2t5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sO6SUqVw2xTFajMx+hD52rACWsikx2Bdie3aQKKgmBc=;
        b=QLsWDy/Kg+yGzulaak0/bMUo4L7zAxQRPiJ6d8iF9+7tSHBC+qvI3Anm1elAoOPNOs
         JYUUWsfNSQmoSMmX7DPTmnziAaP1qnwtGup8IVmcDPtS8Rz+mkrlUont2spd39dJnS3B
         G3QzsWNtiOU2/cX1dZhGbwKM5Z8TojUXfThaEiGnI9EkDwURvqfvjjfrzPAI3YiPVgK0
         kja/ylZPUGmRCDgMgZ/obW98T+TwRCGJgKh2GYzmH4nIU0Z8XtU38Dt3gn35ufCvC4SM
         t4w7x0l1qDL4PcCFWUAU+ksMv+4yvjrn/6K4L5/5FQ9F69w3O6P2AWSIe+WCvesnxoo4
         ZokA==
X-Gm-Message-State: AFqh2kpCs1KkjQIPRxeZLBfKcI91rxzVqVIVYUBdHH60Vs1tNjBi+EUA
        2uMqLpuM0ZOUrhpQNQnA9Ua106TF84wLgjmq
X-Google-Smtp-Source: AMrXdXtRuHRrMeMcw8VJe8kq/FI3A09Nu2cAUW98IOvRcpS0jNxsQfZwpT2zd01GWgyHI9hfNPA5WA==
X-Received: by 2002:a05:6512:b23:b0:4cb:d3:3b99 with SMTP id w35-20020a0565120b2300b004cb00d33b99mr10295016lfu.36.1672767067289;
        Tue, 03 Jan 2023 09:31:07 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm4916818lfg.219.2023.01.03.09.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 09:31:06 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] interconnect: qcom: rpm: Don't set QoS params before non-zero bw is requested
Date:   Tue,  3 Jan 2023 18:30:56 +0100
Message-Id: <20230103173059.265856-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Until now, the icc-rpm driver unconditionally set QoS params, even on
empty requests. This is superfluous and the downstream counterpart does
not do it. Follow it by doing the same.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 43b9ce0dcb6a..06e0fee547ab 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -193,6 +193,12 @@ static int qcom_icc_qos_set(struct icc_node *node, u64 sum_bw)
 	struct qcom_icc_provider *qp = to_qcom_provider(node->provider);
 	struct qcom_icc_node *qn = node->data;
 
+	/* Defer setting QoS until the first non-zero bandwidth request. */
+	if (!(node->avg_bw || node->peak_bw)) {
+		dev_dbg(node->provider->dev, "NOT Setting QoS for %s\n", qn->name);
+		return 0;
+	}
+
 	dev_dbg(node->provider->dev, "Setting QoS for %s\n", qn->name);
 
 	switch (qp->type) {
-- 
2.39.0

