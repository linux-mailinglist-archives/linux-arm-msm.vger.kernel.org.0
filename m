Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E37789073
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 23:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbjHYVgJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 17:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbjHYVf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 17:35:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EDF26A3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:35:55 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50091b91a83so2034465e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692999354; x=1693604154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26pn9YzS7LvfeqGbIW61UxU0+DuPD7DZQB8eW2hvtKM=;
        b=iRZHAwuYmQrr2Z9IY1xwMbg7LDWbfh57GpHGdctJ99CsrEOYfRXwatyk3ENJVb/SHr
         gQOWY6xTPMcGxLRtvhfzGNIbHipYLey+GtcXsyM0sTHKfqxUZvZUhG3KbYUH9nkbK1Tf
         SfjlMWtWMrbEpV7clPV2r8MeSIfHsler/9YgUjpofV+PNw3J1972VLYROFCQWIznjPpr
         1MEjccQ301aAehtFHdAhJwJEdRBNKE20cioxw/P9FqEm0t2F330ot2noOGsUwRXJFtsi
         0YNn8xm/KVAApZsO8T2SzYm8hzwNhb2L5g9EFABIKrkfpBoQQRShRnRq17p1XJSXU5XV
         sHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692999354; x=1693604154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26pn9YzS7LvfeqGbIW61UxU0+DuPD7DZQB8eW2hvtKM=;
        b=Ta7zuapJVm6N5WnDCTML/q87Iv/10YGPkAqZ/uO34Tc4Q5lZf0givNalptpvPqtPo7
         DOmV/uL1a8QeqIXT8ASpMzNOqc+daSolfz8FBOEgQKY7852jsqL4VL8pABEXHvUOGcig
         WoclGcCXeKzrJnH9GOFshqB1+BEVe2I1eCV1UCi8tR6ja0IapFMjlYvFH2xvRFWI5jdd
         o88HfkioyvKQzFSiWKby6ZIR4QdBQMnQV1N6fr/1hLrioWHC5mXWos3UKY1K94q+k/01
         6+RXgcefJklCVMHSUyC1Nm+1waXaydkFvOqlXvBRxZX9Pn3+EYMF5V/T4EcgyRCTc+aT
         4ppw==
X-Gm-Message-State: AOJu0YxhmbFY2futYdu6W2zbo+fovLL0Mw/nsJThXERP2FwR2VKmzAVd
        fXJnn9QmazKmZS2XHnQ/yiwAmA==
X-Google-Smtp-Source: AGHT+IHYYIxBsOIv5/RRxtju53Lr3ztpX2Sm8pNCjTOn2ZEVtwAf/RRNnNGa6RyqUvaP5vH7AmVOow==
X-Received: by 2002:a05:6512:200d:b0:4f1:4cdc:ec03 with SMTP id a13-20020a056512200d00b004f14cdcec03mr11823459lfb.18.1692999354319;
        Fri, 25 Aug 2023 14:35:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b11-20020ac25e8b000000b004fe47879d93sm429947lfq.106.2023.08.25.14.35.53
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
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150: extend the size of the PDC resource
Date:   Sat, 26 Aug 2023 00:35:52 +0300
Message-Id: <20230825213552.1646321-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825213552.1646321-1-dmitry.baryshkov@linaro.org>
References: <20230825213552.1646321-1-dmitry.baryshkov@linaro.org>
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

Follow the example of other platforms and extend the PDC resource region
to 0x30000, so that the PDC driver can read the PDC_VERSION register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 380712aee977..38c5d6dbd0d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3923,7 +3923,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x400>;
+			reg = <0 0x0b220000 0 0x30000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.39.2

