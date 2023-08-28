Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694A678B84E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 21:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbjH1T2A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 15:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbjH1T13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 15:27:29 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25098CCC
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:06 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31dd10c2b8bso476148f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693250824; x=1693855624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNNFEJol507fnnll/GiCNMd/EJ+bjC8uSrL8Nl+Ny9g=;
        b=j7RA/+VrPOlZBQ5ZrjTCRD88rvjaQzRCprr3Fjo2CBkgJh8MqVG4MImUUWi2SxaHxj
         vKqPWnPvy1l29LUin6CtTOosVFYO1ChAQcdMnhJMFlUU9sIjzsy6KGcuxrnkMkQGrENq
         aBsoy+/EDStX/CnqvBQ+lZyrkExXfg46rvK1y8eqeXbs1v2c1bHeaJKgG1tgirOJeAdc
         aynPcSXjqdoi1+x+/Ir489fr5QoC5W776XPcdBTDMlRxrPZG2HbvtzD5D9Pl+g1LrOz7
         1NyD0axOq9zYjRBiPjgAuMAsv2JtfqVxZ5xCRzGAryJj7qlAxIVARgyPCmrgWdvUVoAP
         U76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693250824; x=1693855624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNNFEJol507fnnll/GiCNMd/EJ+bjC8uSrL8Nl+Ny9g=;
        b=iwQlwJx9TNgSIsbtL0H88lpmCX1NfmHfWSd57geLsJJkEQAPGP9SXqzPsHzu3HqK+C
         mrBmHof2aJ6rBlo+ORL9MT7rr5uTcLdsagUQcpW263riNuB2/v1P4JQwubeh50MqI9ha
         qL1h7DwyB5UwQnWEbMXuEvqFgklfuvnSQ82bqEV5hXuET1tHelfBXFJD8DqBmb49dkIO
         IS8MlNNx4crLs5VmRcsy2JE0wB2yYOLDRqtr32MZk3PPFSH/vbCYrrwloDf7UIb/re1i
         oVzpDAAZkDJi487OhWRfBpHmu7iYaFsh++3/owOiYxl/FSUo7/RYR5VtSOtMtnWt/6ne
         JHqQ==
X-Gm-Message-State: AOJu0YyxRo0LsXP2KmHRNkrTNQ8ZCR837sKmps1ltt38288HfU/rCwL3
        DZoyAWzrjcKwBcFmeBRTii7pOQ==
X-Google-Smtp-Source: AGHT+IFuspge895OlO/pS7GkSpr8Z2Vw74TPV8e/HYmtxE5aA4G5rRHHYITyGt3xIizf7aHsvM3LoQ==
X-Received: by 2002:adf:f011:0:b0:317:6965:ef4d with SMTP id j17-20020adff011000000b003176965ef4dmr20205597wro.56.1693250824733;
        Mon, 28 Aug 2023 12:27:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8bd:7f16:d368:115f])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003141f96ed36sm11435319wra.0.2023.08.28.12.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:27:04 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 02/11] firmware: qcom-scm: order includes alphabetically
Date:   Mon, 28 Aug 2023 21:24:58 +0200
Message-Id: <20230828192507.117334-3-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For easier maintenance order the included headers in qcom_scm.c
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom_scm.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index fde33acd46b7..980fcfa20b9f 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -2,24 +2,25 @@
 /* Copyright (c) 2010,2015,2019 The Linux Foundation. All rights reserved.
  * Copyright (C) 2015 Linaro Ltd.
  */
-#include <linux/platform_device.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
+
+#include <linux/arm-smccc.h>
+#include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/cpumask.h>
-#include <linux/export.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/init.h>
 #include <linux/interconnect.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/types.h>
-#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-#include <linux/clk.h>
+#include <linux/platform_device.h>
 #include <linux/reset-controller.h>
-#include <linux/arm-smccc.h>
+#include <linux/types.h>
 
 #include "qcom_scm.h"
 
-- 
2.39.2

