Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47F905961C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Aug 2022 20:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236027AbiHPSCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Aug 2022 14:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236848AbiHPSCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Aug 2022 14:02:05 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE70832F2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 11:02:02 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n4so13506132wrp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 11:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=9taDxJULIelMqQsxjJdBGUHZxSA7P+lFOG0ZHS90BWQ=;
        b=i1j/yGNW/OaexzL0RCaLrhFKZK82IHiNdEpDv3e7ITBmfkWUqza9Lq9ZY1dg1Daq5e
         /6S1r8k4hCyJv4RGuySjH1p1j9EheZ+c8ihsxgLy1ep9kw8Fcx9tIrKoFv810Mh3gPaO
         ynvyGpKOlXqMqWGD8o+4vhhNCTzKeabJKQte+cxgfRb1WPpAkH5pPshHVPiNGnvIhTkp
         vYu+q7YYNP9wmLNKx6i+CP9wYKbG0eqwT+EAM1tK4OoeWdv65yZB0OVT8VyKfAuw+v+o
         fJEeTpd/DpOm5LttY86T5fPdANWOnkQ3buY+PHWoVLp9TY7XgmN6ueSqVIP5freLca/M
         wRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=9taDxJULIelMqQsxjJdBGUHZxSA7P+lFOG0ZHS90BWQ=;
        b=U/EWVU1mjP9Kve5uOdCuKc/TyLggqTPumV2flISEsMO/J3LK5ln67y0Mpau7eMQpvH
         YfYGiQjgh2yeSXXimXsnTxjCzyJFk1zQ9U20j3CfstxT+YOlXTueRRgyqd/NZ7QzhUdm
         CeAJ1Z2849ptdGEjfluemQpTTIIpRnxUZ66AFItng8neuEwSGGYKBTtLZP26pQTrTs2/
         vhs/FIuV4xeu7QPfueJjduY4/266vGXZoeGPp/0CTQTfa8uFsKpT1l/TVwIfVs9EQ9Z6
         XEOocwYlASHmKYg6aY/zIsRTgSQtNTVf2409MVZjJVItlMEjqJbNumcO054yizgHECZ7
         HFrA==
X-Gm-Message-State: ACgBeo2vT8sR7DZRYDPYjGesziIQyyqrw1IHqBnsqC1OM9UlAAgaP8B7
        9omjTwmlEJDzPfv/WjZLd2+pvw==
X-Google-Smtp-Source: AA6agR41LIZaaFSqv4A9rwWezva1UDpU7Ziq2uFdF5F/ZoumQh7Wqcz2ypMp/V2M0+u6LtFHscWdDg==
X-Received: by 2002:a5d:6d0b:0:b0:222:955a:8774 with SMTP id e11-20020a5d6d0b000000b00222955a8774mr11798320wrq.129.1660672920757;
        Tue, 16 Aug 2022 11:02:00 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id p185-20020a1c29c2000000b003a4f1385f0asm14383253wmp.24.2022.08.16.11.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:02:00 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] pinctrl: add support for SM8450 LPASS LPI pinctrl
Date:   Tue, 16 Aug 2022 19:01:55 +0100
Message-Id: <20220816180157.6711-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds pinctrl driver to support pin configuration for LPASS
(Low Power Audio SubSystem) LPI (Low Power Island) pinctrl on SM8450.
    
This IP is an additional pin control block for Audio Pins on top the
existing SoC Top level pin-controller.
    
Tested this on SM8450 MTP

Thanks,
Srini

Changes since v1:
	- no code changes only minor fixes to bindings as suggested by Rob

Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom: Add sm8450 lpass lpi pinctrl bindings
  pinctrl: qcom: Add sm8450 lpass lpi pinctrl driver

 .../qcom,sm8450-lpass-lpi-pinctrl.yaml        | 136 ++++++++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 240 ++++++++++++++++++
 4 files changed, 386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c

-- 
2.21.0

