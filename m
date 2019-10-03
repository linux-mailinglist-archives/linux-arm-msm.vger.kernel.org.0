Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE07CAE24
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 20:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732635AbfJCS1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 14:27:53 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38732 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729199AbfJCS1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 14:27:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id w12so3826448wro.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fi4XGjAW8IL22UQ2E3MLgTRkUEhWQPz4pB1hOvF/+fA=;
        b=Hi1MkI/qpCxDbo6JZhKQmKaxIfwr4T4/k99ZbBFtrHb3q4zw4ByDCYUdD64t29C+gj
         jVQ2d7m6uw7VArrSuymO7GOFOw0xAjsY1rOrejvNUM/CWj5UQkatSjG1q/5u8wGFu44X
         adzpD3zXTL4dmCzurjzLoCdmCYYyAlYC9Nnh28F6IWKNhnFhLA/FeCYphMw3rixYFew0
         Zd+7JUBPLll2xu2/2sVF2JxGdc3dQdcK5N+5sIFIFY29oE9lBrj8yuNFrneVgttifo9J
         rD/bOUSj1RMwnG0WRsbbYtMqFD8WoJ5ODZLwcMNPWz9rAl1uw5hW7ef8uqkisLu7P5pb
         O9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fi4XGjAW8IL22UQ2E3MLgTRkUEhWQPz4pB1hOvF/+fA=;
        b=KLkqnGWadCMjOtGgnedgMiaR2fq2s2RYSwMHVQ9T81zowhkzpVYBkBqWCVTeCD/j2o
         axSS8K8VWuRWV6b+0FkcWrUactbD298T4BLKcQEVCvdsjgKDoH8DEON6qgn3zyYQZ/jD
         WkBaCJlMVjY0MQYwMaqIKU9sGyDIzkAB/FwSP2zKxSATLlAcsIr3VVCETIadND4grd3v
         ehd/dBqYGa8KngbWbTq1Yzq4B+7D6quPY0jbkmtqy60egxK0SMm76XtY/ZKy2M+Cx7Bp
         /mOYevrAvM2uFkgf1e5hwLI4/uMmqRM3V7nxP/4FiddRKk97vFCAEod6JhPamAqalT6J
         +lbQ==
X-Gm-Message-State: APjAAAUVwXq+aAXhNp6v75tewSRHM1WVOWCIXARMXpZWeIy5Lad72bjJ
        7C9B3U4FsyBO4CWmZVvcgSXl43lrKfRQqeyEF1JcOg==
X-Google-Smtp-Source: APXvYqxbFaYgQESHFT0ejIDrfC9cSb6nt3hGDE7e+F1jf57qtk9/E/O4Le3nxo8YcgqHg6K6YkTwO5gXuwhpzDsp1ZQ=
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr4115663wrr.23.1570127268783;
 Thu, 03 Oct 2019 11:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190301192017.39770-1-dianders@chromium.org>
In-Reply-To: <20190301192017.39770-1-dianders@chromium.org>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 3 Oct 2019 11:27:37 -0700
Message-ID: <CAJ+vNU0Ma5nG9_ThLO4cdO+=ivf7rmXiHZonF0HY0xx6X3R6Hw@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
To:     Douglas Anderson <dianders@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tirumalesh Chalamarla <tchalamarla@caviumnetworks.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>,
        linux-arm-msm@vger.kernel.org, evgreen@chromium.org,
        tfiga@chromium.org, Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 1, 2019 at 11:21 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> If you're bisecting why your peripherals stopped working, it's
> probably this CL.  Specifically if you see this in your dmesg:
>   Unexpected global fault, this could be serious
> ...then it's almost certainly this CL.
>
> Running your IOMMU-enabled peripherals with the IOMMU in bypass mode
> is insecure and effectively disables the protection they provide.
> There are few reasons to allow unmatched stream bypass, and even fewer
> good ones.
>
> This patch starts the transition over to make it much harder to run
> your system insecurely.  Expected steps:
>
> 1. By default disable bypass (so anyone insecure will notice) but make
>    it easy for someone to re-enable bypass with just a KConfig change.
>    That's this patch.
>
> 2. After people have had a little time to come to grips with the fact
>    that they need to set their IOMMUs properly and have had time to
>    dig into how to do this, the KConfig will be eliminated and bypass
>    will simply be disabled.  Folks who are truly upset and still
>    haven't fixed their system can either figure out how to add
>    'arm-smmu.disable_bypass=n' to their command line or revert the
>    patch in their own private kernel.  Of course these folks will be
>    less secure.
>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Hi Doug / Robin,

I ran into this breaking things on OcteonTx boards based on CN80XX
CPU. The IOMMU configuration is a bit beyond me and I'm hoping you can
offer some advice. The IOMMU here is cavium,smmu-v2 as defined in
https://github.com/Gateworks/dts-newport/blob/master/cn81xx-linux.dtsi

Booting with 'arm-smmu.disable_bypass=n' does indeed work around the
breakage as the commit suggests.

Any suggestions for a proper fix?

Best Regards,

Tim
