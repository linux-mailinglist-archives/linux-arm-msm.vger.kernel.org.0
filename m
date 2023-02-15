Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823AB697FA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 16:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjBOPkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 10:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjBOPkM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 10:40:12 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F061A964
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 07:40:09 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso1867262wms.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtGI9J/URlQIzhyslQIJ/PtbIdSSsHxe7OMQrunObcE=;
        b=XywXSQatpWGLBbnf+u8TcuVykvY+r6jAMWSv6w7lnW/83eLmPLI3GIitWwEETFfgcT
         +Ta1HrXH24igqMqrnEYiYeSmHPmZ16/LsuHqSZG/GbIdpbid3u74j30hvEn1xON5AdQ0
         q08JmEBI9ZqMEo8PDIBXS82K9/BMgRgXFdBYSTHC2dXk1tV0tNO8+gBQfNcy+bP6oC63
         GG+s/A6W/W0Ghst1NU3wzsx1mmw3UsxV/qYKfDOxebiN6dHQ7Weuulzw7MNBZVbVPB7t
         HyuEiHKWE/s59VzA+I6PR4DrWv9x2+y33cwYirX0CB9yM2kVEayJRj0se6zwiILN9ASt
         CGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtGI9J/URlQIzhyslQIJ/PtbIdSSsHxe7OMQrunObcE=;
        b=TESZBqoLHXObYVQkil5826RtSplJsRKFDC/ydxUMRt6NWoywS6u9d37x9ajONDuort
         HkOYwYTs98XdOqty45CaRj+fPCRDn98tktRI2EkWBMQA7LYBBg9w2/CE8Iu7b/MkvMbh
         1stlBP7uUwqwOAnD8DDMWgdBrGZdwr1XJ1FrkcHl1rNn7wGSXiIIIEah3801V1WoDKtZ
         zen4ZJIQCKHWS7pT7O/XjJ3baaYZ4fKDRvndIHV8b+LnGU9snhdoFqJ+cMu7lcNRD3Q1
         zBUhmrpvXb3inr1mPVeH80HkGhiH03vfjvjFdkoc03uYBwo4yW2IjozudjAte9VCmuiK
         1i6g==
X-Gm-Message-State: AO0yUKXZnyxQ6Dv/5R6LUsq5QyAFg6g8Xx4xUJb0R99T5ybpdlm4iC12
        Y6WRVvrLSgtlW7pcX+z/Pa9zFg==
X-Google-Smtp-Source: AK7set95w/zG5u61+FNnYv5RUlfIseziLuMFGGTLdZmQSPq7E1qnaOIyhOgeJ7RFGm4KwjY84mBjOQ==
X-Received: by 2002:a05:600c:180a:b0:3df:e41f:8396 with SMTP id n10-20020a05600c180a00b003dfe41f8396mr2327708wmp.37.1676475608523;
        Wed, 15 Feb 2023 07:40:08 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ea02:3f39:48c0:67ce])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c191100b003dd1c45a7b0sm2808877wmq.23.2023.02.15.07.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 07:40:08 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: sa8775p-ride: enable relevant QUPv3 IPs
Date:   Wed, 15 Feb 2023 16:39:58 +0100
Message-Id: <20230215154002.446808-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This enables the QUPv3 interfaces that are exposed on the sa8775p-ride
board: I2C, SPI and the Bluetooth and GNSS UART ports.

v1 -> v2:
- uart17 is the Bluetooth port, not GNSS
- add uart12 for GNSS too in that case

Bartosz Golaszewski (4):
  arm64: dts: qcom: sa8775p: add the i2c node for sa8775p-ride
  arm64: dts: qcom: sa8775p: add the SPI node for sa8775p-ride
  arm64: dts: qcom: sa8775p: add the GNSS high-speed UART for
    sa8775p-ride
  arm64: dts: qcom: sa8775p: add the BT high-speed UART for sa8775p-ride

 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 100 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi     |  87 +++++++++++++++++++
 2 files changed, 187 insertions(+)

-- 
2.37.2

