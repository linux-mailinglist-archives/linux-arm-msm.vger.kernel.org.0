Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01BDB661BC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 02:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbjAIBLL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 20:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbjAIBK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 20:10:59 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F45D1092
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 17:10:56 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bf43so10726165lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 17:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
        b=Vsz2WQvesd6Tz/AJqarptl/OBMOqv9EH82JbvOaC98ZXf1mgVYR+eLkGuG3ygXVYSP
         fi0uRsd/UvZwjmeJjrDHo8TkeRzCpMJ7vPKDQgAPslTSCKBouJ1P4c8iuvU3d0WVji8s
         kPtpuMZiw9T+NXwtWb8OGTxwTYif2D0rOoylBtaHLEsxq2SiDavUT3q+VctVo5g2U8hf
         GPQsNHyZEI+HeES2uVxYhKdrM3X2U4ZS5IMSeGnS+8szqCt+084vcziYC4E3MdhR4aZt
         yxoz1xN7ienhEzr/j2J/HDwNj+JaFWRSZPBv43hQ3gUJzeq7xIgOjysEZcZ7yX8kEoEj
         pSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
        b=S1JMuQUMKv0Rj0yZXWiOI6cPIb3PdrfVj9VKb60Sj4LR0LXEKiCmC/Q9nrMbQlWYxU
         V2tvw7DRvEzi1lkY1ooYSQ36aP4scysZiu7nwp2QbLqkWcT1guCQSIR/IM4JgFwRXJX2
         RMm/r/LK8u0dbIpRckKZsRD4sFJ2+1m5HJ4XDT4UycXHGp71BVrBEQQ8TQ+AErb+LfJo
         WnU+YA4WAKKyYiPoweTUEa6e5wKSUtnHy5I0o2Vlg4xim4SZ/TGDRmy51YsYQ4Xe0KRS
         qW5Xj8TslE9dD6kPiOz7xpKb9Nkm+DrWE8Th+RXZOSqwcTX/Un3pAlurYPgM077dXnYX
         KCHA==
X-Gm-Message-State: AFqh2krvA6qaPbh8sW5DY3y8Kf6hT/Xw2Ezmc+hz4tKoKcGnzR8BNQL2
        UDMjRxHiVOfNk+7DTUqt1SZs0w==
X-Google-Smtp-Source: AMrXdXv2hWpbxPQMuDdYGKPXDGoAnivFnkcYWNDLosztuDcFM30jI24yfADvP/twwdv+3nd0CpkU5A==
X-Received: by 2002:a05:6512:23a3:b0:4cb:6bcb:de4e with SMTP id c35-20020a05651223a300b004cb6bcbde4emr5312952lfv.24.1673226654486;
        Sun, 08 Jan 2023 17:10:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y4-20020a0565123f0400b004cc590975f7sm1324346lfa.183.2023.01.08.17.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 17:10:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 3/4] ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
Date:   Mon,  9 Jan 2023 03:10:50 +0200
Message-Id: <20230109011051.263391-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109011051.263391-1-dmitry.baryshkov@linaro.org>
References: <20230109011051.263391-1-dmitry.baryshkov@linaro.org>
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

