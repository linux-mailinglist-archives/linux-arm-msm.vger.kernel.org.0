Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF297434D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 08:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbjF3GN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 02:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjF3GN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 02:13:26 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7059A3582
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:22 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b69f216c73so22813651fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105601; x=1690697601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lqfZ+plqtAcix8GY+ZuE4+nINgGrfEm+RrVhC4lKko=;
        b=SoZn3WtvnS+867WoJgWXuSliWnc95PxMCp/4pFghyt+p9DftmJ/LA4oUty0dmTp/qm
         wVf3KEONHI2mHrOLB/mXyUoPgtcX62/6up4adctb0lQN9fmSCBN7+2CLHeI3dUetQtV9
         srFX8zC3rHKERqMEcGMPRSGERQaN2cUDUWhD59QnUqmVTzR83lNkkwhZQToVWJpOlnjm
         aUEJCKaG96ZjN/x8GnEl4NUI5sVwUHAo3sOGBtR77G7zo9DH0ZaKjFV4dK5hFIZVcPd1
         9qO3U9ynYeCOIjqdcF9TQcsyJGdq40mfsUBajyNJryqlibY5BUBsklO39Q0CPMqxox90
         EpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105601; x=1690697601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lqfZ+plqtAcix8GY+ZuE4+nINgGrfEm+RrVhC4lKko=;
        b=hiAh/LO3gIORoQVYI0iWfitC7/+kZFIsl0FfICvAuo5kWKHIE3/mLL5Ui75mWNKd6T
         SNzOdqiG5BSkW3XRbdkcThRgNtPJ6rucF5yZnBYnVDoHmg7jcNZ5/z8TpxM9f0hrtOcB
         V1ZXQwAKAEpdsZg9Tfn+sJ/WUtUJuWW59mMSnfDFa+ZcRzHTPa4hIMJeNuea5ebLKNH2
         QCgQuM4PjEurY+8P9RJHfvMCZYNu6ZFjt74zrjYNAKZpwhawkbmwe4U5c0XGGCQaBD6o
         BV1oUDEU+cMcOyBYVGY2ftCN+cUe1WvDSCtmeB9t6O2y438lq3cO9iHicVSJyXjEMP92
         34hQ==
X-Gm-Message-State: ABy/qLYqwvuBez2synNp9CoRZHiwz5qAaeXx3/5bW3D+DwVZTpUPIChc
        FB++8vQsGfpMQEuPPAKjANfweQ==
X-Google-Smtp-Source: APBJJlH3nTBL+3k2b4lqs0HYpum3I2Uxkg8RoZ7UVEGZUpPMuqADLsiGXaqv04cbD4ZK9SVYArf9iw==
X-Received: by 2002:a2e:8743:0:b0:2b4:74ec:3dc9 with SMTP id q3-20020a2e8743000000b002b474ec3dc9mr1438176ljj.14.1688105600691;
        Thu, 29 Jun 2023 23:13:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb0d6000000b002b6caeb4b41sm505582ljl.27.2023.06.29.23.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:13:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: sm8450-hdk: remove pmr735b PMIC inclusion
Date:   Fri, 30 Jun 2023 09:13:13 +0300
Message-Id: <20230630061315.4027453-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 8450-HDK doesn't use PMR735B PMIC. Drop its inclusion to remove the
warning during the HDK bootup.

Fixes: 30464456a1ea ("arm64: dts: qcom: sm8450-hdk: add pmic files")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index bc4c125d1832..dabb7e872f38 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -14,7 +14,6 @@
 #include "pm8450.dtsi"
 #include "pmk8350.dtsi"
 #include "pmr735a.dtsi"
-#include "pmr735b.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8450 HDK";
-- 
2.39.2

