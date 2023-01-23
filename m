Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1EFD677BFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjAWM5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbjAWM47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:56:59 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCD22102
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:56:57 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id b7so10727142wrt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3elGWepOp7YI0v/zw+3mJj9hmZZ2pYdPkfHMgJtqffA=;
        b=bysXpJnGuUJUyaSsY3er/ZRdAw085wCQ9uLdOxf+70JbZj6ASXkoTFZhLL3GANfYve
         gSTMQh0S52OM/MInH/lWxu2+BPHHlVejREvPdujhZQ3ilSjBZvWM8GmRZ+QMS/ZnjEZF
         5rzoyyEtdTVUCyNK8IYV7u4pCZoAK8ujVZUj7YjpSQVZxbBkvfYQu+DlqPs2dhro8Sdz
         8Q5a0JF7jpHhQVQ0uVZEnFp6rEhvn6845QiDT7NkL+OKA6qEFioJ/FBjtrFCQrBZ/G2h
         8N6rOwZjoL2m1kBV4VWt4lkQouAycwYmulTYxY92uCFaBInMR9AKXk69ITyvOQ3pYy2D
         IyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3elGWepOp7YI0v/zw+3mJj9hmZZ2pYdPkfHMgJtqffA=;
        b=OtdHjPkknAt8H8o79ATz1aFC/DklVbRAhIXVv/tpSnmTYFEG+ETfAs96Frq0aD+fzD
         NnCzzHZd+LEtswURC9Zt75ErIrE32RrD9k8Mf7wuEAor2Zw95U0TqrxMDX5KgAWmQB2w
         ZGUxF7SOP3Orhr0EG6vruOwldtIgGt2BnXRL4qtyVdBmsIjf9lTe22W5EH9GJvUlOaZ7
         /r5PsfY0qyNAOqx02gnSNanAn78XeK9DcuH0/hiqUxtMQThp3s0MF722r0oitmJ9L+Rb
         ZlivJhEiB+S7f06MLgEsSRcSwAmR7KVNtuGh7bblrAU5WoNvwX4Hstca8dPRw2OZSwtV
         E/Cw==
X-Gm-Message-State: AFqh2kph/t4wurelu843CD6D1jKjFwvhl4yw8JlhkVehXPQVBYf74YK3
        mBQbq8fJxk7uDldeQbhKBiOywQ==
X-Google-Smtp-Source: AMrXdXvDMtYVPa84sT4t2rd541S9r/fyQRClbhac0cFyYqoq9t4W/68ADfj/BuW7YGgS8/FW4LZ9vA==
X-Received: by 2002:a5d:48c7:0:b0:2bb:ed0c:a0d8 with SMTP id p7-20020a5d48c7000000b002bbed0ca0d8mr19900955wrs.53.1674478617109;
        Mon, 23 Jan 2023 04:56:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000100a00b00297dcfdc90fsm4569616wrx.24.2023.01.23.04.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:56:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8450: drop incorrect cells from serial
Date:   Mon, 23 Jan 2023 13:56:11 +0100
Message-Id: <20230123125612.154840-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
References: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The serial/UART device node does not have children with unit addresses,
so adderss/size cells are not correct.

Fixes: f5837418479a ("arm64: dts: qcom: sm8450: add uart20 node")
Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d66dcd8fe61f..395a3a156e24 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1017,8 +1017,6 @@ uart20: serial@894000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart20_default>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -1411,8 +1409,6 @@ uart7: serial@99c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
-- 
2.34.1

