Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7485674EDA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjGKMJn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbjGKMJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:09:27 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D45B1708
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:19 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso9079760e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077357; x=1691669357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeaN1f+ghedlkK+LVcPEZpCD/0S5oxq1YSE0F/H62AY=;
        b=E1F6tAjkCMrumjeH93rBvrJrPz7T45uTi9GxiD84n4neP68QxZc6L5AS9lLhzz3iUW
         ecH26oJXb4AaoSyF/pQKHFXugNf9FIRbTaES0z/je5PbxyHKqPKl7KD/cEBJA5us7dai
         +oaqDhqapwRMzW/Tq3rRT8yTMm4U8uAzUo1kHqTJtf8C1hKBOjrKfjVvNM/5OaeoozRt
         U6LzelNjWsEEZ3IcURmXoLBDWXxBHAZdxFbKG/IzZOCyrwacodbWFx4Tms6RLPoi3q/i
         bYFqmVT6ekXz9Wu+Ur7QvPrYBi2HGcilxi2dfjXS4Xw/hH+RNWUEiowpavQDTCAecPe8
         c86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077357; x=1691669357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeaN1f+ghedlkK+LVcPEZpCD/0S5oxq1YSE0F/H62AY=;
        b=g+yTwzzqD6X5UH998HgGf7fvh6TPdCMGtp8/H1xh1YgizUyRkXVo2pd86ehLyr9Eeo
         A9Q8f8Ip9rUVEOHRQK+HxKQiF6oekjgG3m1Nc1NCIgbAh6gs85YKd9RLtUnMSkUncrA3
         DwyC9xCYmBLMJLabuGIPgMmbEGJzktQ0NyY3jhqdDxcqOZNdYHlSbkzywuh0SHqdYxW2
         qwuVEB/b2eKgdhzFhQcCFMhx6D6417FKj8ZwDNfGDqHm7gsCYgPwgzpYwnj1+33UpKbc
         ywZLCvjC6/gkaemZRiGBY3vOeRl6vb5vzH9pm2A7Mm+kalUMQ5lPsGoH7UU24+HLkypP
         82aw==
X-Gm-Message-State: ABy/qLalsjQKqoVTIdS+NY6U8TH1HD+9JYsOuuInNZXnUsDZ5nSsKTu+
        Dz/VwnfQyqgkHPx3HVbu+3XA+w==
X-Google-Smtp-Source: APBJJlE7WeJ3yWB+z/BuECY6OnDLn2qChRgUx1dpuYqONRQUxUMqqHYI4XzjpfZFo2AMgDwTabTH0A==
X-Received: by 2002:a19:5e51:0:b0:4fb:7618:bac7 with SMTP id z17-20020a195e51000000b004fb7618bac7mr11218680lfi.64.1689077357312;
        Tue, 11 Jul 2023 05:09:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h22-20020ac25976000000b004fbbd818568sm291447lfp.137.2023.07.11.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:09:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 00/10] phy: qcom-qmp-combo: convert to newer style of bindings
Date:   Tue, 11 Jul 2023 15:09:06 +0300
Message-Id: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
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

Changes since v3:
- Rebased on top of phy/next
- Squashed sm8150 changes from [1] (which were not picked up) with the
  sm8150 patch from this patchset.

Changes since v2:
 - Rebased on top of phy/next and updated [1]

Changes since v1:
 - Split large patchset into smaller parts
 - Reworked sm8150 too (following changes in [1])
 - Unified bindings with the existing ones
   - use shared list of clocks,
   - added sc7180 as a first grade entry
   - dropped useless descriptions
   - removed ref_clk_src clock
   - dropped second example

[1] https://lore.kernel.org/linux-phy/20230521195420.12454-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (10):
  dt-bindings: phy: migrate combo QMP PHY bindings to
    qcom,sc8280xp-qmp-usb43dp-phy.yaml
  phy: qcom-qmp-combo: simplify clock handling
  phy: qcom-qmp-combo: populate offsets for all combo PHYs
  phy: qcom-qmp-combo: add qcom,sc7280-qmp-usb3-dp-phy compat entry
  arm64: dts: qcom: sc7180: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sc7280: link usb3_phy_wrapper_gcc_usb30_pipe_clk
  arm64: dts: qcom: sc7280: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sdm845: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sm8150: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sm8250: switch USB+DP QMP PHY to new style of
    bindings

 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 284 ------------------
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  46 ++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  57 ++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  60 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  57 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  44 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  49 +--
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  79 +++--
 8 files changed, 168 insertions(+), 508 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml

-- 
2.39.2

