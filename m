Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964A6673839
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 13:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjASMWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 07:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjASMWN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 07:22:13 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F119A34540
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 04:22:10 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r9so1686158wrw.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 04:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwi8+uTOAFWNeXd+ZheoUybhF+7XBWeOHjKML2m+YeM=;
        b=XElFWCvT1iReHdBMa1+UeRTx/92UfZwjjsRjfIFA0zoDE2oHkQWV1QanidA1Hh1gNR
         rTUXstCP20+vanKz4xexF9UE8X5e2ma/o9iZ6QSc5BVn+Qzb4/ipQ/BTeuQH4W71JBkw
         QmboXXjaRVdfQ5cBC4ZNTgH32KWUBXdypMjKJi4mQCOrcvr6+XkxVYfXpWCMrPncoccD
         XSF+HV8u/OmznayjrknY5OmM527Uf5o4cPHbyYdNvZRnFwiZxLn3DjuzHNL21Luv+uby
         dFovPLvCkxS0uhlGJP389Vy+bC6H72KwjmSl89EyuXY4UcpoLTW3S8pvnFn6qvvzmDAm
         OTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwi8+uTOAFWNeXd+ZheoUybhF+7XBWeOHjKML2m+YeM=;
        b=Ykdx5ek73YXJEupFmHofS9irkWfTb4LCf+Cg9hVt6/v2wEdPcEL6huofBBNhrnFuUm
         7mrUXWZbFo6IRW7RiRN5Ck19AfQi49PXG/Uz/WBx+UTQXoFE3OGNtNZ0laUzMlGwetDB
         TcNazpfz2q7OKCfA0PGOmH+CqGviPODdV5FHN8ZPKxzc4jXWpWyIj3azZL/Ylg1gsPDh
         rSg/Chk5JqSD+EP5chdSGMLK4soW4dcBliU8+seIuRHX7z2wDkPZOdl+gwDSkDVLO+xq
         1rCcqSE5JuQ5aplFMyYr69R6lv9TqJNjcKaYYHArwH0lzVh//Jk7dW/JbwoU2xpJgDuq
         zefw==
X-Gm-Message-State: AFqh2koyvgYf6SxeEV994I6y8Rv3ZRM4M5SHd2btVz3UKjkbl8oYy+xE
        yPSwtY3e2iBHx1KATR02xYitgEDAEk/SyM5s
X-Google-Smtp-Source: AMrXdXuaHc/L5Odf6LWKtCrAhf32T2LQRFrHH7twhE/e9mkimGBQd4EAzp12i/gDFKeBGrag0e8mmw==
X-Received: by 2002:a5d:6505:0:b0:2bd:dba2:c17e with SMTP id x5-20020a5d6505000000b002bddba2c17emr9450041wru.12.1674130929490;
        Thu, 19 Jan 2023 04:22:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d678d000000b002bbe8686d6fsm34118401wru.117.2023.01.19.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 04:22:09 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH 1/2] arm64: dts: qcom: sc7280-herobrine-audio-wcd9385: drop incorrect properties
Date:   Thu, 19 Jan 2023 13:22:04 +0100
Message-Id: <20230119122205.73372-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The sound card does not expose DAIs and does not use custom qcom
properties, so drop '#sound-dai-cells', 'qcom,msm-mbhc-gnd-swh' and
'qcom,msm-mbhc-hphl-swh':

  sc7280-herobrine-crd.dtb: sound: '#sound-dai-cells', 'qcom,msm-mbhc-gnd-swh', 'qcom,msm-mbhc-hphl-swh' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'

Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
index ae2552094cda..020ef666e35f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
@@ -32,12 +32,8 @@ sound: sound {
 			"TX SWR_DMIC6", "DMIC7_OUTPUT",
 			"TX SWR_DMIC7", "DMIC8_OUTPUT";
 
-		qcom,msm-mbhc-hphl-swh = <1>;
-		qcom,msm-mbhc-gnd-swh = <1>;
-
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#sound-dai-cells = <0>;
 
 		dai-link@0 {
 			link-name = "MAX98360A";
-- 
2.34.1

