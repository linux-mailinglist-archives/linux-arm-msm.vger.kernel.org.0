Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F91A6E0E47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 15:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjDMNRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 09:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjDMNRU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 09:17:20 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D71E0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 06:17:18 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso3759292wmo.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681391836; x=1683983836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sor1o3lgx6pN6vl67a8PWbhrfGi3/hG81XlEFkcdfb0=;
        b=Iqwvyv8WgfS/XE0vS+/Khekvvz+atOqobe2B05VzD6c9V4XTNqYTbaNPLU3uSae11V
         x/vfpDhzg4pbnQmphl9Lo73JAQtNAb/rrjG7Js2FZK9kK7hHicKU3pP26s1qDEy31l2m
         rl8UQ6wvZbhIDbrwgAA2tMLt5GVhLqA92Wh0fbBZ4s7NJFhUKI53q9uspaR5VdQx3xI9
         7CPiD/EuATButGBOdaWftY9nx0sfXsGTuGZ756GXuSyYNNpgAVerskDcVbTXmV53Mv7W
         F5uXlKEUbp5leKPi7slJbHbakGYxBa6cPZkcnwnwovHE0Zwy3NG+NkhOodwahqn497an
         ZxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391836; x=1683983836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sor1o3lgx6pN6vl67a8PWbhrfGi3/hG81XlEFkcdfb0=;
        b=KIbPUY+35Tvk5wcEqrq6a8NmOH9wA2KdgRpe+/aqvgg28R1GmlLmnsFu8f/CDLBSyj
         BA73Dtt2upbTPnxqb1hC7w3pqyH8yoPvbxK7q0TAzvz0UF/0yrDnvIokVQx+wMJjWbjT
         ZPPr5L91V6yeQAQtALsMSFJYuO+/x3drC0sM4fxdhvQkUiRNor2Q2C/MeB3ZP8zU8QM2
         feTP+xp0wBCWv8WYZr/FrXrYolW1Uv8s74h+48ov44aYJf/hUO5wwZWeMrnD13Wp0EG/
         rJwDvsjuHYw32cckatG1khe145p8KPOhPQBJp0mGM+VXS90u/Gn+wV2Gi4HD+E3sPC69
         OR/w==
X-Gm-Message-State: AAQBX9crDOksyNYxE2W9fVa/lQyIP9QywAxmxT1ttlEYuPWlB7VV9AYI
        PFcj77tMeVKsE6CpWGKLNvdUKg==
X-Google-Smtp-Source: AKy350bORanD31k3svyLmAj37J/UJ696aFUbqm7fguFemtr0h+CoOf62HMopl4I8dSifRLvkiQBx7A==
X-Received: by 2002:a7b:c8d4:0:b0:3ef:6aa1:9284 with SMTP id f20-20020a7bc8d4000000b003ef6aa19284mr1729418wml.29.1681391836605;
        Thu, 13 Apr 2023 06:17:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id v3-20020a1cf703000000b003f04646838esm1796400wmh.39.2023.04.13.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 06:17:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/4] arm64: qcom: fix the reboot reason handling on sa8775p
Date:   Thu, 13 Apr 2023 15:17:01 +0200
Message-Id: <20230413131705.3073911-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

SA8775P uses nvmem to pass the reboot reason magic value to the bootloader.
Remove the reboot modes from the PON node and introduce an SDAM node passed
to the nvmem-reboot-mode driver. While at it: convert the bindings for
nvmem-reboot-mode to YAML and enable it for arm64 in defconfig.

Bartosz Golaszewski (2):
  arm64: defconfig: enable building the nvmem-reboot-mode module
  dt-bindings: power: reset: convert nvmem-reboot-mode bindings to YAML

Parikshit Pareek (2):
  arm64: dts: qcom: sa8775p: pmic: remove the PON modes
  arm64: dts: qcom: sa8775p: pmic: add the sdam_0 node

 .../power/reset/nvmem-reboot-mode.txt         | 26 ----------
 .../power/reset/nvmem-reboot-mode.yaml        | 52 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi   | 23 +++++++-
 arch/arm64/configs/defconfig                  |  1 +
 4 files changed, 74 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.yaml

-- 
2.37.2

