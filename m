Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18EF76C7907
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 08:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjCXHif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 03:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbjCXHia (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 03:38:30 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2792535BF
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:38:21 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eh3so4255713edb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679643499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAprqgd89DQDWghmK8wzlkk4PWPeS5Tsb0KbPljBSvQ=;
        b=LTDQy9N3mmNu1hltRqTgxtWO2OtLHLin+xAaKZBlE8SuMzn+aot1KEDkW9XjWoHzvx
         9c4R78DLsUNTN66fSCu7Yj8SnMwBurjTOH4LOjibBzO4vzpadRk2htixYLRoqBmm6BUp
         +K8Mm0QCjeEV9yB9/HjdwOypaeILsvjuQzt8kLxI/ODHlG0kA26ubuDe7R43H0MVY2xj
         qs/RvRdHU2FKh7QMycO+NY+9nQo4RjqRk2ECr4cTpS3d4f+R9fUT7FSiO/IpiPMX9G/2
         x2uw9dKl0xzeDKrR+dwDVQ4XfxR0tTIl02+m5Wq07Taf6ao+hMAS1JrWfDtLFvEul/LM
         mGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAprqgd89DQDWghmK8wzlkk4PWPeS5Tsb0KbPljBSvQ=;
        b=D1lXkQQue+ThefAdujkDC+yD0avrCnYbkxv7sO77FQKCOrRVZLy60v3i+6J1UqM6bO
         RNon0md3QDh77/vGQFflJOEqMhgBryEqdYw/ERcRQiO8Y4VohsDoLo+NuDRHkJfvGzQd
         qukXkaLjgmRKTOluJgyyNMiGKY3Q8e1IRvgoy39ldE5b0ygBkNJrMclcz79ldoV3UFkc
         qvKuwcqFnd0ApUnZ/M7fFykHgZoEmzClfyC16iv8LrLnzucKPBVrZriCzUQ8Yqo1XRji
         zmXiOPIEstAR7ZippPmlUhMsD24pihcMSfw2bRABunf+X4a7iBOyKg5mdKosxZ2Wjg3Q
         SuKA==
X-Gm-Message-State: AAQBX9dDb/EsaFZT5HldamTRNV15BlTnQqFeUZ9Bv87GhXKIuTNO859O
        hnNpcYOULk573zfc8lCo+hwddA==
X-Google-Smtp-Source: AKy350bSR4Jed2aPQf81Z3u7aHv98nYX0B4O/Wa5eo2AwrKQfXqdOFHd4zKOTiE+1w3kXiiZyyrItA==
X-Received: by 2002:a17:907:7fa6:b0:931:99b5:6791 with SMTP id qk38-20020a1709077fa600b0093199b56791mr2015985ejc.72.1679643499768;
        Fri, 24 Mar 2023 00:38:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id rh26-20020a17090720fa00b00930ba362216sm9970429ejb.176.2023.03.24.00.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:38:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 5/6] arm64: dts: qcom: sm8350: drop incorrect domain idle states properties
Date:   Fri, 24 Mar 2023 08:38:12 +0100
Message-Id: <20230324073813.22158-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324073813.22158-1-krzysztof.kozlowski@linaro.org>
References: <20230324073813.22158-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Domain idle states do not use 'idle-state-name' and 'local-timer-stop':

  sm8350-mtp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes: 'pinctrl-[0-9]+'

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/all/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 2431b77e38d8..05a4c33eaed9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -248,12 +248,10 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-power-collapse";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;
 				min-residency-us = <9987>;
-				local-timer-stop;
 			};
 		};
 	};
-- 
2.34.1

