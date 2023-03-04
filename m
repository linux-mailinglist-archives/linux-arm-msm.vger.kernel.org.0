Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41EB6AA9DA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjCDN1v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjCDN1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:27:49 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F363199E4
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:27:47 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g17so7031226lfv.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMJaPWZzvgr1zZRk25pniV8MNs32JGnZ0ctQITcox7M=;
        b=o8kkgmrj2CZofpq7c3FkIlktr8pr851tpsO8hUhyNIAbK53RHVnMT6HM5xgR9g/92b
         uwCh4FRQ+l7zi46ITBZWceMIdVugwfDdV5XGhAWWtIoabnu1VLjrojg9DrXjYo+XIN4c
         PbDu98R30gX6B/0HK7bhgn40lkfZqvlqctTfhLI3KgXRa+dUBBa1vdH/HRzw/b26tJ+x
         OdZpHA5WFlAiij6Hr19O+DUxot1uqRJ8qN3CH+qiRNFcE4foBHUSBByCi3qnqAUXKpu8
         eH31azpvQjwzm0EznW5pSeBEjviSI//OSWmQ/1CQlMe5oJYCkgkMlAEH8d/hnKLwFJFS
         /V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMJaPWZzvgr1zZRk25pniV8MNs32JGnZ0ctQITcox7M=;
        b=1LgKGtdcI46UmsJ0NCsuu5kXgcKKrEkYhsFjLLKiFrgimAIpMAxVFBPCyZ/PDp3sTS
         63jt4z91yYhFEBwfz3GteVoFNCcdkxvPMLOOpCq5qsu0JPDnzBXOsIZ0frYSfU6VFK1V
         EA+asDcFGrn8jECZLcWQc969X/SVLwQKtEZqvtjA0fFtV5+mpOAyc2N6XY9WGKVAmDSO
         3l8jeXZ2spMos/wns1sBh1rxWZ1cUuvQOw0cparJZsIsmadKTr9NcGflcv3ax5RV+TzO
         5B6op5PINgM+qpajXZPwAstsHIvm7wkuJXCzHYEcpOpPeOZmAfe0VMeUgtv72Om1jCoP
         XjVg==
X-Gm-Message-State: AO0yUKV5ReBWHtCA4RmpH2HkOzSbWoDFkjtvZ4cNRXxK4XA52dRbkXwv
        sLh5ey571amwEbhf+X75nCMqkw==
X-Google-Smtp-Source: AK7set9/WXxrWCvmP6rW/sT8RD5XDoy0Ea95CLZoMxnBBVA1rIgNW6Sg6EFezTykxLUeUfPmlmiKRA==
X-Received: by 2002:ac2:4854:0:b0:4db:387f:a3bb with SMTP id 20-20020ac24854000000b004db387fa3bbmr1587155lfy.0.1677936465661;
        Sat, 04 Mar 2023 05:27:45 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:45 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:37 +0100
Subject: [PATCH RFT 02/20] clk: qcom: smd-rpm: Add .is_prepared hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-2-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=1482;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IcjgjHunD3zMZaFeCfHoL5cnPI0PmUW34gmf6fJPVyQ=;
 b=TA38znb8IsFbG6X+YzeL7jxDAfYqgL3P5XySVNQBRYMrhinLnwYLW7iCI5JC09DYwsWPOVlZj+l3
 9PqFN2fBDSPADX7rWnlyzqWb/RUDvZvepA1iFGevM5jxQQmGbMJ6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

