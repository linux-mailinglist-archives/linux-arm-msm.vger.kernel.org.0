Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB97418E71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 06:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbhI0Eun (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 00:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbhI0Eun (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 00:50:43 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1497C061604
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 21:49:05 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id r7so10978789pjo.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 21:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=VCLJxOMghD8RaVbA5dWN+yrWOdqhM/FitAV43QdnWcA=;
        b=v4HWkol1Zq2VhH4qtQtAVKhBp7KIbVoceST9LFQCBxkv5ECnN3dX4CfY7bPWod1Rtq
         tKg77idmeZtxwyenmots5LLnqoUaHUaBhc+7ctWVnzBaOLr6HcH0Oixi2feVWeQdbaE1
         NxvHcpNxWWbjTJ0THXDepb6qIDTtiG3VLVglRMPB4fs3eGiD8t32VSZom1cohHRDOQzB
         ttJI6ckSJVfTGaPAUbCRnQ9uhTc9vu0h9r8GV1vRcM/TrBZCrUDKIF+i6fYajSYdnpgk
         KhYC8xqA0DqP0QymE8eRlf875rb16Ib6/FpRj6Vt9Gbyp+xXWifPabTnoADgG67KoLpy
         Nlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VCLJxOMghD8RaVbA5dWN+yrWOdqhM/FitAV43QdnWcA=;
        b=FARlREE9N2oLfqWGv96N75L3lVk/OtYGQnhwdCgFRapDKkEq5aepvh5vkeDnSR5Fga
         Ui+DFkbH21/r+bWAIGa/6ZIp1yUjPc7s0UmRwX9gTk6e6rNHvHrz77IydwhPKDXq0Ajw
         IKuf5NyOED0vQNegZp+icMp0iwP7yCh63CW6yntR1dr1nxlPpR6FlaOm/PuZs5+oWhT3
         2rKyEQWkg+wrCho2MTMhlNMgxZVTgm8PTqBYD2njOcwSTlwAi+MPYwetmng1cdbE86b0
         Biwt/XqFrn7Uf5aLFrK+EsUUPC+3tedtrbuGqVi/tNKdUEf5f/XJFla+lQ+aKYzpVTuV
         Z4GA==
X-Gm-Message-State: AOAM530XR5KOMY7slF4GckBOOISMkxMfPcSweghuVvCPJrw9BI1ibTlf
        ibeyAIZ26Iqm7EE/bEqwwdg/tw==
X-Google-Smtp-Source: ABdhPJwYodALpHMpng2H+jCiibiIx/t6qGhMZwNj8Bl+wKK+zEAM+9zWZtFnqmIdlCoxV1/V66vOZA==
X-Received: by 2002:a17:90a:b382:: with SMTP id e2mr11819780pjr.119.1632718145282;
        Sun, 26 Sep 2021 21:49:05 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o8sm14550651pjh.19.2021.09.26.21.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 21:49:04 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] Add missing vdd-supply for QUSB2 PHY
Date:   Mon, 27 Sep 2021 12:48:21 +0800
Message-Id: <20210927044824.30246-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series adds missing vdd-supply for QUSB2 PHY which is required for
digital circuit.  The driver works right now likely because firmware
already sets it up.  Add it to bindings, driver and DTS that miss the
supply.

It should not cause problem for existing DTBs:
- SC7180, SDM630, SDM845 based platforms already specified vdd-supply
  in the DTBs.
- MSM8996 and MSM8998 platform DTBs miss vdd-supply, but dummy regulator
  will ensure QUSB2 PHY driver works as before on these platforms.


Shawn Guo (3):
  dt-bindings: phy: qcom,qusb2: Add missing vdd-supply
  phy: qcom-qusb2: Add missing vdd supply
  arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY

 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 6 ++++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi              | 2 ++
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi           | 1 +
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi      | 1 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 2 +-
 6 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.17.1

