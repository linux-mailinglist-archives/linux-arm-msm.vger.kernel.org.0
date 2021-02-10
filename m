Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0B8316820
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 14:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhBJNhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 08:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhBJNhM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 08:37:12 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E91FC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:31 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h26so2949164lfm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OK81w0okvWHHaNk33KPEVxuAuHEks2VULF6WHJpPdmo=;
        b=aomtJ6dKVSAxJQLIJIpM50sPT+jK6z05EScfUENIyyebvSIRY0ZYjvFUk7KBUsVLEf
         afLyG9MbzA08jToVYmWfQjprMfHkiwM32aJuWrsUx0B5zZ9VvV+1CGFI4bK3Abd6xURY
         6OPuf8lix0u+9w8f5kBMbsU5dIA42Ny+KjPOIw14S3qi06M2X6613wXz4rKvIu5+TP3H
         reF2zB/KpoPSmmviVF31rKtFgTh1sbDoqJ/k0KdcSh/v7JoUc49ijEeh25K7r5rUp7ay
         8XTN6AMEETuXjusQjM5mudlxKABAaVswKd+0EwWe7yc4t1SegpV3gcROEPI/6DmOkZCQ
         iMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OK81w0okvWHHaNk33KPEVxuAuHEks2VULF6WHJpPdmo=;
        b=VKSN3SeXNZzw3yPd7rba26kqzwBvGUiYbG9TM2nnsI4VaAOlgy1MG9AYsk6fDEcPVZ
         p1qG36XbDTOauvOKAo5ryB6qwCClAq98iDIV30NyG4coOUFY8VDk9A9XVVTLs99yarDN
         j/hhii80upyrc0wZgKaE+kjEPFyuCLGEGOBX3ym/0KHH7LU3QXzOMouK9FJTrZM9BYRL
         d90T8MW4ri5rId4f6j/+Ei1h8ERINzpEcIOD4WS1SDR5DyZyoV8QdGuHDjDAyB8FZrKz
         f8zJnfVRyo0nT5jJtDvmnrqJjI9Fk/G7vq9y9F/0A44HxO/S8CZBPL4EgHIFrMwRcDBD
         h9oA==
X-Gm-Message-State: AOAM532lZORBVXOGuwUK8Qlq6LHh5XavyWt32jFj0+an9gwbM9bcwiKq
        YE/VkBHlSQtoDqnBk+VOgkieRA==
X-Google-Smtp-Source: ABdhPJwGXteGUlXZRdHRhZcaCSl67Ca6QuKZ0PVvy756k7LciH0/MnJDGJNHxisljR+uD0olXHdd5w==
X-Received: by 2002:ac2:4545:: with SMTP id j5mr1744930lfm.136.1612964189592;
        Wed, 10 Feb 2021 05:36:29 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id c8sm332629lfb.168.2021.02.10.05.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:36:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: dts: qcom: qrb5165-rb5: use GPIO as SPI0 CS
Date:   Wed, 10 Feb 2021 16:34:54 +0300
Message-Id: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI SPI controller shows several issues if it manages the CS on its own
(see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
use GPIO for CS") for the details). Configure SPI0 CS pin as a GPIO.

Changes since v3:
 - Rephrase qrb5165-rb5 commit
 - Remove leftover  pinctrl-name entries for spi0
 - Group pinctrl entries at the end of qrb5165-rb5.

Changes since v2:
 - Move pinctrl-names to the board file.
 - Reorder CS/CS-gpio/data-clk nodes to follow alphabetical sort.

Changes since v1:
 - Split sm8250's spi pin config into mux/config parts, split away CS
   handling from main SPI pinctrl nodes.

----------------------------------------------------------------
Dmitry Baryshkov (4):
      arm64: dts: qcom: sm8250: split spi pinctrl config
      arm64: dts: qcom: sm8250: further split of spi pinctrl config
      arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
      arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |  14 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 540 +++++++++++++++----------------
 2 files changed, 274 insertions(+), 280 deletions(-)


