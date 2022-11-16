Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E1162C4C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235008AbiKPQi2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbiKPQhu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:37:50 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09A45E9D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:31:48 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id t10so22533745ljj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJHwbZILYP8+/3bf2ysPsIVRQOxo5OqcH7pSEuMOltQ=;
        b=EHJE2TianlnxZSWh5AX2cj7oS3YN5io2A5IS7W9w7oUFNYKGHhQKUAfX6ltTLajATj
         WsdYcogEBK1XpKLFmyz8rafYm7SUs5JJdW7nJFQk12O4vtyQ5nkP8wnGbhuppEukTvG3
         soUJGAnUrUju2fcC2n2DjfmQNDdMRaM16kIjr6ioSYt+RTracL5o/xOD8f/0FdRo1fTu
         FZPmh5ha6FdZoVCXcxj741jt/avqLts6tsj3tqUWfij36XN2blrZayeu6rUHSfbUkBgj
         MWNiN5k7v+/4Q/+JymaHipaShdxC9op2jFNqeXG88UvmiKOISKU2dJCxabECk8zM6s+c
         6ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJHwbZILYP8+/3bf2ysPsIVRQOxo5OqcH7pSEuMOltQ=;
        b=zVRlafpQPhbpgsQ4SCdbs8j0xdonT6mNniDOHw0X3qLejrErpuC2UAsbU+1Kk7SyhT
         izy4dFwCAT/fESzJ2kizw70xXl4bs6zRIBViHubEjQxDALaunQ5sOa+CwxvdCiY1IiWr
         Rs2mxrdAuh+/jtmdWnqeJPSLcX3OmvOjdwN58fSayytUHbJaRT5dK6G7hDCoZdrj1JKY
         HOP7J153wp69/kq6ACffmFrlOVGu2e+GqVukN+1sB3M1CIwBOGoOeWLqWgjHN2K4j8g1
         a1wzcJ1bgl/07On1RdZyPFGDMrt2bjYyc9wB2CpNOmab8/wHa2so9uhHbCxLMomULcEQ
         LvZA==
X-Gm-Message-State: ANoB5pmiDoLlShInpeLFfQlUjIV8zHBZyFkuJJjE/g1+A5zuRkfKoRYw
        YroDgX6cLWw6A4NMYqwlRkOi1A==
X-Google-Smtp-Source: AA0mqf4bFUhLzqIBnykeRocSbGABvzjHGitRtbRH2WnARLS17Mr4SNSuhARK8RLFqjiHLi/3dE5cHw==
X-Received: by 2002:a2e:9ec3:0:b0:276:d9a6:dc00 with SMTP id h3-20020a2e9ec3000000b00276d9a6dc00mr8470050ljk.379.1668616307072;
        Wed, 16 Nov 2022 08:31:47 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a21-20020ac25e75000000b00494603953b6sm2673634lfr.6.2022.11.16.08.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:31:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8450: use defines for RPMh power domains
Date:   Wed, 16 Nov 2022 17:31:41 +0100
Message-Id: <20221116163141.177997-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use defines for RPMh power domains instead of hard-coding numbers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 19a0f5033cc9..705e05588941 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2277,8 +2277,8 @@ remoteproc_mpss: remoteproc@4080000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 0>,
-					<&rpmhpd 12>;
+			power-domains = <&rpmhpd SM8450_CX>,
+					<&rpmhpd SM8450_MSS>;
 			power-domain-names = "cx", "mss";
 
 			memory-region = <&mpss_mem>;
-- 
2.34.1

