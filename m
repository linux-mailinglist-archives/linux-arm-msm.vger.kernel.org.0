Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EED16C91E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 01:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjCZA5i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 20:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjCZA5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 20:57:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71FABB87
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j11so6898064lfg.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679792254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/q5uxzakrQ9teWALDZWu8oA0wDMjc+3lIyuDRspNANo=;
        b=C74peBWEQJTruG6UIdlaxtou9xL4sBaGPZ/az4/ZI9bpJn7atwdFb5gqMqLOEguJ7p
         LRhYdI6nhyFNJLwA1fI7S9ViiR6zxBE1MBnZ+lExb+jrR1swryf/ceUoGHtwPNOleNVX
         9E7fKdJVJibvqF1bKS0/jk/eYgjb3REU4o+udZymMd8TkuUPGSwCd2l+vu9YYGJ8PhPW
         6o7IZ7L5xHYVkf04slj+iLT4s4n2qV5+esYcrX7jvarHKJC4mENK7SmA9Q/olYCsBuYl
         EXe1bcaf6ofWh2uhWH1jwg0e3Ps2N4avg4lIOXdwr/IbSmJbh48lPY3Ps4ktz3xcXWcf
         +YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679792254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/q5uxzakrQ9teWALDZWu8oA0wDMjc+3lIyuDRspNANo=;
        b=FjwlLOwDdtR3uzJc/lW6uDGXkJ7qwneo141UcHZSmbQoPvs2G7HyODCQ0mxZEdF6s2
         y7gs4lM+Nlataci2I0PqVzg3vOpZFPMgitjiWtjHxe8wFgMRX/WSefbSFwX6oZntOdOT
         41xvmQW0rFasXiwYhceZhtREhC9lUYnVsYt2sczEBdYMWOJnLkGKR5/UQfjGXOUFtU94
         8aygfJgnmaeRaO9jH5d6NoEvOt0YyeO3p/q/dtU5gxaEqUJYvT+t30yBLli/Bj+q2C45
         sZEjyr8Kjv99JdXFD27dxHrbwu4Bh31BaQsMzvNAJkaoFNRMI0/V3KPBboIvVKmkdBjp
         w0VA==
X-Gm-Message-State: AAQBX9dMlad7HyMCy0Wx8MgXZv5u8cQsto8cG0swshs3Zoa2YMnrSH6f
        OVj9ihCLhnSJ/aBMb9Nc2LTjwg==
X-Google-Smtp-Source: AKy350YTa6v5GREGlqyOsKRP7D0hdjtMEaUku5fLe5fC2YHQFnH0bpHq2BaThx+/Ve9BXjkQXJU3JQ==
X-Received: by 2002:ac2:5638:0:b0:4dd:fd4e:5a20 with SMTP id b24-20020ac25638000000b004ddfd4e5a20mr2283885lff.58.1679792254120;
        Sat, 25 Mar 2023 17:57:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020ac242cd000000b004e7fa99f3f4sm3996858lfl.265.2023.03.25.17.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 17:57:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/9] phy: qcom-qmp-combo: convert to newer style of bindings
Date:   Sun, 26 Mar 2023 03:57:24 +0300
Message-Id: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewing several patchsets for newer platforms made me understand that
having two styles of QMP PHY bindings causes confusion. Despite binding
documents having notes telling that old bindings should be used for
older platforms, it is too easy to attempt adding new platform with
older QMP PHY binding. Thus let's have just a single documented style of
bindings.

Dependencies: [1], [2] (for sm8150 changes)

[1] https://lore.kernel.org/linux-arm-msm/20230323144726.1614344-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230324215550.1966809-1-dmitry.baryshkov@linaro.org/ 

Changes since v1:
 - Split large patchset into smaller parts
 - Reworked sm8150 too (following changes in [2])
 - Unified bindings with the existing ones
   - use shared list of clocks,
   - added sc7180 as a first grade entry
   - dropped useless descriptions
   - removed ref_clk_src clock
   - dropped second example

Dmitry Baryshkov (9):
  dt-bindings: phy: migrate combo QMP PHY bindings to
    qcom,sc8280xp-qmp-usb43dp-phy.yaml
  phy: qcom-qmp-combo: simplify clock handling
  phy: qcom-qmp-combo: populate offsets for all combo PHYs
  phy: qcom-qmp-combo: add qcom,sc7280-qmp-usb3-dp-phy compat entry
  arm64: dts: qcom: sc7180: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sc7280: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sdm845: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sm8150: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sm8250: switch USB+DP QMP PHY to new style of
    bindings

 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 278 ------------------
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  45 ++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  57 ++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  57 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  57 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  48 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  49 +--
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  79 +++--
 8 files changed, 162 insertions(+), 508 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml

-- 
2.30.2

