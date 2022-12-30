Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C41B765992C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 14:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbiL3N5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 08:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235234AbiL3N5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 08:57:04 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC4E1B1E7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 05:56:59 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 1so31825704lfz.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 05:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp9/s8XcL0YdBuoi+jisb8bsx211FBUuKCpaqFKJu4A=;
        b=YPZmLIfjbQWjQQ0ptB1Mmfqjk9auW+aqx1qDx/JGKmI+egvoVhPbY+aYNspz7ZMAit
         1yi/6TFcsvtqqWBn9ysNy5xnvSrEcOGPQautwmCmmmiMl88Rj2B8+sSDdfGBytO1DxiJ
         ixo5lfXBy71OQuD8rdR9W96JGXhwsk6Z+/b8hM+8w52hnnXI6QlxE1BnATfI4E6xkxAt
         inuLeds1C109J1cPhTD5NQiP74mE/uX0RkaSbNMcx2xBCrsUVAMDY751P12DySiaAHQK
         ZDf60RfdeRxlfS89Lv/U5/VIbPeMRioLuwIlkdAh9kEnDyD7j/S71aCe65eM2YKx1Hy1
         uXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp9/s8XcL0YdBuoi+jisb8bsx211FBUuKCpaqFKJu4A=;
        b=PwzFlAtgQ+MgnoCvlZ+xYVCuonMZswulEXeIrNs/2y9OMyKZ4VlLM3GTcvdUsGqUOs
         vZhq1dmnnd5Gzt9YEeFsYyNBbjajh5J6ZsMJpLHeY/T+t8xe/N+rK08eZArdL+O6NRka
         vraUeaEV1j2k9uq+KhFBJwZYSpfYttsZJHYnKW4aLZt/hPBGz6zZXZO2czWDEjbrB3ax
         37OE7b5rL5Wi5iWustRbirJb+twKSDQxS1d9WBN2Q/PxZxn8SIdn9JzjJzqBQtdJ0OE5
         Xo8nIXoQK0xV3MCstMvb5LEIJmasFxaAEqMD+RwKm16a7fiaEBcOVBkYwXei4+GtkK2l
         VLMw==
X-Gm-Message-State: AFqh2kqLCEh/wcLJxtZQT+2oAmmg10HAWEa7/bxDUQ6auWqTbBhNMMSm
        9gIdutMgjJ/ZAm5mEwBt8KC0Og==
X-Google-Smtp-Source: AMrXdXs/UgZBZEu72sGwNZexPHK2xXzY/zmUTOhC2nyM7o/gONDppRlsn8lmQ3nsWqs1mnqZx47abw==
X-Received: by 2002:a05:6512:529:b0:4cb:1438:12d6 with SMTP id o9-20020a056512052900b004cb143812d6mr3465362lfc.8.1672408619548;
        Fri, 30 Dec 2022 05:56:59 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d9-20020a056512368900b004a26ba3458fsm3454787lfs.62.2022.12.30.05.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 05:56:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 9/9] arm64: dts: qcom: sc7280-idp: add amp pin config function
Date:   Fri, 30 Dec 2022 14:56:45 +0100
Message-Id: <20221230135645.56401-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
References: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect each pin config to come with a "function" property:

  sc7280-crd-r3.dtb: pinctrl@f100000: amp-en-state: 'oneOf' conditional failed, one must be fixed:
    'function' is a required property
    'bias-pull-down', 'drive-strength', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index fa10dddadbb0..43e61a1aa779 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -732,6 +732,7 @@ &sdc2_data {
 &tlmm {
 	amp_en: amp-en-state {
 		pins = "gpio63";
+		function = "gpio";
 		bias-pull-down;
 		drive-strength = <2>;
 	};
-- 
2.34.1

