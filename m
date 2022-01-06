Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D44E48688B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 18:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241942AbiAFRbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 12:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241894AbiAFRbs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 12:31:48 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E51CC061212
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 09:31:48 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e9so4696902wra.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 09:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dkvyhO6hJ0wvUK/T32ySbQpnfAXyEhGAp68FW2iN8Bc=;
        b=sPbhahkc70MjDaDWZtVKd5uyYPFnyqkebv/WA+WbNFCrElp+YeS8Q/7nukv8MJ5eV4
         xsRbH+NlRFD+tx9HFPAOy5ABjKRkstViWfZHh+xQOmeL1hWYr604YayQ5qV4WS7L0GC/
         S+Mlt43i8W7hxT/gjCisF7PjVOhP+NNS/vocqO8tzJZz0Wjqsh1Q3yj4XG2hTQ1lfzHB
         XQs9Zu86ttxw6MgMCsZ0A0Ao19n2ru+OiT3bcbYKuo6vuUYHcM6J0+mW8em9YtA9nYXa
         JkIdHyEwqnXw3jEcERwuqQQx9zDtjs65kXE3wc4N5HhNtJd49SSNEQzUK6Dz/YhkVBKb
         ULSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dkvyhO6hJ0wvUK/T32ySbQpnfAXyEhGAp68FW2iN8Bc=;
        b=AzbsDP/hZGEqq9/4dGFEWrGHdby7SK+CI/H4dqi4oCSOJhEXd92n8faH3TEP8VOwyc
         w/qarBbopPFdefIY9bM5sL8GytRP4Gj3IcTjSv/FRYv7uPgqPHqyUvRn/VdP2ZHIKNvk
         n9N77TvusZdJ/FrwchiGGBOIL/Zt64Ffrx/hpWkB9GU9q4rPPCVNfOAFilm7x7fV+7mK
         WxD8KYqYij8VdpGttaGNUL/NiD0PJeFOx4Ynz1qhfMOArVofTs1igQsIJnzPSiLEQWdr
         jpfyQTGTXDDU84KWo5uXNWNiDPkQFgKCQcljAoUlre5MJeLHf3gPnLgjLcFAA9UWqZgo
         MyLw==
X-Gm-Message-State: AOAM532q2iJcfDmDNPFZ7u3WaKu1wsca8W/7u3+4t7PUtBkv6tCx6SA0
        9JkHZG6DRA1g5BdG1fuUfxByVw==
X-Google-Smtp-Source: ABdhPJwU0MWrOP33qrBEeDQX1h3YbvV3GD7GOCTJ1TluDAs3DSWjtp2vBbsMGsgaUjw+zQGvIyQAJA==
X-Received: by 2002:adf:a40b:: with SMTP id d11mr50432985wra.209.1641490306821;
        Thu, 06 Jan 2022 09:31:46 -0800 (PST)
Received: from localhost.localdomain ([81.178.195.252])
        by smtp.gmail.com with ESMTPSA id b16sm2575594wmq.41.2022.01.06.09.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 09:31:46 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v3 0/7] iio: adc: introduce Qualcomm SPMI Round Robin ADC
Date:   Thu,  6 Jan 2022 17:31:24 +0000
Message-Id: <20220106173131.3279580-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RRADC is responsible for reading data about the current and
voltage from the USB or DC in jacks, it can also read the battery
ID (resistence) and some temperatures. It is found on the PMI8998 and
PM660 Qualcomm PMICs.

The RRADC has to calibrate some ADC values based on which chip fab
the PMIC was produced in, to facilitate this the patch
("mfd: qcom-spmi-pmic: expose the PMIC revid information to clients")
exposes the PMIC revision information as a struct and registers it
as driver data in the Qualcomm SPMI PMIC driver so that it can be 
read by the RRADC.

Changes since v2:
 * Add missing include (thanks kernel test robot :D)
 * Rework some confusing function return values, specifically
   rradc_read_status_in_cont_mode and rradc_prepare_batt_id_conversion
   both of which didn't correctly handle "ret". This also bought up an
   issue as the previous implementation didn't actually wait for the
   channel to be ready. It doesn't seem like that's strictly necessary
   (same data is reported if I wait for the status to be good or not)
   but I've included it anyway for good measure.

Changes since v1:
 * Rework the RRADC driver based on Jonathan's feedback
 * Pick up Rob's reviewed by for the dt-binding patch.

Caleb Connolly (7):
  mfd: qcom-spmi-pmic: expose the PMIC revid information to clients
  dt-bindings: iio: adc: document qcom-spmi-rradc
  iio: adc: qcom-spmi-rradc: introduce round robin adc
  arm64: dts: qcom: pmi8998: add rradc node
  arm64: dts: qcom: sdm845-oneplus: enable rradc
  arm64: dts: qcom: sdm845-db845c: enable rradc
  arm64: dts: qcom: sdm845-xiaomi-beryllium: enable RRADC

 .../bindings/iio/adc/qcom,spmi-rradc.yaml     |   54 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |    8 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |    4 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |    4 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |    4 +
 drivers/iio/adc/Kconfig                       |   13 +
 drivers/iio/adc/Makefile                      |    1 +
 drivers/iio/adc/qcom-spmi-rradc.c             | 1070 +++++++++++++++++
 drivers/mfd/qcom-spmi-pmic.c                  |  108 +-
 include/soc/qcom/qcom-pmic.h                  |   63 +
 10 files changed, 1272 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
 create mode 100644 drivers/iio/adc/qcom-spmi-rradc.c
 create mode 100644 include/soc/qcom/qcom-pmic.h

-- 
2.34.1

