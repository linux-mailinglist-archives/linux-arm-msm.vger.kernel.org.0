Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD9F6C790A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 08:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbjCXHil (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 03:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbjCXHid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 03:38:33 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1427646B6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:38:22 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h8so4315689ede.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679643500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZMi7sLdrM3/+emhhwm7I6CBclwb/X39tQ363y4/lo4=;
        b=gvnoPVBeZOw7DEqPIZWPn+jVjwnuhu9c/4a9j4OsWMJktoqJhXfVE0Q91UlER8vlPp
         bCVlX5inqzm+dWl33+CaeRkQt7iU7Kj4KVl3iaZVJsXTJ7Rq0LIAy5lxVAo6mkPxXxQd
         A5TePjzwtILzPvlRPkxjdxee5r7Q9vrGjhby5hT41c39kztOlGq8dJWDhmZi0kCXgjMp
         GA+1Awi5AEcrLk8Mx13bDQHmEouubi6tZjrIGHoS4lXJfxMPcWM7JgFUCj1vk4BMpYue
         JnewLsA89XiHNMu/HDTW75hf9L2JyiVb5cDefsgD/KomLzfsoYEA77uOqLZwiTFc2V4V
         OPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZMi7sLdrM3/+emhhwm7I6CBclwb/X39tQ363y4/lo4=;
        b=mINwTja81m3vkOV2Ax0kppWAMdgpb60DT/zOqDfCdCFPvqp+AI3Q0jQTcH8AXg6buv
         LdMzl2ekXQaAufMC7SrPtd2BUH8m5Tcesa6GgFIRwEBvYima26zjPjES+1jCMZZ7Wg0+
         LB1ThY4SYIkaUjFnKA8l3H7bISsethrqm94R1T5yXkYJvveMmdXEYddS9ydgfmn42EtK
         YH4sTqVbUMWedijJ/vZ4lDBLsCvNoa7TQrG4vqkDA7I2q3nIVOO63l+YbEwW5pbe/Pit
         h02chDgrmQz+qAJv2yutAqPQCJroGXXI5kfBUzJWwBPLT7VUx1BRdgWcWouP2ZuBe/op
         yfxQ==
X-Gm-Message-State: AAQBX9eGw8903ySIbGeD74q+rt767Ih+A22Y9f8D2jO6DfBkKQLNDlXP
        DnywjAQKxd4RGsnrmTulOtfdU20aMeKZxmEhc8M=
X-Google-Smtp-Source: AKy350bbRZyHEiuhazOXLX+kXjCrxVkzcm90HtTPEZQ4KX0VDn4TlNMk5TzJuO3ijn+jCQujDcuLoA==
X-Received: by 2002:a17:906:a3ca:b0:926:e917:133c with SMTP id ca10-20020a170906a3ca00b00926e917133cmr1682953ejb.47.1679643500582;
        Fri, 24 Mar 2023 00:38:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id rh26-20020a17090720fa00b00930ba362216sm9970429ejb.176.2023.03.24.00.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:38:20 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: qcom: sc8280xp: drop incorrect domain idle states properties
Date:   Fri, 24 Mar 2023 08:38:13 +0100
Message-Id: <20230324073813.22158-6-krzysztof.kozlowski@linaro.org>
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

Domain idle states do not use 'idle-state-name':

  sc8280xp-crd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/all/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 1a3d15e6d381..4adfff7583be 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -268,7 +268,6 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-power-collapse";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;
-- 
2.34.1

