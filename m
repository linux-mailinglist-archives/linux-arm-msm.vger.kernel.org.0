Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773FD6B5762
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 02:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjCKBV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 20:21:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjCKBVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 20:21:53 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B96130C26
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:50 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s20so8924105lfb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678497709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTDbm+7N4yVUzz4R2xYVQ50dgGLLZE+t+6gvmPYy5k4=;
        b=Tr8qgb94EXb5TL+2T16+xp+CRlIpT/QgD63bE+3a8rM4FKNPJZYwXIZzdnh5mwYjal
         iaO1QkWAStV6pkcutDQpBP5NKuVN33VucjMv6SPjhkhNRA1/Ur2xe63O0Bof5jKbWb9B
         T0/ryVIbMpWZlurk0j5JJIf3/uuy2FajrFAn5/1Bswf4InLEzcu8mhUcBI491BvY05ZT
         FgRx3y5NmlWlPI4QnFqptqBQkebe6ZOzMV1nV5/hE1fyJhoIiNYQu6FZARWkkt6+6wey
         DNvGVpBWsesUqAzDRvDvfPdbNbwuj6mwujlAwmz4tqqIBoDpqex3NrFRFZFNHm2bAR+N
         9hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678497709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTDbm+7N4yVUzz4R2xYVQ50dgGLLZE+t+6gvmPYy5k4=;
        b=j5xWjtG8XiZc8Za5pQQLtQwew2/VdCNW05CP7Mvi/k3sc5LcOvnjAfu+EW+N4DLvxY
         D6GJngtRThCDo0jsO8Oce164VrZCvHEXBDyQ0MJoTrUpKv5OzHrw03+kcOwMINjpEmQ2
         9evmdj2OAmbBrg4pyg/xbqq14Nol0YFkbkDB/OjDbTn9YVr0TlXHITn3lZ9/7Qdq4gBW
         F2VqmdVH5MXzgT0eqVePg2UG2X+b6P8ZaqzALoeg8eDPt0DD2YAYy3hc7HP9C5ofGZSW
         CSUkjaY8oU5KCTuC5JrqE+b/cuRU/2fhCQZC1FxwofB71A33YfA0JNLF0oE7AWmOn1wA
         pLPQ==
X-Gm-Message-State: AO0yUKWOLbIkkI1rMNKUnLRybP/VvW329CjAfdMkgZWhuojOW5IgsNTN
        YckY8ewTQr48otBcvzemqou75SOAeMldDyNX7uM=
X-Google-Smtp-Source: AK7set8sz6kQ88WdF+vyGuC0JXd/8RYATXVqrHYCyUwTvzSUW+HdqvAZ5vwHqOG/VHmhDCdMijnn+w==
X-Received: by 2002:ac2:4c99:0:b0:4df:8235:25a4 with SMTP id d25-20020ac24c99000000b004df823525a4mr8006551lfl.53.1678497708913;
        Fri, 10 Mar 2023 17:21:48 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id y26-20020ac2447a000000b004db25f2c103sm142318lfl.86.2023.03.10.17.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 17:21:48 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 11 Mar 2023 02:21:35 +0100
Subject: [PATCH RFC 05/15] arm64: dts: qcom: msm8994: Add simple-mfd to
 rpm_msg_ram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230311-topic-msg_ram-v1-5-e9c2094daf09@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678497700; l=702;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ln41TPzthNsYeGoHC0ifH/tSwzDMu2f/kVSclj8EaYc=;
 b=zzpaVUcaxh9/mI4D3qzbp167Uy+gg4fPL4KtypfjwqZFBRfegdnYmtKIPYqCrnxxyD7dUKgGYfco
 tXoxiUsbD0GKV8B5mXvxs6+EHFV2CyBo8DIyU07dpHX1b+GRrJK+
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
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 9ff9d35496d2..37f7c0b2fbdc 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -731,7 +731,7 @@ gcc: clock-controller@fc400000 {
 		};
 
 		rpm_msg_ram: sram@fc428000 {
-			compatible = "qcom,rpm-msg-ram";
+			compatible = "qcom,rpm-msg-ram", "simple-mfd";
 			reg = <0xfc428000 0x4000>;
 		};
 

-- 
2.39.2

