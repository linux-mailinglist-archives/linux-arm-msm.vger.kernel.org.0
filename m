Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC12792B00
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236289AbjIEQqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354150AbjIEQ32 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 12:29:28 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4B84225
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 09:21:21 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-991c786369cso422696866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693930769; x=1694535569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca2eAe6pvMNyR6imFqpBniy7ICyAfe/hANZLQ25/e0Y=;
        b=yhgwko6jx1/CiBhHOFvr236Ka0+xtNMkvagSF2qO+IANGIBcwFAaW7g0Rnmf4TbB8A
         6sGFNyStw65b2RhiMHJUtcSEHmlubLREow3oI/7rJsPfwxlJWk9uAePiySOnDOcNtdzn
         w0sv6LgrlEPRp3p7LhbI6up34FygY6Oqh+uEB/fa9VaAiWLhapJvYh/Hs37JAa4TBomP
         S05+U2URXFfiUH5edw9Y3M9bREY5dtK6C0tFdhi1FwwVWMl7kAmzRNbp1PEs6PJstB8I
         u/OFLdJr9L86BWseQOs6wLZ/rUAaI/ygNtkgJIqzvT4kc4AMBWygu/A8kEsPDXnJ5ONW
         t9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693930769; x=1694535569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ca2eAe6pvMNyR6imFqpBniy7ICyAfe/hANZLQ25/e0Y=;
        b=mFTKRwQ9OA1OqYw97c32otJyeQaH+iakE0111MRB+beH2KxMqjHuxNtfF07+gsAi3V
         TiyXmSmqYN0UNiLdiIH3QfMgDJd1KNXrneYQLG3kCpH3ExiyYd4VtZO+rF35yPjFk9un
         n1/OTjf4wTjaokkpnp9pZvhGgOYHEfHL+ggUbyHAhk9x7+79aqeLQjyabWWqyufDb0Ml
         RJmKutiSRxi7kTJGcbCpRP77IhevPvweVkSrNv2+LDlGCbiViLRVvx/HUwwVmc4FG4um
         6yB7PlkEvUYgxGCp4FXakEYG1KUj0/6zP1m2SRhtmf1jKa7A1jAOJBc0QQVPGdtQtwBu
         bfGA==
X-Gm-Message-State: AOJu0YzcWCSk9b/vvxoXNaxn1LthfdfKgRBb6SyJZB7W4diUE0597SY4
        HorN10avQn3Pcmk/NhSMiKE7sAqxnopkJqhexI0=
X-Google-Smtp-Source: AGHT+IG+oCDVe1qnz0Eh4bx1Aac6LkewwnuG8hvHtmfCrkF0hc+vfTNz3AZGaXnbaYCTFMaA43jutg==
X-Received: by 2002:a17:906:304a:b0:9a2:139:f45d with SMTP id d10-20020a170906304a00b009a20139f45dmr267866ejd.43.1693930768881;
        Tue, 05 Sep 2023 09:19:28 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/12] arm64: dts: qcom: sm6125-sprout: drop incorrect UFS phy max current
Date:   Tue,  5 Sep 2023 18:19:09 +0200
Message-Id: <20230905161920.252013-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Neither bindings nor UFS phy driver use properties like
'vdda-phy-max-microamp' and 'vdda-pll-max-microamp':

  sm6125-xiaomi-laurel-sprout.dtb: phy@4807000: 'vdda-phy-max-microamp', 'vdda-pll-max-microamp' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 272bc85f1719..90b5f22ea9dc 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -406,8 +406,6 @@ &ufs_mem_hc {
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l4a>;
 	vdda-pll-supply = <&vreg_l10a>;
-	vdda-phy-max-microamp = <51400>;
-	vdda-pll-max-microamp = <14200>;
 	vddp-ref-clk-supply = <&vreg_l18a>;
 	status = "okay";
 };
-- 
2.34.1

