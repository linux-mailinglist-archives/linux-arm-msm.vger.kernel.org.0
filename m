Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61FF17798C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 22:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbjHKUtN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 16:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236789AbjHKUsw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 16:48:52 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C7F3582
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:48:49 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so38204511fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691786928; x=1692391728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41db47u7JHTIc6RPU/e4KhJFc+aEEEb2g0bni/VxnHI=;
        b=iuG5EnRjn4wf/FfUMxoRIIVkx8u96UH7ijRuXf249vq+Ze5DqZsJFa/PEzAhWQQk7W
         RC7evFziFC268XMTZ7uQuq/n2JzVGItEN+ayK1mpW6V7qsDVApUyDUCerzdJc5hIEYQi
         jlmvwXhBBcBHuGwLPLxfd88PgCogCK3Nls7OBVnSyclmRW6odViSdZKluVA3tPCm7PX6
         zkx7sU8H1VxsiKgcLaNjoMIm0dlh6qLiMO+zn+eNdnllksTOALWCE5jlZ87EU19Wnlyw
         ObRvt3aG9NVxosZ8KyRvqiiD6Klog8NNd/DpLpB16e0dCmeVe6Ub+tcqx7/ZB9oXF2vZ
         DZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691786928; x=1692391728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41db47u7JHTIc6RPU/e4KhJFc+aEEEb2g0bni/VxnHI=;
        b=TrGyEKUVt4EWz188jO5Hy7X9Vk/VuReLvr1mfLJywFdoCzk977Oj9mQCEejbkcYiFn
         34vmaQ7qK6SQgavlb85+fNAVMp1Pezup29+zCVn3bPxZCCh1zWkdmqVpOEOAuu+doJ8H
         UEBkTNTlllj5rIhsqC3cG0lamIJppFNBIg2C/ol4pPLUQgovD93GNs9T89T3mqw2j/kX
         Vy0ibn9CatkqHewFx4ggcNsWG4EbW0y8qaQQMRvW76QBBRcrBbwBzWbeCUq0zvKgJTvv
         hEgRjf4TlotXNg0pjQvCqNmzwCmdFUnqrdmoT/8GlNohvxRCYbSyFYbYlmNTaNS6C9Br
         7Q0A==
X-Gm-Message-State: AOJu0YxLlUZQL9ZWfcpnaGaM3nbtCOMMfr9Dha2HcxaeRXH75lxRf/BJ
        dgXsYoyUKkUDsWVv3aPNm+/XSg==
X-Google-Smtp-Source: AGHT+IE3eXyaLZfdB0YyUF2jD4w4MqT4UPe9Xkuhm58JAx7vw8VapOpaxrRbW3TONye93gf77iTKjg==
X-Received: by 2002:a05:6512:1156:b0:4fb:89b3:3374 with SMTP id m22-20020a056512115600b004fb89b33374mr2325742lfg.54.1691786928108;
        Fri, 11 Aug 2023 13:48:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id w1-20020ac24421000000b004fe8d684172sm843603lfl.234.2023.08.11.13.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:48:47 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 22:48:39 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm6350: Hook up PDC as wakeup-parent
 of TLMM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-tlmm_wakeup-v1-6-5616a7da1fff@linaro.org>
References: <20230811-topic-tlmm_wakeup-v1-0-5616a7da1fff@linaro.org>
In-Reply-To: <20230811-topic-tlmm_wakeup-v1-0-5616a7da1fff@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691786918; l=745;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HKF79DZaKKdLAHbzWWQPNMbkJmaE2nmAXM+wQx1rJmc=;
 b=XvEvrh7n9Kd1E3uLl7yaB9gSQUaJbS+cbJsYbM4vKgoskHSbdLHC/AAapyTgdx2zQCfwt3NUS
 BmRPAZWOjZYAg1CHKeBkZbZePkDxJ5cwnK3VsbuvyADfhT+/uJsMhE6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some TLMM pins are wakeup-capable. Describe the relationship between
these two peripherals to enable this functionality.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8f66306d1de3..8fd6f4d03490 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2261,6 +2261,7 @@ tlmm: pinctrl@f100000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 157>;
+			wakeup-parent = <&pdc>;
 
 			cci0_default: cci0-default-state {
 				pins = "gpio39", "gpio40";

-- 
2.41.0

