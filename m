Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2CD4789071
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 23:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjHYVgI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 17:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjHYVf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 17:35:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7528610C7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:35:55 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5007f3d3235so2079502e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692999354; x=1693604154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tp7LgFPLpnIkw2JmjBzO/9511opzQR/ho3jSDUkitEI=;
        b=WQzBx3wDBZP8lOmUkvk09NRwHzHkybbed0St4r0VsMFSTBNaXFRuqJnmJG2ve4fBaM
         i7v8KgtCZfjOMfSn5VzRTx/g/dO1IvY6NcuEI9adeVnsYSlqTK2wOdbCJZe3sAxDZPuL
         z12qzuZ+Wkak33cJKUPvW61kxALAGfd044oeOr8BuUT6/gJI/B43THKdbIncm+dIGWxw
         YPmV7vzvPNiw0qExibgYK8yk+tOqzyNIza9HFrR50HbGz3iRYWdPxNl5BijUV9aRMG+k
         /elYaOPEC/yAWIYwm21KnGXCRfDe9t1ETVqe2tpdgEyaSoCRh6yTdalKwy9PP7aALXeT
         98dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692999354; x=1693604154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tp7LgFPLpnIkw2JmjBzO/9511opzQR/ho3jSDUkitEI=;
        b=Lef1xTQlGQooa+AlqbtLquWvh/hW1cs5O5YVT+baLHuNAKwHCzLSbF/3Rxpe0CjJFK
         lLFVOEDj6aS5BGN5kyvvY+InO9nkW996cYZWlr6Fvv1DAB4HWXXEciXncMbaouBvzFA2
         IR4uDiO8SkqQzlMRl9HyJicv82mGtTB38jwcrwEZqOGFTeOrCyTuSIw9NfexMgqkSGIc
         Zr433kWl1znx4328FOzqreIenHQ0d2XYGroD1HyJRs9QYuKGYJFdLQqDVcwW4s90Krjh
         vcHYa7sDH4eQpQIuTfxBy8Gxb1X8i6gQieltpBqgbkeYeKsU6xlFv8RteQL8Y3RVvTjq
         YRKQ==
X-Gm-Message-State: AOJu0YxKxGX7vmc31Ue4OquA6+lCleMWvy8EuQIWO8tceZq21gN3wBpE
        sy27LJKosPFWjAv5Aa222Lsv6+4ZJ8qTpiFVg40=
X-Google-Smtp-Source: AGHT+IHRhrWqUyLoNkeL82+BnNr9H5EuJ2/70xPuM2P3fuBxElC8Ed3FFrgvWr8P8/qR2fBbcIzOkg==
X-Received: by 2002:a05:6512:b05:b0:500:9026:a290 with SMTP id w5-20020a0565120b0500b005009026a290mr9955891lfu.9.1692999353563;
        Fri, 25 Aug 2023 14:35:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b11-20020ac25e8b000000b004fe47879d93sm429947lfq.106.2023.08.25.14.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:35:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 1/2] irqchip/qcom-pdc: don't read version register if it is not available
Date:   Sat, 26 Aug 2023 00:35:51 +0300
Message-Id: <20230825213552.1646321-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Qualcomm SM8150 the PDC resource has size 0x400. When PDC driver
tries to read the version register (0x1000), it reads past the end of
this resource, causing kernel crash.

Check the size of PDC resource before reading the PDC_VERSION register.

Fixes: bc82cc42644b ("irqchip/qcom-pdc: Add support for v3.2 HW")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/irqchip/qcom-pdc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 9bb6951257c2..431b213b5abb 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -324,6 +324,7 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 {
 	struct irq_domain *parent_domain, *pdc_domain;
+	struct resource res;
 	int ret;
 
 	pdc_base = of_iomap(node, 0);
@@ -332,7 +333,14 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 		return -ENXIO;
 	}
 
-	pdc_version = pdc_reg_read(PDC_VERSION, 0);
+	if (of_address_to_resource(node, 0, &res))
+		return -EINVAL;
+
+	/* compat with old sm8150 DT which had very small region for PDC */
+	if (resource_size(&res) > PDC_VERSION)
+		pdc_version = pdc_reg_read(PDC_VERSION, 0);
+	else
+		pdc_version = 0;
 
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
-- 
2.39.2

