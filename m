Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF5D7BE4D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 17:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376813AbjJIPeo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 11:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376478AbjJIPen (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 11:34:43 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDD2CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 08:34:41 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32487efc319so4480956f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696865680; x=1697470480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6rF4ae7A+5qu7hPdMwKoYbMkNQ9I3y0SztMSLqzlJI=;
        b=1GiaPatXMbjbivOoFbdAFg/r9w+rSgKkX7seca/A2Hg/X6CP1fZZgrBjY4/2+hjOwb
         kyvtOl9CFpErk5Q0S1L/71V/TyejawsGzWl5SQ/Eyb3qXe4VE7sJCbwWdLrlAQmZNmAd
         qc4cOFTUQC+ISd6KeZo50O3PjOmJnhCaK9rGYyXVjBeTCaN4AwPhh3mjRs9yVvylMFtM
         Tgo8pS0lvubva7KSPfr96OCQLWeAkWy4MLAj+ezan6UXwodJvmJuHJOQP4yIR1w3iS/O
         9jeGpDO/Ua17eG4OXMNrTaeyNQiwFQj60adFzNkj6mrPdARAKE1Z49oZ1DkXKQ7R0oUj
         mUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865680; x=1697470480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6rF4ae7A+5qu7hPdMwKoYbMkNQ9I3y0SztMSLqzlJI=;
        b=o958mg8BusPuCYfuBPvb/zEJ3Zn2Yz0KquN/l1Qu6WbSueHmp7HjruR122Z7O714y8
         rdSvBmYnm1wQFUGUSb06hquu5bkbdl6J/UAG7fAf3/SfmMEfJdIY8KFfViWBMKs+umgA
         6PfgupkCpdYGs2sz9ksBAbCFm2rAnFsArcPYT/mMH0E92xzVl7ZNkvY4NFcOW7UkGjnk
         8xS9VGua6Tpy8+BMsw0fWiEB6BnaT3uscXCP6f2ZYO040JtRVdTrgkyY8zolrvbodQnZ
         df/KwwPZeVOGlBrHOGLd8oUN0adySYYDj+ifz2diVA8rqFO9jRMQLjvQTNCs1qzWe3MQ
         B4EA==
X-Gm-Message-State: AOJu0YwqK17NIkm0D4PuuVVa4Es1xHJjrS9Kbxk6s8PWsMaRsNG1YEY/
        HH/9XKbfPS0IjWQh+K8y7N3B5A==
X-Google-Smtp-Source: AGHT+IEs0EgEEp9lcge0UczftS4WgUtkS2H2jzDatDX6PGrIq8IpQrUpTSlay0/zgZLL8k5nWnZEMw==
X-Received: by 2002:a5d:548f:0:b0:31d:d48f:12a3 with SMTP id h15-20020a5d548f000000b0031dd48f12a3mr12332461wrv.43.1696865679835;
        Mon, 09 Oct 2023 08:34:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm10016521wrp.89.2023.10.09.08.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:34:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 00/15] arm64: qcom: add and enable SHM Bridge support
Date:   Mon,  9 Oct 2023 17:34:12 +0200
Message-Id: <20231009153427.20951-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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

This is pretty much another full rewrite of the SHM Bridge support
series. After more on- and off-list discussions I think this time it
will be close to the final thing though.

We've established the need for using separate pools for SCM and QSEECOM
as well as the upcoming scminvoke driver.

It's also become clear that in order to be future-proof, the new
allocator must be an abstraction layer of a higher level as the SHM
Bridge will not be the only memory protection mechanism that we'll see
upstream. Hence the rename to TrustZone Memory rather than SCM Memory
allocator.

Also to that end: the new allocator is its own module now and provides a
Kconfig choice menu for selecting the mode of operation (currently
default and SHM Bridge).

Due to a high divergence from v2, I dropped all tags except for
patch 1/15 which didn't change.

Tested on sm8550 and sa8775p with the Inline Crypto Engine and
remoteproc.

v2 -> v3:
- restore pool management and use separate pools for different users
- don't use the new allocator in qcom_scm_pas_init_image() as the
  TrustZone will create an SHM bridge for us here
- rewrite the entire series again for most part

v1 -> v2:
- too many changes to list, it's a complete rewrite as explained above

Bartosz Golaszewski (15):
  firmware: qcom: move Qualcomm code into its own directory
  firmware: qcom: scm: add a missing forward declaration for struct
    device
  firmware: qcom: scm: remove unneeded 'extern' specifiers
  firmware: qcom: add a dedicated TrustZone buffer allocator
  firmware: qcom: scm: enable the TZ mem allocator
  firmware: qcom: scm: smc: switch to using the SCM allocator
  firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ
    allocator
  firmware: qcom: qseecom: convert to using the TZ allocator
  firmware: qcom: scm: add support for SHM bridge operations
  firmware: qcom: tzmem: enable SHM Bridge support
  firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
  arm64: defconfig: enable SHM Bridge support for the TZ memory
    allocator

 MAINTAINERS                                   |   4 +-
 arch/arm64/configs/defconfig                  |   1 +
 drivers/firmware/Kconfig                      |  48 +--
 drivers/firmware/Makefile                     |   5 +-
 drivers/firmware/qcom/Kconfig                 |  86 ++++
 drivers/firmware/qcom/Makefile                |  10 +
 drivers/firmware/{ => qcom}/qcom_qseecom.c    |   0
 .../{ => qcom}/qcom_qseecom_uefisecapp.c      | 260 +++++--------
 drivers/firmware/{ => qcom}/qcom_scm-legacy.c |   0
 drivers/firmware/{ => qcom}/qcom_scm-smc.c    |  28 +-
 drivers/firmware/{ => qcom}/qcom_scm.c        | 179 +++++----
 drivers/firmware/{ => qcom}/qcom_scm.h        |  21 +-
 drivers/firmware/qcom/qcom_tzmem.c            | 366 ++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h            |  13 +
 include/linux/firmware/qcom/qcom_qseecom.h    |   4 +-
 include/linux/firmware/qcom/qcom_scm.h        |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h      |  28 ++
 17 files changed, 746 insertions(+), 313 deletions(-)
 create mode 100644 drivers/firmware/qcom/Kconfig
 create mode 100644 drivers/firmware/qcom/Makefile
 rename drivers/firmware/{ => qcom}/qcom_qseecom.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_qseecom_uefisecapp.c (84%)
 rename drivers/firmware/{ => qcom}/qcom_scm-legacy.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm-smc.c (91%)
 rename drivers/firmware/{ => qcom}/qcom_scm.c (93%)
 rename drivers/firmware/{ => qcom}/qcom_scm.h (88%)
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.c
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.h
 create mode 100644 include/linux/firmware/qcom/qcom_tzmem.h

-- 
2.39.2

