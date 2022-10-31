Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25555613D92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 19:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiJaSnI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 14:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiJaSnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 14:43:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DE9DF77
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:43:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d6so20601567lfs.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXzIYz5+51v/Ox4rpeSDkU9wciu2UFoLCRABkqXo8ZY=;
        b=HmL9kRt83IsfClTFfER0OV+4Fvp6Ab6WsiA1rqp9SYZKs5krbcm0ylOIZ0Aic5PKTK
         n/yrr0VB5zMtpZ3A6doQoFlEJukOtcFPxqFxmkysWKRDSboYGf0AlsOxN5Bf1umFoh7J
         k4UnCLvUB075mPEuT1bEXqw0Cngph3g79Pzsgq/1IVN1rvO+t+UAqYcTwYc64TosRCgj
         pjVSK2cR47unZZzbriiRQfp4wgl4W/b6Innx23Y22nLKH7enEm9pAiFTjHZu0pRwtIE0
         8TvwE2txRXgAp6/tC07U1qs/GCD048qcW8cdN+0Z5/pmLZgKSV+KmliatIF+GwgEzGeO
         f4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXzIYz5+51v/Ox4rpeSDkU9wciu2UFoLCRABkqXo8ZY=;
        b=a6x9ZR3gabLQHyvOcW545F7DEq6R2vX+NkJ4VIscfbwG3agY3Kr8gnIzdOZSIWPkYS
         9SP+Kf3oHsIo+ykYaXqvre/9dX1ffueIXLQgHznQ8Jz44nTjWrGbwqdr2/Oj2PsBGSUO
         U9aC+OIcGNb5LhxhWTkQOGCJOGTeHW7bRfuby3GbD1QtxGJVlGXG/13Fa7IaqjnA5rBJ
         c7o/dATknjamc46CXKNLPabOVkl46xU9gqOBB2AabH96A68xqB1C3xSka2765BpAfs3w
         LZXTEkODK3kVevBK6F8nU1F8JUsB7hD6wjhP8AdaCFqK543d+vrk46MEDbMzuDRHMjd1
         XlVg==
X-Gm-Message-State: ACrzQf1GnvEph2jHYn6LFcsI/vf7C3+CzilGIIkiBGRjVXXPkn1CDT6Z
        NtiBy9oH/YFL7+bg+hcXo9Luiw==
X-Google-Smtp-Source: AMsMyM4T073Yv+JGLQqhkADELIid00CulstnKHkA4MtnuwYSQKVjQVdgipjDUmQ4sFXmnk1ToKNesg==
X-Received: by 2002:ac2:50da:0:b0:4a2:44dc:b820 with SMTP id h26-20020ac250da000000b004a244dcb820mr6323789lfm.316.1667241784612;
        Mon, 31 Oct 2022 11:43:04 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 7-20020ac25f07000000b0048ad4c718f3sm1393880lfq.30.2022.10.31.11.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:43:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PULL] qcom: replace the rest of Venus firmware with MBN files
Date:   Mon, 31 Oct 2022 21:43:03 +0300
Message-Id: <20221031184303.113448-1-dmitry.baryshkov@linaro.org>
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

Follow the example of vpu-2.0 and venus-5.4 and drop the split venus.mdt/.bNN
files in favour of venus.mbn files. Provide compatibility venus.mdt ->
venus.mbn symlinks.

The following changes since commit 8bb75626e9dd831d323c4e460414b56260f0b700:

  Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-31 11:12:54 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware venus

