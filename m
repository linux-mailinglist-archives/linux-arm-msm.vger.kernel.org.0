Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 669FB4B43E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 09:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241866AbiBNIUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 03:20:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbiBNIUA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 03:20:00 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59D625C42
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:19:53 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 66E75407D8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644826792;
        bh=twEcMK7D4MpQMmFx/xz45Xek8jdGQn3r+1Fp5P1lKZI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=TeG/jb3lwXluq02uJzsB4g9rDDLf951RPp4W9Ai2gjjj95POLOsRyAPZ+bRtMR5Go
         FPH7nI1mF1W3j1dggfdnAaIcr5Gzfld/EckrP+ClVCC8JQWKXNw9Fews2Dg7kTy+Eb
         Pa5CnT0pezzQEb3JDGxRPIweXCP0k6XlCOcyyvg7KXxg4eC9o39uh93oXkyMJaa7mB
         fhXZAgSoeIiLpDMKLlHHQ/7N9QcrG2PH6Zp97O17ajgw3+wIWrqQBp3lrfP0TBcxuQ
         vOpmJs52ztMtpbqkbZbsTBkH6yrdVVbaIpRynKxitqS87VxAnN4+b3c/3mhipur7vy
         mv6Rja+7WhByg==
Received: by mail-ed1-f70.google.com with SMTP id z8-20020a05640240c800b0041003c827edso8126948edb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=twEcMK7D4MpQMmFx/xz45Xek8jdGQn3r+1Fp5P1lKZI=;
        b=Br2uMTzC1FOn4u8aiZiUYJHHkDM8zked7yOdPeD8VIbu2U2VpZxQjtUOko9M4V+Iix
         hpGG/2KW7hSIGgZ4fSpbpulQo6RHulYx7OzSTwcMRVhL3Q79bH3kZJ0HR2Q6bbE4qiT/
         4+nOwcXS1FMZFbxYkLyRiSU2VTs/V9RQnIOhaHHHivIVHGesXk8vopqFfoJGMUyN1Vsb
         4AlV9cYdX6X3bGfZ+LQA0vxc/BxoK/z3eo31HUxCVddfiGz193aoZcYpFnEw/BB+xhJR
         EVmyG/s9sMiPIJS6ZtfRGvZjts06vT2RUI4WLUol7wiSo5IMH0V+aYexOiqDaOIWwDSD
         VvtQ==
X-Gm-Message-State: AOAM533I3NWx0tFlVmlYvktx/b7dHhRDpuWMar87wAjGcAzvQv7HX5g1
        cV53nikFRTKFjl+YjSx9l+ct0QTKdBYbr9eUMP3iSwdOELV8kYQbPH0OUvb+sFCGBCNWHbkXPLD
        myBPVj8HhCciAxFQNKl4pe/ZvHukB68cUgcj/zwdSLBY=
X-Received: by 2002:a05:6402:490:: with SMTP id k16mr14100033edv.204.1644826791990;
        Mon, 14 Feb 2022 00:19:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2KcC8ZeDmmjUgfK6kq1aeD1UrtI7pu7omHRR58fZiRCylZRo2PHSaI/KjoBiBhqpeH5FfTA==
X-Received: by 2002:a05:6402:490:: with SMTP id k16mr14100021edv.204.1644826791865;
        Mon, 14 Feb 2022 00:19:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:19:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 0/4] mfd/pwm: dt-bindings: google,cros-ec: include generic pwm schema
Date:   Mon, 14 Feb 2022 09:19:12 +0100
Message-Id: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

DTS patches are independent. Not tested, but I really hope no downstream kernel
depends on pwm node naming... If it does, please change it to compatible. :)

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: pwm: google,cros-ec: include generic pwm schema
  arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
  arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
  arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema

 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
 .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml          | 5 ++++-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi      | 2 +-
 9 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.32.0

