Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0A46FB499
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 18:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjEHQE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 12:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjEHQEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 12:04:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EE25B91
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 09:04:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f11d267d8bso5268384e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683561888; x=1686153888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38AF8nxzOttpxjGEqN4XiKny+LIjfNIP7wF2d4kn7Y8=;
        b=E5vNHeWDkMnvrPEDlrca3wB2OK03eO31HFXQhFGg9xXk1TpMVQVTpKK1+EETWkQuLb
         ONXMtG97Y9R9cexLAVh3vuei7SVsZ5mS/Tvl3nKwS8oNd9CcYxrA4KLUxq+2WPp0C9rx
         Wws/71xPGXLGs/VCuLr1LhBRmMkpo4tmFYfk9NJqiF7XzDo2G6bHIQCSklOpLVmMAbr3
         wmn4UXlTDnexPxUdEfTpc7k5ENgrb2wrFbOST16H/DT/7zxINl51L2ue9CJ7UuvHajow
         wINK9asyWr1DxMbslPqUV68AffAX4P5NShrjkvRFZk48ncINuSrbjZtnXMT/7FwZYrSC
         iaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683561888; x=1686153888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38AF8nxzOttpxjGEqN4XiKny+LIjfNIP7wF2d4kn7Y8=;
        b=edSrMBzzBlRlzIia6mP/aYO53T+VmRWppLJ2yoeOoL6NHGL7llSEYKYUtRKFGzJUk0
         INczvPSPrncMSJ8Rgpo2uEzXOLM7UQ5pa3dguHzJx1iLKmM+DmMoz9JKNJ4yctgu3pkz
         ECG6+w42Is2kTh6aVOS9V/cijf4ZTXrssxumYRAogbgZOWzEDGUUH2hkbeOPJcNwKFkd
         I537gr6Lg9jGm0mwhrJ9L+lHFx21vsmU+7UJNheGjVHOUYL8jFALOeHsfEbH/kQaPJCP
         Nf+G0wfZzY+LH63673oG04b48MG2mBKOkodCvgkew8aF8d5Mioc2sT+ERw9GX6TPiHI4
         Dx8A==
X-Gm-Message-State: AC+VfDzwPnQzdrYJjknPjjHGsRANlB/3wny5zMfL1iPQsi45B058MxOT
        ej663w25rV5cfKZJlTwP3v5/0w==
X-Google-Smtp-Source: ACHHUZ66YitfnJd8D2n3isV7TMX2yXp5JnKySLqANxS/X11ZnVoFFFoBeUeSuCjBDXw2UxGRmWiQzA==
X-Received: by 2002:a19:f80c:0:b0:4d5:ae35:b221 with SMTP id a12-20020a19f80c000000b004d5ae35b221mr2433424lff.34.1683561888223;
        Mon, 08 May 2023 09:04:48 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id h3-20020ac25963000000b004eff4ea8dd3sm32372lfp.76.2023.05.08.09.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 09:04:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/6] ARM: dts: qcom: apq8074-dragonboard: enable additional devices
Date:   Mon,  8 May 2023 19:04:40 +0300
Message-Id: <20230508160446.2374438-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for buttons, LEDs and coincell charger found on the APQ8074
dragonboard device.

For PM8941 we don't have a defined field to store the reset reason.
Support wrapping pwrkey and resin, but without writing the reset
reason.

Changes since v1 (noted by Konrad):
 - Changed to use freshly defined qcom,pm8941-pon compat
 - Fixed indentiation for LEDs definition
 - Reverted the order of pinctrl fields
 - Moved status field to the last position
 - Removed unnecessary pinconf indirection

Dmitry Baryshkov (6):
  dt-bindings: power: reset: qcom-pon: define pm8941-pon
  power: reset: qcom-pon: add support for pm8941-pon
  ARM: dts: qcom-pm8941: add resin support
  ARM: dts: qcom: apq8074-dragonboard: add resin and gpio keys
  ARM: dts: qcom: apq8074-dragonboard: add onboard leds
  ARM: dts: qcom: apq8074-dragonboard: enable coincell charger

 .../bindings/power/reset/qcom,pon.yaml        |  2 +
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 69 +++++++++++++++++++
 arch/arm/boot/dts/qcom-pm8941.dtsi            | 22 ++++--
 drivers/power/reset/qcom-pon.c                | 22 ++++--
 4 files changed, 103 insertions(+), 12 deletions(-)

-- 
2.39.2

