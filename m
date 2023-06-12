Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40A572CE4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbjFLSav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237650AbjFLSYp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:24:45 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC734E78
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:24:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so5580552e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594282; x=1689186282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SD+82Kp64qdWpl/p0nHwxIb/l/7wz0DuQnwuSSdR/H4=;
        b=DLAoC+YI5ihmdO8CNl1QejkU5ba9vdx06Z+NI7L/nO1cVIUcxwExm0xIpmipS22YdC
         GW4AlOmy/eF5P6nOW/I466ueIgqcQxJl5RDYEXdafLMUX5yUvvSWYK6WVVWF09xDY4j1
         51JEQkgGY751aEhBDdmqs92WZiP4vBHHbePfmCTHrYzKO7GG6AIlpeCC90hAi5Ria4NP
         wq9AILrsfen14FoV0pjuxAbG+dMtoSDhp95uIhe4ej+aALqzYIqCERjSOJXpxt9RkXPK
         izMUxgPCghgJhMKCJ9yluUUzsmLSh4xFevPDe0myB1YI6a8RMKJavfwt8/y/hvovKaeO
         VMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594282; x=1689186282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD+82Kp64qdWpl/p0nHwxIb/l/7wz0DuQnwuSSdR/H4=;
        b=F/Npg+kZbwJLAwLxqfxYKe56HGu196FsMqz5269gfmKcMig6ibiJME82dKVfA3DoBz
         5h8K5t+0YXO9kTcGI45YRSAox6sp4dRKRQNrRLDnTR5nYNHu6jv6MjgyoqTRVLNlF9jt
         hqcCs1qMGdAofOXduO4tcE11NgoUwVH5axHk65XSaVmz832xywOE86OxeFhcvoK7bWU1
         /to3+CWEzRGNZ/Wr4cAl7B0EvqDNbPL+/V6ux31JiYasVJNJUcTV+tEySgKms0Y2bId1
         mxcULNrU9FnN+YMx5SS0KAAGt4QG181JwUX+Gf4iCyPGYLxSl/Qvhzx+R3orfEfIwXad
         DiUw==
X-Gm-Message-State: AC+VfDxKy//xNV7jioamOFnAMT1emmWXUs1nR99TGNN458kXXp9mlUu4
        vyU4s73aEPaOoZGTeN2WJKZhxw==
X-Google-Smtp-Source: ACHHUZ59M0kdWHSJ7Qy0Nr6BEwWK0DdyxH9NFgW2MzdgoRX+27RfEzHBLG0l7TrgZ5h+3PncdmFzVw==
X-Received: by 2002:a05:6512:459:b0:4f6:2e5f:45cc with SMTP id y25-20020a056512045900b004f62e5f45ccmr4498200lfk.3.1686594282057;
        Mon, 12 Jun 2023 11:24:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25938000000b004f64073a252sm1502035lfi.96.2023.06.12.11.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:24:41 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 20:24:20 +0200
Subject: [PATCH v3 03/23] soc: qcom: smd-rpm: Use tabs for defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v3-3-5fb7d39b874f@linaro.org>
References: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686594276; l=691;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7uAPa6YDjXHLJZjqpcpTS8PIWFtwDRP9qtCSKC7URyY=;
 b=ESZpNbzbQ/xt/c2RmUiCpmrjQGbD9w+h5/bdbMHoNBU0InzGeWvrebWATOnYlgBtX2nGiySlm
 1vFrFqFhhcGCNGEDWGrdGayN89gbDg6nnUMZG/RFoUgsXDTDqHWaTZN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use tabs for defines to make things spaced consistently.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/linux/soc/qcom/smd-rpm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index e468f94fa323..99499e4b080e 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -4,8 +4,8 @@
 
 struct qcom_smd_rpm;
 
-#define QCOM_SMD_RPM_ACTIVE_STATE        0
-#define QCOM_SMD_RPM_SLEEP_STATE         1
+#define QCOM_SMD_RPM_ACTIVE_STATE	0
+#define QCOM_SMD_RPM_SLEEP_STATE	1
 #define QCOM_SMD_RPM_STATE_NUM		2
 
 /*

-- 
2.41.0

