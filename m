Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C77C60D5ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 22:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbiJYU6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 16:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiJYU6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 16:58:24 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2788EB56DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 13:58:23 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j16so4954146lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yUTt6VLq/FG7bgtqV4fhWrAEHOLV/WTIHQhdcrc1Wog=;
        b=Tp0TLa00HLCXtl3ffcadkzejggM1y241hFCoY5J0DWzBHimYZgdV/tt/hkoCAvQB/v
         808aUD+QHNgq3jvfqrzR9B2UqeYUcJxRn8XaUDqQJI2xLfEYy7kRqc0irqxTtTpKrV2C
         pNJkD6raN1oJ5euAK2GgDuoqd3qkKEOUDh/HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUTt6VLq/FG7bgtqV4fhWrAEHOLV/WTIHQhdcrc1Wog=;
        b=y0vHdsNBjt7ynOf3ratKQfSb/uufLlA6YlX6fdURKDJsSDED7r/EcIydCaKvH1u+vB
         stiQB+98+LLhEvrhmTas8PtyHJwgld+CfQLZDsvJ92hhXq84J6Bol9kX4gmqgqUJgV30
         cZ5Rgoqnh063VWlFjjx2UOsR1dx7zEWWj+ZuWrUJCaWNJIOkwLLllsPB07uFRWXLPiqz
         IXhIikeb9k2ynBDmrWtwPrIOihFDvmqo8Ja5TE+oYQgSrmpphuc+F5xGkAEYuBIp4VO0
         xdfxpwMRJ3urPKPqgjKVWvp/slMka7AHTmkPPnOoYifESf/RDVUEPHW1QOLK20el/34P
         k4Lw==
X-Gm-Message-State: ACrzQf1j148R6mJUa3Sn3kPdN3KpDo6vzdyIPY384JOTDgHQPb3MXmVU
        y5CPW6bAW+K4l/zO782o1ZOEAnPhUiLOF9ZZnnKK6g==
X-Google-Smtp-Source: AMsMyM7k+V4SEh4ZacdYw66y4Hxj0CbKLUR3YfJBFYjUYEQpZYrodngI4GSQU+eNpvTiB8SGEEec/8vIC9OmgIyO1qQ=
X-Received: by 2002:a05:6512:6d4:b0:4a2:f89:db7d with SMTP id
 u20-20020a05651206d400b004a20f89db7dmr14224188lff.125.1666731501476; Tue, 25
 Oct 2022 13:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
 <CAA8EJpoBYb-=3RT_EO+PSFkbJ95RobyeHt6QmOfTTgvEEFoUfQ@mail.gmail.com>
 <CANHAJhEui=wn985RzfsUR+GdsESCExi2Gst43c+WEOBqaD5dTg@mail.gmail.com> <CAF6AEGs3RoB7zm8NjgsHMfqGY=-+etr8-EEuZw1MPUaXbDBy_A@mail.gmail.com>
In-Reply-To: <CAF6AEGs3RoB7zm8NjgsHMfqGY=-+etr8-EEuZw1MPUaXbDBy_A@mail.gmail.com>
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Tue, 25 Oct 2022 13:58:10 -0700
Message-ID: <CANHAJhEWXf8U-FJJbOUpRV1gCXsd++H8kzbiBP1Z7iryaOCoYQ@mail.gmail.com>
Subject: Re: [PULL V2]: qcom: SC7180 and SC7280 venus firmware updates
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org,
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

On Tue, Oct 25, 2022 at 7:24 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Oct 24, 2022 at 4:13 PM Nathan Hebert <nhebert@chromium.org> wrote:
> >
> > On Thu, Oct 20, 2022 at 11:02 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 20 Oct 2022 at 20:08, Nathan Hebert <nhebert@chromium.org> wrote:
> > > >
> > > > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> > > >
> > > >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://github.com/nathan-google/linux-firmware.git
> > > > update_sc7180_and_sc7280_firmwares_v2
> > > >
> > > > for you to fetch changes up to 054271e4164b6b4c069a3aaaeb9bfcde8c850339:
> > > >
> > > >   qcom: update venus firmware files for VPU-2.0 (2022-10-20 09:37:35 -0700)
> > > >
> > > > ----------------------------------------------------------------
> > > > Nathan Hebert (3):
> > > >       qcom: update venus firmware files for v5.4
> > > >       qcom: remove split SC7280 venus firmware images
> > > >       qcom: update venus firmware files for VPU-2.0
> > > >
> > > >  WHENCE                   |  17 ++---------------
> > > >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> > > >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> > > >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> > > >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> > > >  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> > > >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> > > >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b19   |   1 -
> > > >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> > > >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
> > > >  21 files changed, 2 insertions(+), 16 deletions(-)
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b00
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b01
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b02
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b03
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b04
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b05
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b06
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b07
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b08
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b09
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b10
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b19
> > > >  delete mode 100644 qcom/vpu-2.0/venus.mdt
> > >
> > > As I wrote in another email thread, it might be better to drop split
> > > files, add only venus.mbn and then use Link: lines to create venus.mdt
> > > -> venus.mbn symlinks.
> > Thanks for the feedback. There was some concern from Vikash at Qualcomm
> > about making a change to the venus-5.4 firmware to drop the split files.
> >
> > Vikash, are you able to comment about whether or not it is a concern to replace
> > the venus.mdt and split files with a symbolic link to venus.mdn for
> > the venus-5.4
> > files? I tested the suggested approach on ChromeOS with kernels based on 5.4
> > and 5.15 and did not see any issues.
> >
> > This is a holiday week, so his response may be slow.
> >
>
> The symlink trick that Dmitry suggested would cover the case that
> Vikash is concerned about.
>
> BR,
> -R
Thanks Rob, Dmitry, and Vikash for the feedback. I have sent a V3 pull
request that incorporates Dmitry's suggestion to the linux-firmware
mailing list.

BR,
Nathan
