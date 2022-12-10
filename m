Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815A264907C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 21:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiLJUEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 15:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiLJUEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 15:04:04 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D09413F6D
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:04:03 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id x28so12230998lfn.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+WGT3fNh6Yw17jViCrVV80kxl64BIoihM5Qf7fR2rc=;
        b=tIYA8upjYipNFhZq4YKZCwsqc/hIWWhc9D8J3PinwckcrCq2VIo48wRy3I+YwHL391
         eW8MrSuzCZQwbjZM0w9HPvvRb866k+AiM7CxNqcZZG8iyYQz9V7Z2BcaQ+0v57CeDOO2
         YE+bEyTH+CsULvBuBrN76opBsr1VZE34yGD0yDvrK9w+0jqyXkLNx+1N9esmZE2F0RAR
         lQdtrkV2KM4SlOP8qRUz/T5gewYxtswvkwggkS5o+JDSdLJJtxb5MeeE2i5MOMwN+MyZ
         fxvwI6A5+oadZ3M1142xvsOmAyw7hrEiQ5VnFTveNvhdKmZRb13Qf2M9MKen2UNv7pXJ
         p/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+WGT3fNh6Yw17jViCrVV80kxl64BIoihM5Qf7fR2rc=;
        b=N+v6wfsWLpLFqThBfvCahUHMHR5zDIbaPzh+Zhujw0H8lq/Ygdyq5srUJ1AE9MMTk7
         JXUXX8CZlaD7Majv91hgoIjjnzsYt1KyVbDdLAwe9jgNtaK5bbYGksrJXXwQ9uPxtZKP
         CODPAUY3sLgQ7ncM9SdPhTS5o65j9UUuxwEuPsovWevtSApukBXw99/dvK95wCq4h6dG
         oY6B4qC2zJ1VhRvu/Itxu4r8HAjSJnN3veU3UTx6I4FrB308JKKzhYhVMDTQWt/VLg3j
         Cc24wmu63DvR4EE4jq7EBMBQgNs4q3M2w+BT0QVnW4FtzQoM5pT4G6p6Kjid9F1ZUuND
         ybXw==
X-Gm-Message-State: ANoB5pmhey2vYvS21BMJDbId2Nz3fWCtkVeXDmqLs1ZLrkCDMC/L/NXC
        4OT4XPjbZtJpMtwKx79J6zbdcsjhQUZqLqJ/
X-Google-Smtp-Source: AA0mqf60nWT98TqdJr4WnzYvHDTNg01GRGjJQrf6z0tpIZB+YD6fif8SuGnGMu+NMfbndTvyFLIreQ==
X-Received: by 2002:a05:6512:1108:b0:4b5:5ca8:93bc with SMTP id l8-20020a056512110800b004b55ca893bcmr3430632lfg.23.1670702641455;
        Sat, 10 Dec 2022 12:04:01 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004b4f1ea713csm839628lfp.73.2022.12.10.12.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 12:04:01 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/5] MSM8996 eMMC boot fix
Date:   Sat, 10 Dec 2022 21:03:48 +0100
Message-Id: <20221210200353.418391-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
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

In a very unfortunate turn of events, enabling interconnect on non-UFS
devices (or more precisely devices-with-UFS-clocks-disabled-from-
bootloader) crashes the device, as a memory read to an unlocked peripheral
is attempted. This series tries to fix that with the least amount of
casualties..

Konrad Dybcio (5):
  dt-bindings: interconnect: Add UFS clocks to MSM8996 A2NoC
  interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
  interconnect: qcom: msm8996: Fix regmap max_register values
  interconnect: qcom: rpm: Use _optional func for provider clocks
  arm64: dts: qcom: msm8996: Add additional A2NoC clocks

 .../bindings/interconnect/qcom,rpm.yaml       | 24 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  6 +++--
 drivers/interconnect/qcom/icc-rpm.c           |  2 +-
 drivers/interconnect/qcom/msm8996.c           | 19 +++++++++++----
 4 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.38.1

