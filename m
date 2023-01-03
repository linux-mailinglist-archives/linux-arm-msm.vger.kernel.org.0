Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DE465C269
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbjACO4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238034AbjACOzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:46 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49D6120B9
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:36 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id bn6so22185016ljb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PUHxikh6ixLObBbSQSvhLpdNZFpYsbA0B7Pmct7Lkg=;
        b=uuzV6YGdI/nFu0MJa9RiVYtwlAsWrxwij7AMGjAlo8213pjVDzEhvgjVZ+jCHmdm1r
         Wb5A9QDECKIENr/3WIyM7jTdFDespXtnpG0fj47I66xsrUTIsYOFC+lIdiZpmpImZ3N+
         z+UUHwlMEoPPH1hLXQxts8NnZa5m83jp47Cw5lvFzdzstETH+VZoKptWf3LHnv6bQvbT
         Zkw2lFe3rbPCCtsFa8j7DN2ZdNurR3t9fchYP3s/BUt27TTiBWdpKWL7hNnw52GgyB80
         9vlrzXdT1Rfx7GqRvLHN3iGAYKrwIzFKqIzKSXzrpreDioYCYOsbs4FU77ipWy7XgtLu
         IKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PUHxikh6ixLObBbSQSvhLpdNZFpYsbA0B7Pmct7Lkg=;
        b=IallhNkrV82X4ndnIQBKMVfXLQhzgiiM9H3NgqY3Q2u5u5UPTxQEyRzUf33LsceWJd
         Qu8XFLuRShcB35wi+oeajmI764CfynZZSbPjWNc7ap8e47KsiCojoAIrY/BR8jmDBSTw
         ezOL3qNfvJKa2J5Qs6AuevvBj7E+spUTWEa8dQAuC35kxQ/hpgvYrp6//+sjOv7glAMs
         Kk0vAXfWITiFCV4ko70reKj5LEWAxYeJeP61IoM9kzLaLrkH4CDrsfIMkxY4OJobnmjh
         8uh2hCsjmEBCbuUFJ67EquDOBmZ6lKWRk0J4R2mFm/R+LEYRFV7F1CKmbJSwZQsll/7g
         ewwA==
X-Gm-Message-State: AFqh2ko2D3LxjCIKv2TkaoaV49BwKLyWzuqTJkm5L9QIF5GDyIW7zJQ+
        C1hIszTu9jKmdWo1dsyS4fQnLg==
X-Google-Smtp-Source: AMrXdXtg5Z9jsUeRUcJYDTPzlpCywVNNBeEiA8Zd3VF8SlHHxj5b+uumrSXdE2wBIYtKwfGZYs9Tyw==
X-Received: by 2002:a2e:9b9a:0:b0:27f:be4b:286a with SMTP id z26-20020a2e9b9a000000b0027fbe4b286amr8169876lji.42.1672757736305;
        Tue, 03 Jan 2023 06:55:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 19/21] clk: qcom: dispcc-sm8450: switch to devm_pm_runtime_enable
Date:   Tue,  3 Jan 2023 16:55:13 +0200
Message-Id: <20230103145515.1164020-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to using the devm_pm_runtime_enable() instead of hand-coding
corresponding action to call pm_runtime_disable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8450.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 40efa4682bed..adbfd30bfc96 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1762,19 +1762,12 @@ static const struct of_device_id disp_cc_sm8450_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8450_match_table);
 
-static void disp_cc_sm8450_pm_runtime_disable(void *data)
-{
-	pm_runtime_disable(data);
-}
-
 static int disp_cc_sm8450_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
-
-	ret = devm_add_action_or_reset(&pdev->dev, disp_cc_sm8450_pm_runtime_disable, &pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
 
-- 
2.39.0

