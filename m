Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C59E264A4E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 17:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbiLLQg0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 11:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbiLLQgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 11:36:05 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462F513F45
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:49 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j4so405344lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn6GZCWwPXZqZM3ZwqhUpA0loC9h1KO7LziClj2r/4I=;
        b=ICi102vkAktWY3YS6h/aW++QO7y39ssqQmzyO84Z+s/Hy3FfOnWURAWjWSYTybt/8T
         ficpSmvUS2vIy85NPDI9tdEzFUr1PDe8+EDVRRyqQhrhI3TxnfBWvrlguXKTiIhmXzNE
         zkjDzK3hd9E92EZZy5YtlJWyimQMZdb9KPoVW+KboVdViOomgPmavpOrQU58yoFBtjy/
         1tgBZ21RJCmbWcrv/oyPx6idIhmASU8VY/eT6yLrBrrE325wgujWjl2ZEChkhEHtEDEt
         W482z4cQtG3aK5d/8P4tkLQVhe0kaPF8/4iLXGlC3+k8wEGqE4RXbOcX6g95d8D5ffHY
         ABkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yn6GZCWwPXZqZM3ZwqhUpA0loC9h1KO7LziClj2r/4I=;
        b=K1WOqMo428ZjDNiKcAcfiSw8NjYJrG6d80A8ErMLDo2K0BLdm/gpfIItDbM1OCud9s
         HcjwjF3i/AN0vEOcx4mbKaZqQfi3BDZDj2NvTiyzDSAqLgl6cfD7nq1uC+mHVbIiHMap
         8NEXU7+2/jFL7AzBQbRJa1BwrBX1uLjNWohtrvfDeVgs0nzSzdjDnyHpIue4sru6kPRQ
         z2fXCxKzezAzP28ey24iRZn85RedweRFJNESTZnaUV0+yFzcsOGiNaz9Hc+HePnuOhHw
         YtqfWLYsEKO8gwgg/jBfiV7J1E6G9EVneaIjM/3P7OpMBEuafTdBiAZ5rBigeYTMR4yd
         kIfg==
X-Gm-Message-State: ANoB5pld4E9ucCSGS3ibmy5Bli5qhAQdNgSy5Z52Yl/Ik1BoqqoXKGf8
        x82KXNHpRbi55kNSRD51o0y+Fw==
X-Google-Smtp-Source: AA0mqf5jveybit0QYnpjw8oZu8ex8iNXLGXPpX5vEsM1KjR7v3HOvrkmgkQoVlFDV/xyYlpW+Uu4iQ==
X-Received: by 2002:a05:6512:1082:b0:4a4:68b7:f884 with SMTP id j2-20020a056512108200b004a468b7f884mr7747796lfg.40.1670862948868;
        Mon, 12 Dec 2022 08:35:48 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25b10000000b004acff58a951sm29209lfn.133.2022.12.12.08.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:35:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] ARM: dts: qcom: mdm9615: drop second clock frequency from timer
Date:   Mon, 12 Dec 2022 17:35:30 +0100
Message-Id: <20221212163532.142533-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
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

Keep only one clock frequency for timer, because:
1. DT schema does not allow multiple frequencies in such property,
2. The Linux timer driver reads only first frequency.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index b0fe1d95d88f..a6331e5ebe09 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -84,8 +84,7 @@ timer@200a000 {
 				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>,
 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>;
 			reg = <0x0200a000 0x100>;
-			clock-frequency = <27000000>,
-					  <32768>;
+			clock-frequency = <27000000>;
 			cpu-offset = <0x80000>;
 		};
 
-- 
2.34.1

