Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207A07C84E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 13:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbjJMLtA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 07:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjJMLs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 07:48:57 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C64BC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 04:48:56 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32caaa1c493so1630350f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697197734; x=1697802534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/djleLEuuC3lp+936owLmRGaug8G9ZraHIR1nlDHkk=;
        b=vQpLq5BEsHSJFDIWyeTUwztlXitR5jTrGFpQtMZPzSvJGXXdASYTeB0N9Koq2dCG5f
         kJx4U2IBoDC2MvsI6bnoOvmuqa33ESasC5tU0f8YLxlq+Ag4vonSB0UK4j0F8+A0BRDq
         FaqwYDMsguDkDhwUERaa7Q/UtKK+rXq3yPJ2tQVq2p1dEq6UbNWO2db7PjeeE27bMKDP
         00hwLmwQtVo0fbVqShSCEmFyREZYRgOtJzCmHG1eHK5ape1tZseI18/jf0L/1R5gblSy
         PtJwAgfZEE10ixYgYrCPYcnywCf1a7X5RBXAW9DL64WpXtSMuc55z3QeNdEhJNdOjscf
         H3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197734; x=1697802534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/djleLEuuC3lp+936owLmRGaug8G9ZraHIR1nlDHkk=;
        b=q1EZqyUaN7yjLGHEWGAf+KHqk732GIxyJQ8qlYo1oM7Y9c9YSQ+KAGy3E9QJ8hFhWq
         in2QsyaEIfWpz7htK2BZAgWhRyOqgSJiW/dQT2I8Il2XKQGxHsA+N1akJQuxoqcvRLCQ
         q/WRAEyjubeClJexBJ4krORlYExG1ZCfZt1AFSJviCRmk6vv2deM++N+wfIECDgcM2wD
         C6uJi0mLNoTY39W7EUtZpK6CxpApiLwgoyrFnJeeygt+ayuTi2gj3+ze5awWC2YLXC8C
         yH3wxF7ZYWDatpUXGWf4cG6PLM7qKUKkSxXcATRcy3tpaTWa0vtygRYAjvxbyNRamN8I
         eN/g==
X-Gm-Message-State: AOJu0Yx50tRv3Gf8L3OOqAvByGOHxYPzgtwPEgd+dcbmX5f3U3+w3qIb
        1omO//qDHz7nmMblovqZak9hxA==
X-Google-Smtp-Source: AGHT+IEnqeUgh11RR5em7SuKq8IrgD1o4vEng+unT6JpXvnQhWSAAdNm4wxzhZFquoM5eiAo/RcP8g==
X-Received: by 2002:a5d:5106:0:b0:32d:a101:689d with SMTP id s6-20020a5d5106000000b0032da101689dmr332421wrt.56.1697197734660;
        Fri, 13 Oct 2023 04:48:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4209:13a:988d:80be])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b00407754b998dsm974509wms.27.2023.10.13.04.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 04:48:54 -0700 (PDT)
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
Subject: [PATCH v4 02/15] firmware: qcom: scm: add a missing forward declaration for struct device
Date:   Fri, 13 Oct 2023 13:48:30 +0200
Message-Id: <20231013114843.63205-3-brgl@bgdev.pl>
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

We reference struct device in the private scm header but we neither
include linux/device.h nor forward declare it. Fix it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/firmware/qcom/qcom_scm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 7b68fa820495..c88e29051d20 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -4,6 +4,8 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
+struct device;
+
 enum qcom_scm_convention {
 	SMC_CONVENTION_UNKNOWN,
 	SMC_CONVENTION_LEGACY,
-- 
2.39.2

