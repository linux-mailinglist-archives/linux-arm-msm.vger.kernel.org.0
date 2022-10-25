Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78CB760D5E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 22:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbiJYUyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 16:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbiJYUyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 16:54:52 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28879F34
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 13:54:50 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a15so14178864ljb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 13:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qpCoIXyGfubfE3X4kZy0CHeFFWQt64Ls0egPKk2u8yQ=;
        b=R3Mf5rveHb2ROeT1K+qJnXztMKDZ1Y5m8fWEC6tbC57fuiycD5uN/wEqSX5NTxqS4z
         pjHDFTQr/zzxIuSB1wq21STgTuX4d0dBbmDqq3JCuMsOsLmDVTeIA7wby3osmreow4OQ
         BtvyWKlRUInNu8pztaGahXA+zEXOiXlNxH13I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpCoIXyGfubfE3X4kZy0CHeFFWQt64Ls0egPKk2u8yQ=;
        b=xQt08x0xSMFXgIkGwxgBSMKm1ol3cZTKy41ST/Q1PMeD6erOobxqYh6t1wk0nkt+Jp
         y5RbB/JoUOaaGhSUeWC4bLOb1RLBrJZcS7vtaLYz1AmDWFI6DZb6oM7f8jac4JStpkXk
         yq9Op3ngMORgo0Ou2KHyw54GMwMjZNdRSkw+Jh3t7EfTzsG8wFhwNBZcr95+yn21gZ3B
         0DC5/UuJyaAZG3rV2KXL3J+eSwkKhoQJ9anyecCpAwHc+fR16w3ziDpy52bwPkMzgnHe
         RqoW3rTWCRCET4OpkbhLjqAdlEnZ6FvXAblobOcLDzUqx+4TBQehI+zDHws/6MPCmVnr
         YHQA==
X-Gm-Message-State: ACrzQf1BHfU/3UcM+hqzrt/M9dIfrb2qNLUYkvlBkduz7APCwI+TvLQL
        u6pJVHnWMxPBwZUekJF2PKtWSUxpBi8kC/r1+m2PTw==
X-Google-Smtp-Source: AMsMyM7MtQ8BuSs3MR4uzASp3DCf6Lwyq5bzRIBH1Njy7gCY5wBEwoNc9AkHk3zGsb7/tnxVpVGn6m66t4L9YT+VOiA=
X-Received: by 2002:a05:651c:98a:b0:26d:fd1f:10 with SMTP id
 b10-20020a05651c098a00b0026dfd1f0010mr15282036ljq.323.1666731288518; Tue, 25
 Oct 2022 13:54:48 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Tue, 25 Oct 2022 13:54:37 -0700
Message-ID: <CANHAJhGcJT3nEq_s7qb4ammtiyCe1SQko3yXx7_5nm4PoJg+=A@mail.gmail.com>
Subject: [PULL V3]: qcom: SC7180 and SC7280 venus firmware updates
To:     linux-firmware@kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
update_sc7180_and_sc7280_firmware_v3

for you to fetch changes up to 99a1a406c0bc9144de6b8de8efd983cfe0389131:

  qcom: update venus firmware files for VPU-2.0 (2022-10-25 13:34:43 -0700)

----------------------------------------------------------------
Nathan Hebert (4):
      qcom: replace split SC7180 venus firmware images with symlink
      qcom: update venus firmware file for v5.4
      qcom: remove split SC7280 venus firmware images
      qcom: update venus firmware files for VPU-2.0

 WHENCE                   |  24 +++---------------------
 qcom/venus-5.4/venus.b00 | Bin 212 -> 0 bytes
 qcom/venus-5.4/venus.b01 | Bin 6808 -> 0 bytes
 qcom/venus-5.4/venus.b02 | Bin 873596 -> 0 bytes
 qcom/venus-5.4/venus.b03 | Bin 33792 -> 0 bytes
 qcom/venus-5.4/venus.b04 |   1 -
 qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
 qcom/venus-5.4/venus.mdt | Bin 7020 -> 9 bytes
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
 22 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 qcom/venus-5.4/venus.b00
 delete mode 100644 qcom/venus-5.4/venus.b01
 delete mode 100644 qcom/venus-5.4/venus.b02
 delete mode 100644 qcom/venus-5.4/venus.b03
 delete mode 100644 qcom/venus-5.4/venus.b04
 mode change 100644 => 120000 qcom/venus-5.4/venus.mdt
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
