Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1E474851B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 15:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbjGENgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 09:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjGENgf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 09:36:35 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B174171A
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 06:36:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so110494361fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 06:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688564192; x=1691156192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8RY0oLrcN1ziCn11wNT5C3sfW5R+ySCTN0M0/9f5vY=;
        b=Jp3mxKwYNkkoUnXXhfNDZ+p+0OtWAFBF8gqXp/TXxIGXxj1hRUkkn2R81H8QfhQBJ1
         dp8bzRj8qcnwv4aW7V18GXYJZqzzHINZEJXEvleslxa3ij7SYlcsluM/Ecajieg03T1t
         aBaTnlUm4a/S+AovBnTJ3UFAs2bhmNwm5gWjv8fQ62quSMWiKVKhcNc3unWChizwi/Rf
         9prmkbnYSvsCRGbLV+u4B8vw8ny/Rf7ni+/I4VbdbmQrH2Inh9mspgM0LjWXZNXQX+UG
         Nrp7/StM1jQ3mF+G+kIeVNL9LoKHbCBk8PDVtlTIlUmHYS5Q8AMAtUAzdtdZA09Dr0hY
         7uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688564192; x=1691156192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8RY0oLrcN1ziCn11wNT5C3sfW5R+ySCTN0M0/9f5vY=;
        b=ku4dRbaPfifbRzR0oWowQxpH4Rk8yoKwmM9XMp/Tj1UNZ6mVt9rkx9wsJfCdlqKCkC
         yO/eZWzP2qHJ2aFtUvv+sGMHxZXMMtqz0S1XEpd0v1MmjNabAhXEYytcAOXkxdFPRHuk
         HZr0VURJuLZggguF9LGstEOK4SVmYszflNik8xHKnT9LTN6QtjcVsChzkPzHODR9y+9o
         GG7srgrmtm7za7zskgzQw3GtM9IZvr2cwLNPQsjUThmcEBQXN25Nqjb4SzKVvCpTpwk+
         r4Mdby3XM6fJto77kc3lwJfuJY6IzbRNR5GfAYNAbNoEYmtZEGdHeuaY8cVT15vJX+vz
         rvkw==
X-Gm-Message-State: ABy/qLb1BYV+In7eAQ1XwjmFnd/Bcox06ZtUFJE6LH4wJ9ghylAiDYM3
        Iritz5L1q8y09XZKBzl2dbGrmQ==
X-Google-Smtp-Source: APBJJlG0IhbigAuJFE9XFvxUCU7Mu+/qWzSzuus05MhOV2eoyccpqmLk4iiyvjDMquZUYRA5tHw7TA==
X-Received: by 2002:a2e:b003:0:b0:2b6:fa3f:9233 with SMTP id y3-20020a2eb003000000b002b6fa3f9233mr3089622ljk.46.1688564192720;
        Wed, 05 Jul 2023 06:36:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e7e10000000b002b700952298sm246803ljc.33.2023.07.05.06.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 06:36:32 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 05 Jul 2023 15:36:22 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sm8350: Fix CPU idle state residency
 times
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230705-topic-sm8350_fixes-v1-2-0f69f70ccb6a@linaro.org>
References: <20230705-topic-sm8350_fixes-v1-0-0f69f70ccb6a@linaro.org>
In-Reply-To: <20230705-topic-sm8350_fixes-v1-0-0f69f70ccb6a@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688564188; l=1330;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ooYmQL6SkQkkWldHfPPw/4CdhDWAvNOD09W/OjxDDVk=;
 b=HYmLCG3uLYSMmBCcd1xWjYslQpb362zInqSFP19FBUp5aJ0ODv7GRkC7SdlLIWgZG5tgi5tv1
 WV+oNEzjN4FD26urwK6lhu24m/lsmDhfcQz/PpR5uw8dWappp/J96/W
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The present values look to have been copypasted from 8150 or 8180.
Fix that.

Fixes: 07ddb302811e ("arm64: dts: qcom: sm8350: Add CPU topology and idle-states")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e1a09d4a83c4..4981a502d4ce 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -246,8 +246,8 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
-				entry-latency-us = <355>;
-				exit-latency-us = <909>;
+				entry-latency-us = <360>;
+				exit-latency-us = <531>;
 				min-residency-us = <3934>;
 				local-timer-stop;
 			};
@@ -256,8 +256,8 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
-				entry-latency-us = <241>;
-				exit-latency-us = <1461>;
+				entry-latency-us = <702>;
+				exit-latency-us = <1061>;
 				min-residency-us = <4488>;
 				local-timer-stop;
 			};

-- 
2.41.0

