Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E252674C0D5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 06:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjGIETd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 00:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjGIETb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 00:19:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0291E48
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 21:19:29 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f122ff663eso5158751e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 21:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688876368; x=1691468368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EV4gjfG2h9+eMvOMzJqwLX08mwvLdctC3KQGCJDlteI=;
        b=oUe1HSUEOwKt3tiPcKQxZTqky8YJ/J+TVVTVJj49EcfWUiAmpnIpIL4mSIlM+26kN1
         7FytEkFeH+4Dk8yENbCXnUWqPEujUkFqs8dkiJ34/aNjAc75DlS/CZH+/AyUsm0JNMW/
         tbREqo3Bq+zUlRHLAvNnXxU0ZwRfPWhQta25cLhr+QrIhmcb2PX4p80IfDodhXaPBTiX
         /PNWNGwg36b6LybvKeFPpCQE1IFLxwV84klPqcxO68hzFf7D6tSmGwmfE09sVu3YrUPY
         tr76tP/441urfBW1eIl2NKwvZEQECSL6WTNVQhQZQ3iJFhZ9UbS8QE4FiIemR42K4C/V
         IV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688876368; x=1691468368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EV4gjfG2h9+eMvOMzJqwLX08mwvLdctC3KQGCJDlteI=;
        b=MreVYphMhiKVYJlpcV7kqt9NRlaUrlC+NekOuK7woibH5VyGBjiRhD9L4PulJ42gf7
         M6t0Nc1qP0LGI1Yem6a9U/2joHOooSM27WD9G7UuXjP0kolwTwu0ViWLGYtmnqCJt8a0
         MIoxvWh62jE+QMm1QFY0vwTCTo7uSIHMZonQe8ZXiY/Zy1kwDbxOZRk0ekouWO+/G/zm
         K3ytNxX7o6KL05pw0mYgkDundWp62JK3KztlhD4Sgf3THQewfqvwFbBHco/ZdzA1i+gt
         ox/LfjwzoH6IiJXJu5WdJG0a2CnccZ36afQLruZrHoQxpRo/mDWJMQA2StxAzkNiBq2C
         P2Ww==
X-Gm-Message-State: ABy/qLbQdQYQ4sc1gbsV3BM/iY95i1TH1uZpajG2HDLiVDIhbmFXoFoP
        q1ebUbkuwY2WZzF7VCVy6bjEkQ==
X-Google-Smtp-Source: APBJJlH1hMwnX24K5ue0eNJ38qb9anodescAmVYDk03Umy+uJIqB4CCuAZUizF0XtCaD0pLclhdRKA==
X-Received: by 2002:a19:655a:0:b0:4fb:7cea:882a with SMTP id c26-20020a19655a000000b004fb7cea882amr6224939lfj.3.1688876367751;
        Sat, 08 Jul 2023 21:19:27 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 21:19:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Date:   Sun,  9 Jul 2023 07:19:21 +0300
Message-Id: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement DisplayPort support for the Qualcomm RB5 platform.

Note: while testing this, I had link training issues with several
dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
or VGA connectors) work perfectly.

Dependencies: [1]
Soft-dependencies: [2], [3]

[1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230709034211.4045004-1-dmitry.baryshkov@linaro.org/
[3] https://lore.kernel.org/linux-arm-msm/20230709034808.4049383-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (5):
  dt-bindings: display: msm: dp-controller: document SM8250 compatible
  arm64: dts: qcom: sm8250: Add DisplayPort device node
  arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
  arm64: dts: qcom: qrb5165-rb5: enable displayport controller
  arm64: dts: qcom: qrb5165-rb5: enable DP altmode

 .../bindings/display/msm/dp-controller.yaml   |  1 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      | 72 +++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 93 +++++++++++++++++++
 3 files changed, 164 insertions(+), 2 deletions(-)

-- 
2.39.2

