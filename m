Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEA71D8F06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 07:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgESFIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 01:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgESFIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 01:08:55 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21EAC061A0C;
        Mon, 18 May 2020 22:08:54 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id x1so10690344ejd.8;
        Mon, 18 May 2020 22:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bzaSWPdEsSK5zaDdrUfyTL7HSAYziP4z95tfcOtLWTs=;
        b=tfqD/Z+PdlRuS6tbP/HDtRSt8Q3tGdqdYXjGOc5Sn7r4OHEmF/yzfGuaLPsoGs5dQe
         5YlYtZYGS7xD6HHYh4uZ1SKzft9hzSoiKFcpPzM+pFdF0FDzivYbEeQmFE79H8/KIdiE
         OewTZJpRa6TqpSpJMWP2ww3CVuwq8bZnmRxJeNsPXvRBjrv6NnBcHp9U/MoDnuIOAEVb
         RYHoDXjyEGBtYGXxSXkMAeSvtzH5VpWYjbg4V+Lp1pM20LyZS+rw/nn0rFR9hKoDA+xh
         KYkVoGSahbj9YliC5GBVmJL8b4+JBQDOemzCczOKwvn0L3ydKth9Fpy0o1IKzMof/UBu
         lFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bzaSWPdEsSK5zaDdrUfyTL7HSAYziP4z95tfcOtLWTs=;
        b=UVwGVtgKFqgoM12O8YCy9721PxKXXrDOodPcPD2IoAx3Hhb1fGePPcK4MAD0T6zPV6
         OWtOVfA6ioelinEdQAFpqY8yTvfzkKvnyQLNtLuJRnAj9iamYC6Vf0n2DAZU+GNooBde
         IDVpGt4+b3Hy3GmLNYvAOzz9fwlnkua/Hh0ni6M2gg1LndkT97/qc4Y4bOtQhkbHZHwc
         SetUepxMcsIQC+YkaHIIDoLbrNYBpFuHnxJow3aN6y7k6mtoj6V97uYCeCdPTN4o7ODn
         7EHI+4z0Xv62K8oJfUjvSMg2ig8ud1RPeq734ELK/bDwgglXkVA6jac74vqEyZL29/VO
         bLKQ==
X-Gm-Message-State: AOAM531jDcmzyWwz+zijn9dYjJ4MUns3KnBvIV412Ji/Z/cu6KWHG1bW
        eQyH9odKxVt9sO7wpF5MY5ev8KueL65dHlLaCbLCOw==
X-Google-Smtp-Source: ABdhPJx8NbvbqQ6CA/+kgi0g+QbJilFJZSKZaTMiQ5lgnnALRPeH3b1RgHKKAppVTvfgvjWnu7XE4sX1QSNgjO019e4=
X-Received: by 2002:a17:906:860a:: with SMTP id o10mr18415826ejx.250.1589864933626;
 Mon, 18 May 2020 22:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
From:   Dave Airlie <airlied@gmail.com>
Date:   Tue, 19 May 2020 15:08:42 +1000
Message-ID: <CAPM=9txXskVu_yD3DNuR0HgSUsE2v1Pv98dm=AHGvv_z2XKTAQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> Introduction:
> Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
> SoC ASIC for the purpose of efficently running Deep Learning inference
> workloads in a data center environment.
>
> The offical press release can be found at -
> https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
>
> The offical product website is -
> https://www.qualcomm.com/products/datacenter-artificial-intelligence
>
> At the time of the offical press release, numerious technology news sites
> also covered the product.  Doing a search of your favorite site is likely
> to find their coverage of it.
>
> It is our goal to have the kernel driver for the product fully upstream.
> The purpose of this RFC is to start that process.  We are still doing
> development (see below), and thus not quite looking to gain acceptance quite
> yet, but now that we have a working driver we beleive we are at the stage
> where meaningful conversation with the community can occur.


Hi Jeffery,

Just wondering what the userspace/testing plans for this driver.

This introduces a new user facing API for a device without pointers to
users or tests for that API.

Although this isn't a graphics driver, and Greg will likely merge
anything to the kernel you throw at him, I do wonder how to validate
the uapi from a security perspective. It's always interesting when
someone wraps a DMA engine with user ioctls, and without enough
information to decide if the DMA engine is secure against userspace
misprogramming it.

Also if we don't understand the programming API on board the device,
we can't tell if the "core" on the device are able to reprogram the
device engines either.

Figuring this out is difficult at the best of times, it helps if there
is access to the complete device documentation or user space side
drivers in order to faciliate this.

The other area I mention is testing the uAPI, how do you envisage
regression testing and long term sustainability of the uAPI?

Thanks,
Dave.
