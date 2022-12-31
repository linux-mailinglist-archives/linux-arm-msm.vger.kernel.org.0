Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5980C659F8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 01:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbiLaA1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 19:27:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235651AbiLaA1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 19:27:21 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1161EAC0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 16:27:20 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id z18so12160540ils.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 16:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FxYmD3MKNHGkzolG6Z5MV/mrr6zFi3TuI0Acg35raUw=;
        b=uH5i5hxS2db0gl9TP2bZAQjpr0wfz5+0z84KT2RLjdV1BAd1e7QrWes04UwlOg7Pb2
         pWJoAaIEKJKcvq4vSjaqB15CMNGFrhFFc7A9m/0TZJdtBedFFMVSzZPhxHExISzk9RkO
         KjZ66UVJs0iJpxUIKLLLtn1TgEzImPwgFNXq05e70860m4CtLGzivCbf22RGKYd5QDjl
         YhaZ77wnUxflEAEX0Hr4G+gg3IQpyWMXTSJdQWQq8YWQRWqxcUZ4Y0YtPDPbTFKzl2lz
         jpoZh8gXtiJ9zpsiwfYCO4DJGDsWETWLDnN1y9DmWXT6bLynaMK+o5ixfeYiTKH2+JJ1
         jIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxYmD3MKNHGkzolG6Z5MV/mrr6zFi3TuI0Acg35raUw=;
        b=G2JWzG6XIHwyiM3ZbzJj7+wiRokH2SGqnL7JrKN8RL73PJpOd0ATmxVAkF7z11eVOq
         8IPMRmEVJE6KF9CNIGrFqCWAKnQOydh5PGb6uDt+O5JYQLuT5d7ynTOEkAy/dNXU8fIH
         JXn4YemGNGRFzLl83OC7qUwv2LX+uSNHvqBr02ztlMLI8eYqsEc8PKgxPcNvnv6OIn7L
         NVjiXav4z055JNjCMuLzoHsBMiD5zbe2L74uILmbMLPV5eofogmzqHbaMY7zXAZrjX0F
         xROGnpBGr+EHdLrLiYU2gD0rct4npK/o4G4iGZE3rKoe7Yj8K9MIpL3QvMruY26jOwMu
         VFeA==
X-Gm-Message-State: AFqh2kp51VVLcYIsBg1VgbKzj+rLOnpEoSRQaTQ8DRwggE//FJxzP2cT
        D2Xn4k+5WoZKmb9CeVFjn1vN9tXOdiu6m753
X-Google-Smtp-Source: AMrXdXvZ55pFDq6DptGgKckLQ6pfj0htYFe28lUwLhD6q6rCjSIi+aLk+JnD/4J9yvM1q4EKXyW0Rw==
X-Received: by 2002:a05:6e02:5a6:b0:30b:ce86:ce4b with SMTP id k6-20020a056e0205a600b0030bce86ce4bmr23190411ils.8.1672446439727;
        Fri, 30 Dec 2022 16:27:19 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id t4-20020a922c04000000b002f9f7d24d78sm6969279ile.76.2022.12.30.16.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 16:27:19 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dts: qcom: use "qcom,gsi-loader"
Date:   Fri, 30 Dec 2022 18:27:14 -0600
Message-Id: <20221231002716.2367375-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPA hardware has a GSI component that needs firmware loaded.
Recently, the way to specify how this firmware is loaded has
been changed.  As a result, indicating this via the presence or
absence of a "modem-init" property is now deprecated.  Instead,
a new "qcom,gsi-loader" property is used; this permits a third
method of loading GSI firmware to be supported.
  https://lore.kernel.org/netdev/20221116073257.34010-1-elder@linaro.org/

This series updates all of the exiting ARM and arm64 DTS files for
platforms implementing IPA so they specify the GSI loader using the
new property.

					-Alex

Alex Elder (2):
  ARM: dts: qcom: use qcom,gsi-loader for IPA
  arm64: dts: qcom: use qcom,gsi-loader for IPA

 arch/arm/boot/dts/qcom-sdx55-t55.dts                         | 4 ++--
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts             | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi         | 5 ++---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi                   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 1 +
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts             | 3 ++-
 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts                      | 4 ++--
 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi      | 3 ++-
 17 files changed, 29 insertions(+), 24 deletions(-)

-- 
2.34.1

