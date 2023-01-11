Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1014666366
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjAKTRm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237663AbjAKTRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:17:05 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8200118E3E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:16:37 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f34so25005766lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oh3hYJeoCeFa1TcRgxGXltrl1Ege4H+8PD3ZWKm/His=;
        b=hrMKwn1pZMHcobnPCUK+JBDldS49J1N3PNPXTC9Cprxr/pPxxMr+PHtiJ5sLlwYE/4
         5sZ3wizj7aEtfEpjgph7RFr8hoe/MtCy7YV0hvzTmP6uhHLljxnjg/1JtDWh/Z1Xd+Yg
         2KHsfgSll4uKcLPcF3PB9uNGhNhqP008CkcEQwOEp6RZw+a+0g7hHlCQrfrx6vEc1zrT
         TPwY6w/A7SxvbgSnmA/MOWXa+XKz2ye27BoAX3wLG8wcWoOEnakoZDWSLDl0x3hLqhso
         jpl3XnmXxkBlz8jVDYQxYg1gROi03XeQ9ll1YbWk8N9M9uxo8HODijPCoewdrpdD9bZv
         npbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh3hYJeoCeFa1TcRgxGXltrl1Ege4H+8PD3ZWKm/His=;
        b=tHa2Ly1qX7n+bvD/5ZAPYL8Byg3+IVUA6x6BORp8grgOJWTNLZlfXQtuyZ1XM3yDwL
         m/yW3Qg7RnVUIsOTub1b5odMfQu71xy2OnoKt/S8z2moWu7INB+0TNU9pmWpSTgcpSrh
         vuH63CPMOLj+f8U57Sw+3t0N5dyzJj36URR5PXMIq2KfG+rub5FjDXxG8PLiZEDcnMF/
         ZK912XLTa+oIDonW6UbExX6TG+so40JZFMqU+SD3CSxVxMTjKhxEMItunvkk4Cs+2L9M
         J9fazgC4+h491pUtSHRxoUtj1cWxGIchBLOjOx6qBguxDxO8FIZ+hrKWm7Fhv5y332OK
         OzSQ==
X-Gm-Message-State: AFqh2koo1jDTRx+JOXNGUlpb0sySzaBE/Buq6coNOsyJP7yUzmZB+rLK
        ro5fZHiajUvwQOsxhPlZy/va/w==
X-Google-Smtp-Source: AMrXdXvvAUpUFyXv5YtBNvsyhHQFGGH5goVp//W4VRpUWa0oTOGVvwwoUR07Fflkz5FJhyBVrO4ekg==
X-Received: by 2002:a05:6512:2586:b0:4b5:9e70:ca6e with SMTP id bf6-20020a056512258600b004b59e70ca6emr2843681lfb.17.1673464595860;
        Wed, 11 Jan 2023 11:16:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y19-20020ac24473000000b004946b549a19sm2866414lfl.45.2023.01.11.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:16:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996: mark apcs as clock provider
Date:   Wed, 11 Jan 2023 22:16:34 +0300
Message-Id: <20230111191634.2509616-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as we added the APCS clock controller support, mark apcs device as
clock provider by adding #clock-cells property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index d31464204f69..d52023c19682 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3485,6 +3485,7 @@ apcs_glb: mailbox@9820000 {
 			reg = <0x09820000 0x1000>;
 
 			#mbox-cells = <1>;
+			#clock-cells = <0>;
 		};
 
 		timer@9840000 {
-- 
2.30.2

