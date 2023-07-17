Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C12D7567A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 17:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjGQPUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 11:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbjGQPT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 11:19:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677431BD8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 08:19:33 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso7454287e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689607171; x=1692199171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZVz0HHbNacYcZ7SswA3bwyZfWy1YH5AMNjeXJBFPFg=;
        b=rNZgbBZpPSV/suV6tgIxgg4kwXvvWfXFhsYAXsuDsXPyn3ogYa6AhAMB3K/eb7b9m0
         kTlXUad7J2qcGe3C5yzvyjW8qyEJlPRWmHZQpZ7KdpM3bGqMkbFS8KfBSHYo9pGMv3Kz
         V3F+kyEZSClCsJYw06QomxibukGtsnZOUgJiBXHmbcM59vrI3TJrenZleJJAOvikgUiL
         TUASUEtBkdtCPDHxLhb+IzarEOgHsaTSrleD6nlrlFCzFftztEyK26g3Pl0l19DpeAtY
         dvEYD5Zi6rHZI2vcpNtuOW2puNkRGTXxXljnSoc7kwwDio5gAaPICN9qWfL2oAx278VE
         qqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607171; x=1692199171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZVz0HHbNacYcZ7SswA3bwyZfWy1YH5AMNjeXJBFPFg=;
        b=A8BrQcOz6HaRtuXEwigWwKz2+eiVRBepcnejn9cWIsJHI6ZULl4faJPE19UoR2Pu5l
         MPes/xkKf1C8TqPVT2GadkRrIP005FJZaQFLs1glVkrNQXQbncKyGivLMQwaoqzKV2X1
         NHeyrnere8MlTlh2IXjF+UqI3IhXspkWRM3Fh4acPAqtayUTqxkhpAbPacR/pQ6qG9NF
         c+llKZ+9eh3cbiQvWtJQyJMJHZa0vd+NuEZTgO8rku5M8ucn0IyPtGxJcGloNsqHQbhs
         2h1B9Rfq9o5nTIheWVRqjL/WR5owfwrd4RDhaYbE+J5Mr8+1hW/EpKatQRB1AfJ9I0XT
         2OvQ==
X-Gm-Message-State: ABy/qLbEndhWt9PHTbos7wUJawZ1Lo8uljosMsWeG3c0ZJWmhsobCl6g
        dEb6T0dnYGmvX1Ki9T5WDqOIbw==
X-Google-Smtp-Source: APBJJlE66n6oQEJ427y2dX9pgdTTKd00k6qtINgc9SZdc8nG9vgP5b0qivWIq4kYysk9vggbXLOGXg==
X-Received: by 2002:a05:6512:304e:b0:4fb:89e3:5ac4 with SMTP id b14-20020a056512304e00b004fb89e35ac4mr9148515lfb.66.1689607171063;
        Mon, 17 Jul 2023 08:19:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004f26d63f823sm2873949lfh.237.2023.07.17.08.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:19:30 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 17 Jul 2023 17:19:21 +0200
Subject: [PATCH 14/15] arm64: dts: qcom: sm6115: Add VDD_CX to GCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v1-14-27784d27a4f4@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689607149; l=758;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=teCmvh/mH8/+KIQ6w2EiUF+9FzEW2n4wijD09cbH2a4=;
 b=Z6lj84tCtOpwyb5JGxRB90l01ovLnN0ixjCPdiYSidGzkn9vehSp80TM9eBEPDZtKZiNTZMJx
 jHf11RCWkK0CDgzc5nJ9DXHOh81HZwyCwcG3HSLvDV8PIeemm2MGyUo
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 839c60351240..29b5b388cd94 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -784,6 +784,7 @@ gcc: clock-controller@1400000 {
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
 			clock-names = "bi_tcxo", "sleep_clk";
+			power-domains = <&rpmpd SM6115_VDDCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.41.0

