Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A79E661E16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 06:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjAIFCC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 00:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjAIFB6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 00:01:58 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E5DA441
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 21:01:57 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id e13so7774137ljn.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 21:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
        b=rabUfXrZj9srcbLYoOx4/vFBoennFGXE9BohXN29RUFrWAlWo0s4WCnH82+be1OBvC
         3NexbCgKhvCw6WQAgKk6B9i4Gof7HXYNXWTXo3Vcbi3imgPoVvTRhA+RPSK+dNlo7/mD
         oNNghloWaT+SMpuxh75Oo8P2VGWrWuuDtdakRuz0p+bxS95jtvUcdQXQmQiGqxLwgVdW
         DyaXpGHisUS0++mNwv+0+zGIXYCkiycSdjslX7GwIZc8tiZneNQkvhIKlWIwNjOO5aoy
         5CnBYBECJRhjBh8u2Q5uYbyu8ENHuM0TsnVBLITaOMt0r9EXAqeqxBQTmsspDUY+42qM
         1Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
        b=vKTcN2QrUReHtnowxCdUu/BIFiYJC0CXkyccu1dSP+RO05TZdwCJvSX53BW5Sf3LDj
         GTBOi01WkrHUHnDiQoavEIdMMuleiCekONTOTAWLdc14gE0QctVT7K5fzsEDo/7enGbJ
         CKNn2shC7Fl2GlTHMSHVAFQ/Ahi7ptFMWB6yKaYrnYbTFpyKZLQe/EnXQLO8FedHSUN5
         RyB5ZwMOBOQ6hi/x60gWC8rpbhGIen5TgYI9oYW8giDKgTMHM3Uiq3pl55jVZKEK4Kwd
         TRNEG0jdQIHSxSit/i5fsYqE17J+jbfgq4Qr4pG7Sl3lQh+pe7rjjTIxkLHm/9o2Dgij
         t5BQ==
X-Gm-Message-State: AFqh2kpvJlV9rhVfQBvkCktVYGZErUHnel2GyfG5R4GzHvaNvcke+lD1
        yenKgC1XYqSHuijdOggHUEb5XA==
X-Google-Smtp-Source: AMrXdXu9eMpvd7PLGEHAUuuTDmo68Besxd4fVT3EUBanv3mfoE7E5yIoFHas7c4Z8KStCI1azvy50A==
X-Received: by 2002:a2e:5450:0:b0:283:7f20:a89d with SMTP id y16-20020a2e5450000000b002837f20a89dmr1470407ljd.34.1673240516197;
        Sun, 08 Jan 2023 21:01:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j12-20020a19f50c000000b004b59067142bsm1008257lfb.8.2023.01.08.21.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 21:01:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 3/4] ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
Date:   Mon,  9 Jan 2023 07:01:51 +0200
Message-Id: <20230109050152.316606-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
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

Add SoC-specific compat string to the MDP5 device node to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c0851..0cd59088f9c7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1549,7 +1549,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.39.0

