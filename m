Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 787016B218F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 11:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjCIKiC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 05:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjCIKiB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 05:38:01 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567984C1F
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 02:37:57 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id bw19so1336822wrb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678358276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9KTUExWdII8qJRqjpyq1tm3NnK6k207XeARbYR+kJF0=;
        b=Fr3XhBTerq4QuB5agoIrrHUM4GzggyzFPTgOHYI5wLvSnTAN/zl0o0giOF6Ik8b/Nu
         bpoQrFFeNTTLEFGe/ZeDliBqCRG9PtMDv2X394tomBlzdHJsMVwSKEA7IY4sJH5Rj6Yo
         +IRPNKMVzLJM+vTHpxcxzXzszIBQ9feXT7LJ870vSqDsEks6znudwoT10K/E6IqCQokv
         VEj0bP/vctmiiCPyR4jMYFLOhGpLpHe+3+ShqOd6YUvRa91afk91X5K9XylgijKO3ys4
         +ZbdN1unSxMJvNk9W3G+SOiGo9NxjpUomkCXb/BK10UEZYnahWSKM5BHhyPddgwaK5SM
         xtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KTUExWdII8qJRqjpyq1tm3NnK6k207XeARbYR+kJF0=;
        b=rNuCGlBR2cu1+2ZYRPmCRPz3YNTyNZXKQSIXI+/O2hwFtbJkpcwYNoynIA7H7LUwCB
         MI1eA8o3V55FxVFMqJsKFCnnhQRQLCVtcpYF7ux68ym2Gkpgev8u1OYJ0aM6TuWkTo/9
         B9kcsUOA89DSSpuvJ8PromE1oqiIa2e/FiPiQmkbb6P6p+8xfIKgcc46Hd7i2KWgYNtl
         /y3iAMj121U7xk5szHgvDRvUAF+bjK3eAbDlgfRNzNs/YUXFqGlYso/aGL3yQ9ZBBGc1
         Orf9li9qQXlj6AOOkQ68xRWaLRL2eoihGY3TK5OKbldmj9nsmo3kXFKpVJi7fSqjb42/
         8lcQ==
X-Gm-Message-State: AO0yUKXfBeKChsXaLzvCLp6kXUrl+yYS7kTyRTGfTJA2Rx98UjhgtDdQ
        OABehdSKBCrFD+SrBwIN6Ml16A==
X-Google-Smtp-Source: AK7set9hs8tO/LCrLmsjJiQEyeCucu5g9mFkx+u5wSDupbJeqAmB6u3kajPvxk4kaNr/BuQYDAkfBw==
X-Received: by 2002:a5d:604a:0:b0:2cc:1935:1ae8 with SMTP id j10-20020a5d604a000000b002cc19351ae8mr13210498wrt.47.1678358275831;
        Thu, 09 Mar 2023 02:37:55 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f14c:2275:50fc:c056])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d58e2000000b002c56af32e8csm17638119wrd.35.2023.03.09.02.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 02:37:55 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 0/9] arm64: dts: qcom: sa8775p-ride: enable relevant QUPv3 IPs
Date:   Thu,  9 Mar 2023 11:37:43 +0100
Message-Id: <20230309103752.173541-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This enables the QUPv3 interfaces that are exposed on the sa8775p-ride
board: I2C, SPI and the Bluetooth and GNSS UART ports.

v4 -> v5:
- remove board-specific interrupt from UART17 in SoC dtsi
- rearrange node properties to have various *-cells properties come right
  before status
- collect more tags

v3 -> v4:
- use interconnect constants instead of magic numbers where applicable
- pad addresses in reg to 8 digits
- group pins under state nodes for UART

v2 -> v3:
- fix the interrupt number for uart12
- replace underscores with hyphens in DT node names (although make dtbs_check
  does not raise warnings about this)
- rearrange the commits so that they're more fine-grained with separate
  patches for adding nodes to dtsi and enabling them for the board

v1 -> v2:
- uart17 is the Bluetooth port, not GNSS
- add uart12 for GNSS too in that case

Bartosz Golaszewski (9):
  arm64: dts: qcom: sa8775p: add the QUPv3 #2 node
  arm64: dts: qcom: sa8775p-ride: enable QUPv3 #2
  arm64: dts: qcom: sa8775p: add the i2c18 node
  arm64: dts: qcom: sa8775p-ride: enable i2c18
  arm64: dts: qcom: sa8775p: add the spi16 node
  arm64: dts: qcom: sa8775p-ride: enable the SPI node
  arm64: dts: qcom: sa8775p: add high-speed UART nodes
  arm64: dts: qcom: sa8775p-ride: enable the GNSS UART port
  arm64: dts: qcom: sa8775p-ride: enable the BT UART port

 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 99 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 86 ++++++++++++++++++++
 2 files changed, 185 insertions(+)

-- 
2.37.2

