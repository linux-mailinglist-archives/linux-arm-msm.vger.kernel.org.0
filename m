Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACDB6C64F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 11:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjCWK0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 06:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbjCWKZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 06:25:58 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43E21CAC1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:25:35 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id l12so19851124wrm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679567135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaQACbxWFe/pP0PYdcE2NPjjd/o5GOPyZh6BOGAwiP8=;
        b=EDK/OC2gr0VhTqb/8cfkz3D7WlMPMQM2ELils/2BJph5U5K9iidkuqoUxZlw2Rh4yY
         bG9nXl3bN8p8ByXNnmUizw7VxwxiBMaFatQ+QWA25ecnX8/EvkWtD1qcL6FpEOZlvnYR
         +xXKkFPGzURm1L4waqYLeX9UhOuOT3swffCfg/GmLq0qa1q7bk/Ng/0EV8WUnS+G8AXF
         LfT0kd80T66ZOC5MG/60vWfd0UC2E2zAJ0zP1F9NUpF1IXB5ZbmaYYbC+YBQ7NEA1XMt
         uFCH47IhPi3S2YE2gzbkBClbF/PAUwlHbpmJ1w+7vZSAOQStcKGGz+EZvu0JdKwZXyzX
         sPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679567135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaQACbxWFe/pP0PYdcE2NPjjd/o5GOPyZh6BOGAwiP8=;
        b=EVpwP0NjNAUuKW5EH2OtHI9eLenlMgUmjnT4Y6vO4gRrGCUTe9UcuS2P7q+RKGsHTD
         W2JL6IjwLGt064wK0QNc0GWf/DbdRtMmH1uv1C1lxqGYWIX4Gy9OP2dyQKKbDn3s09nq
         DZq0QzBHBYBOo8nFZP5AqOKrfAc16IcQTXi5mL7fXLPH6oiRsu9PI/yjT7Ix2IQ9cYNY
         ftzFw0YUh4dTSqqAKuyp39/jSdpgYrheXYnDWebIjePk6qWfBlYunA9+IOLFrB6mHmEV
         dTQAsHWbkkbmQ6cB66CiIiB/XzX70OwJ9oiJppYxwS1qlII7V8UxxjQIX3X+b9FP4WVR
         xpRg==
X-Gm-Message-State: AAQBX9f6Eu7ROdzU5bCuNa8cxMZsn3N4oKge606EjbLmkSSgyxpqdWbV
        K7NX9Q2IJzdvtHYYh3gty28BnQ==
X-Google-Smtp-Source: AKy350bCeDHpSVI8xLS6NQ/SiOOsVX2JYPYHUtQ3vn3tZY3Uc4D9P3VP7wUr81eOPMcUs86Lve47yw==
X-Received: by 2002:a5d:49c3:0:b0:2d9:5608:ee0 with SMTP id t3-20020a5d49c3000000b002d956080ee0mr1808899wrs.69.1679567135399;
        Thu, 23 Mar 2023 03:25:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 03:25:34 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 23 Mar 2023 11:25:23 +0100
Subject: [PATCH 8/8] arm64: dts: qcom: sm8450: fix pcie1 gpios properties
 name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-8-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the final "s" to the pgio properties and fix the invalid "enable"
name to the correct "wake", checked against the HDK8450 schematics.

Fixes: bc6588bc25fb ("arm64: dts: qcom: sm8450: add PCIe1 root device")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8ecc48c7c5ef..d964d3fbe20c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1908,8 +1908,8 @@ pcie1: pci@1c08000 {
 			phys = <&pcie1_lane>;
 			phy-names = "pciephy";
 
-			perst-gpio = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			enable-gpio = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

