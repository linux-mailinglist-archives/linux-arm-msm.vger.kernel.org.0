Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E00278B21A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 15:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjH1NjY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 09:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjH1NjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 09:39:07 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D65B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 06:39:03 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-58d31f142eeso38403517b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 06:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693229943; x=1693834743;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pio6VoOm/5lpUbXzpkLDCulsDT3sYv4Dh7mQt0x57W8=;
        b=A3T23trTU/csXttC9AWpmWnSFJQTiD6RwJSakxXH+VW0ZEkV5S546tO0Ho0iWKzgEn
         5gZnUxrBeFtapp1leDnMHRJVH+BgcViVN3vugk9eKJbNZXoUAG9bSEo2nwl/tscDkJR+
         shy2elGHulln2vkU6G1IjRMdxAPwnAqFmq5rO9m50F6ubMge5TWwULdJZABQLJIL1Sdv
         T1UhdEg/QtW+68ZEnpnonEOBao6wrIEtDXY9R1IAUyY+3aDRWjkf3+6r3ghypXCbnDfT
         IwXX3/ED0ylWpLfMF5mI0cfwq45+19rmZIMLuQXF3XD7Pq+SOlFhnOJl3AulW4hzFS/f
         H5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693229943; x=1693834743;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pio6VoOm/5lpUbXzpkLDCulsDT3sYv4Dh7mQt0x57W8=;
        b=TIBTqmDPRbv4Mzv57l3DxGj07rqtBAvnyy9uWZlc+5kDDKcofzXwu/0kpVD0oH7UfS
         c2NasEU3ZhH6diOdbpe/GHfQ6eKv17ylUUXj6WDGAJrwwQuvDgqbg7r5x5OmovU50xcz
         ONcI5ihohA4mKADcbPdYU9taPyTmpqUnp2laC8IlthpiPkcx+kYzgqkPT5AcJty/bmLo
         8GoD6tLgqYDdN2IfSyEEClCl+bUDn2JRqYs51SCG5L9p2lDnW+E6RvkELAmaAatj4kxI
         IXfx5IV3Zs+9be+Dp3HCXxEiuGwxHD4Y4QA7hwBRLjPuItG4xd9Vec84vsNwGZoIcqr0
         mxwA==
X-Gm-Message-State: AOJu0Yxx/k2b3GYOlrVCQ1qd27xrfRDKiKZLpM0ygGxAxf85RaHQuekU
        pjt0q9G9nJV5DSdKYc9itg9gZpDz8Mjvj6JQdva56A==
X-Google-Smtp-Source: AGHT+IH09vDBNafmWZFBy2GTAoRBCiNtc0u/e6CGk0mBt8uS0MwUCIk9yBV1ux9wBv4Z1OoCAEPrZImbLV7Q9GhtSo4=
X-Received: by 2002:a25:240f:0:b0:d53:f88a:dc09 with SMTP id
 k15-20020a25240f000000b00d53f88adc09mr24600029ybk.2.1693229943197; Mon, 28
 Aug 2023 06:39:03 -0700 (PDT)
MIME-Version: 1.0
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Aug 2023 16:38:52 +0300
Message-ID: <CAA8EJpqg-CrbzpSqO9W6W2c=V6TN0Yx5mfih3j4cYeOLNRz+Ng@mail.gmail.com>
Subject: ath10k-firmware: WCN3990: Add board file for the Qualcomm SDM845 MTP platform
To:     ath10k@lists.infradead.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Kalle,

We'd like to ask for inclusion of the board file for the Qualcomm
SDM845 MTP board. It is a hardware development kit manufactured by
Qualcomm, using the Snapdragon SDM845 SoC and a variant of wcn3990
BT/WiFi chip.

Following the questions from the ath10k wiki page:

* description for what hardware this is
- It is SDM845-based platform
- It uses wcn3990 chip as a WiFi and BT radio
- For the reference:

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001
board_id 0x3f soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b
fw_build_timestamp 2018-07-19 12:28 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
ath10k_snoc 18800000.wifi: failed to fetch board data for
bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp
from ath10k/WCN3990/hw1.0/board-2.bin
ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id
0x00000000 sub 0000:0000
ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_snoc 18800000.wifi: firmware ver  api 5 features
wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc 18800000.wifi: htt-ver 3.53 wmi-op 4 htt-op 3 cal file
max-sta 32 raw 0 hwcrypto 1
ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

* origin of the board file
  - This file comes from the firmware package provided by Thundercomm for
the RB3 platform (also sdm845-based), cross-checked to be the same as
the file provided together with the sdm845-mtp board.

* ids to be used with the board file

bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp

Note, the device comes with the board_id not changed from 0xff.
Following the example of existing boards we are adding the
calibration variant.

* md5sum of each new board file to add

$ md5sum *
c1f5ff1660cf6dcd74bff7b41c9e693f
bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp.bin

$ sha256sum *
8b250ac1bea81825cc6f4a70105dea89b0952340a9c77a8ab37e99cbfa63e53d
bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp.bin

-- 
With best wishes
Dmitry
