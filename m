Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D65A78D988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236894AbjH3SdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242937AbjH3J6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:55 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39254CCB
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5256d74dab9so7015583a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389530; x=1693994330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMuJsymgFdsKAjrQm0VavHQLfVQtcng3/FrcyEkfn3s=;
        b=hG8s/jX13xStnQ6ibVDSDr+X0BmUOjyNWmsOWdrRPnsG3rkKUXxxrPYyj9dSlecZ2k
         qS5CO5SLAeTpYzuFwTacFGLfFmGBBMktNmkzYDzfMN8cYPdwUx7Q6KmSAMoeOdgg13r9
         xUUH9B9Be9xgBtzPO1RuEloeuPs8HFFrv/1lpeypCO07pF3K+GlZcaQbbvA2ZjHu+1MI
         3LpDaiLQv4NYUU1Bjl1bP4KVBHEgxfUDYbdgm0gIwVjwzZ1GhOurz56sNP9VuAevi+P5
         FrV24JLFkCQEvD5i7VH2nuq/m9+uYDH6XRJPAGDS0YlBcyCDkxsarnsn5154FPGOqKQE
         kl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389530; x=1693994330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMuJsymgFdsKAjrQm0VavHQLfVQtcng3/FrcyEkfn3s=;
        b=X+mKf4kOG5gskY9bwZZwze5X64Hb4Vww1VUetGY0pDxDgz1qj7+8JXk5Jd4x+nzhD7
         qD2wegD3uJlCN77Tpv40AadpQL2L4xr7D2ZGBAdAdcwhhyE6ivEXmkvLoExfMErqk8jk
         p2vnwvFML3ppMqFkGr71UB5CwosKWJZAUhiXkvPNx8sDVZZ80h/lFQtnK8SyrIRkotxQ
         p2amXxtz3KvnrnpbAxbu4xGUl/Rb2sIkTQpkW27csED/vcNJBZ4TX0sOWoY2qlCcD2Po
         3/ylQJR1/IF693iTpL1+rSr8yds/7cYeJ4jGA2OmR9RaahM+YdfyfREHWpnKlFf/rZ5a
         nR8A==
X-Gm-Message-State: AOJu0YxPAwZPXukDOzPYadbBZS6+ucKat9wRJ+++ByL6gTJaVz6spvtp
        pVJRlrxZF06Kb0OSN/RfYuZpqQ==
X-Google-Smtp-Source: AGHT+IEf8KL+ACn7JaRgtK1OVzWD45Pz7Q/Rp6ixSdbBEUiDBLjrnNxNNLgw3xdnQkN85h/UEJPDEg==
X-Received: by 2002:a17:906:208:b0:9a4:dd49:da3e with SMTP id 8-20020a170906020800b009a4dd49da3emr1337672ejd.68.1693389529786;
        Wed, 30 Aug 2023 02:58:49 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:48 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:30 +0200
Subject: [PATCH 05/11] arm64: dts: qcom: pm8350c: Add flash led node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-5-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node for the led controller found on PM8350C, used for flash and
torch purposes.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index f28e71487d5c..aa74e21fe0dc 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -30,6 +30,12 @@ pm8350c_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
+		pm8350c_flash: led-controller@ee00 {
+			compatible = "qcom,pm8350c-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+
 		pm8350c_pwm: pwm {
 			compatible = "qcom,pm8350c-pwm";
 			#pwm-cells = <2>;

-- 
2.42.0

