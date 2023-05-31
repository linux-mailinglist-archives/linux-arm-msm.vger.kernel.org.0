Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEDCF71734C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbjEaBm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbjEaBm5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:42:57 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496F910C
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:42:55 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so5811603e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685497373; x=1688089373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePONLKG6w8Sb9ucFxfluXQBvZKdoTzrtXA0KFPUr4P0=;
        b=o9cSS2QpT4Wsl9SR9B2SslD69sG9DYpVAE9i7hyhzarTk8AkclAH51cTCzfmX6ln4/
         PTnNwSnTK3kesILZwZFPs2fxd/O4gxE6FR9zAOgnUiX/1/APaO7Y0rrs1Rw8/3Htdhwu
         d6PcQugcBh/entClYpOKT+yIhiivQ/kWlM1yX8l74Coeu8iTJ7mH91JJdytoE0rRPMlz
         EvJR51/pRjqRnSIDrk3neBCce8ZHKySuks1xpbRMn6UU4k/ipL9WHf/Kwbj3Fld/1SeE
         c0rC4QVURUgMugoZKLnSEL4y8upXUwC7Yf/I8LxZt6jfwgp/eY8sfKdowM0arOrltgqe
         nSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685497373; x=1688089373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePONLKG6w8Sb9ucFxfluXQBvZKdoTzrtXA0KFPUr4P0=;
        b=c4tblfHd7ixzKZC5vJqUeq4pc0uBeqz6a+VDrnDkWKATHdadAnbxtbksYfBIsQZJWn
         9khvICvb6oVh6/KsXFKwGj9FpxLyzSHq7LQqC6A+6CwfjCnRuvH9FVqWPhRMPcOnSXHD
         cITqOTlpYwHFTVF6r47kCUl/DASX1+3o69QyaUfXH0wzNZ01uMAstutnczRyNuEqdCEg
         1GnZqc8xJ4qYdGpLwVw4pH4/9R7fpPeM9dQupeJnVdy+NrrcXncD/bQCX/Q3jRg++/kD
         9PSSwzWrtPCrZzNtqjti2cznzqjeKZuWxH2WELQ9rzVPp8gBIGzXrdbD3cDxOidx86pI
         IvYQ==
X-Gm-Message-State: AC+VfDzcoakdREo9bw0IF4TBYyQhEtzbcJEmsV3lp+TfSfTXZImAHnsK
        +3ymUxOaslWmbBCJ6onDiQtdYg==
X-Google-Smtp-Source: ACHHUZ6rN08epjLFVRSdRe8/aHjgfq3mu6/vKJMLlFwJfB7csOoyfLgMXdNLW261Y5UZbe60d8+XWw==
X-Received: by 2002:ac2:5292:0:b0:4f2:5c4b:e69b with SMTP id q18-20020ac25292000000b004f25c4be69bmr1948255lfm.67.1685497373704;
        Tue, 30 May 2023 18:42:53 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id q20-20020ac25294000000b004f3945751b2sm515994lfm.43.2023.05.30.18.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:42:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 4/4] ARM: dts: qcom: apq8074-dragonboard: add resin
Date:   Wed, 31 May 2023 04:42:48 +0300
Message-Id: <20230531014248.3824043-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531014248.3824043-1-dmitry.baryshkov@linaro.org>
References: <20230531014248.3824043-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device nodes for resin (reset, volume-down) device node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 7f759b00524b..ce5eb56a5d1d 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -148,6 +148,11 @@ led@7 {
 	};
 };
 
+&pm8941_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &pm8941_wled {
 	qcom,cs-out;
 	qcom,switching-freq = <3200>;
-- 
2.39.2

