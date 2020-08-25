Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA17E251CF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 18:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHYQK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 12:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHYQKz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 12:10:55 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61389C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 09:10:55 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id x17so3896623uao.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WgWByWGvguKIeIoz2+159dX6x4UuEkDuTZbs4BUSmnA=;
        b=bFps5sAmhdTDJhNVxL1nFnSKSn5gg1ysP1pQuHcF2HYjtCQl+LECrZqH7IHlUmNWY7
         k42yemoAfbjbGsQdB3VL4GU1eGJDvTb0Lf5BCj305ARzwvSADE3QxswOOxOFEAvUeynp
         pGEol79S1Wfm/yaUHQYpiWmto96jvLx6UpnVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WgWByWGvguKIeIoz2+159dX6x4UuEkDuTZbs4BUSmnA=;
        b=XuIdUZAYcCln/JOkrCQdU7LPW/IHl0YKKWARphkGZH5hJYK/o+QavezdW5ohicgJbk
         QOsiVrKQ8prMgvPFt9cxYCzeT4bq7ggyl6rW4uYtbNpIoabDejTczgfHwW7SByRWf/Jf
         lxzjaypA+ys6lVnPSjwDUw0FCAbav8qberYkbsXfTtTiplmoAo+ewL2zDlj7vjQoGYwZ
         70tBguE2x2Xhrj15AjvXYJzw+SuJHjaSfGZxShkmQ3LibzXWOCON6jwEpTn3GijSzI3u
         UKwXDiLfxSYZxM2Dj46L96XXlht6ZC2HVi7YDmUTh8oL3ujgPOpjZAcv0xOL245B/OgD
         RS0Q==
X-Gm-Message-State: AOAM532iZ0cNivInLyDJGvAtr9MWhRdBwHi8TPiPP80z5OHEHnfwttB/
        vCkdyzFjI1/9k6oYdj3Ng6gq7FWuRQwH1A==
X-Google-Smtp-Source: ABdhPJyH1dIBgBSV0gvNz48hv08O4Zn1raQ0+q8QYia3UMSFGCPoY3RLwIX5YFl3rgt0R2PnGIIkWA==
X-Received: by 2002:a9f:24f2:: with SMTP id 105mr6113627uar.48.1598371854154;
        Tue, 25 Aug 2020 09:10:54 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id u185sm1919049vke.17.2020.08.25.09.10.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 09:10:52 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id i129so6622462vsi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 09:10:52 -0700 (PDT)
X-Received: by 2002:a67:fbcc:: with SMTP id o12mr6262613vsr.213.1598371852357;
 Tue, 25 Aug 2020 09:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 09:10:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XK3Xa3rRWvuSA_jA+5_1XYBmHEX2B2XSb8h3oOe1PHLw@mail.gmail.com>
Message-ID: <CAD=FV=XK3Xa3rRWvuSA_jA+5_1XYBmHEX2B2XSb8h3oOe1PHLw@mail.gmail.com>
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 25, 2020 at 8:43 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Currently the non-strict or lazy mode of TLB invalidation can only be set
> for all or no domains. This works well for development platforms where
> setting to non-strict/lazy mode is fine for performance reasons but on
> production devices, we need a more fine grained control to allow only
> certain peripherals to support this mode where we can be sure that it is
> safe. So add support to filter non-strict/lazy mode based on the device
> names that are passed via cmdline parameter "iommu.nonstrict_device".
>
> Example: iommu.nonstrict_device="7c4000.sdhci,a600000.dwc3,6048000.etr"

I have an inherent dislike of jamming things like this onto the
command line.  IMHO the command line is the last resort for specifying
configuration and generally should be limited to some specialized
debug options and cases where the person running the kernel needs to
override a config that was set by the person (or company) compiling
the kernel.  Specifically, having a long/unwieldy command line makes
it harder to use for the case when an end user actually wants to use
it to override something.  It's also just another place to look for
config.

The other problem is that this doesn't necessarily scale very well.
While it works OK for embedded cases it doesn't work terribly well for
distributions.  I know that in an out-of-band thread you indicated
that it doesn't break anything that's not already broken (AKA this
doesn't fix the distro case but it doesn't make it worse), it would be
better to come up with a more universal solution.

Ideally it feels like we should figure out how to tag devices in a
generic manner automatically (hardcode at the driver or in the device
tree).  I think the out-of-band discussions talked about "external
facing" and the like.  We could also, perhaps, tag devices that have
"binary blob" firmware if we wanted.  Then we'd have a policy (set by
Kconfig, perhaps overridable via commandline) that indicated the
strictness level for the various classes of devices.  So policy would
be decided by KConfig and/or command line.

-Doug
