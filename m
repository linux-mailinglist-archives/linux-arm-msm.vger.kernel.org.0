Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0FFA2F98FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbhARFKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbhARFKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:10:52 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2A2C061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:10:12 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id v19so10188438pgj.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TBFKvEViSzsnkhTUaK26kgYhSJiSapZbq1GrP6ltSkU=;
        b=bdjBgZ/xWthWJxtsVEs338z/u3+ew991NPsNP4ScRtWBojK1/Jc6Xjd5T5SdPECEeU
         CqI4xSv5HKtpl1i1dglW05XqbJp6MyDL61JasQn/HFKumouCb7LKBwvorboouIsMeAEY
         rcQTqQsjk//WxpRe6BJ4de+o2yHniqJhxSHt83DkEKDmwwMO9TY/Y7r+Ao3bgNvdGOZL
         6j/oBxxvKeGCd9EdOjL6AvDdNh9n7ILX0myK9uKr+AYPV7aFtZadITNm33IQjFQ5tilt
         4UOtVB6jIIjekIWZMsjBEZTCXegSFKt3rnyKveBdGVw6XRCxPS59jGGaKe5Kqjz484A3
         u+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TBFKvEViSzsnkhTUaK26kgYhSJiSapZbq1GrP6ltSkU=;
        b=XtOye6mUgezSGr/do3Nm66x/CmgJV0d4srP9eJkOH1cfND2Cb+KBalrkrNkx2xK1bb
         1v1/3Fq/xm11/BThhbuuGi2i11lU2TuFfu5xDC3WBTpCWRu1fh3LdBQIwU12cUKoZR4H
         DJGgcr2McBsqx6EoSQgFe7P1r5lHv4PpWbMoS50hIvd/FpC1IdI81Y1LaYKyZwbuw5Z/
         vMiUluCwAUFp7ja+h0pd37n783am0Dgbs0QyuT5oB/NlIeWDJPdjX+ev32Esy5sl7WDb
         tMQ6vvupw5TssJS58SvLtWGFWtMAMVVBCTI5NbSjawrXmQuIJwADMJU0U3ZXvU6P+zq0
         egBQ==
X-Gm-Message-State: AOAM531QDBfYOyCA2BDiTlLoKGUSIK9fFD8y9xoTggGlaFyMfViUY2YF
        mJF6x4hG2sMrCf0D8XrFXM9H
X-Google-Smtp-Source: ABdhPJyD4TyarXykMRw8mowcqYmFpA1pQ3d0JkcxAqJJ+Gew4jI+HsJ0vPyRiKydzOE25A/v3TzLhQ==
X-Received: by 2002:a65:64da:: with SMTP id t26mr24487467pgv.145.1610946612105;
        Sun, 17 Jan 2021 21:10:12 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id j3sm14703571pjs.50.2021.01.17.21.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:10:11 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/7] SDX55 devicetree updates - Part 2
Date:   Mon, 18 Jan 2021 10:39:58 +0530
Message-Id: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bjorn,

Here is the part 2 of the SDX55 devicetree updates series. This series adds
USB, watchdog and pshold support along with the relevant bindings. Also, there
is one cleanup patch which fixes the "dtbs_check" warnings for thermal zones.

The binding patches are expected to go through relevant subsystem trees. If they
are not merged with this series, I'll submit them separately.

Please consider merging the DT patches!

Thanks,
Mani

Manivannan Sadhasivam (7):
  dt-bindings: usb: qcom,dwc3: Add binding for SDX55
  ARM: dts: qcom: sdx55: Add USB3 and PHY support
  ARM: dts: qcom: sdx55-mtp: Enable USB3 and PHY support
  dt-bindings: watchdog: Add binding for Qcom SDX55
  ARM: dts: qcom: sdx55: Add Watchdog support
  ARM: dts: qcom: sdx55: Add pshold support
  arm64: dts: qcom: Add missing "-thermal" suffix for thermal zones

 .../devicetree/bindings/usb/qcom,dwc3.yaml    |  1 +
 .../bindings/watchdog/qcom-wdt.yaml           |  1 +
 arch/arm/boot/dts/qcom-sdx55-mtp.dts          | 29 +++++-
 arch/arm/boot/dts/qcom-sdx55.dtsi             | 96 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8150.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi          |  2 +-
 10 files changed, 129 insertions(+), 10 deletions(-)

-- 
2.25.1

