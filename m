Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7AC6DD41A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 09:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjDKH24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 03:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjDKH2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 03:28:55 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926B510DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 00:28:54 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g3so8374809pja.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681198134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYIzKSwGvXgmY04hGg8wntK0YcMOF3CTzRnRLf+lmfo=;
        b=e6OfinFL6B6gdg/sJAGuLAhGXAyEHGQoZxFCxUIg+v9m0JVdVVaV9DIHI4uJiIHqkU
         5lw43+apQZR1B7d/GX2LyV0NikJvmvv4D+MtE4GFcUagGspsqEdHY4ZkAgakMI1x5HEx
         NnD2hGbX+okDo3T4dF0ALSiQr3ScWMnfEclK/VueuB1FngF2hgHcUzQysAG5oSNlAw/D
         h1lJNs1JKLB3p1hzkohhHCg9HtDHzEpeePkD1IEou3QsRpWvoI6uo0Y6jUPGMqu7Pdqw
         fVBOdLXMgRriDdfpJB4kWbf7ZZXKSn5cEBRVM8TRK/nKrG0s+7zy1rpFiR199UV26UbZ
         rs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681198134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYIzKSwGvXgmY04hGg8wntK0YcMOF3CTzRnRLf+lmfo=;
        b=UadXguj1IE8OPKRhQMJcquwmDzwUKSCHYpEfmKHEHNKrXZ9bEEa9qy4MQYPqi3w3rQ
         NmcxBDsJGlGvD0Ubuz+hge5OGogMEYm2vpxc9XfZaSVufHylX+5qqqDGoPYlWVrYdcFy
         q1cZlMjP7Ko5Kj555zJrOSzr9PxM5JrEmTx3/QpTFEW0DdQuV1wy0DOJ6TwCHDW2R/EK
         zwa7IGGYZ4F1RJYepPUwyiqQEeETu097Dp6JuhiCQcx6b+fvokD7EU8fY1J3YLZ0qY/G
         OTBfht1kkOp0QVFXSjA1y9IXdpYcAbnNGASMJZR690GJYQIobLn2gUeHI1vo37qJEYwd
         1oaQ==
X-Gm-Message-State: AAQBX9fcNZ0D0vHtQLbWF51CgosoJQRmkOOWWr0IuIdpWroHV9WFMe/U
        t5L2ESBe1zxWfs7j2DqMktjTvYw3xPOlZ46bKoE=
X-Google-Smtp-Source: AKy350ZJeDMak23Z7LaNvanfRFivkMlcjclZLWaRbaa7GoUajg5ks3HHywtS5GNqiNKPpeg5jf5QAw==
X-Received: by 2002:a17:903:1c4:b0:1a0:7584:f46f with SMTP id e4-20020a17090301c400b001a07584f46fmr25167435plh.9.1681198133612;
        Tue, 11 Apr 2023 00:28:53 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6a11:8ba1:beba:def7:a4ae])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b001a043e84bf0sm8946612plp.209.2023.04.11.00.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 00:28:53 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add Qualcomm RB2 board dts
Date:   Tue, 11 Apr 2023 12:58:37 +0530
Message-Id: <20230411072840.2751813-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Changes since v2:
-----------------
- v2 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230315210145.2221116-1-bhupesh.sharma@linaro.org/
- Addressed review comments from Bjorn about load conditions for vmmc
  ldos and added [PATCH 3/3] accordingly in v3.
- Collected Krzysztof's Ack for [PATCH 1/3].

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

Bhupesh Sharma (3):
  dt-bindings: arm: qcom: Document the Qualcomm qrb4210-rb2 board
  arm64: dts: qcom: Add base qrb4210-rb2 board dts
  arm64: dts: qcom: qrb4210-rb2: Increase load on l22 and l24 for uSD
    and eMMC

 .../devicetree/bindings/arm/qcom.yaml         |   8 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 227 ++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts

-- 
2.38.1

