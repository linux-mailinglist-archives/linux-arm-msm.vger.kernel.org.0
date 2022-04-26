Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC02510AB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 22:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352948AbiDZUsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 16:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355125AbiDZUsk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 16:48:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3B3165A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 13:45:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j4so9500955lfh.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yS7t+owB0f8T4gOXe6aHgeEs/gx57xIkeKjotSTBji0=;
        b=nf00EnqdTVuaInkiRTATH+wUsR/zbQ065eWO/SHOQRq+jUqnz2T+b+PAXIDC7n1cvU
         1bP88lnPHF44nCEXVir8RcOzwvPbEwH+k5uwk2A6ol4eUptrZSJwfjBij+14Rvmgv+sz
         872oZ5AoOlYKcqNjCog/1ZRF7HWG6b5aombucXMM8gV/ryBWgM55/6Yq9R/Hzf75ktMD
         1yXZwZoobeZNkVpaRaKq5jyiKyMJgK2eOwTaVyTBI7F/cc2pHrejAtbQBMqp7RKpZx9G
         0I+bGaR+WxaE+2v9Fkd2dJFvEl9fcObsdRpQx/l7JKkJL6LLkzReeeYp1rdMbvJKxM0I
         r5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yS7t+owB0f8T4gOXe6aHgeEs/gx57xIkeKjotSTBji0=;
        b=yL9r41zebwBDPgWbP27K+ELjS3OHci6pw1Nt1qJxk07oYedWoPQ0N3yVmVlpLWWqh/
         kQ3sKWOBHthtSLH3VX3fxzhaYxOMxFHJVCHzPHOIOkxxe9ONo0hGVE6mp5/tDTPlywbE
         7/c3i02Rja5by+t8Nn7Py+V2MHT7mazOmsrVeA0+bXs2PpaZP9DqsPxBYsWTMFz6p/ff
         Ar0OgTb36ha/jHdkRC4CXBxtBJDBIcYTAFRXaTUCcxn6Wb4bEWmDST+1fjSfD9rB6vPU
         9kUMKjMYGzcpqv1cCyY4Ssgi/+T3P5Qq55KDJ7rpEvOQVnWHbFOB8vD+rBZQAdLr4ARC
         oAnQ==
X-Gm-Message-State: AOAM532uM9NTfspwPjU1hLuRlLwcLws6meh7X3cpctsD8AQ8fxqEQYOw
        ZlQVNIv6u8//xWeeluALWCUlAw==
X-Google-Smtp-Source: ABdhPJxf3pN/h29eAqBJozLJJk5QBm26rZN1LDkpibb5aehmkalHRNBXTcTjnEEWQSL3XAO3mcVSAw==
X-Received: by 2002:a19:f24e:0:b0:471:c076:bfb9 with SMTP id d14-20020a19f24e000000b00471c076bfb9mr15799324lfk.442.1651005929750;
        Tue, 26 Apr 2022 13:45:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f8-20020a19dc48000000b004720649aa22sm888322lfj.182.2022.04.26.13.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:45:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PULL] qcom: add firmware for several Adreno generation
Date:   Tue, 26 Apr 2022 23:45:28 +0300
Message-Id: <20220426204528.3005774-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Hi linux-firmware maintainers,

Please pull the firmware for several generation of Adreno GPU (A220, A330,
A405/A420/A430).

The firmware files come from Dragonboard 820c BSP available at [1] or directly
from Qualcomm at [2] (registration is required).

[1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
[2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip

The following changes since commit ac21ab5d1de0de34201c90d32eee436f873d1e5b:

  Mellanox: Add lc_ini_bundle for xx.2010.1006 (2022-04-25 07:36:16 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware adreno-firmware

for you to fetch changes up to dfa3c4c30996376dbc3adb530c0505b2efad583b:

  qcom: add firmware files for Adreno a420 & related generations (2022-04-26 23:36:27 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qcom: add firmware files for Adreno a220
      qcom: add firmware files for Adreno a330
      qcom: add firmware files for Adreno a420 & related generations

 WHENCE               |   6 ++++++
 qcom/a330_pfp.fw     | Bin 0 -> 2212 bytes
 qcom/a330_pm4.fw     | Bin 0 -> 9220 bytes
 qcom/a420_pfp.fw     | Bin 0 -> 4292 bytes
 qcom/a420_pm4.fw     | Bin 0 -> 9556 bytes
 qcom/leia_pfp_470.fw | Bin 0 -> 1156 bytes
 qcom/leia_pm4_470.fw | Bin 0 -> 9220 bytes
 7 files changed, 6 insertions(+)
 create mode 100644 qcom/a330_pfp.fw
 create mode 100644 qcom/a330_pm4.fw
 create mode 100644 qcom/a420_pfp.fw
 create mode 100644 qcom/a420_pm4.fw
 create mode 100644 qcom/leia_pfp_470.fw
 create mode 100644 qcom/leia_pm4_470.fw
