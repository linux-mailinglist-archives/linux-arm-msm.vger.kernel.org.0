Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2EB6B5763
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 02:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjCKBVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 20:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjCKBVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 20:21:47 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587D712EAE2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:46 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id i9so8936018lfc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678497704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqZApAuhZhivZLZrMG6fAoSB+Mw5Lnp/4/MWe1IXRBc=;
        b=GhRYNZQPRwHEWx9GY40BX6eW2Bdk8Rqgw4tT6CDLhzUxq7aF5IYpmeP84yAORiWh5l
         gsglOi6TABVSnNbfqp6tUz0+0pCAOhCPI/6m14xmYsiEwEj6bdRTrF36qcjCFMUcNtZE
         CoVUrYO7/0NrlZIhTQYN2+f6busDoSK3YJrBs6ryPnxI4M3Ku9JYPju7gFVwWNjvWaqh
         yzFc36/jDggob1aRFONnk+32lvqQpdTaHgj0d2lX6KCPSqkzY2BNuUt4I6m7nTcUMYt3
         WRUUao6XYWVjAYPR8ZAC5ikrKrl7AE35MWUUp4cEX+TEt/vh37i0zXtS7qabmVGpDYO1
         SdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678497704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqZApAuhZhivZLZrMG6fAoSB+Mw5Lnp/4/MWe1IXRBc=;
        b=nPLehOqDyTVH8Kf6s2q6dxmazoTDuYUmsz+d6H9ls+N94qp5EijtOQIUoQSI1tB1WN
         rFgQTNwP08xYFnlzkbaT4d1m4F7tw7DOQnhBDSKxsA/LyyzlJdiMgLRA4B5SX+zYMy6S
         FErSiKncXIQGj4SyOEt65J0ZnRMT2wo1ioiBE5eb5VEe/HyOCC1KxzY9wv7Mfin6e69T
         R+9hive2FHFfUSDLVMHf4hYwhLTCsyVh/oDKfN1PinbuzzlvyDajNuL0f+lwXh2PZ3zF
         MPaDsOn5rX3u9VkTxZoGT6XkIgijyQvXxcdy5OXJUBtuQCfptJFyQPofxy8li1WdLQ98
         LMOA==
X-Gm-Message-State: AO0yUKW8zG3HhUWo8RWOg8/A804vPjqlb+JoOEczVq37/6LOqiO86X4j
        a+F7Ei2OaoMldh1LUWcc15jVyg==
X-Google-Smtp-Source: AK7set8OXoqLrSs50WUcFF0XwfSpZCaSEeSNxW5hCwV88eeudSOOVV5XnWwOVBoy3c1z71vpSWYL1Q==
X-Received: by 2002:ac2:5edb:0:b0:4b5:9e70:ca6e with SMTP id d27-20020ac25edb000000b004b59e70ca6emr1388925lfq.17.1678497704546;
        Fri, 10 Mar 2023 17:21:44 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id y26-20020ac2447a000000b004db25f2c103sm142318lfl.86.2023.03.10.17.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 17:21:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 11 Mar 2023 02:21:32 +0100
Subject: [PATCH RFC 02/15] arm64: dts: qcom: msm8916: Add simple-mfd to
 rpm_msg_ram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230311-topic-msg_ram-v1-2-e9c2094daf09@linaro.org>
References: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
In-Reply-To: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678497700; l=688;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sbj7R4NIANVM9ZvCZPxtffdLnUBzs9kiZ+WoQgY7YsM=;
 b=7KR44Tl33Hmox1YtwXHhaTUmG7THGPKWON/vtlTY6m6GLOIbk40TZZmyLoL6bP1VGi55QZbCTKPb
 WqBwUOhIAx6tuLuvOE5a4JRbOQwwGpUUJsbKG7vGeaITNTjhmbN2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing compatible to make the node compliant with the bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0733c2f4f379..ce27709bd4a6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -510,7 +510,7 @@ tsens_mode: mode@ec {
 		};
 
 		rpm_msg_ram: sram@60000 {
-			compatible = "qcom,rpm-msg-ram";
+			compatible = "qcom,rpm-msg-ram", "simple-mfd";
 			reg = <0x00060000 0x8000>;
 		};
 

-- 
2.39.2

