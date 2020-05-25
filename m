Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3AE51E1301
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 18:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391266AbgEYQsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 12:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389087AbgEYQsZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 12:48:25 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C849CC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:48:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a4so10793650lfh.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NRfikZQfnzv3DqAQbjEWBAHDTgL1DbiRjO2Ao7KxpKU=;
        b=EpxHfRuilQ3olQsMfwSX2RsB+/aIgAezO/2jVLjevP84jZh3OPMrJqmaOYjYVik7Cl
         QZqfFAnMT5tf1X8bRQH6kK9Ud4zGH0ln6ASjoWEMzLPh+zn9grolTsZYS+nRLwzOUy7a
         J4vSMEJocjc7wu/snlHmYBlT2ReXQVmjRPbYQcAt7o+5WcboXxINK+4OGiyMCoiZFJKv
         LX6cAzEBNGKBhI/HLfe0nQL2n4e9WiOxiOJixp6YcAngqfWo0yrseeyQTFp3eny6livV
         D3xFnJbX9QjbLbfz0GSTQdsMeMO+Fa5V4TZU4ywvfui1ghAS3w4CHio0Gl+5awInyRrV
         o15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NRfikZQfnzv3DqAQbjEWBAHDTgL1DbiRjO2Ao7KxpKU=;
        b=nFCZ/pVQZlNSOFQVS8A22Gk2Hs9NObyiBCmbCzmjXE0u2spv2+5ub9HPyXbkxW8JTf
         DqY2DYPnZ9b13hvKJ1zgA1I60jhQnKEKbeNLFAKg9W1b0CNgUq/h3WgDxwF1EOju0tfX
         4hHE34HYrKqmXvwxjJDHzX1ugO7Q7umsM578GKi+x/kxb/cLubrq5c3KstYl1F/SDtbA
         wAphAHdY3Xza80nNm3+IY4uBwJBknF93LnmZHxAjOqwDZK7ubVUb/+KNNitwBzb0WjoT
         Q15fYRNJUgu3TGId8YaFdR7FelIXUIMSj4JiwCBoNMZuCjZEn1lSW88KNmBLGvu1ZZwl
         0vaQ==
X-Gm-Message-State: AOAM530s5q6St3PckuwIV2MGU1HqLfhtHu8By159i+He4HHtgmH61tGd
        xbBYc3iZ0RKLcqDdIgCCGIr4oD7D0NI=
X-Google-Smtp-Source: ABdhPJzFGU3gVLo1w0mNJyPSUGTPxZ33nK83+0n06lPIrqq4nc9ArDq1Z7p3REQXcCY0gNEiCA6I0Q==
X-Received: by 2002:a19:4048:: with SMTP id n69mr9737662lfa.31.1590425302951;
        Mon, 25 May 2020 09:48:22 -0700 (PDT)
Received: from lothlann.lan ([188.162.64.24])
        by smtp.gmail.com with ESMTPSA id y21sm2914337ljg.48.2020.05.25.09.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 09:48:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 4/4] soc: qcom: socinfo: add SM8250 entry to soc_id array
Date:   Mon, 25 May 2020 19:48:17 +0300
Message-Id: <20200525164817.2938638-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an entry for SM8250 SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 5f98949c7562..3e08cf9836ae 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -217,6 +217,7 @@ static const struct soc_id soc_id[] = {
 	{ 312, "APQ8096SG" },
 	{ 321, "SDM845" },
 	{ 341, "SDA845" },
+	{ 356, "SM8250" },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.26.2