for you to fetch changes up to 7d5671369d1c8f2d4125ff931602f2f8fe20211a:

  qcom/vpu-1.0: drop split firmware in favour of the mbn file (2022-10-31 21:32:05 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      qcom/venus-1.8: replace split firmware with the mbn file
      qcom/venus-4.2: replace split firmware with the mbn file
      qcom/venus-4.2: drop split firmware in favour of the mbn file
      qcom/vpu-1.0: drop split firmware in favour of the mbn file

 WHENCE                                  |  37 ++++++--------------------------
 qcom/venus-1.8/venus.b00                | Bin 212 -> 0 bytes
 qcom/venus-1.8/venus.b01                | Bin 6600 -> 0 bytes
 qcom/venus-1.8/venus.b03                | Bin 5568 -> 0 bytes
 qcom/venus-1.8/venus.b04                |   1 -
 qcom/venus-1.8/{venus.b02 => venus.mbn} | Bin 975088 -> 992976 bytes
 qcom/venus-1.8/venus.mdt                | Bin 6812 -> 0 bytes
 qcom/venus-4.2/venus.b00                | Bin 212 -> 0 bytes
 qcom/venus-4.2/venus.b01                | Bin 6600 -> 0 bytes
 qcom/venus-4.2/venus.b03                | Bin 28976 -> 0 bytes
 qcom/venus-4.2/venus.b04                |   1 -
 qcom/venus-4.2/{venus.b02 => venus.mbn} | Bin 884136 -> 925432 bytes
 qcom/venus-4.2/venus.mdt                | Bin 6812 -> 0 bytes
 qcom/venus-5.2/venus.b00                | Bin 212 -> 0 bytes
 qcom/venus-5.2/venus.b01                | Bin 6600 -> 0 bytes
 qcom/venus-5.2/venus.b02                | Bin 837304 -> 0 bytes
 qcom/venus-5.2/venus.b03                | Bin 33640 -> 0 bytes
 qcom/venus-5.2/venus.b04                |   1 -
 qcom/venus-5.2/venus.mdt                | Bin 6812 -> 0 bytes
 qcom/vpu-1.0/venus.b00                  | Bin 692 -> 0 bytes
 qcom/vpu-1.0/venus.b01                  | Bin 7528 -> 0 bytes
 qcom/vpu-1.0/venus.b02                  | Bin 300 -> 0 bytes
 qcom/vpu-1.0/venus.b03                  | Bin 20 -> 0 bytes
 qcom/vpu-1.0/venus.b04                  | Bin 20 -> 0 bytes
 qcom/vpu-1.0/venus.b05                  | Bin 20 -> 0 bytes
 qcom/vpu-1.0/venus.b06                  | Bin 20 -> 0 bytes
 qcom/vpu-1.0/venus.b07                  | Bin 24 -> 0 bytes
 qcom/vpu-1.0/venus.b08                  | Bin 16 -> 0 bytes
 qcom/vpu-1.0/venus.b09                  | Bin 883152 -> 0 bytes
 qcom/vpu-1.0/venus.b10                  | Bin 41360 -> 0 bytes
 qcom/vpu-1.0/venus.b19                  |   1 -
 qcom/vpu-1.0/venus.mdt                  | Bin 8220 -> 0 bytes
 32 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 qcom/venus-1.8/venus.b00
 delete mode 100644 qcom/venus-1.8/venus.b01
 delete mode 100644 qcom/venus-1.8/venus.b03
 delete mode 100644 qcom/venus-1.8/venus.b04
 rename qcom/venus-1.8/{venus.b02 => venus.mbn} (98%)
 delete mode 100644 qcom/venus-1.8/venus.mdt
 delete mode 100644 qcom/venus-4.2/venus.b00
 delete mode 100644 qcom/venus-4.2/venus.b01
 delete mode 100644 qcom/venus-4.2/venus.b03
 delete mode 100644 qcom/venus-4.2/venus.b04
 rename qcom/venus-4.2/{venus.b02 => venus.mbn} (95%)
 delete mode 100644 qcom/venus-4.2/venus.mdt
 delete mode 100644 qcom/venus-5.2/venus.b00
 delete mode 100644 qcom/venus-5.2/venus.b01
 delete mode 100644 qcom/venus-5.2/venus.b02
 delete mode 100644 qcom/venus-5.2/venus.b03
 delete mode 100644 qcom/venus-5.2/venus.b04
 delete mode 100644 qcom/venus-5.2/venus.mdt
 delete mode 100644 qcom/vpu-1.0/venus.b00
 delete mode 100644 qcom/vpu-1.0/venus.b01
 delete mode 100644 qcom/vpu-1.0/venus.b02
 delete mode 100644 qcom/vpu-1.0/venus.b03
 delete mode 100644 qcom/vpu-1.0/venus.b04
 delete mode 100644 qcom/vpu-1.0/venus.b05
 delete mode 100644 qcom/vpu-1.0/venus.b06
 delete mode 100644 qcom/vpu-1.0/venus.b07
 delete mode 100644 qcom/vpu-1.0/venus.b08
 delete mode 100644 qcom/vpu-1.0/venus.b09
 delete mode 100644 qcom/vpu-1.0/venus.b10
 delete mode 100644 qcom/vpu-1.0/venus.b19
 delete mode 100644 qcom/vpu-1.0/venus.mdt
