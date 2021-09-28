Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCE741AF13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 14:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240560AbhI1Mc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 08:32:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240540AbhI1Mc3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 08:32:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75E2E61058;
        Tue, 28 Sep 2021 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632832249;
        bh=mtSfHm8rKZZDIv110IBwJuxSeqCXj4md2IThNZnXe9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jyTR57Xle6lTAoHy2sBUMN/HVXZN1O4L6YgU3KqqWVrnpZ+D+S++HIfAJhZAeXhxm
         5RRZ0IeQSJECjtr04A2ETSlFuY5awhlk4SS65bURbIbLKaUeZJxCgNIlgD9nNUYTKu
         wjHZXA2MRKMxMd9R/2ZVfwa5RB07jifgAtK9VWCc=
Date:   Tue, 28 Sep 2021 14:30:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] Revert "of: property: fw_devlink: Add support for
 remote-endpoint"
Message-ID: <YVMK90kRtkBxptlR@kroah.com>
References: <20210927204830.4018624-1-dmitry.baryshkov@linaro.org>
 <CAGETcx-3Y3rOSoXu3SbDa6BP_jcT8uSQA+MV55QCY4b0Oe7L-A@mail.gmail.com>
 <11fe1793-1455-ae44-b213-9afe47dfa370@linaro.org>
 <CAGETcx_HRmvDKuXQEJkMk7zBpedLGkQmvJ24tAWpCHFf4DPX_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx_HRmvDKuXQEJkMk7zBpedLGkQmvJ24tAWpCHFf4DPX_w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 27, 2021 at 06:13:12PM -0700, Saravana Kannan wrote:
> On Mon, Sep 27, 2021 at 5:56 PM Dmitry Baryshkov
> > root@qcom-armv8a:~# ls -l /sys/bus/platform/devices/88e9000.phy/
> > lrwxrwxrwx    1 root     root             0 Aug  4 15:13
> > consumer:platform:a600000.usb ->
> > ../../../virtual/devlink/platform:88e9000.phy--platform:a600000.usb
> > lrwxrwxrwx    1 root     root             0 Aug  4 15:13
> > consumer:platform:af00000.clock-controller ->
> > ../../../virtual/devlink/platform:88e9000.phy--platform:af00000.clock-controller
> > -rw-r--r--    1 root     root          4096 Aug  4 15:13 driver_override
> > -r--r--r--    1 root     root          4096 Aug  4 15:13 modalias
> > lrwxrwxrwx    1 root     root             0 Aug  4 15:13 of_node ->
> > ../../../../firmware/devicetree/base/soc@0/phy@88e9000
> > drwxr-xr-x    2 root     root             0 Aug  4 15:13 power
> > lrwxrwxrwx    1 root     root             0 Aug  4 15:10 subsystem ->
> > ../../../../bus/platform
> > lrwxrwxrwx    1 root     root             0 Aug  4 15:13
> > supplier:platform:100000.clock-controller ->
> > ../../../virtual/devlink/platform:100000.clock-controller--platform:88e9000.phy
> > lrwxrwxrwx    1 root     root             0 Aug  4 15:13
> > supplier:platform:18200000.rsc:clock-controller ->
> > ../../../virtual/devlink/platform:18200000.rsc:clock-controller--platform:88e9000.phy
> > lrwxrwxrwx    1 root     root             0 Aug  4 15:13
> > supplier:platform:18200000.rsc:pm8150-rpmh-regulators ->
> > ../../../virtual/devlink/platform:18200000.rsc:pm8150-rpmh-regulators--platform:88e9000.phy
> > -rw-r--r--    1 root     root          4096 Aug  4 15:10 uevent
> > -r--r--r--    1 root     root          4096 Aug  4 15:13
> > waiting_for_supplier
> >
> > Thus it is not possible to spot this device link without
> > CONFIG_DEBUG_DRIVER=y (or any similar debugging technique).
> 
> I sent out some patches to make this easier. But doesn't look like
> it'll land in 5.15.
> https://lore.kernel.org/lkml/20210915172808.620546-1-saravanak@google.com/

I have now queued these up to make it into 5.15-final, this thread has
convinced me :)

greg k-h
