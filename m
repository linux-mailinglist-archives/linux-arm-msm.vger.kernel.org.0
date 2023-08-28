Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF5378B852
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 21:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbjH1T2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 15:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbjH1T1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 15:27:34 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7F21B4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:17 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31c615eb6feso2938341f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693250835; x=1693855635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMIOWWSdqeSoUAfHcjIOH1OC+hMNlEb1paPS+tEaJKg=;
        b=BCjoeEUS/FckunA7BjsPbj5RT/CgPggSegR9WzbBOoQWtgPXY39sFmaEIE9kfJhJ7j
         2zROPjmvS+BGD9EvL5JgTngaatkJ3F77HlSYV6kxCn815OjUP+eP/AO73EyxCRErLTZw
         G3Mi/2pk0RCWlfDwldSJ/CEtiWSI5MZlNnrrmGibUrL8AyZYetCatMIdEPMu2i9Zpy/H
         mJ+EPJm4AnLYht0y9tLr/SC1ChgtsaM/N2lu2EoyS9TIZVR60RHwz9eUkjePNntEK65y
         D6u9+Rt/AbLg15sCE03YMu110ANPN+zdJMBJ8qCvHcKFHWlRZwifdZzCiYtOXka6Dbve
         BSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693250835; x=1693855635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMIOWWSdqeSoUAfHcjIOH1OC+hMNlEb1paPS+tEaJKg=;
        b=WGxs+VSIBO3x7s46hpV8nKaL31sS78UOWdobmrwEPjX7IfwuHMlCzcCxHanMjJ5BnR
         se+14c5qeJ18K1BnIYzzTs1kFtZCckC7XWtPlVS6ICxNMtBaWtyMkRLQH+M56CtJ98JL
         ITG/J/EDsSUkd3PB+ymEdySQbLuSRSHxcf0Hb48oINPfFmzUyZGwJxnbaM50sNAcujWi
         i4A18FwdHX2avEQ/r1eLmh/OGVS1jBNmOCeI5sv/2P/eFPPUb8O2yq9eG1HDrN4Jc1C/
         V5RGNJ44+t3aG4pXcELv63dwBbBNnyRyaOBk3NI/wV+eoiOcb9Z2NlhjHR5Sn2uKSt3D
         OH4Q==
X-Gm-Message-State: AOJu0YxFTaTQNh5B163n7VhthMkkI7L7iydSzu400xIWVtVjT/r4VKba
        crRpTuFS2jPMm5v+zIWUnohpXA==
X-Google-Smtp-Source: AGHT+IGwSg/n9slu02mhVXrK3uD2f2TSMnRa4Rgqq9mKJ/qMfRRSzAIiIAyq0Qe05qJxlrLQgd/K1Q==
X-Received: by 2002:a5d:414f:0:b0:314:17cc:31d0 with SMTP id c15-20020a5d414f000000b0031417cc31d0mr20153261wrq.34.1693250835788;
        Mon, 28 Aug 2023 12:27:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8bd:7f16:d368:115f])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003141f96ed36sm11435319wra.0.2023.08.28.12.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:27:15 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 11/11] arm64: dts: qcom: sm8150: enable SHM bridge
Date:   Mon, 28 Aug 2023 21:25:07 +0200
Message-Id: <20230828192507.117334-12-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable SHM bridge on sm8150 platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b46e55bb8bde..ffb0b9d82bea 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -607,6 +607,10 @@ scm: scm {
 			compatible = "qcom,scm-sm8150", "qcom,scm";
 			#reset-cells = <1>;
 		};
+
+		shm-bridge {
+			compatible = "qcom,shm-bridge-sm8150", "qcom,shm-bridge";
+		};
 	};
 
 	memory@80000000 {
-- 
2.39.2

