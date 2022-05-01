Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C47B5163BC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 12:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345305AbiEAKjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 06:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345362AbiEAKi6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 06:38:58 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81710B66
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 03:35:31 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id a1so13712766edt.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 03:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V2XiL9f9veS3ZvGoQ5FNlxYvDUpFRv+K0jj4suqDnag=;
        b=pF6mL+OXBOtWGzfNQ8znVxL2M2FREfNIUdRisU6G55LmR5FUZgjKS1xg4CcqfpDGUR
         mYVt7sUYjMfhbpIm9jwWwPbifoCUWHRwaWhOxX6UVhF4VLrIwBr0OLrEdrZF/ATYLhaE
         3uHp7gtzPNv4xxnLFab7MFmAWsjakM3/+gE+ikcbLzAUIe1KAuQ1g0GoOzLW2bhi8Pu3
         H3hxm1XkeqRza4UDiKNG0TFZfgEXlspOuIYa/vLz8SMlF3UlbnlIDcvfHtlcE+ISHg/a
         aF2L6nw0n/CpHUhZYkCee6oLL5Q8lhVgKt1XP38xY4HL16Vd62I674J0eWfdXJxe6Aj9
         h6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V2XiL9f9veS3ZvGoQ5FNlxYvDUpFRv+K0jj4suqDnag=;
        b=mSMiM9zESvbKKqO1yNhHSKw8ER0nFJFVzrPs43gClcIu0ydGMkqVSSABVqDxeZmCNx
         of8soFZIZEAqeFcU3gVR11vsNWd5EQDcwQpCZftiMBh2THoPuWkA+zfHRI++VW5CwEXy
         dVrt3hUaIl20TUAG1rWMqiQFmFiYrFJobLcR6S+URfZRcB2HmM2ekXBHMDRLDEraeZmA
         y/+wSF5qPLqLpB05qUheQPBk/5QfV6rL+3mWhwTk6KKM3hbru14AX0q17ntWUdD7oXTn
         GwbNkfNWOCXEMmbNRPk4QFNL3wO5/20fqjKLnMK1EtM+Vdzcz95KYLFT6aIWLpm1gAYR
         Ro/Q==
X-Gm-Message-State: AOAM530SXXIqpP8KnuTDDYND3p0Ib59eCPLrRi5NZOtgMHkMMJthgsnJ
        CxG+AJalgEIeONT5aNS9BVb1Qg==
X-Google-Smtp-Source: ABdhPJwWkXv4+jpkaXY4fsL5+3eP+ynAKoDdfutGbXlrcGuwSnIUlHUP7d7B3tSHvlrxLPDdFfqmYQ==
X-Received: by 2002:a05:6402:26c6:b0:426:3d16:f9d6 with SMTP id x6-20020a05640226c600b004263d16f9d6mr8505958edd.210.1651401330029;
        Sun, 01 May 2022 03:35:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214df1sm2464438ejb.87.2022.05.01.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:35:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/8] firmware: qcom_scm-legacy: correct kerneldoc
Date:   Sun,  1 May 2022 12:35:14 +0200
Message-Id: <20220501103520.111561-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct kerneldoc warnings like:

  drivers/firmware/qcom_scm-legacy.c:133:
    warning: Function parameter or member 'dev' not described in 'scm_legacy_call'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/qcom_scm-legacy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom_scm-legacy.c
index 1829ba220576..7854af4abc62 100644
--- a/drivers/firmware/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom_scm-legacy.c
@@ -120,6 +120,9 @@ static void __scm_legacy_do(const struct arm_smccc_args *smc,
 /**
  * scm_legacy_call() - Sends a command to the SCM and waits for the command to
  * finish processing.
+ * @dev:	device
+ * @desc:	descriptor structure containing arguments and return values
+ * @res:        results from SMC/HVC call
  *
  * A note on cache maintenance:
  * Note that any buffers that are expected to be accessed by the secure world
@@ -211,6 +214,7 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 /**
  * scm_legacy_call_atomic() - Send an atomic SCM command with up to 5 arguments
  * and 3 return values
+ * @unused: device, legacy argument, not used, can be NULL
  * @desc: SCM call descriptor containing arguments
  * @res:  SCM call return values
  *
-- 
2.32.0

