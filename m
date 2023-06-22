Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43526739BE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 11:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjFVJGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 05:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjFVJEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 05:04:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B3649F5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 01:58:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f85966b0f2so8662625e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 01:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687424256; x=1690016256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCMJi504sYQMFBv//OUTfJxsgInj/cqDnJl9orEaN+Q=;
        b=O0lzkiQ9R0BFYak2RQ0b+iOMWiSLngEqcm+O/+EXGvxIaf75ex9pPFscUMdo10LsmJ
         h6NEVqOQRxtu8i0uwfFdgweFSk2iAGvxT/efb+LtnxeTMVqtFb5g3I27PKFu6bN6i0Jc
         lAe7vDsq3j1LtMRA1EeTsi4mhIXfINxeWHTEgQcw98qGF3d4r3622kWv69HYC/odN9ty
         we0ACpAbKJd995cZDgHbDcly7Fy/zFIi0JJ16DUk2fScpvhjw0e2EUAsjVtm4LAypC0a
         2yMnFMRBZoHk65MmoWDody5moxxUOk55+9U0aHTK/6Q8XAkcpZmffXeamR64YRuFC+W/
         HOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687424256; x=1690016256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCMJi504sYQMFBv//OUTfJxsgInj/cqDnJl9orEaN+Q=;
        b=Iq/2u6DgCBT+LiXVOHNjmpM1XDVkUdAFhQssQGbbrEyRol/d4Rqt87wcqG772suFNj
         WOayPtvKj/BF/F6oX45NrUZds3G96HkcfMLuet7qhZrzpmGWAGjhCBut4xBdNkoYZH2g
         ZzmRX66DaoVuIn0CRJLodHpzpck97qxMvSzJVl7TXQdH+jDxtH8gwq301ITC1vlpJJL+
         ZMUczKUcepZYnyqV1b2PA6tqAyx00hD3WBrCpFFkUvfC17F1qCIEcNKrdapB/9nELChD
         j7+qe2JxGddHyf6J+o37f6YOt2Kk4iNs42XOpcG8vwXbcJZu9zAAs8w6EZp0m7+jXh7G
         kcpg==
X-Gm-Message-State: AC+VfDy6FE0rCrPKegN3NGxNKM6XG4EWkJcnfNr27+INLwl7FLNxmL60
        eUb49xML8KULjMD0OxunQJvvbfReuHpUzIsAFcaiCQ==
X-Google-Smtp-Source: ACHHUZ431NWT2AJd8UZc6AX8L3I4h849BqwnafTutmcLWyeTaklY2DgP7L9fb+RH0fbVaGXaK+SonA==
X-Received: by 2002:a05:6512:3284:b0:4f8:692a:6492 with SMTP id p4-20020a056512328400b004f8692a6492mr8587747lfe.32.1687424255831;
        Thu, 22 Jun 2023 01:57:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c20ca00b003f9b29ba838sm7136305wmm.35.2023.06.22.01.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 01:57:35 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 22 Jun 2023 10:57:19 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: sm8[45]50-qrd: add chassis-type
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-sm8x50-upstream-chassis-type-v1-2-13f676eb71f3@linaro.org>
References: <20230622-topic-sm8x50-upstream-chassis-type-v1-0-13f676eb71f3@linaro.org>
In-Reply-To: <20230622-topic-sm8x50-upstream-chassis-type-v1-0-13f676eb71f3@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zUblXQ2/uGMx7njimb/Z6ZmxPvKmO/KtMl+gxZksctU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBklAz7+g2Fm+/mQ5gDaF3Sk9ty7UAWuFmWYx1DdFvt
 hv7OxPyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJQM+wAKCRB33NvayMhJ0Y7QD/
 40SK19cUlaotxxl2qrt0/jMlZKCPWPJdtnuUh7kr5wRncqUHcwBsumVW54ez0O6YtulxoBd51QTK20
 Y8N1xng3ai/8x6O0COB1ZuZAieeAzbU1fl84jxlWCocGcFl/J12MqTdy4INy/ieJKhAgB17H5wfIAX
 gR5niLmeDgwiwI7PGBSCcJz9x+eTV/c5ylzLZuM10JsWa8E1e/jT2bVYaLnAHX1tWG3//zuOe8ciZ5
 1swa5CPJAgqn6kyLiCWoX+T6TNeMMvJornQjCOTLnGjuarw4Ir0ao2GcU0dH0YsXgExz9uwxlo1Eq1
 5T1E0Rez1YN/qJRneaT6NVNlCiQN/Q45vdAj2GCbL7VA5//vVV91NaMe10BqQhzO1g/SAqnOl3wxAQ
 L9bIU7gu5D+mWOM8S7pmk0ZLMSFMnb4fVCjVdPKcghwMWNXUIjFqVqRwKf2Q4FSB/6nkg+6as0f134
 mXhE3l2GNfRG+uYHLQEUNsNo+f497o/ds+GXQJyd16v/DsK7DlYiC+gy39dxyxSESjZ1b/LiyxjCUd
 fIUg7OhvdLNES+zHiS9caGZamdvhZpblwLufdx1SnWFtwnwulzQTddTsv4L8Kse29gwN2K1UeAo/Z7
 qiXkvFCJCdUilm97zdI0dDdJ1yEXDwTLukRTkJAGQfpjyNnGQlBnvekx0yCw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm's Reference Devices are handsets, set the chassis-type
property to 'handset'.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 1 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 65a94dfaf5ae..37479327707f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -18,6 +18,7 @@
 / {
 	model = "Qualcomm Technologies, Inc. SM8450 QRD";
 	compatible = "qcom,sm8450-qrd", "qcom,sm8450";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &uart7;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index ec4feee6837d..3bf4121e36ce 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -19,6 +19,7 @@
 / {
 	model = "Qualcomm Technologies, Inc. SM8550 QRD";
 	compatible = "qcom,sm8550-qrd", "qcom,sm8550";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &uart7;

-- 
2.34.1

