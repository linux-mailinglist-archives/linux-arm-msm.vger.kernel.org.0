Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59326537281
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 May 2022 22:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbiE2U0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 May 2022 16:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbiE2U0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 May 2022 16:26:45 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD8B3F883
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 May 2022 13:26:41 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id f23-20020a7bcc17000000b003972dda143eso7368102wmh.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 May 2022 13:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x1VSkjEDoSpkJmFZJsis1oTlMiXSxH1AlXy0e1tfDgU=;
        b=cyOupqai6zlxeCdpJnX9PfK2L7NgvJMXBc9oFaIUetO5M4DRoLmN4Ooar8+qCX0LLs
         rwQUKa+LFuSyPZyfF1dm24lbepxl28MwyYn+hPYPvyaGxVSRhAbhUA40e6qo3cslX5Wa
         2wtIcKapb2JWDktnJ+9Yk5JUvUAGok+s0ZKxUh9Sbm1EcDRts4d4ZsfCGf74D6FO6joO
         nHIYLh95XcZ3C6BbNdVhSD4zrCqhu9ikmaINsdBrdwAQ0Kf2VSgxCqPvyiKXAM2SmsR4
         pk/fQIRAqcPJDoz9JIUBkjC1t4avQZFJonc76ZgBZBH3P0Np93/nUt2hQmfPZFGHNAor
         9VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x1VSkjEDoSpkJmFZJsis1oTlMiXSxH1AlXy0e1tfDgU=;
        b=dHCbu1JO3Fk1W5zXSuwS8kZ71U0RxJnFu0bILFaUGy/3ZxrFgJQA6IZDCix7Xb0x0k
         BO04IXaXfV7eDp0XcvUy1bYhTFUwKzKCVu+aRVIUqeaSct40W0dXInRtNNP6xEXwRY61
         aixxdEjQyqQVVLdjRmTlQlbef/884xmiwbjFv3MP+dN7l4xE25m5DYiD2htqFQF1yd+t
         jzndxV92YaLx6dz2kX4JJtfHnx7UZ1JSPHBfjRUMGFCoHb3qIULAJ5qIDSSY3IRkhyd7
         as1vdq/eabVVHEAqo9BuJ3Gyd9HJTewqD+ynSBUUvlzLdf+T8RPJiivWQcckxBEXmAVi
         DM0A==
X-Gm-Message-State: AOAM532IFYIlefqm4DsmOYqduSv/ZLGjXI1eNwAYzyX3cFIbgP3AHYmJ
        dOuRbmMz+PsU1nk3ZS7AfBqSPg==
X-Google-Smtp-Source: ABdhPJzJ0v9KLMvk6yNUhrEn/RGwGPqc9mHEXz2Bkz2+Izl5Aa4aPYOUy1/X/fXFb9FNpSSXvooCaA==
X-Received: by 2002:a05:600c:3ba4:b0:397:49b8:262 with SMTP id n36-20020a05600c3ba400b0039749b80262mr16585365wms.77.1653855999975;
        Sun, 29 May 2022 13:26:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y4-20020a5d6144000000b0020c5253d8f7sm7099310wrt.67.2022.05.29.13.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 13:26:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sdm845-oneplus: split qcom,board-id into tuples
Date:   Sun, 29 May 2022 22:26:29 +0200
Message-Id: <20220529202629.47588-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529202629.47588-1-krzysztof.kozlowski@linaro.org>
References: <20220529202629.47588-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom,board-id is an uint32 matrix, so a list of tuples.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index bf2cf92e8976..8897a2f4cfe3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "oneplus,enchilada", "qcom,sdm845";
 	chassis-type = "handset";
 	qcom,msm-id = <0x141 0x20001>;
-	qcom,board-id = <8 0 17819 22>;
+	qcom,board-id = <8 0>, <17819 22>;
 
 	battery: battery {
 		compatible = "simple-battery";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 1b6b5bf368df..193cbd27b8b4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "oneplus,fajita", "qcom,sdm845";
 	chassis-type = "handset";
 	qcom,msm-id = <0x141 0x20001>;
-	qcom,board-id = <8 0 18801 41>;
+	qcom,board-id = <8 0>, <18801 41>;
 
 	battery: battery {
 		compatible = "simple-battery";
-- 
2.34.1

