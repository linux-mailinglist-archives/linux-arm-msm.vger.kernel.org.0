Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D8D348EAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhCYLMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhCYLLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:54 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEAFC0613DF
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:53 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b83so1885313lfd.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NDXHpCb5h3W3+zF4OjuQq512OaSqWRquW+9LthWR0MA=;
        b=e+X49hqzWnLwYEowjjAGD2k3UxE1ewtmsb9s1ZBFPTkFzgF3kQgwXxY7BvxhgTFh7w
         sCvVoDpCRpjCR9gfa52GXxysFDd1dcyKJXxx5+2rrliRZ2VWSPichpogf3SQ3Lm0XE0b
         bCKXConouYQ5bNh/DEcUJen1vCVwr23exaGyYO8UnXIxVeX8iYLEsJqyaMEmmFVvL8Ql
         M4FRVRz0o6k5eGhT7KXrw3ZCC83WekR7jbkRaGH4n24LTwwWDDYYWAyszRc4vtR6K51r
         bUD79djJHzXXix7Bj7v6OC/90xBp/Gi5v+/Ilq+ZLaCTtRxQVmSdf6JGALyXSgY2JLnn
         Hg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDXHpCb5h3W3+zF4OjuQq512OaSqWRquW+9LthWR0MA=;
        b=SKm7dE+vcd7QAlI3Y87R6Iokzr1yGCRso9hxEV4cFPkINg1JBc4ImgSULcUAFxbMQp
         1+7oKuW6UN7gT7eh4MxzNLlnNSKH/69Rc617ae/ErXSX4vt5jnDgpSlyxtE/Vv/mAO5Z
         wQ/u/lWoggcel7sMa6YNdRiuxmug78WF2jnQ8VGmBGlohy0QK1nthjRQbUxZ39e4eR4C
         l6r34zK2C1AqSAeK26hp8qotIhlCL5GqycEpYJOBu9vPMiCmaq1xbSZ6O3eOYFeii1lo
         kLG5QJfRbOI1Za1lj2XDZPFmZ6gA7LPcLu4zy7ZFyh2hB8mNVdN3Wmam1mt9lScWMLT1
         atrg==
X-Gm-Message-State: AOAM531aTQNdIdsRcGPrD/Ez5Y4M60PhWJT6edRtLP0ZtguWqg0UUSGj
        Lkzan0tW7v+9UdRL/kjqGCwzRQ==
X-Google-Smtp-Source: ABdhPJw/FqtqJbHh7fAkLswz2Y9VKFxF//lpl4KMO6gNM5SvP+11Wyyfmo+M/w0GemT7COdGG8pIyg==
X-Received: by 2002:a05:6512:5d7:: with SMTP id o23mr4648175lfo.81.1616670712350;
        Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 07/15] clk: qcom: videocc-sm8150: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:36 +0300
Message-Id: <20210325111144.2852594-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8150.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index 3087e2ec8fd4..de09e5456555 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -20,8 +20,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL0_OUT_ODD,
-- 
2.30.2

