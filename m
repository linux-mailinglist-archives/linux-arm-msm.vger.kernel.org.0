Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3A46B5779
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 02:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbjCKBW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 20:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbjCKBWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 20:22:31 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE7712FD05
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:22:00 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id t11so8959161lfr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678497719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/BcDHpYHzx8G1jUC91vptKuBo8FCaPMJ3cRjrY/Ueg=;
        b=b+t8VB+5t0+uXjVXePUnxbvHPZC7spQj57gPEyq+NOtlA6CykiLmznVdmQAdmgbTj0
         9n20JWnkLFEg6xzKvJO5TnTJ6a3/qOJShlThLMumLsSbb0qQcECJf/3WLJdf4R6AKT6x
         aqnfgjcfzbYGpqD9y2Zu0kzKkx+8JPT0Fd/58nQZ79xd1H9SEX+pxRT/zJNn45tJdJgZ
         DE4GXx/bFi6QuCi63K66zPncYVta2GOGndjlllzJFMx7uwNXAoDp3ADThcC6LZ/NaDiy
         LarzKNfckP+eYc3hjWnWDmHORvqLjoRWSzkoWE4uf8eG5JIGvZV2OhE3jT6ndw488XtC
         uO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678497719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/BcDHpYHzx8G1jUC91vptKuBo8FCaPMJ3cRjrY/Ueg=;
        b=uwMfsLetYxO/oYzKNA3O14moAAa8D/5QpqXnTshVqozPrPJ8cbVZGgM06YHBtUqqB2
         Lxwz6bHI60skyP6vlLE6RJHBUxUsCOr1cXAvBaoIDgW0ewv7hIMLiBK+xnDAWv8IajIR
         zWUCFicRxIKKiOmj3yGQDb5eiEOwZH2mvrCBzUwcgklG5/qcKniCqXpmews22I3QjAuk
         uaHRUMvb3IdN/Au4+kxQNGnfnFhqgCZ/Ka6mkc3iJL3NFdhFkensfziLMk9s6vqwgZZG
         W34GeADL7ZFqBHyB6Ts+11iSLly8tPc9d07cavUd4oqGTuqwbmfcciJ4oFb5/fhK5IXg
         F62Q==
X-Gm-Message-State: AO0yUKVYFE+p53AJ/hvbk2jZ2pVoFyB4LJviyVt25pBMJCP/6DB49AYD
        UUZSJfdIRVXwdhLNF9keaFwsTw==
X-Google-Smtp-Source: AK7set91E57K+aHeawpsrtIz/12dISDhRDPtGS0whMeTx1SM5WRoWfNHAJALVeIqxpsG52ScricLrQ==
X-Received: by 2002:a05:6512:144:b0:4dd:998b:4dc7 with SMTP id m4-20020a056512014400b004dd998b4dc7mr7400903lfo.21.1678497719631;
        Fri, 10 Mar 2023 17:21:59 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id y26-20020ac2447a000000b004db25f2c103sm142318lfl.86.2023.03.10.17.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 17:21:59 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 11 Mar 2023 02:21:43 +0100
Subject: [PATCH RFC 13/15] ARM: dts: qcom-apq8084: Add simple-mfd to
 rpm_msg_ram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230311-topic-msg_ram-v1-13-e9c2094daf09@linaro.org>
References: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
In-Reply-To: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678497700; l=689;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gWBFR82iuDasEylczucWdostwFl8y9SpzRYPpDuu/TY=;
 b=wuoJK8iO8eSNzp3CLETa3FyDsQOBnbPMayQ2/+SW8iG+27m6ZH8nlX3L9D9tJwat9mqoPDSNryXA
 mNd7CdIPAhQ9XQaevU1YWZDrK95aJy8asXAphDk/o1//wVM75PAO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing compatible to make the node compliant with the bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index fabd7455eb8f..c6b33dce6fe8 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -716,7 +716,7 @@ tcsr_mutex: hwlock@fd484000 {
 		};
 
 		rpm_msg_ram: sram@fc428000 {
-			compatible = "qcom,rpm-msg-ram";
+			compatible = "qcom,rpm-msg-ram", "simple-mfd";
 			reg = <0xfc428000 0x4000>;
 		};
 

-- 
2.39.2

