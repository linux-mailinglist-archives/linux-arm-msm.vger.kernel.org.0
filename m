Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E433B60CEE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 16:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233066AbiJYOZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 10:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbiJYOZH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 10:25:07 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDCC87696
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 07:24:59 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so7797558otu.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 07:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bGXBYeUCndwf1ekXAko01QJwh6PKL7XDvbvRJfB1gLg=;
        b=ABkhzuabWPvcbK7CBOkSdN8eZIXM3y1u1pX7369I6XJUtKC4hhD8XCNWwsCDdpeQK/
         eARAMDiDT9BXj8FQXYKNOzaIIc9ISnEFva/+VZZ7ik3Wp6gJqzbNbRL5KyXLaeXPxgS8
         ro/onwUqkiNYoRhRcJxm/PAneU+cFjzYHGJWI7hZCcNNHBYLB9M2x/eJYwLP6M3ry/nz
         K3FCz3+2RgO3drUIumxkUkiL+ECbTZZj7La0WJKziRi3tmSxJsMrLqyaHpi9EGC7cSCR
         8kH0BSIOkSKL7gdcqnbL/xCBwxlR9Wh+0qFbg5JKZSEWLJlOuFG/EYqaLNJzdYHrK1jS
         9Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGXBYeUCndwf1ekXAko01QJwh6PKL7XDvbvRJfB1gLg=;
        b=mzITB/ohGSulL0hnhPYJyFcrCN/KH/Nmn08QjFQegFV0jAC/VeZlo1uf2eyY4p5tYI
         +4j50ECxa/EwFegerfyRC+N4grRUVaHIPditRAbJbQlYUvbFR7CXoR/MR9gdBc4xf04Z
         9vWVUiY1JBberPxVNp7a/c6SEdSieWxCn4qbBSQc55rWTD2Lc4+KcB0SRxaQmKmRWl2j
         9oPB4lLLUpgUvFXpeZbE5KZi6G9W3AwPMj4CJkzoIMI0DXc6ZB120wIKtHYpgAUQ9OAB
         g98+ZWFlx6DR+2RrY9DZx91E2n18doAAOB4RjUGHVxW3BWbYGW1/sV4PNN0/oektlQ41
         pm7g==
X-Gm-Message-State: ACrzQf2Xfo19q3g36JQ61vxFZ4g/gj2szHz6W9L+kQU8cEcZeu6KoslW
        D+1ubu1fkQR0lI/hvBspcuVunyyaNgLXc481/LI=
X-Google-Smtp-Source: AMsMyM5bklZuoqpKZZRuGDvHRGRqS0T5rB4ABN1ptMUYJcLWaRA63AJDnnJrvsw6mmTXt56tqu5QGbTMo5XOWSul4IM=
X-Received: by 2002:a05:6830:2644:b0:661:e80b:bd4b with SMTP id
 f4-20020a056830264400b00661e80bbd4bmr19252184otu.22.1666707898262; Tue, 25
 Oct 2022 07:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
 <CAA8EJpoBYb-=3RT_EO+PSFkbJ95RobyeHt6QmOfTTgvEEFoUfQ@mail.gmail.com> <CANHAJhEui=wn985RzfsUR+GdsESCExi2Gst43c+WEOBqaD5dTg@mail.gmail.com>
In-Reply-To: <CANHAJhEui=wn985RzfsUR+GdsESCExi2Gst43c+WEOBqaD5dTg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 25 Oct 2022 07:24:46 -0700
Message-ID: <CAF6AEGs3RoB7zm8NjgsHMfqGY=-+etr8-EEuZw1MPUaXbDBy_A@mail.gmail.com>
Subject: Re: [PULL V2]: qcom: SC7180 and SC7280 venus firmware updates
To:     Nathan Hebert <nhebert@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 24, 2022 at 4:13 PM Nathan Hebert <nhebert@chromium.org> wrote:
>
> On Thu, Oct 20, 2022 at 11:02 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 20 Oct 2022 at 20:08, Nathan Hebert <nhebert@chromium.org> wrote:
> > >
> > > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> > >
> > >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/nathan-google/linux-firmware.git
> > > update_sc7180_and_sc7280_firmwares_v2
> > >
> > > for you to fetch changes up to 054271e4164b6b4c069a3aaaeb9bfcde8c850339:
> > >
> > >   qcom: update venus firmware files for VPU-2.0 (2022-10-20 09:37:35 -0700)
> > >
> > > ----------------------------------------------------------------
> > > Nathan Hebert (3):
> > >       qcom: update venus firmware files for v5.4
> > >       qcom: remove split SC7280 venus firmware images
> > >       qcom: update venus firmware files for VPU-2.0
> > >
> > >  WHENCE                   |  17 ++---------------
> > >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> > >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> > >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> > >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> > >  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> > >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> > >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b19   |   1 -
> > >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> > >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
> > >  21 files changed, 2 insertions(+), 16 deletions(-)
> > >  delete mode 100644 qcom/vpu-2.0/venus.b00
> > >  delete mode 100644 qcom/vpu-2.0/venus.b01
> > >  delete mode 100644 qcom/vpu-2.0/venus.b02
> > >  delete mode 100644 qcom/vpu-2.0/venus.b03
> > >  delete mode 100644 qcom/vpu-2.0/venus.b04
> > >  delete mode 100644 qcom/vpu-2.0/venus.b05
> > >  delete mode 100644 qcom/vpu-2.0/venus.b06
> > >  delete mode 100644 qcom/vpu-2.0/venus.b07
> > >  delete mode 100644 qcom/vpu-2.0/venus.b08
> > >  delete mode 100644 qcom/vpu-2.0/venus.b09
> > >  delete mode 100644 qcom/vpu-2.0/venus.b10
> > >  delete mode 100644 qcom/vpu-2.0/venus.b19
> > >  delete mode 100644 qcom/vpu-2.0/venus.mdt
> >
> > As I wrote in another email thread, it might be better to drop split
> > files, add only venus.mbn and then use Link: lines to create venus.mdt
> > -> venus.mbn symlinks.
> Thanks for the feedback. There was some concern from Vikash at Qualcomm
> about making a change to the venus-5.4 firmware to drop the split files.
>
> Vikash, are you able to comment about whether or not it is a concern to replace
> the venus.mdt and split files with a symbolic link to venus.mdn for
> the venus-5.4
> files? I tested the suggested approach on ChromeOS with kernels based on 5.4
> and 5.15 and did not see any issues.
>
> This is a holiday week, so his response may be slow.
>

The symlink trick that Dmitry suggested would cover the case that
Vikash is concerned about.

BR,
-R
