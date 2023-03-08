Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E50B6AFC50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 02:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjCHB1j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 20:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjCHB1f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 20:27:35 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABAFAE129
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 17:27:24 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id d36so16327942lfv.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 17:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678238842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQZ5iCWhMANigGWxJk0t0CkO0rMOybOWwPdUXj361aw=;
        b=tqJIuKHGTihhSx+GPAtwP7T6r85r3uDYu/ibd8Oei95EgXY8IaLu992afJ5IV20TOd
         ghU8IKcp8uDhpF8hYn/Wvw5ojy0j6WcAAm+p6FgJLP6nC1/GPs0LWos+VbmjL49QtGjd
         qtdXB62m3PbiFjkIfeR0MI7DGZpA7RYTNJbAWohL5LO28vgnfBdTu2mi5FiOIRYkI7jw
         aKyC4uXpNBipnbl0QfbQFx2hz/8sVR17xXX56JwAZMfjMFWZmWzXu7elK5rogsCVm/vC
         05FPodvBKmI3SLNlr5nbBmJzW6gdWVeFZdmEnbxIhEnZzoduH7TYz/mSNLWoc6sKqOUr
         ep+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678238842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQZ5iCWhMANigGWxJk0t0CkO0rMOybOWwPdUXj361aw=;
        b=dFIbaNilgdEHKvnWrgIkztbCVCHDkw5zv+S4ROgQzJxb0ZA4pXMuPQ7pP3Qa6okUUB
         uIFvmkVdbbiY1Lqi57esTp9bn78+2QBrWpF3Y642l+9Kkl5crogtnJGPww30mjYZ1V9b
         jxa+14+1M2K8ZQhk4gWevN4kI+Fr6YyDyW3UEpCupZqz+1vpQhTwAGyj7c2QbAiC12J/
         QtFE6XUO0XSUp59FpT0xmKSIjD90NpEuPKUZClasNQPCYBejF5bFlQA2S0sLeYobdOFs
         NeBFc/q4011w1BdWGJBdkR+1VJoKNXTJeeD9zP86IbmE6s39nsdmspzydgPXlKTMYW0T
         rt8A==
X-Gm-Message-State: AO0yUKUO2XB0AEcIxwNFIi4SJZ6LQmLZqYFmod8qT9l77/HeA9uV9U4Y
        TlzG2yNToo9Bbow0QLjyemkLHg==
X-Google-Smtp-Source: AK7set8fyH58CcHXnpatfnQHqZSxILa4+yMe/MOFC7dTiUUkZvSFgS4tCnjf+43LZ0FV0dD6URTqwA==
X-Received: by 2002:ac2:43d5:0:b0:4d8:62e5:4f64 with SMTP id u21-20020ac243d5000000b004d862e54f64mr4128523lfl.17.1678238842495;
        Tue, 07 Mar 2023 17:27:22 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o24-20020a056512051800b004a2c447598fsm2182944lfb.159.2023.03.07.17.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 17:27:21 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 02:27:01 +0100
Subject: [PATCH 4/8] arm64: dts: qcom: sc7180: Add SoC-specific compatible
 to cpufreq_hw
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-topic-cpufreq_bindings-v1-4-3368473ec52d@linaro.org>
References: <20230308-topic-cpufreq_bindings-v1-0-3368473ec52d@linaro.org>
In-Reply-To: <20230308-topic-cpufreq_bindings-v1-0-3368473ec52d@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678238834; l=782;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YW+5zz9FRRsSPi3ZTqMkVGcpHSZDAlwtppM/bq/g7d8=;
 b=I87N1dHMwKE70RsHxF+Q8liR+yt+LGbb07yGQ4MYR+0sLZUiP/aQwpQOORAdvsaJ9ZvZnkYvIq+3
 DvJ5Pt/rAtejFXwPvuDTXmRjiVunwIkcQej6JU5uFjoTiPISGhp4
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

Add a SoC-specific compatbile to cpufreq_hw for compliancy with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ebfa21e9ed8a..a80bdd0604e4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3570,7 +3570,7 @@ osm_l3: interconnect@18321000 {
 		};
 
 		cpufreq_hw: cpufreq@18323000 {
-			compatible = "qcom,cpufreq-hw";
+			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
 			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
 			reg-names = "freq-domain0", "freq-domain1";
 

-- 
2.39.2

