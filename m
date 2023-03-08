Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0579F6B1401
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 22:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjCHVfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 16:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjCHVft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 16:35:49 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDF099D65
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 13:35:42 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id g17so23135297lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 13:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMJaPWZzvgr1zZRk25pniV8MNs32JGnZ0ctQITcox7M=;
        b=vKrNdtp74XinQeNY4eMDGuSmvkyKQGDqeQBhsMhjY4fdPFriJ/A/gnKkP1o1Rj5hGd
         d17LdIQDyFuSpT2Vfj7n7jHcMdiuoTW/TlXkk2saJZraSak8jwZ4Q24GswuNvxiAG74y
         UIkMljkp3U+T6aBAVWMxiZCBNWyRgmu0YLRi9L8sGgJwaKegUSS8EDgULQ+IQ03gMFx6
         l2fjXcX3reu/Cu0ptyee4UayN1EImRLVAhamofdEb9uEo3zSaVG7Ko97sziZIay7InL2
         XuZXMX/aRgxC28XHPPNGYfZej9i+JhM/Hg2bsCWhnKvmC0bkRYhNQuyOSLjeTRXqhT5r
         tcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMJaPWZzvgr1zZRk25pniV8MNs32JGnZ0ctQITcox7M=;
        b=cl2ijg1/PZk71i5ELfGFwAMdrxuIyvcVQkkZ+D8gU++oRYBKczyc62i47GwaBebt8K
         NhKE1Au8bXD2pRnbglWdHQ5Eqrusu8xQYNnWx/KeLXXJf2N1XiHnOZf37j5E68F0KcDw
         GrCw2VRQ8cV3RBc+yTMZI4rdOWct3RwVQXxDmJrCh64SYYh51EdDGU86dkGz9fvI0cIj
         O5+5qTEUzFFESWM5XhtteTA3AgxqvuRGBPROC4F1pxA4UWebySsOCaJqseIymo1x+TTQ
         IZHvxEe53UKCm0Ikkt77W1vcCwZb0Q7mjM+3psaHpf00vmfUGpbb+TcNd7ixP9pHprHm
         ehcw==
X-Gm-Message-State: AO0yUKV8GtCR9smkZTKzof2eiw7Zc3JyujClgmVbZDZgf1e6HI/49qNp
        lh2/PSX3Zn2429WonwvtARvucg==
X-Google-Smtp-Source: AK7set/JPTntxaKTZcLdE5KqdvSF5AcoXwGRJn/HF6O72/daeXJyZEV1ZobxCAwgpbYkndOGpkFLRA==
X-Received: by 2002:ac2:533c:0:b0:4dd:a7fb:1e7c with SMTP id f28-20020ac2533c000000b004dda7fb1e7cmr6210843lfh.3.1678311341007;
        Wed, 08 Mar 2023 13:35:41 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:40 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:19 +0100
Subject: [PATCH RFT v2 03/14] clk: qcom: smd-rpm: Add .is_prepared hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-3-ae80a325fe94@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=1482;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IcjgjHunD3zMZaFeCfHoL5cnPI0PmUW34gmf6fJPVyQ=;
 b=XRRU/aPY7IT5XMd/T58u1InRETQd/B3Yhxj0yGAMrEQOfmdVugwndUVxyE9RQFkJpxKP4wWNbu/N
 yGcVWciwAl1WH/YY2FamRSLaf5lO4N4wNpnx5oA33Np6wonJwq7K
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

The RPM clocks are enabled/disabled through clk framework prepare/unprepare
hooks.  Without .is_prepared hook, those unused RPM clocks will not be
disabled by core function clk_unprepare_unused_subtree(), because
clk_core_is_prepared() always returns 0.

Add .is_prepared hook to clk_ops and return the clock prepare (enable)
state, so that those unused RPM clocks can be disabled by clk framework.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
[Konrad: rebase, don't duplicate the enable func]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index ecacfbc4a16c..cce7daa97c1e 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -438,6 +438,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.round_rate	= clk_smd_rpm_round_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 	.is_enabled	= clk_smd_rpm_is_enabled,
+	.is_prepared	= clk_smd_rpm_is_enabled,
 };
 
 static const struct clk_ops clk_smd_rpm_branch_ops = {
@@ -445,6 +446,7 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.unprepare	= clk_smd_rpm_unprepare,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 	.is_enabled	= clk_smd_rpm_is_enabled,
+	.is_prepared	= clk_smd_rpm_is_enabled,
 };
 
 DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);

-- 
2.39.2

