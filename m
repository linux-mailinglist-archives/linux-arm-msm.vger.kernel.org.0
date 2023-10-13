Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6C97C84EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 13:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjJMLtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 07:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbjJMLs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 07:48:58 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2743FD7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 04:48:57 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so20606485e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697197735; x=1697802535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lyOHM/RBgmuxKTo/vmZ0oW2gfmzXsxTpr43TXFONHQ=;
        b=IyxTQBNUBn8rmejfIc3BIopFVVYZSzIjPk7Zzne3yZWknhQWh1wcuglbAY+wjrwBPi
         3ChInU7QiVVar6M8joo3dFQFzPSKRWmerovkTWESEnsbov+hnUNsKRZaMTek8ZzLSXSF
         UTf78hCuZSACvwzb68f4Ci8flA4plebbWtnvYrMboHmKfpTNa/3/KUg53A+67gk5Q6TI
         9QcLbb13o0QqmS9AF+j27lnJmKW1pYJziZ0uYOtKhU6VPUkfv8PsSuAq5SQYNlqwIA8M
         g5IvDn8R8eleUZly9qLG1a9HDN2Ma9aoqcZWqW3r15Pvpqu/+uDjiI64wMINMdgKJAag
         EX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197735; x=1697802535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lyOHM/RBgmuxKTo/vmZ0oW2gfmzXsxTpr43TXFONHQ=;
        b=bFGiURW5x9PVTppZFoJtEXCK0DOH/363vU3b2k94FZtP5KQYwL9OmIXeTtRtRrKTKB
         f12YuPBhk/QlFT23JsjqW71h4AKWbeManf0/g9mrv0HrzIBDqkI1LkXGaJ4QMoeM9LE3
         RneUfeWKW74y8E6rkJjehGBMWtH3S16ozNnNcFiN4B/8MF51gW5ZiTtL+oode2G/lKyf
         KTAOoPkgTXTVhORuSX0V/lCVRW6K4NhrL7sCOUNatZfsPIWCLnMiruRIX5+DLCZ9OiNZ
         paxNj82u/WcVp8C9WQ1+WRnxNkj/EvIemZyRb/WKsoIvZ4pHGeakqXJIo56MqlGIlDLJ
         FS5g==
X-Gm-Message-State: AOJu0YyCAx3vJ+PIXCjeaxJzQP+YBtv9XUt5kZVj6PbEtudIZWeauZoJ
        8XuGtVJWJs4b8+2xvM1boo5N0Q==
X-Google-Smtp-Source: AGHT+IGwfVRxhdaPcrTgZudW4uBmd9NjhkZBeH0ym5/LLLLuWLxGrB4YZsbUy/eulNORH0ETqJvBVg==
X-Received: by 2002:a05:600c:2a4e:b0:3fe:fc0f:52e2 with SMTP id x14-20020a05600c2a4e00b003fefc0f52e2mr23680112wme.37.1697197735644;
        Fri, 13 Oct 2023 04:48:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4209:13a:988d:80be])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b00407754b998dsm974509wms.27.2023.10.13.04.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 04:48:55 -0700 (PDT)
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
Subject: [PATCH v4 03/15] firmware: qcom: scm: remove unneeded 'extern' specifiers
Date:   Fri, 13 Oct 2023 13:48:31 +0200
Message-Id: <20231013114843.63205-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231013114843.63205-1-brgl@bgdev.pl>
References: <20231013114843.63205-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
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
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
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

