Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43CAA60D62B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 23:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbiJYVcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 17:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbiJYVcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 17:32:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42672B56DF
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 14:32:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a15so14321397ljb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lNl18H7nWoSg769nmPB4Fbb4nB49kkuQLERALgD+1Y4=;
        b=Yn/mSchSYMqvsnMbPCEEme2tqkdvEi3zO/P7A0aWLrUfwKoaG3xymu68CLNuZ/gqE+
         TXo0CFO0Mt8SZtotHwihLJArVdiqJw11mQGfXh0c+THt33QcD8/phaFUpelm5TZx0vp8
         KTlFp03xFplmFDCGa69AHkx9jGsfqldHLttHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNl18H7nWoSg769nmPB4Fbb4nB49kkuQLERALgD+1Y4=;
        b=ne8l58eJ9rJk9vg5a+z6ttsdpZPa7grWTLkVebhmG2236nM5HI9Ujr0oZ+HMNaJLjI
         QRGDUP+DMftFAQxheQU0AE/6fzuRkGSE8UI8of4Wt5aEemvgUQ0Nu5DDCg2X29vwkTM7
         x285qGkrCK8Ee0bhfHD24IPeMimGlkOf7c1Z/IPO6723FLAmWYBZHXuq/ix/F8+Rt8BW
         qP71itt9uLHZV/dKYAAYfgiC5pjdYPyVJ7pTBY/UfUL/Jb/e+NP6SMM5jgedF1B8Bavq
         29i4Dk4YmRG+ovyPmenISv9ahfP5EW5dKnMHpjc6LI7jFVdUxuOMHgBV1+aCtbesUYkc
         0PTg==
X-Gm-Message-State: ACrzQf1SiaitZNbmFZ1YKWZdapRLNyKvY0SD3taOMEeJRjEbtY3vtdko
        RA16+K6raGimzaNm9/fgREVCT5SpEeL9YJejLAWfMw==
X-Google-Smtp-Source: AMsMyM6oOm735Tw4SCfCbxdiC5xAzsoPMgJAxelTIMgOFci+ndfnXH2la4glFkPX5J57nWcCE2yyUl8epmTCvSxnMhM=
X-Received: by 2002:a05:651c:907:b0:26f:bb25:f66c with SMTP id
 e7-20020a05651c090700b0026fbb25f66cmr15471794ljq.132.1666733537626; Tue, 25
 Oct 2022 14:32:17 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Tue, 25 Oct 2022 14:32:06 -0700
Message-ID: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
Subject: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
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
update_sc7180_and_sc7280_firmware_v4

for you to fetch changes up to 05df8e65182f7ee945f826e41b5eaa17c188a8df:

  qcom: update venus firmware files for VPU-2.0 (2022-10-25 14:16:59 -0700)

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
 qcom/venus-5.4/venus.mdt | Bin 7020 -> 0 bytes
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
 delete mode 100644 qcom/venus-5.4/venus.mdt
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
