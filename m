Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22FE17899AA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 00:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjHZWTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 18:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjHZWTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 18:19:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFF31A5
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 15:19:21 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5007abb15e9so3141244e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 15:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693088359; x=1693693159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OtqmKWQOCsVeVVMPiWgKWfAaJASJVDjkKkH4pptEQ8=;
        b=Jcu3Y4qRQxebu8OdHAFIpb5dG/MQ+7EFHVf6o1F7CdKxvGug+5LOqF7xHKcvNbdlwk
         DuGEKTepeGihl3mUhgFrpbesocqjn6nlC3VhaRd3STU2Hhh55t2E+GAHyXLpB5QDqhGp
         HTpyFjxkcFSHr2qu7TUFPcyWQtMXT1sNIpCm0CDG3Oa8+x7OMG+hYIOlQi0KkKuM0K+l
         7ad0kEQYZxKLjecxeC2wSJrrhTAvwELlgITnBGcENWIf8mYY4OhknkAB3WK/ekTAer4X
         qR4cNZ5rPQRp1GFGgnBGl0jCvwg7knehsWOpS4lO7FL6I2txQ6ZqNIzHG75gTgZbqPfx
         IMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693088359; x=1693693159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OtqmKWQOCsVeVVMPiWgKWfAaJASJVDjkKkH4pptEQ8=;
        b=C5HSjonx6ybSIU1jsnB+NFQ/AzFBtSP0XwTkf7kNl0YRyIeKzA+lsPnpZGSNJxQG9z
         QaQ8UsN6WBdmW+y2/Fc8WyYwwvpY9cbjE3WeoQ8qrn/z5QYx2MDYx33BgqnPOV9FbahJ
         trp5iSpto9Z3uTLkzF8BZEdMm7TmP4F/7z+VvSoLxb9Y/pOTNNo/6rY2EQy4waxPP+Kk
         JlmvH5egRTq5SRUkKoSKQsUnFhsgcYU+A368YTxdwazS7e8pRhPWFZycVfOVZ3PrLlOI
         1zKTwtUFhWf7xmJAmgF0mC3xVk2Agbrgt01/IBZzKqvE0XGKGbR7Bhbyfz2v8VbRPbLj
         PpqQ==
X-Gm-Message-State: AOJu0YzMQhzm4uoA47kyrAhAyxLtahsvuIhhfd9wDXsUVkbftp7n4gDv
        0i15+x9MbCDNdqnp1zzUGlpM9A==
X-Google-Smtp-Source: AGHT+IH1INk89dWmeSFa8nDQgKfWGxkMznz+aI9MXe9NRiB119RYsVMOQzQf+e7s71BxNhU8SU+9iw==
X-Received: by 2002:a05:6512:a8f:b0:4ff:839b:534f with SMTP id m15-20020a0565120a8f00b004ff839b534fmr19207030lfu.33.1693088359107;
        Sat, 26 Aug 2023 15:19:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a19ae19000000b004fbad341442sm868672lfc.97.2023.08.26.15.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 15:19:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: qcom: sdm845-mtp: switch to mbn firmware
Date:   Sun, 27 Aug 2023 01:19:13 +0300
Message-Id: <20230826221915.846937-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
References: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
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

We have switched most of devices to use mbn (squashed) firmware files
instead of spit mdt+bNN. Even this DT uses modem.mbn and a630_zap.mbn.
Let's switch adsp and cdsp firmware files to use .mbn format too.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 56f5bf52d9bd..7579ba66c6d8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -114,7 +114,7 @@ trip-point {
 
 &adsp_pas {
 	status = "okay";
-	firmware-name = "qcom/sdm845/adsp.mdt";
+	firmware-name = "qcom/sdm845/adsp.mbn";
 };
 
 &apps_rsc {
@@ -415,7 +415,7 @@ vreg_s3c_0p6: smps3 {
 
 &cdsp_pas {
 	status = "okay";
-	firmware-name = "qcom/sdm845/cdsp.mdt";
+	firmware-name = "qcom/sdm845/cdsp.mbn";
 };
 
 &gcc {
-- 
2.39.2

