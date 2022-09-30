Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985BB5F11D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbiI3Swn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbiI3Swm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:42 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2069C166489
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:40 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a2so8202782lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nhmJW38bStR53koI2qHog4MXKMn+LAf/+Mw7HuF008A=;
        b=nhPRWT3U2hCJqZnt8iDi66CM+zTrZO7+6ZO9ltsYr7uwhaWJrKBf0rxtKLCUj3F7HF
         EK2/1wn16Y9B80BFp36+l83la5RG5c8kKcfH05wsv0PJQxVjiL2jfwrimPdgnPY+iWyT
         biBAqGJ3XQN87luOVF8eAW8zoa9088VgzS4kqD4WvyhKvuyQuG1t4wfsWC+gvFnWVYEb
         ZKjLMe7EiWSUJ30lKhkMDcOFC+O4aYzao1SCWr9/MxPA6psKEekBWWOxKqkcKfnrBBr2
         wGPG5d3SmZizMqQrqCjWU0ux3WMRgoVz/n+sQBqo0yHNBhTtAZVusd3Re6IX6WWMnPeH
         g4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nhmJW38bStR53koI2qHog4MXKMn+LAf/+Mw7HuF008A=;
        b=QzYBz1/36DYKt1f12YwI5IR2NSjZdq3Aze4JHSirpfkjEE7zPvZ18u3o/hiZOMECd0
         FICjq+LOHOijV/ilwHsWwnBUHX23XuoJdMBKqeTRZNXaWinaQmmUwQwT7dz3Ut8O87NT
         IKSYWwjZkDUlAL/iSWFaxQDhfKWYkdoQ25X8EZSjm9fEcU00XH1zfsRI2lUeajdoOttn
         iqpU2PP/TuoND9BdOppLYToZYnaLYqebZyHFPyx1KgOehB/45qQe0GJf1mrvbKLJCYCn
         nNZPUR8TOzTbO84aWrRJcVTiOtRVAFgZjZ82zKvyUZIHRLv+HePj0s309SX+k7yKwSKe
         JcUw==
X-Gm-Message-State: ACrzQf3eNGkmPIKzQ6iruzpNu3FNbYAPRDAiCHzibQFbz8JZnScUwu/u
        KfjJKpxeH/wM6k03gAmBvRnMrQ==
X-Google-Smtp-Source: AMsMyM4hNGiFz8NLrXE3eAcZxoQme1ibK7AjKcLR/X2MzA6dcit2EGQuLRY7OOjAHcaeXkbJoV3syA==
X-Received: by 2002:a05:6512:b1c:b0:4a1:baad:1e6a with SMTP id w28-20020a0565120b1c00b004a1baad1e6amr3578020lfu.466.1664563958475;
        Fri, 30 Sep 2022 11:52:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 01/23] ARM: dts: qcom: apq8064: disable HDMI nodes by default
Date:   Fri, 30 Sep 2022 21:52:14 +0300
Message-Id: <20220930185236.867655-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable HDMI nodes. Individual board can enable them if required. The
only APQ8064 board that has working HDMI output is IFC6410, which
enables these devices explicitly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 942aa2278355..829e197579b9 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1470,6 +1470,8 @@ hdmi: hdmi-tx@4a00000 {
 
 			phys = <&hdmi_phy>;
 
+			status = "disabled";
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1498,6 +1500,8 @@ hdmi_phy: hdmi-phy@4a00400 {
 			clocks = <&mmcc HDMI_S_AHB_CLK>;
 			clock-names = "slave_iface";
 			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		mdp: mdp@5100000 {
-- 
2.35.1

