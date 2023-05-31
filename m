Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9AA47172FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbjEaBQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233969AbjEaBQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C406911D
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:36 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f5021faa16so3330405e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495795; x=1688087795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qcBH6bGVmZGIJBDLEVfU6rhkGcQMhUDNw/1p6tNesM=;
        b=n89DjNlA/pI0RjVSF8J1AW8jCKFkWcNM2CZYtpi493nQ/Uo59XLz3qXT+/e2oaxKcq
         DOeykrSTMCtUUkbcQFc7nosUNzk5YhaVs42Ol1hU4+pO3J1Yeni6yulwic+I0Ykc7k1g
         1EFUcg62IVe9qdi81l9ylusqlTCkHU54saMiEv5eeo/Ltc8FOyi6Ns8cfGhH5EBiif1C
         eyir5bV8iKDR6Kae3451W8TaltiQDuWbwUMcps1NVrpIippgv5We9eVkc8HbP8HvRyoz
         bArDhNFq6UiiBLgiZ0jM1NQ83Q7b9LakaDGKhbIiYPd18hVrN0oCXMbjixbzNy094EfJ
         asog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495795; x=1688087795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qcBH6bGVmZGIJBDLEVfU6rhkGcQMhUDNw/1p6tNesM=;
        b=A6Pk1ka2DypKLWigT0RcDpBpVggfl2/mlRgUimBrgo7w0SgFWea20GAiwkvLHSZVqf
         nMIWQiP9wVR2chl67lZf93gDkT0k/TSpzQFfm7zav/u2W6/iTZT2Vv7bMw9TmEPc7+hA
         DuRIA2SVs1v2E164VCcctXAZEi3RGuCjYB5fiKp0EPFs0qy+7RVt1cD6iWpvBSbDrq3W
         68jwOgvmgXLz8WN7u8B1eOVccD+bNtFegWtnsrs/tv52+jJBl8rrQkYJumF2Asgsy9s6
         Fx1LzcMsi3CLD3lFtoEXX/0f+VTLsbKK88tQGPXlv6d21xBJo2a/5wq73oYSDyX0fbA0
         Pvjw==
X-Gm-Message-State: AC+VfDxynd/9NgU9wcgLWQmJ/FGsmojUn9HFjOiJqyiQsFM6jMEofeDa
        f2z2mfAHB9vmVJbp0tAnr2LX4g==
X-Google-Smtp-Source: ACHHUZ6HWgROSLBtmgVz6gcXBarSRzfUW6NbdmEtaRtb+My6G6ct6lH80/9Hdn5bCUOZwnIdCP9vYA==
X-Received: by 2002:ac2:5237:0:b0:4f3:982a:8be1 with SMTP id i23-20020ac25237000000b004f3982a8be1mr1576327lfl.69.1685495795077;
        Tue, 30 May 2023 18:16:35 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 08/14] arm64: dts: qcom: sc7280: rename labels for DSI nodes
Date:   Wed, 31 May 2023 04:16:17 +0300
Message-Id: <20230531011623.3808538-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently in board files MDSS and DSI nodes stay apart, because labels
for DSI nodes do not have the mdss_ prefix. It was found that grouping
all display-related notes is more useful.

To keep all display-related nodes close in the board files, change DSI
node labels from dsi_* to mdss_dsi_*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 1aa3c6bf81f0..2f5e73da8b6d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3888,7 +3888,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						dpu_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
 
@@ -3973,14 +3973,14 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi0_in: endpoint {
+						mdss_dsi0_in: endpoint {
 							remote-endpoint = <&dpu_intf1_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi0_out: endpoint {
+						mdss_dsi0_out: endpoint {
 						};
 					};
 				};
-- 
2.39.2

