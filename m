Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECEB06BBE6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 22:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbjCOVDX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 17:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbjCOVDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 17:03:15 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3D2A2F34
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 14:02:49 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id ja10so11781638plb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 14:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678914115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4kbv6RpEerrJFJTQMRGDEPyboWZ2n0JfoZtVmkoGLs=;
        b=l7Ioni+zA3bkP3wXEjm1/L1XdG3m9rUUN2ZHFHNkiMI+VB+IQoUp1PmrOJe5W6kE+B
         BsmeFc+4/kYi3st5Peoa+fUoet6xpsuHNu+M4MCnFqcR7QxYFXUYyRWDuKHk/x9QBxfH
         tQHXh08aZqIPlULRcpo//W4pOE0ys/Sj435BR4qy8hdFRBuCiGZjhigKKw8w8Y3L2cfb
         T4ssHlKEhaVi7AocYOXKZEP0MDZ49L07WOpp2b1LxLNIJv+I4tfrtoJyHKAYX+68Fe2y
         Un12oaKmIYlTETOoedGNcBclndC93IQ+LLPCY7KUs15jWrAc0C91qsr+0clMIv0kHNuY
         wJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678914115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4kbv6RpEerrJFJTQMRGDEPyboWZ2n0JfoZtVmkoGLs=;
        b=AwkGx99Yo4/rUINjeMQFVQEl2Gtod2zH8PTZITc/sQUQMqsXkGABWiFgdxYQK0DN7m
         Z7oVm+C505Pp4H7PBPSqXUvMYNVkGYqcgNQ7lJnhGEDHfu1V3lyLXoae+dAbooA4HnyN
         /wFm1dHB+CdfgcESX+THgOomDZ4hLJq4rq4YSny2u5rCFVgU0XZdUeOfJ2/n7eB0KPma
         CKhwWe21Ml8Tvrnf0YGQMZvvcRMOIrWjCulvnOD3JqYhEvnLonOawuPdlMItH6JFKlMD
         56vGjpMgYo5sR2uZoxe4gG3J0tj7QUStIEoFlcQoXscs9cIwnmWjsLwP7Y52vk9zIf4C
         Vn9A==
X-Gm-Message-State: AO0yUKW7blaW+KRPcSN4ARB+MfWcxyrosIyVGShEm56bV4dJPD2S5LcA
        SyFSt2VrcxgLnJ/Xp09oSuB7FLQc2cb2tR8ahQU=
X-Google-Smtp-Source: AK7set+OX5ULuxn1yScvFAkNgegzq+qv+kJYNSaqEbluXE22k/b9kiV64wIbQDqEzGEAVhfoiqSnwQ==
X-Received: by 2002:a17:903:3012:b0:19a:96d2:2407 with SMTP id o18-20020a170903301200b0019a96d22407mr774280pla.8.1678914114967;
        Wed, 15 Mar 2023 14:01:54 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6])
        by smtp.gmail.com with ESMTPSA id 10-20020a170902c14a00b0019a91895cdfsm4066498plj.50.2023.03.15.14.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 14:01:54 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add Qualcomm RB2 board dts
Date:   Thu, 16 Mar 2023 02:31:43 +0530
Message-Id: <20230315210145.2221116-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
-----------------
- v1 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230314210828.2049720-1-bhupesh.sharma@linaro.org/
- Addressed review comments from Konrad and fixed the board dts and also
  added a new 'qcom,qrb4210' compatible.
- Although Krzysztof provided an Ack for [PATCH 1/2] from the v1 series,
  since this series introduces the new 'qcom,qrb4210' compatible, so I
  have dropped the same for now.
 
Add an initial device tree for Qualcomm RB2 board (see [1]).
It is based on the Robotics version of the Snapdragon SM4250
Soc, i.e. QRB4210.

Currently it enables:
    - eMMC via SDHC1,
    - uSD card via SDHC2,
    - RPM regulators,
    - Debug UART (via micro USB port).

Subsequent patchset(s) will add more peripherals like USB, etc.

This patchset is dependent on the QRB4210 SocInfo patchset sent out
earlier (see [2]).

To get a successful boot run:
    
   $ cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/\
    qrb4210-rb2.dtb > ./Image-adp.gz+dtb

   $ mkbootimg --kernel ./Image-adp.gz+dtb \
     --ramdisk ./some-initramfs-image.rootfs.img \
     --output ./rb2-boot.img --pagesize 4096 \
     --base 0x80000000 --cmdline 'SOME_CMDLINE'
    
   $ fastboot boot ./rb2-boot.img

[1]. https://www.qualcomm.com/products/internet-of-things/industrial/industrial-automation/qualcomm-robotics-rb2-platform#Overview
[2]. https://lore.kernel.org/linux-arm-msm/20230315160151.2166861-1-bhupesh.sharma@linaro.org/

Bhupesh Sharma (2):
  dt-bindings: arm: qcom: Document the Qualcomm qrb4210-rb2 board
  arm64: dts: qcom: Add base qrb4210-rb2 board dts

 .../devicetree/bindings/arm/qcom.yaml         |   8 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 224 ++++++++++++++++++
 3 files changed, 233 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts

-- 
2.38.1

