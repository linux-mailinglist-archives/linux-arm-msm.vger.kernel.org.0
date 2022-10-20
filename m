Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8CE86066BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 19:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiJTRID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 13:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiJTRIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 13:08:01 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917DA1B4C78
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 10:07:58 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id j14so104564ljh.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 10:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IybMlsJw1Yys6p7xGaPp2Y1xUUcDYRPKINWOHYDcdwc=;
        b=ibmMQrzhrxmtZ/6A5mbyXJKFAvXn12OA0sQuE6UBFA0NmdpGznMXrdR7vmIamgYZRg
         /x89uIj1e+1t5U8t6MS515XATn1Yk+tzIKFg8RWe/RFUK6ufnh7Lcry4rEoDy301aLUA
         GpPt9au+HKaHTNJAEbkXrHgo4pJaH3Ho/a7Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IybMlsJw1Yys6p7xGaPp2Y1xUUcDYRPKINWOHYDcdwc=;
        b=Doct6hea2pv3QYyB0RTmpQqUU1ty/dQ8CAXVqyL5DRtfB0urFTHJ5uLBHgmUFDJBNN
         sPzW0CWkDDU0nV63QF9QoclRQD5jQc2ycUjlcEaaaZYJpT1YDhtvDQg7ucseyQ3DIgBY
         V+Ep+Oeu5pfuTEp2OSO2B4q55LOPw1TbyqhxNmkQyCEXimvQ4eAskaoKQlhO0oWL1opW
         pGh18Y4/pFlCB+GCHMshoGmeJOHi1xeMWEa2dD08NPFWAbKkuvvfDwh5v7/PD77XSGIh
         BldHfYHt+8ZysxzW4xasPU1djw2mMhNPNf3X8nSjNTuw5gZ4owCzMAJVlBX0kaVMZDeO
         uvng==
X-Gm-Message-State: ACrzQf0PwLkqwkLd+kYMCKioAwXE143UOSztfscTi78Kz8N7HY73Xt9Y
        6fMQpzQnd8pzbukfZzznfBk/FShC4GPqDSM56CLRlw==
X-Google-Smtp-Source: AMsMyM5bZnvNjkE/0TBP4deiruJQxWvKQcODnmlc5+pOuYofdw95lEMHkRbBlWwSgh7s+ZB5/KH7gmu9IYqaNaAE9QI=
X-Received: by 2002:a05:651c:907:b0:26f:bb25:f66c with SMTP id
 e7-20020a05651c090700b0026fbb25f66cmr5377618ljq.132.1666285676679; Thu, 20
 Oct 2022 10:07:56 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Thu, 20 Oct 2022 10:07:45 -0700
Message-ID: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
Subject: [PULL V2]: qcom: SC7180 and SC7280 venus firmware updates
To:     linux-firmware@kernel.org
Cc:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:

  cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)

are available in the Git repository at:

  https://github.com/nathan-google/linux-firmware.git
update_sc7180_and_sc7280_firmwares_v2

for you to fetch changes up to 054271e4164b6b4c069a3aaaeb9bfcde8c850339:

  qcom: update venus firmware files for VPU-2.0 (2022-10-20 09:37:35 -0700)

----------------------------------------------------------------
Nathan Hebert (3):
      qcom: update venus firmware files for v5.4
      qcom: remove split SC7280 venus firmware images
      qcom: update venus firmware files for VPU-2.0

 WHENCE                   |  17 ++---------------
 qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
 qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
 qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
 qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
 qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
 qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
 qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
 qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
 qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
 qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
 qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
 qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
 qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
 qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
 qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
 qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
 qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
 qcom/vpu-2.0/venus.b19   |   1 -
 qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
 qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
 21 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 qcom/vpu-2.0/venus.b00
 delete mode 100644 qcom/vpu-2.0/venus.b01
 delete mode 100644 qcom/vpu-2.0/venus.b02
 delete mode 100644 qcom/vpu-2.0/venus.b03
 delete mode 100644 qcom/vpu-2.0/venus.b04
 delete mode 100644 qcom/vpu-2.0/venus.b05
 delete mode 100644 qcom/vpu-2.0/venus.b06
 delete mode 100644 qcom/vpu-2.0/venus.b07
 delete mode 100644 qcom/vpu-2.0/venus.b08
 delete mode 100644 qcom/vpu-2.0/venus.b09
 delete mode 100644 qcom/vpu-2.0/venus.b10
 delete mode 100644 qcom/vpu-2.0/venus.b19
 delete mode 100644 qcom/vpu-2.0/venus.mdt
