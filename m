Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40207CBF23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 11:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343600AbjJQJ2C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 05:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343582AbjJQJ1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 05:27:51 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C7419A
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50435ad51bbso7039128e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697534860; x=1698139660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCMev8fnu3U2mssMcmx8KTkXZc63rgcu+BqEOWmqcVc=;
        b=0GVmSBGpS65v6XR4clU1uq7NiJcwMqPGNmHhai3Lcr6urbGjaBaeQz2OSfQKt6RwGB
         ZW3I2sy6zei7OkRD1KjJVVaRutG9iQinbY5MrKoU2bRqvy+M928SVqflWq6eHJeR0+JG
         08QkjS2nMKbXvItffYB5djycFeanpXCk2SH0zA+S6NntNUEWr8JtR2bbGElX1JsFfIxe
         qcKNSrpzABNMYRWgtl5qD85TkJ/islUnPeGRnizsjYJYnr4TEYsVwpYdyaU48KbO+06V
         Pr4WiSMAR8IhL2x4P+h6tooZKCte6wxpMSRLG7TNwhVg2TDg3YMUG4oTXcZqA2pka6TZ
         2OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534860; x=1698139660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCMev8fnu3U2mssMcmx8KTkXZc63rgcu+BqEOWmqcVc=;
        b=ixmuDwD7ND1wKJIpYd7NuzU6grOnNfVFHZogEy5+Xlle5VGl1PaSamUXAKrPFLSOyt
         1UIrvLtL8NwSls7Vxkb70vIpcBfNPylUtaw217JxoM3WgZhJ3QQWDqGrqtihap0+cYcP
         o0bHITIRRZfbwbeX/ZlMFDfTaixel3NXgtaxlCQVVqjrKLF7pjYK0jPN6UljHYhh6qG1
         lGRWHTQxT1pBS1M5+oNlUQDwXFby1ZZk2YqTCew1Y27ZyJsgdfnlsRkDgD7Xkriu55+U
         Xh76HqbcwG1HO9I+YaT4snZ82zmpfvrtfUGy2xRw8+8xKyJvEI/Ifio2cPN+AS5Ez5Xg
         FH5A==
X-Gm-Message-State: AOJu0YxIk2RBmRqSSp4HzfOQK4xkDTeAMofJApoYIoR3qpEZSa0xt1pw
        ADdG699N8g/QjF3c5cbqg1YkAg==
X-Google-Smtp-Source: AGHT+IEUFhDV/eJeJuNQR6mn+uXs0KNKqtLgmQ2jcPoAfUJPLv+K4dVBGlTiJHc9Owc2wJBd6Wkg3g==
X-Received: by 2002:ac2:4a82:0:b0:503:261d:eab8 with SMTP id l2-20020ac24a82000000b00503261deab8mr1192447lfp.28.1697534860623;
        Tue, 17 Oct 2023 02:27:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b003fe1c332810sm9460787wms.33.2023.10.17.02.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:27:39 -0700 (PDT)
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
Subject: [PATCH v5 03/15] firmware: qcom: scm: remove unneeded 'extern' specifiers
Date:   Tue, 17 Oct 2023 11:27:20 +0200
Message-Id: <20231017092732.19983-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017092732.19983-1-brgl@bgdev.pl>
References: <20231017092732.19983-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
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

