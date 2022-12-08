Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE9D64770A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 21:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiLHUOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 15:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiLHUOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 15:14:16 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C269378B92
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 12:14:15 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id l8so2742761ljh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4naixU0W2mwEQuuHUmas2VUjFasO06w6Uoh0J7hj7Xs=;
        b=AwwRLN88Q3F6of2YPb1n4Pt/0x6cdbfXZGM2usqWpEqd8ecYsDKwGqfYPEoMzKh7Xg
         9NAM31Kgw7fPfVzuO0OMT72VuiCVqDpIQU/6OrxaY6rB6tZuWDACSAibAB1jDGAjcjSE
         YvBELlIuHGVjwFAQCphZmnfJlhqQ6vVEoLL7DEJA+rEegBNvUs4Bf7b7Tz08JI4CV3nH
         qgJrAd1n6BHxhBiFNlPy5fCJ8cqo7oWLeagKB14zQscZmK+FKA3MAVr3iqilXxD8vtSh
         l1RdOnV2+Olyl3wM+ujpcoyxyvnc9G9Ef+YefGpwnrwHA5io+Rn0yMgDO1AuGrtSSMb4
         lNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4naixU0W2mwEQuuHUmas2VUjFasO06w6Uoh0J7hj7Xs=;
        b=4KnU3ELAYRuoVJAiZiFfiGuXB2m8dnGJIv1+20mmmugFvnDXNGBmFTnOmwYw106zPc
         FoaJASo93ZXbbVBj/rsz2c06QhiiYgMY3mVTAjymzC+/1RWSKYt9O9xUr517jk9hquov
         wf4hT6FRwJlYt8kIDTHOCyfMNgwgxBooiYgPEcseArkJUXrQyYcObOCI06WPwU0K8WZG
         qZGPmpcO+29EPnYH/ZDW+xiXltJNrFB8TI/9t4Ix5upz9N7PETAogpEgfEqdCWqazMbw
         p65jRy0BzyrnlNML9zKSZ6jbcCLDfN1zShKhMhO7dtmgeSZnFgRkFesbm2Ih5ENPKXVx
         kW9Q==
X-Gm-Message-State: ANoB5pnKi6gjKUoPOSE7PkAk5GUrGJ2aM5p3Y8qevo0ze895JHSXvDSG
        WVTqxrdTEoTAnvG4gi0RYhrM2/2hUqcgWKKw
X-Google-Smtp-Source: AA0mqf6rw14Z08apamu/Q/ZDI54SJ1rhkCFleFuBj9W5tiRjOr3ulU2QuMc7PDF3xkYm/WagaGnJcQ==
X-Received: by 2002:a05:651c:2009:b0:27a:25f:b265 with SMTP id s9-20020a05651c200900b0027a025fb265mr4333701ljo.410.1670530453828;
        Thu, 08 Dec 2022 12:14:13 -0800 (PST)
Received: from localhost.localdomain (95.49.125.53.neoplus.adsl.tpnet.pl. [95.49.125.53])
        by smtp.gmail.com with ESMTPSA id bi35-20020a0565120ea300b004ac6a444b26sm3466428lfb.141.2022.12.08.12.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 12:14:13 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>
Subject: [PATCH 2/5] arm64: dts: qcom: sm6115: Provide xo clk to rpmcc
Date:   Thu,  8 Dec 2022 21:13:58 +0100
Message-Id: <20221208201401.530555-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208201401.530555-1-konrad.dybcio@linaro.org>
References: <20221208201401.530555-1-konrad.dybcio@linaro.org>
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

rpmcc used to rely on global clock lookup (and still does so for
backwards compat reasons) of "xo_board", which was common back
when we did not care about things like underscores in node names.
Nowadays it expects to be fed a reference to the fixed clock.
Satisfy that requirement to make sure rpm clock rates are not all
stuck at zero.

Fixes: 97e563bf5ba1 ("arm64: dts: qcom: sm6115: Add basic soc dtsi")
Reported-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3f4017bc667d..81523ab7ff60 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -296,6 +296,8 @@ rpm_requests: rpm-requests {
 
 			rpmcc: clock-controller {
 				compatible = "qcom,rpmcc-sm6115", "qcom,rpmcc";
+				clocks = <&xo_board>;
+				clock-names = "xo";
 				#clock-cells = <1>;
 			};
 
-- 
2.38.1

