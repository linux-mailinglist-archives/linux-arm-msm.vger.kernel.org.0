Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCAD669688E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 16:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbjBNP51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 10:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjBNP5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 10:57:25 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC5A27D69
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 07:57:19 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id n33so5276613wms.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 07:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGuGfHn3J9s0ZtjyYXkFfZ2cjjekHbVfFQdYc3NMqak=;
        b=NhT4OBCiLxEhUcF8MOtxzPyCwiafSGWLVe0SXj+tVFMyvTgNOAy7fj4EkFTDDANFQO
         5+k+WI+s1SSoBiUbwYAktT7ud1HjucEbRwt2UiyMzgfIDPhbykLsiEPPkd8fSWgMM+Ax
         Ux7GHTiCwEKkcX0+pvJANOq5VoTh/vvSLKhdNJviJO4/JyIznQU1Vi/5yqmyq22fSD5V
         wcCJ36Nm0003gH4PRqnjFkpS4XuM69GNMGZm2UAL17/QCl2vY7P+l+W8HQ88lDdgyGks
         pU0u1onrcN8KNk8zUcUR5ZELYqWveWSnckvGvg/rHkxRNoLRi4KreFjc3jghLvYrGHwe
         93fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGuGfHn3J9s0ZtjyYXkFfZ2cjjekHbVfFQdYc3NMqak=;
        b=3Ue6S9+qgpbpq7fwfeEMf7s5Zm5mBmPk2f+L+WMl246PhnHhZiClAoO/11LLj1ME58
         Y6JcGCl4k0aW6YWSr+9jb+xjdBOK8SfWAfBaK1DdqB7anOX8t4XrxCibSYGld7fDXQVk
         YBQnCYjD4vTLYPc95YUGpD8pUkJ9RgLX9Khv5iU2mLTGfmmUT0jUJ80ayNR1Ll2jQA7a
         h3T2OuGC6p8nB4W+tilx0pY0XC27hT/sz1tWebjfv9CEil+5dIiSdtaGrdhYs1yWRZ/K
         ZJIVVhfTkUxLrZJfnJ5K1rDOf3Fci9dczsOe+63Sc2iBsBF8lU0FxCcl3POjk0fHQQc+
         yYLQ==
X-Gm-Message-State: AO0yUKUHf/biTHisqm9VS7cHDIAaMcPOHI9B3T7J2kHrs5j1QeyDMmU3
        DzPGyNzkrfdeNjw8nsjM+ACtSw==
X-Google-Smtp-Source: AK7set84Sy4sKmlbUjaRMkgfOSvVMO4JAXOv76idzk0jA3ms3111fOFjvGKc0nN0hjTCt2E2bUH7jw==
X-Received: by 2002:a05:600c:45d2:b0:3df:9858:c02c with SMTP id s18-20020a05600c45d200b003df9858c02cmr118113wmo.1.1676390238038;
        Tue, 14 Feb 2023 07:57:18 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6e4b:bef:7edd:1af1])
        by smtp.gmail.com with ESMTPSA id x2-20020a1c7c02000000b003df30c94850sm20451924wmc.25.2023.02.14.07.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 07:57:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: sa8775p-ride: enable relevant QUPv3 IPs
Date:   Tue, 14 Feb 2023 16:57:12 +0100
Message-Id: <20230214155715.451130-1-brgl@bgdev.pl>
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
board: I2C, SPI and the GNSS UART.

Bartosz Golaszewski (3):
  arm64: dts: qcom: sa8775p: add the i2c node for sa8775p-ride
  arm64: dts: qcom: sa8775p: add the SPI node for sa8775p-ride
  arm64: dts: qcom: sa8775p: add the GNSS high-speed UART for
    sa8775p-ride

 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 67 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 72 +++++++++++++++++++++++
 2 files changed, 139 insertions(+)

-- 
2.37.2

