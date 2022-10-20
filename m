Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4B06067B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 20:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiJTSEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 14:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbiJTSDw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 14:03:52 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9DD1F181F
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 11:03:22 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id o70so505094yba.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JiU21IUjtI58NlwCKQZjnguRNvHim3P+sZFUqd40B4Y=;
        b=a/qrN79cSAPBs62S8I35ncPjusJ84k5iP23/eBJVhXckvOYhgaTCS+bZPAfkxWjkN7
         CIWQkEqmz9LHQsFGx28skYLubkCn6bMFmf1iX7yDaUhWPf3wK3qVV5P1f/nWqk0uIp31
         x39pTTSz3zZhrzte8q1jNsh1pVZWefz1MXnZhArwVs38KUm2djMb2G31/iRZ2tffwJjw
         JYSz9gbf7sdDuRLc5tf/Ux7Yiy5gS9TqHhR/Fr33+EWoBG5bmUAXKMfOUS43Wa7aiPu5
         4njhrzGw0oUmky8kiNBcQw6XVcgkrgKhBcicLgxP8ZCErkJ/fEc4PVJ7iZ9sRRexKjLI
         gyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiU21IUjtI58NlwCKQZjnguRNvHim3P+sZFUqd40B4Y=;
        b=bARD1fzfzy4fvy0tUVtLhOVP0yiUV6MxnBBh42M/0+Z7tRB2vAsUVexYz4d6ZEe9y1
         9eMJsoIZuLBb/YZSgBKnOzReV2POD1deL9N9cnUd+vzZP1QhHxK7tOozsFF1TBCerb8g
         jkoVx67DUzEpgr1SQSIjzKDhd82W6HxEvKVl9VrISmAEgAzSiFKLfgizm0w+anPqVcks
         SoQTtYBHPjwhWHKg3c9s8BGA7kxVrKaGFmaBmRfBxJSl2BHktn8iQq+wL1i794H+Zubk
         ZNSkMW9j6UAO1Oi7dGdDqx5HQp9eWNyeu9pf6Ezki7oMFRkBFjiHTu6GHv0E0FJ3rjov
         Po/Q==
X-Gm-Message-State: ACrzQf2fNM30mXtl/Ygyvsp75NKWBlvl0R+TQF9C82ORiHJ61hYHjp5f
        8DTTlo3h1CEGJfMdHi8i4nTU8CGfJ10b1qaMtjvY7A==
X-Google-Smtp-Source: AMsMyM5W3vXmuPDB46VdSKfGi5D9ZTW2cEO0qEQh3TdZsP6NFAoaIccBpYMlP7g4pBdHstNDY01gSkF3se5KM7Odt9Q=
X-Received: by 2002:a25:8a0f:0:b0:6c2:4ea4:69e5 with SMTP id
 g15-20020a258a0f000000b006c24ea469e5mr12893149ybl.153.1666288955194; Thu, 20
 Oct 2022 11:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
In-Reply-To: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 20 Oct 2022 21:02:24 +0300
Message-ID: <CAA8EJpoBYb-=3RT_EO+PSFkbJ95RobyeHt6QmOfTTgvEEFoUfQ@mail.gmail.com>
Subject: Re: [PULL V2]: qcom: SC7180 and SC7280 venus firmware updates
To:     Nathan Hebert <nhebert@chromium.org>
Cc:     linux-firmware@kernel.org, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Oct 2022 at 20:08, Nathan Hebert <nhebert@chromium.org> wrote:
>
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
>
>   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/nathan-google/linux-firmware.git
> update_sc7180_and_sc7280_firmwares_v2
>
> for you to fetch changes up to 054271e4164b6b4c069a3aaaeb9bfcde8c850339:
>
>   qcom: update venus firmware files for VPU-2.0 (2022-10-20 09:37:35 -0700)
>
> ----------------------------------------------------------------
> Nathan Hebert (3):
>       qcom: update venus firmware files for v5.4
>       qcom: remove split SC7280 venus firmware images
>       qcom: update venus firmware files for VPU-2.0
>
>  WHENCE                   |  17 ++---------------
>  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
>  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
>  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
>  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>  qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
>  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
>  qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
>  qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
>  qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
>  qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
>  qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
>  qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
>  qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
>  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
>  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
>  qcom/vpu-2.0/venus.b19   |   1 -
>  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
>  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
>  21 files changed, 2 insertions(+), 16 deletions(-)
>  delete mode 100644 qcom/vpu-2.0/venus.b00
>  delete mode 100644 qcom/vpu-2.0/venus.b01
>  delete mode 100644 qcom/vpu-2.0/venus.b02
>  delete mode 100644 qcom/vpu-2.0/venus.b03
>  delete mode 100644 qcom/vpu-2.0/venus.b04
>  delete mode 100644 qcom/vpu-2.0/venus.b05
>  delete mode 100644 qcom/vpu-2.0/venus.b06
>  delete mode 100644 qcom/vpu-2.0/venus.b07
>  delete mode 100644 qcom/vpu-2.0/venus.b08
>  delete mode 100644 qcom/vpu-2.0/venus.b09
>  delete mode 100644 qcom/vpu-2.0/venus.b10
>  delete mode 100644 qcom/vpu-2.0/venus.b19
>  delete mode 100644 qcom/vpu-2.0/venus.mdt

As I wrote in another email thread, it might be better to drop split
files, add only venus.mbn and then use Link: lines to create venus.mdt
-> venus.mbn symlinks.

-- 
With best wishes
Dmitry
