Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FF06AE08D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjCGNaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjCGNaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:30:17 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE8254CB8
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:29:39 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id y14so13154427ljq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678195771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzlLRqeLIoCqWaeCUWjv2sHg+Xif4EvH9trW59SFbGc=;
        b=fOUJ3VKR0xgJCRsivOF8z+yqwiKvQTkZJuVKiQm7TEdr7v4AUNTKvl24w5XMb7WMR1
         EqkMQ0pp5xiQhvu0HJUAPMi+W1p3taMXijnPONvM4jyl6ImYL2qy7MSRZnQhP9Y5h/7/
         LfM4fJwcmCldKdJny6k8s+TzyhvhtVq5I9m6uOoE9uK3HmgsAvPpJmt/t6O1x7sEtTzM
         ZicykiXRZt4fIsEkxF9EjmVyzuVfvVyoQqxHpk0UVrf7KcfKMCatHIF9VKdjM8YOaBMa
         9jahkhWxostt1+pAHG6mKh0WQ1fJWK6MS2Zeb81xlyT+TpZoR4hMgnwm4V6peewZdxqG
         yzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzlLRqeLIoCqWaeCUWjv2sHg+Xif4EvH9trW59SFbGc=;
        b=6cW3bJE8uiI6MOw/HKGITaih5ZbGIxwfVnaAgjAx3Y1cBpicLpGxDfdMV+h+mdx9o9
         Zt3yPeCmVpFic07TpVopAPnwdU1UCt+mTRzq+7pBgB8eixmZM6B786EkSby4f9veCfti
         B3oma5hu90h4egRy3QNeMWi2R+4eTGp0aTQKIcBQwG0ve7sEgdRipP6C8DugX1UiuCur
         doEO5sh9Z/H2gzyESXkXaXz5jGocQrvbwlZg5D11Xwoycqayujl2Vf2B/BQRS9xX0EQd
         uyy6cQMoVaciPdCfYzaVMHwQYlVN2FcUPyOxeDldYxPjJm8qfqz30jG9VSrG2Fj8HWI6
         iUAQ==
X-Gm-Message-State: AO0yUKW2DTyxewUtjelLRqWudloT/u7ntVnaizKpphWX0dPvMbZMTVqi
        6UtVpy8heHk1a6HYrceUKdv+1WcUZOCJPBrph84=
X-Google-Smtp-Source: AK7set+VugX+jpRUPrQINQ/X7Fr4VOXfnfWI8pvcndAFBpJP9FnP7FnobOzCPA4RocPFaHSQJKXOPg==
X-Received: by 2002:a2e:96c7:0:b0:295:ac45:f088 with SMTP id d7-20020a2e96c7000000b00295ac45f088mr4271172ljj.44.1678195771320;
        Tue, 07 Mar 2023 05:29:31 -0800 (PST)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id f8-20020a2e3808000000b002983bfe65b8sm1674813lja.84.2023.03.07.05.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:29:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: Print an info line before disabling unused clocks
Date:   Tue,  7 Mar 2023 14:29:28 +0100
Message-Id: <20230307132928.3887737-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
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

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Don't add 'else' right before a return
- Add Marijn's r-b

 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ae07685c7588..115a80fda3f9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1406,6 +1406,8 @@ static int __init clk_disable_unused(void)
 		return 0;
 	}
 
+	pr_info("clk: Disabling unused clocks\n");
+
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-- 
2.39.2

