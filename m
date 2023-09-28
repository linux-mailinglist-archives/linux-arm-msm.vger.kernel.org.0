Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF097B18E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjI1LDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjI1LDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:19 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489A219D
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:17 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50325ce89e9so21195448e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898995; x=1696503795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS4tS46Wt2bF/A6aYMT37LuXJaPlC2jK1TxmIfbaIXc=;
        b=f9VsYRqA5faJFp1y2ixRuY2w9N57T1LSQ+RxByCoS/JMo2X0M0ian6zeTV1i0Ew1Bn
         3hSqva6PCqOMGTQbN+mEzM+7p7b6b4fMSRbqVIA78przqy/04IVNf9+8NENgo9KOmAZn
         wTWCjhUmsC4Hl4NkTiFytu3kNhJim8QwYDuxc+WQyFfzyshiqStUHwUscFB2cnwZWIuq
         w9qczIgQT/Z7tVBo7LtPYLuaOr9WkZyRnSjcAp6+AGu2n31jpEzHWIagPqX0fAjfpEdJ
         Wv4q0H+g/GC8zci/N+Qbbm/TOihiMYL3RCmi/kmGc2NKM+R1m/lDSj72Ms0cZ614gD0e
         0aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898995; x=1696503795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS4tS46Wt2bF/A6aYMT37LuXJaPlC2jK1TxmIfbaIXc=;
        b=Na+5Mo+JPRdJcc+jEAEh1t8IVCFfqpCQwfMAPzv/A8emPDVuQKTgMSdjkh0LPAnlQZ
         v6uVETwYnEeBWlt2Hg8rtWTDhjeA7eYeRz4cNkU4WgDartoCpUpD5KrcDsXg6tjjs74Y
         Juph2IDYQC7eQtO69jcMigysPS0+aiOHmAt1zxrOErhFeFWAGVSJoBR7LbM8BcayN3Wk
         hkpbT9QrDG02VOFDtyICaUDa0Ail+LzB+Ztuw98+SC34zjxmVztfCbebU5vrDeCaBI0y
         YBY4AFdtcONxLVkUVtjZwReZY9LdtdCKJUiLm82qE+cmEtvQ7KuTmVyyf5tewOTbDNII
         D5DA==
X-Gm-Message-State: AOJu0Yyi56uBkBW7ugZ4ylr5I5bpjuOO0euEHl5bVR0znKtngIBMtzVw
        LGRzJ+IGVQYY1smQGoK07bbu4Q4ptliduKsW+jllZA==
X-Google-Smtp-Source: AGHT+IH52BIBoWvUpPsy3/9NefHt24vdlUw5jXWoGW06FfdvyIyYwGlM6RjVyy+CN34kAlw9ssgt/g==
X-Received: by 2002:a05:6512:2508:b0:502:a588:6609 with SMTP id be8-20020a056512250800b00502a5886609mr1279143lfb.3.1695898995639;
        Thu, 28 Sep 2023 04:03:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 06/36] ARM: dts: qcom: mdm9615-wp8548-mangoh-green: group include clauses
Date:   Thu, 28 Sep 2023 14:02:39 +0300
Message-Id: <20230928110309.1212221-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
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

Group file inclusion to follow contemporary practice.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
index b269fdca1460..e3b4b93c3d38 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
@@ -6,11 +6,11 @@
  * Author : Neil Armstrong <narmstrong@baylibre.com>
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 #include "qcom-mdm9615-wp8548.dtsi"
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "MangOH Green with WP8548 Module";
-- 
2.39.2

