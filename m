Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47014382BAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 14:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236862AbhEQMCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 08:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236859AbhEQMCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 08:02:00 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F03C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 05:00:43 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b17so6588822ede.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmFwxPH6uZIhTgCsywft7PH2wef0MTrIdaT6v6CivLo=;
        b=KFsxpfyNvY/btnr3O0yRWEtaqltgCHNzm0TOCI8UkDV2BOYShpYQuOrS7r6+B/WUpa
         ECrmRxw+pyxdrxgLFYpr45Gb8qKFNHjbmwOoT0b54LWr7rnCxnXQ3Hg3LlLX31C9/F4X
         izAcb1krioly0mP8WfudrTnq6XxeERJ2fIW638LQn9eiF+lYbzHWd8cF4/SQjIbbLdGY
         hIAu58KcPaFIXjFLIzgZwYoogzuWMXpa0PSUsq9sQ1xrgsd0ytTqfeB6/pvG5VnDvao1
         2PGAKZVXPVquXt3qT/Ph4NW5eDMMth6Dke5oPZ7Fhb7csAzBLxfmu6ib8hYzooZq6VdO
         bMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmFwxPH6uZIhTgCsywft7PH2wef0MTrIdaT6v6CivLo=;
        b=Tbqig6ajpX9Hik2RDVkNHVpToTWDqUhN4/N8GWY3WvElvj7AAsK1SZiIbG/CjhB8ah
         5Z7FX4tyBXhnP280YStKwi3gQbfaCqkyHJevHpPcwErBh4sUupuWLlYUBLrYp1ojGI6K
         BwuKR4XslX5colinVkepiNZ/RaUT8WDx07JU/yjVQdUabed81IroKi2DSOJSswXQXEgX
         Fgv8JJeCvj2//RJLzlgADOuSVwPuQuXEkMn2epW2XriOKb2MaspXEMoch3ipKYpnZnoz
         crm/2XWt7mR5qlH7t9ShDBAsmxkd/zMazqD+lDCn/KWuSsQD5NmMD9YMnax+eBJLnPzC
         YmVA==
X-Gm-Message-State: AOAM533NNf1Get+ybjanQA82xf1Zu29Urdkpsdzlz6f/Iuaui9+mEUXg
        jgDVQw4TzrdcrBIkE5rYtPBggpwYlSXqnw==
X-Google-Smtp-Source: ABdhPJxEkv/fQt9deN9fhiM48UvlD9OdB+DAToniHxhEaIO2jVzex4Rk83UhMKgjs9tZRkfMB8Xadw==
X-Received: by 2002:aa7:db93:: with SMTP id u19mr29799656edt.227.1621252842566;
        Mon, 17 May 2021 05:00:42 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-66.xnet.hr. [88.207.99.66])
        by smtp.googlemail.com with ESMTPSA id yw9sm8537232ejb.91.2021.05.17.05.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 05:00:42 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Kathiravan T <kathirav@codeaurora.org>
Subject: [PATCH v2] soc: qcom: socinfo: Add remaining IPQ6018 family ID-s
Date:   Mon, 17 May 2021 14:00:34 +0200
Message-Id: <20210517120034.3975027-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ID for IPQ6018 was previously added, but ID-s for rest of the
family are missing.
So, lets add those based on downstream driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Kathiravan T <kathirav@codeaurora.org>
---
 drivers/soc/qcom/socinfo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index f6cfb79338f0..6ded90cf3813 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -255,7 +255,11 @@ static const struct soc_id soc_id[] = {
 	{ 351, "SDA450" },
 	{ 356, "SM8250" },
 	{ 402, "IPQ6018" },
+	{ 403, "IPQ6028" },
+	{ 421, "IPQ6000" },
+	{ 422, "IPQ6010" },
 	{ 425, "SC7180" },
+	{ 453, "IPQ6005" },
 	{ 455, "QRB5165" },
 };
 
-- 
2.31.1

