Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980C835307A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhDBU6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235279AbhDBU6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5062AC0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:12 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a1so6730390ljp.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMkSpD3OcWTd6f37s3IGkgZFUGHa0Z/7pX7Q5b4doiI=;
        b=fR7Mm9cVuPmMP5v1q6Pp/dphkK+g/XQV1yztsGuqWZTq1NXtdadTyvbY9t+iPOpW+w
         s4q8lzJTTxFpkwaq1KO4rBXhNEhW/KXMXqjXlxftUsXmjjRzT9qArdDw3bfXqltNpheU
         r1qMSi17HcF97dkNzt5jQrpgm6w2gBr5sZ9s6aR8xtw0fBMzhev9hCi5XxvsDFJFo9IM
         tFKBphpwjbP3+jYwyem9gHW08Uhfm3nFOKEEGRYRj2tHu39nJRsm8rTKUPBC2oxQqXnr
         8nH482MPV6VfKQm7l0FRsio33LTFpBr+JwYBoGNpbqeemsotD3xzTS55nNna3DayNUAQ
         g8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMkSpD3OcWTd6f37s3IGkgZFUGHa0Z/7pX7Q5b4doiI=;
        b=hakTst3AfPZYTPBxJYPmmOJibuH8cz7wS+PU2jnTxtMupeb6XqhHkmVn8ddui9UdBs
         NOWcg+11N947ds/LNEUGwNKLxNIVs/mlzlcoEdZJUwAQqRIyHye9jMZXhntSZLbKzzo4
         PZf03/apCI6Byipeexm6Vn27cA68SJx10qaV6baSZVeEYAZxc113zFMt+CyN0U/NuKxP
         IwOnCrawAvW/xxJyL/a3RnhMpBD1xfQ6RIuS2qEsLYtXzrpRe7umN1CBF4QHzDnfuLuw
         hWAlZUNcVcSEHJ+DhDw2VL0K8NUt546WmHvpaKGvGbC+S+QOQA98xT4HSoPqWNY/qGKa
         DzQQ==
X-Gm-Message-State: AOAM530OPhJBWvIG7AMPdmBGmiHOC5CrpIu+St5T++DSbaS8x0qAfVqr
        3RGF690ZZLJb3ET2YhtZeluvNw==
X-Google-Smtp-Source: ABdhPJy4/ZJzj8R9VznoGbAYPGHqfPoFTzNrpcKPbqGx2EXsIbRi2ZiKhDut2J/vuO4ScL6sO6GiEQ==
X-Received: by 2002:a2e:7604:: with SMTP id r4mr9766410ljc.60.1617397090893;
        Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 05/16] clk: qcom: gpucc-sdm845: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:53 +0300
Message-Id: <20210402205804.96507-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm845.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 5663698b306b..2d7dc89915e8 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -30,9 +30,7 @@ enum {
 	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
-	P_GPU_CC_PLL1_OUT_EVEN,
 	P_GPU_CC_PLL1_OUT_MAIN,
-	P_GPU_CC_PLL1_OUT_ODD,
 };
 
 static const struct parent_map gpu_cc_parent_map_0[] = {
-- 
2.30.2

