Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7A57BE4DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 17:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376962AbjJIPes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 11:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376896AbjJIPer (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 11:34:47 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4888F
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 08:34:45 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-307d20548adso4306855f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 08:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696865683; x=1697470483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6eAwp+/NLgzsLQxQqIe9/6ILdI8QAjkHJ9+by+NSlg=;
        b=avngnRlyYhw+4EnkLC1+W1rxYCnJAoH2EDyMdXyNcy1SOpr26tIjR9Blz51IIXdIOm
         FJW9y7F0w8wNgv9a1ey5bWPVyehciAMialW65tuZpqcjc6X+lGq/1LAw70Xmi8/cW5Fm
         hYg0wkUWNe12p8EpvBlQgN3bhXu2NdqCfA1uKobo7QNjUAeBNCJMTRAU1eP58AskN0/u
         uM3patVu7tUgPybtuMCxcNPkrrHEEu8IeLtgc64Vd0caThQbpviYdffpLUW4vEOqDFv/
         ow8hUGsNXgntHHdMdzY71itDFiRuTNNkCqKYZDmqT0kfAn033ae9Mw8XOlqWJ9/bQjEZ
         3B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865683; x=1697470483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6eAwp+/NLgzsLQxQqIe9/6ILdI8QAjkHJ9+by+NSlg=;
        b=FLeq2OjQnLPO3u+utqN8zmnnHlhOPf3Xkp5AqlVBJ5KgPN8TDltJUt4ER1vatwyX7M
         XzYsVWtoxttl9RiRYEiPzCAzZSD6KluKaguYTBuI+0Cw9UbuCsfJ8WPk1CY9gAML27r0
         DTEOYwcHQrykxZgC0pxXUw3w4AyhBEQ80u6U12hB225yOLE20Pg4bwG65ZGckBHsq8Mj
         436d4Z9J4LDzHOQXy9ABF7+AurtsZLG/3HwKtboyvSTR0dMuBa63N/hhjmWJzYvGXsZt
         lFqfpw5rzowOXgHB0vS7NH2O04t5d37c0fd085J4Yclu88PsGaQZMl9dgKIwQAZESr74
         QVUA==
X-Gm-Message-State: AOJu0YzuWNzxAlohhbpMOQnJekBXOje2CCT7+58H9PxwDweAwAmTrTD8
        q/oFRQPd5/AK6bF3MrnwTgtCFA==
X-Google-Smtp-Source: AGHT+IGQPbmjtWzlwmkDpMj8BrV+CGMweKgLmWJRazlR2GfQlg6tpQhTsj0X/JeH7Ks7AF7tx4ODyw==
X-Received: by 2002:adf:f407:0:b0:31f:eed7:2fdc with SMTP id g7-20020adff407000000b0031feed72fdcmr14360253wro.35.1696865683428;
        Mon, 09 Oct 2023 08:34:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm10016521wrp.89.2023.10.09.08.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:34:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 03/15] firmware: qcom: scm: remove unneeded 'extern' specifiers
Date:   Mon,  9 Oct 2023 17:34:15 +0200
Message-Id: <20231009153427.20951-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009153427.20951-1-brgl@bgdev.pl>
References: <20231009153427.20951-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

'extern' specifiers do nothing for function declarations. Remove them
from the private qcom-scm header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index c88e29051d20..4532907e8489 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -66,18 +66,17 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx);
 int scm_get_wq_ctx(u32 *wq_ctx, u32 *flags, u32 *more_pending);
 
 #define SCM_SMC_FNID(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
-extern int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
-			  enum qcom_scm_convention qcom_convention,
-			  struct qcom_scm_res *res, bool atomic);
+int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
+		   enum qcom_scm_convention qcom_convention,
+		   struct qcom_scm_res *res, bool atomic);
 #define scm_smc_call(dev, desc, res, atomic) \
 	__scm_smc_call((dev), (desc), qcom_scm_convention, (res), (atomic))
 
 #define SCM_LEGACY_FNID(s, c)	(((s) << 10) | ((c) & 0x3ff))
-extern int scm_legacy_call_atomic(struct device *dev,
-				  const struct qcom_scm_desc *desc,
-				  struct qcom_scm_res *res);
-extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
+int scm_legacy_call_atomic(struct device *dev, const struct qcom_scm_desc *desc,
 			   struct qcom_scm_res *res);
+int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
+		    struct qcom_scm_res *res);
 
 #define QCOM_SCM_SVC_BOOT		0x01
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
-- 
2.39.2

