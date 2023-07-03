Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A71C746234
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 20:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjGCSUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 14:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjGCSUZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 14:20:25 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFA010C2
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 11:20:20 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b69a48368fso73443311fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 11:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688408419; x=1691000419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hijFl2QUFFsHhXY1yCqHSNQt/9fhgFqGawyucytFczE=;
        b=vt5mos3tXUkE80GqbGibWwnnDX1jnTo2f17aW7MX1H5Rs1ZV1Zn+Cqz5TynUOaSQvn
         b0ZEpblbGjJ+J9BLO/meW0b9tpTx9RKr58bQLDj0v41Lrq/CcSN2cdDFSViGYUYtHVlU
         xuFkahbIct3Rs9h/M9SAvs1ZjBTLOGV6jjFfg5VAy9rc+HB5y2jlegSvvLWNbYaqAY/1
         fjDYLjBW9UpG5zwMzNpDyGhtsncq9AKosnsFn6PgWAa+wwYIyVfEVBUQOF6m2NcQD7LQ
         dPiNfyypt30gqvFcN3oI6fjb7jlIJLYSwSbe7AI9vF8Cndn+vRI8zk9Y6rjcR4Z3IUNz
         twnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408419; x=1691000419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hijFl2QUFFsHhXY1yCqHSNQt/9fhgFqGawyucytFczE=;
        b=ORrTxS622s30ykyE6pWAJGbH1yTKisV4DqAIPLzCA5qLobnpUt3aU9U8zHm7fREGbB
         qa0qC3pTcw3Rl65b88/y/j8d+yiIxkaOXPcHcLRDA6M1OqQ4+5TbXVgKRcZM8LoZMUfN
         oiIF2YKuEAx9XpL1eFEalo/U9+0HuQR0fhs1E/GBH3QD6WiXk+zt38quGPpofrifbYgs
         ACas3h36/TyoPtHNHmKjpWDrQY7OTWIZYrVQdw7dVCG3DBB/jEMUnI+9TZcPYUZMMb7Q
         lYOUxkaCUbQE5lonOkEXxagZw7RrrXaYZ6aOSCpT4ZyTzPf8UsjKQVtRnJHgT9jlOVbL
         lAIA==
X-Gm-Message-State: ABy/qLbzFvzW8h6wXeK8pZXAL5MxVHBWpjd04CoOhJWhrkl3fI2PnOiY
        57pX+quS+z7u+5uMu9XYgEGn+w==
X-Google-Smtp-Source: APBJJlFJP/hbusGQig3D+lD25i28THHDwjxpVjaw1z/PoqUhvSQGYBYixB/ll81lAjb0k8+sw4NJag==
X-Received: by 2002:a2e:9c0e:0:b0:2b6:eceb:9bb with SMTP id s14-20020a2e9c0e000000b002b6eceb09bbmr1833215lji.45.1688408419279;
        Mon, 03 Jul 2023 11:20:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id s9-20020a2e9c09000000b002b6995f38a2sm4946224lji.100.2023.07.03.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:20:18 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 20:20:11 +0200
Subject: [PATCH v2 7/8] arm64: dts: qcom: msm8998: Use the correct GPLL0
 leg for GPUCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v2-7-6222fbc2916b@linaro.org>
References: <20230622-topic-8998clk-v2-0-6222fbc2916b@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v2-0-6222fbc2916b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408407; l=790;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bqBo821nh08iVKE/Ewr81Hlfh17hRb8F8VMbdnAAnZk=;
 b=hnGnT/+QKMk5tBC41mZER+wx0TcAZ1S/ACQphxhRJ8EjUoBZn/0nGbgZpC+Vep0idptLEkuee
 T72NIxEv2YWCewN2w6IEYolABdHrMyv95ZOmXJuno4SSraoDS63cVdq
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

GPUCC has its own GPLL0 leg, switch to it to allow shutting it down
when it's unused.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f0e943ff0046..74bd05579796 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1574,7 +1574,7 @@ gpucc: clock-controller@5065000 {
 			reg = <0x05065000 0x9000>;
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-				 <&gcc GPLL0_OUT_MAIN>;
+				 <&gcc GCC_GPU_GPLL0_CLK>;
 			clock-names = "xo",
 				      "gpll0";
 		};

-- 
2.41.0

