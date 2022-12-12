Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B16649EB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 13:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbiLLMdr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 07:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbiLLMdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 07:33:22 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0860510FEB
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:33:21 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id fy4so11583567pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iGi/0ZZ+vc4iAtcuWt8z9nWG7TbhSoTIkcPUXrevRhg=;
        b=S0YmWiQ5kBfkN9C3UpzdcfTJZbyqaeWyCehKwvetGznDI982bAfbU+TlbBOLkrwoiH
         wkv98IXhSJcagT5xDXRDTn4he3qqUUoZcpszeIlzwSE4KmLqM5vx+ZYgl9WmwYYS/x9Z
         g6ReqxkIXK0B4zVNryiiNhZs2DfL26V3AYXbpGqvlZr+zjTc8nJYbgAhlQyG9HHZJRCD
         GeTLSgr/CuchT5qeGDewKyo3TVt2K0sgcJDo4CZFjFQeYpXDXHXhe5ccbLWUJMSNBbL3
         3B6/qXDrVu/SaprLSY/YXUZp+l87GasVlVfHCjofZaLQMrvsbfHpVoMHstO40BK4Hhzl
         ertA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGi/0ZZ+vc4iAtcuWt8z9nWG7TbhSoTIkcPUXrevRhg=;
        b=P0i2uGiiJMb35HDbAGG3c8+XxChYvLp0AHNOws97HxJJbgw7TNjVa2IQq+SwL6X5Ww
         pHpbQKZOXEG1Ey1HuarWNeMXyyCCXuPYI5JsMtYkorOTWYyxD1S649DXLTuNJcOS5ddX
         jdkpi3tWecr1arNGxo689/ppXKSH9Rgyhp5o/JmJFkAUUqoVKwSKcHxuSZAfpAIi5iqP
         a89qIS0lPp2i9G4JqAq7Rlln8Io46kUDwvGWrfUyi/84xdkHQDS/pOKYVSIX9ZFdN+SK
         Bk9wmwoNlPUt91xSfqpKvM8CO9UyiEygB9UFnO8P0VImxROTpPbLwsan2ot3P9c21Ngs
         HIeQ==
X-Gm-Message-State: ANoB5pn9srFYf5s+pYmv+XAzp09Rd6A/eOytuJPiqMIGa6A+RTu4axGn
        4z8Q42jc+XmQjzK47REO7y6e
X-Google-Smtp-Source: AA0mqf4GZipn+jU2gOJXBOz2ZPxMB06bAfqGIAo5ENag8B8OQ8Uz4ePTdVEfD8k/tVxZnUZvtIxeqw==
X-Received: by 2002:a17:903:40d1:b0:189:dedd:a4da with SMTP id t17-20020a17090340d100b00189dedda4damr19024132pld.34.1670848400473;
        Mon, 12 Dec 2022 04:33:20 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.33])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b00189c93ce5easm6252557plx.166.2022.12.12.04.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 04:33:19 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 00/13] Qcom: LLCC/EDAC: Fix base address used for LLCC banks
Date:   Mon, 12 Dec 2022 18:02:58 +0530
Message-Id: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

The Qualcomm LLCC/EDAC drivers were using a fixed register stride for
accessing the (Control and Status Regsiters) CSRs of each LLCC bank.
This offset only works for some SoCs like SDM845 for which driver support
was initially added.
    
But the later SoCs use different register stride that vary between the
banks with holes in-between. So it is not possible to use a single register
stride for accessing the CSRs of each bank. By doing so could result in a
crash with the current drivers. So far this crash is not reported since
EDAC_QCOM driver is not enabled in ARM64 defconfig and no one tested the
driver extensively by triggering the EDAC IRQ (that's where each bank
CSRs are accessed).
    
For fixing this issue, let's obtain the base address of each LLCC bank from
devicetree and get rid of the fixed stride.

This series affects multiple platforms but I have only tested this on
SM8250 and SM8450. Testing on other platforms is welcomed.

Thanks,
Mani

Changes in v2:

* Removed reg-names property and used index of reg property to parse LLCC
  bank base address (Bjorn)
* Collected Ack from Sai for binding
* Added a new patch for polling mode (Luca)
* Renamed subject of patches targeting SC7180 and SM6350

Manivannan Sadhasivam (13):
  dt-bindings: arm: msm: Update the maintainers for LLCC
  dt-bindings: arm: msm: Fix register regions used for LLCC banks
  arm64: dts: qcom: sdm845: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sc7180: Remove reg-names property from LLCC node
  arm64: dts: qcom: sc7280: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sc8280xp: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm8150: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm8250: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm8350: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm8450: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm6350: Remove reg-names property from LLCC node
  qcom: llcc/edac: Fix the base address used for accessing LLCC banks
  qcom: llcc/edac: Support polling mode for ECC handling

 .../bindings/arm/msm/qcom,llcc.yaml           | 100 +++++++++++++++---
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   1 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   4 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   7 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |   1 -
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   5 +-
 drivers/edac/qcom_edac.c                      |  51 +++++----
 drivers/soc/qcom/llcc-qcom.c                  |  85 ++++++++-------
 include/linux/soc/qcom/llcc-qcom.h            |   6 +-
 13 files changed, 186 insertions(+), 94 deletions(-)

-- 
2.25.1

