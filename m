Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAFA16BA129
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 22:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjCNVI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 17:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjCNVI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 17:08:56 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F25613DCE
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:08:53 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id p20so17944043plw.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678828132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9Afvq2rE03umB9jzYmDgfACZhSPVHY7oqjJM7AVeLU=;
        b=S+aBYA4OaqysHNuxbp1e+O/5hB1Ir4JsfC8eqDtlglOrZXKRdJiHYEQij5Idk/vvfd
         2mUTOr3qX49+9RaPAV1ffvr45vt81oza/X1gZ6yMhSv5xPit4lZOMQtxmqjHwddx1dyQ
         HXuxq0FaInqIPv8mtgWiaJl2/bYTZUcXddc6/rLmTtvJG8RzQRAkJUnwwYLlHDC+ueET
         vz6QkZjW2Qf2hOYnfHSLhLxQbfFl6dnl0GTNJTPUaqRQi05pc4peEjHKVqATGx2snm6n
         yL1a5QSv3Bm1VkftXh/4QGl7AVQ/BKn/SGKrO3hjw8sqP5GtIelEpmzVBoJWoBsWCBv3
         yNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678828132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9Afvq2rE03umB9jzYmDgfACZhSPVHY7oqjJM7AVeLU=;
        b=ai+79IgCROdEN5A67yddzqrtivbb+UC557LhMuDPFDufGs5skkz9qIn9eiI3tmz2pb
         CPVDaIgomJkoYk1/lfBDJiojxu1iXjTF0g+rc3Psv0ZPZ5D33F/p0DpKaDCZWFSwKNwV
         rPYir300muJ/5w8v76zo9eRL9eUDHHCdvfy585pJV/Sl53EE7il24G1bZrqgHunPOObx
         3Ss8U+tmtxykUPivD1q7KcAgzV1WB0BtA1U1qpwEGa6pHU2FdjCRgqpPB3pGnpJtHagw
         SENNjqMrPdR1Bf+FqIdpVEFSBNHOUFHoTVRM8m+/00OwVftwidOgdRvn5x54GUbnUfpW
         VP3Q==
X-Gm-Message-State: AO0yUKUzzpUa8DAms+JhYP7F/HmG0Cg3Rp9QjHLZj61S1uIk/p88PbOS
        brCuk/jfsJLrMFhBrq+pEv4HgIi/oKHqdoBd+a0=
X-Google-Smtp-Source: AK7set+XbqzOtGETP0+NT1OeYvKQO1910yxxR5CvJMUXIhLZ2mzV+RnFksbmOklPccPppPxE0hooUA==
X-Received: by 2002:a17:902:c948:b0:1a0:7678:5e16 with SMTP id i8-20020a170902c94800b001a076785e16mr358428pla.67.1678828131977;
        Tue, 14 Mar 2023 14:08:51 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6])
        by smtp.gmail.com with ESMTPSA id kl8-20020a170903074800b0019edc1b421asm2190150plb.163.2023.03.14.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 14:08:50 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH 0/2] arm64: dts: qcom: Add Qualcomm RB2 board dts
Date:   Wed, 15 Mar 2023 02:38:26 +0530
Message-Id: <20230314210828.2049720-1-bhupesh.sharma@linaro.org>
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

Add an initial device tree for Qualcomm RB2 board (see [1]).
Currently it enables:
    - eMMC via SDHC1,
    - uSD card via SDHC2,
    - RPM regulators,
    - Debug UART (via micro USB port).

Subsequent patchset(s) will add more peripherals like USB, etc.

To get a successful boot run:
    
   $ cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/\
    qrb4210-rb2.dtb > ./Image-adp.gz+dtb

   $ mkbootimg --kernel ./Image-adp.gz+dtb \
     --ramdisk ./some-initramfs-image.rootfs.img \
     --output ./rb2-boot.img --pagesize 4096 \
     --base 0x80000000 --cmdline 'SOME_CMDLINE'
    
   $ fastboot boot ./rb2-boot.img

[1]. https://www.qualcomm.com/products/internet-of-things/industrial/industrial-automation/qualcomm-robotics-rb2-platform#Overview

Bhupesh Sharma (2):
  dt-bindings: arm: qcom: Document the  Qualcomm qrb4210-rb2 board
  arm64: dts: qcom: Add base qrb4210-rb2 board dts

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 337 ++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts

-- 
2.38.1

