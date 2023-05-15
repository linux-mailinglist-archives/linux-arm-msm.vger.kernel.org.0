Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63248703099
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 16:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237257AbjEOOxc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 10:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239987AbjEOOxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 10:53:31 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2598C173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 07:53:30 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64ab2a37812so20568259b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684162409; x=1686754409;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+hNvGE7q4jXvKF3ZUYBMyXuwdC9NQPYtizzZFk0+BI=;
        b=Tqc9WcFsmQJ38bWa2mqZUYIIu4WW0P1I1N9S1Pcn26m4cY1fdE4X5gAEtVd708XhZ5
         e7B9GvTmwQ4Kdp5hrmw4dExINB1pD6xBfPMZbLnKooED5aeImtqamYNsaK208yYEFEKH
         t8LSSwnPQxx8PHLLwgt0jJv/657WOunaaBXQjx+p0LsearZTOFGnVbhTobbwfKXtCLE8
         zX8vvmf/TbZHQkQMZDppCJX5OEmdckWFKLJR0G/j8aocrg/1M3iOHqWTmiwwLCNDO1Ih
         qXyzyLTn2MQBIQxl4y5VStGJuInOC6kgkGJFxJVHM5UgLZwjBBdfWv1v5NZ86+zy6L12
         gPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684162409; x=1686754409;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+hNvGE7q4jXvKF3ZUYBMyXuwdC9NQPYtizzZFk0+BI=;
        b=hG81n8oKR/H8vSmglVHIL0CaV2I05fkzP/15USlRJEeZ1K9lMI/jLENq4dFys92LYg
         D8CUWfVSIr2dyq053p6CzPyeVq5hWXS91WtGFxM/0JYff7rnqzvwvT5ZseTIzyZALvnj
         YpMDNvWRd3zOU0Ll9OR3sHgaFf+xSjPPVLVjwK2tfHviViMwhPWOCwJqNj6R4X0ZrNgS
         MuAJ1wyg7RSbJ7pNFM8wUn+ItN8X8GYrS9j7tMn8DoK/FTxwuAp3DsrYGS5MHDIdKg0o
         ONUTPytpUrefz9QFF4NwQRUWoS22ltommeD0vOhX7FmeJ2u7ggt3S1FnkpHt+QS5b3CF
         xxCQ==
X-Gm-Message-State: AC+VfDzuJMqrHJyOjPa6PA7c3DYpQAVaBpSR6Di2c/RxGiutpBqgB3va
        I5K4qRcv4g/nQ1LxNI8MrKEgQg==
X-Google-Smtp-Source: ACHHUZ5kA3m+Je8244vgLI1qkECu84qFhEq/Osu5+zhAxuk+eXyhdEkFpleZ2nyWwpREbo4N2K+4og==
X-Received: by 2002:a17:903:294c:b0:1a9:6604:2b1b with SMTP id li12-20020a170903294c00b001a966042b1bmr31503842plb.20.1684162409562;
        Mon, 15 May 2023 07:53:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.50.231])
        by smtp.gmail.com with ESMTPSA id p20-20020a170902a41400b0019719f752c5sm5433228plq.59.2023.05.15.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:53:29 -0700 (PDT)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] Revert "regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS""
Date:   Mon, 15 May 2023 20:23:23 +0530
Message-Id: <20230515145323.1693044-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit ad44ac082fdff7ee57fe125432f7d9d7cb610a23.

This patch restores the synchronous probing for
qcom-rpmh-regulator because asynchronous probing broke
Dragonboard 845c (SDM845) running AOSP. UFSHC fail to
initialize properly and DB845c fails to boot regardless
of "rootwait" bootarg being present or not
https://bugs.linaro.org/show_bug.cgi?id=5975.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index b0a58c62b1e2..30659922b0aa 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1517,7 +1517,7 @@ MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
 static struct platform_driver rpmh_regulator_driver = {
 	.driver = {
 		.name = "qcom-rpmh-regulator",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 		.of_match_table	= of_match_ptr(rpmh_regulator_match_table),
 	},
 	.probe = rpmh_regulator_probe,
-- 
2.25.1

