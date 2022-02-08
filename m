Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC414ACD87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 02:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240357AbiBHBGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 20:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343984AbiBHAS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 19:18:59 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF610C061355
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 16:18:57 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id w7so19147486ioj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Feb 2022 16:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vScBC3jkunPuKV71bwmpHxOhrGxKlBbuYe/cqBu7qF8=;
        b=TV/KEXy0SdalYrBG9vcyQo4ANXKRqQZpfsevkQCRvDDS3QkNqsAVFK3CiXgrn7BhEC
         lQZP1zue6xcSxErPJDsPnbnJ7NzZaPCUltMJoeN9SGtNIMM3tb2qVUWD6hCx2/5gvyQb
         4WVzprlonmdeJ8JUjSQiAOvjj5o67UrS7+Dfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vScBC3jkunPuKV71bwmpHxOhrGxKlBbuYe/cqBu7qF8=;
        b=w042/Fq1RyWxqrk5/4qUX8i9Qh3/TY0A7HDIp45imEol46Do40EfcyKouPrP0uruGY
         3lH8262BMiDW0r8r3o6tTCuSjBLdHA52bXZ6e2P4I9IDws9ZsnLl5nSrzK587OAqaeNA
         2Ae5k7CRuD1fIShpF9eeoN8/RnMql0D19HM6Tq+WyPlTJgbenzdzcglAkPSlp60OEjHV
         Um/NNWWJI/u6Ia6wy91BjVB7YskZ8E23T5GsXSoKaXXVUWdJ2eOdYgHC4kM3n4OoIWxQ
         B45z22x6aBIbUh8bytXlHPnt4o6ok5xO4tAvY2SU7L0DLRVENHL/bMeJDIgdRiyT4SBi
         SK9A==
X-Gm-Message-State: AOAM5333eB4WEUMMHC0bzr/nC2ib/UYoGBxGab1Z9igTI8DN4UeQmO2f
        hvWs6nOgjkhqlW2wkv3kAoWIrHk/iRANxw==
X-Google-Smtp-Source: ABdhPJw2VjgjczGjhLxkAxEbHhn2Zieou1qnMNV73PNNPy/nd0wNakXCTesmX1MK7CunYbNXWRBouA==
X-Received: by 2002:a05:6638:1444:: with SMTP id l4mr1017273jad.95.1644279537286;
        Mon, 07 Feb 2022 16:18:57 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id ay35sm7037725iob.3.2022.02.07.16.18.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 16:18:54 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id 9so19204289iou.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Feb 2022 16:18:54 -0800 (PST)
X-Received: by 2002:a05:6638:168d:: with SMTP id f13mr980261jat.44.1644279533953;
 Mon, 07 Feb 2022 16:18:53 -0800 (PST)
MIME-Version: 1.0
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com> <CAE-0n50sONq+URcWwvDH=UPshgy6+XZEB3sK_4n+5jNktHsEhg@mail.gmail.com>
In-Reply-To: <CAE-0n50sONq+URcWwvDH=UPshgy6+XZEB3sK_4n+5jNktHsEhg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Feb 2022 16:18:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VwrO9fpOtpjrsbjkmucvL6NbHMc3jLtjsiRJD6aG0Hkg@mail.gmail.com>
Message-ID: <CAD=FV=VwrO9fpOtpjrsbjkmucvL6NbHMc3jLtjsiRJD6aG0Hkg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for eDP PHY on SC7280 platform
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>, quic_kalyant@quicinc.com,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Feb 2, 2022 at 1:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Sankeerth Billakanti (2021-11-15 23:07:35)
> > This series adds support for the eDP PHY on Qualcomm SC7280 platform.
> > The changes are dependent on v4 of the new eDP PHY driver introduced by Bjorn:
> > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=575135
> >
> > Sankeerth Billakanti (3):
> >   dt-bindings: phy: Add eDP PHY compatible for sc7280
> >   phy: qcom: Add support for eDP PHY on sc7280
> >   phy: qcom: Program SSC only if supported by sink
>
> This series was sent to the wrong maintainers. It's in the phy
> framework, not the drm framework. Please use scripts/get_maintainers.pl
> to find the right email addresses and send this series again.

To help out, I've re-posted this myself, hopefully getting all the
correct maintainers.

https://lore.kernel.org/r/20220208001704.367069-1-dianders@chromium.org
