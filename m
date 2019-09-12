Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 372AFB0AFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 11:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730386AbfILJLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 05:11:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44241 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730352AbfILJLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 05:11:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id k6so15422553wrn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BNNdf6pK+mCx6ftnRWMxKvAZQ+4ajUB9tHI29q1KvNY=;
        b=oaiyNUFi3itForwHOvFSiPV4hFujOxmXjG5fhYeq+683YOgScQNtDfl9ekjlX6U0QB
         xh9eA6o8aHoCYIipSvuzwxIrqmuDfZg0R5z+YUu4531OzTB6ZGeK/jOjPDd1tM2nyWRH
         DsfUti3RTJM4wdKDk1bcSNRVzn8KBAq75pDwvX3jNHzVfaf+m7dfyvnV7tn26NHpWZfT
         m+Hsymx0O+uxkOP7MOnMfBNhpVNTqsLlAE5gfC6/rQW3CZjl07XDQW2/wa1Y51prYf0D
         97fNU5THdwVKJWsodDewvSJP4rTyCKqfdvxBrwuSIUiWrel+ijABtNPaZ7i+oFcG3VXD
         87fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BNNdf6pK+mCx6ftnRWMxKvAZQ+4ajUB9tHI29q1KvNY=;
        b=bgp5LwBd8Itt+Ku3uRNh5EVHjnYzOJOvHf1BC147YetaqGzhxNl6XQqB3f8PYY2zSm
         ja3mE3nXOTUKTi1be8oonVKWt+AiImcaPSsMmYQz+NFCNOzz9VB9Wd421UKlYgUXxwgy
         MA+fhfWBvQxRhGV/XxEaKycxDbwoFGEE1A3UBbDxc0F8hlXSD5NoHwflLNqefEddmPBr
         /DS8gKgADJLXadTTINJ3q9YMt0E9+DIrsr84dC+Q5pG6gFq1qEMgV4ZkWElKB3eobip/
         AV9hTql9KJI6VLdYhgohoUS3AjyGrUKHJZyQ/GFD3xQCCEIaJPVAlmalL2sAnjzZB+f/
         uoFg==
X-Gm-Message-State: APjAAAUZr41+NlL+oXrxEhrl4KA/J/pg9kNzl2kRW2oMu7P9+vCw/5aZ
        Ubjjgwkz8ep8bKOBVXAVbRNg/Q==
X-Google-Smtp-Source: APXvYqzA/o7qluqOpXXnZQUZ3Gav6EZgPQqH/7DI4tf2PWyXyXMLcq/31ofd3vX8/sVl/DyJiR6Wxw==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr10910294wru.335.1568279460416;
        Thu, 12 Sep 2019 02:11:00 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id g185sm11016899wme.10.2019.09.12.02.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 02:10:59 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andy.gross@linaro.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] soc: qcom: socinfo: add sdm845 and sda845 soc ids
Date:   Thu, 12 Sep 2019 10:10:56 +0100
Message-Id: <20190912091056.5385-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds missing soc ids for sdm845 and sda845

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 855353bed19e..8dc86a74559b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -198,6 +198,8 @@ static const struct soc_id soc_id[] = {
 	{ 310, "MSM8996AU" },
 	{ 311, "APQ8096AU" },
 	{ 312, "APQ8096SG" },
+	{ 321, "SDM845"},
+	{ 341, "SDA845"},
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.21.0

