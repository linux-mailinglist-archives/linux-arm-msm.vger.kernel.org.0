Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E8A6AC1A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 14:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjCFNlV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 08:41:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjCFNlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 08:41:18 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FB22FCE3
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 05:41:12 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f18so12789474lfa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 05:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=demFJEUEpJvdhO0WfS6d2haBUZGb3Sc0QF/0m+krW4o=;
        b=SqlmKiqV1vvIob8AbIAmc6V0U38ABCSpa4IH6mKnNa4t68QesWeBXA6TjMGMTwLooI
         ui/ym4oTLhGUKS6elVsQxoAMGuRbRAOGWIW+ZN5ermjOq9+Fgp8RHFJMfphta1fTLXQL
         QuouQkkMhWdASN4Ub7qYR0j9sio0ezffv4YWGXlgpzquCvUoUBiIyBont+lzUrEYH2yf
         Bn53vF3yPhVS/nCR8zEKJ85ap0XK56WdgtnNXtSBAClf4nfrJZ78IKOGIdbEI5rtjPdy
         g6hz1BDA+VV7Dvkx7+x6YMcWRCUfodwSzrBlQ057vpwB/l7xM28lfAdKWxi1HGuo4yPu
         mH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=demFJEUEpJvdhO0WfS6d2haBUZGb3Sc0QF/0m+krW4o=;
        b=I63PeGjhBHKXdJQU79Vjb+DP5W3vdICbGmodQI4w1vFF68MWfJBgnk4d+iZqamrcnT
         WPkGntlxENIN6ESjdvTioo2NGRo6qghzZ9Lx6t2W9UwG/kkg0lYD48uTINX+muZNcNkt
         YzkzzSfz4ahIMyHKqmclk7GImCQtcymrTSkPsGMifOKjcK2bDrkBuIotghVzYpZMca27
         2FsZxPt3Q9z0LFDmy57Heu/sk8AekFOVGt5MHvUGYS1OG2g8JCGj0i4HrxrXVIoVOLaq
         4RMVbcHleVhHU1Jffj05FMMyemv8x2pkqgLPv0LImKCU2ltZKsnMGSu+M8k790gvOidQ
         UbQQ==
X-Gm-Message-State: AO0yUKVEZx3emiNkh341U9gVhxtZdcn4aUzXC6JpmK9I7PYqvl1OSYTT
        muimTM6yRcGai2yx/TQjTFdd1hLDIe7YC9DDLMo=
X-Google-Smtp-Source: AK7set8OrayqTzgpgTAhV1JC15aJbJTBqVjr8AdBh/+c/wGSrcmEqdJ27+6wwIgCBa+OOEWMbJwA5w==
X-Received: by 2002:ac2:522f:0:b0:4d8:58a7:6d90 with SMTP id i15-20020ac2522f000000b004d858a76d90mr2766511lfl.42.1678110070773;
        Mon, 06 Mar 2023 05:41:10 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id d11-20020ac244cb000000b004e792045b3dsm1574505lfm.106.2023.03.06.05.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:41:10 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: Print an info line before disabling unused clocks
Date:   Mon,  6 Mar 2023 14:41:08 +0100
Message-Id: <20230306134108.3099396-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Currently, the regulator framework informs us before calling into
their unused cleanup paths, which eases at least some debugging. The
same could be beneficial for clocks, so that random shutdowns shortly
after most initcalls are done can be less of a guess.

Add a pr_info before disabling unused clocks to do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ae07685c7588..827a51fe6653 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1404,7 +1404,8 @@ static int __init clk_disable_unused(void)
 	if (clk_ignore_unused) {
 		pr_warn("clk: Not disabling unused clocks\n");
 		return 0;
-	}
+	} else
+		pr_info("clk: Disabling unused clocks\n");
 
 	clk_prepare_lock();
 
-- 
2.39.2

