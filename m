Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF9D2FA390
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 15:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404825AbhAROte (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 09:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405178AbhAROsQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 09:48:16 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809BAC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 06:47:36 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id 43so3063789uag.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 06:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYITA3Yxe+LNUEBbIjMhLMDLo8Pr6qOWRiVR9QOc69o=;
        b=WBp4BQ4iS/nMuJHj2dRCYS1FOe1q70UMadKm9plqyvTpqfBAye6UbGn+Szu9OK2C9t
         /sL8U2B/SyzKpzYyfD/PA0RseoBzXrBcf12M4EFyJMxQXw3jeGXo1UhmVOCddHRiGoax
         Xyfns6tQ10yiERfST33vIWqybEqEXPJWFcPbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYITA3Yxe+LNUEBbIjMhLMDLo8Pr6qOWRiVR9QOc69o=;
        b=A3euVKg7+s0Fm/Gc78wiP+X57ju2vjZMUSjFcRC+glVUBcsQuicZxY9jxZPzY/+Hms
         6J9lwwOcjih6/hNfc9RqeQ0Ymm1fDhvoe41/R9Nd+YMflDl2aKg3ClQYzIsTUcpiz/5I
         Am7aTx4Y/SbJjeeV2SpBexM7lEWkQCIBFhUMZCMmDoXLf2hJ3/uiekWze0L9gVfbEn9w
         r9nIAfa8ko0TT+HXJ4z4RougnXrCi1VdhTudGAGQzr3QYKT8Cgc4FqRHD1ReOTEyDdcf
         NRh7G9axTlSluRQwZPeOEFKXVp4Ww6C1UaKHP7HV71MYzRmORgSDKOX8D77SbUg//8/l
         wRbg==
X-Gm-Message-State: AOAM530WZf0X1d5LoRkiirt1X/k0aRdkbwfnjhyrt6TUC07MhWtBHZEb
        GGD6r3H9IoDUkyMEjxK36K08QhBeUkjJtkDPXy9eKA==
X-Google-Smtp-Source: ABdhPJwMOdZBQVMFI+wOY4prWcda+5x/AEFNDfgLueyLCfRiRaIBomu6uUxWpvmwEP1qgrXX6LiK2JHjkjI2sbTLjFs=
X-Received: by 2002:ab0:7193:: with SMTP id l19mr2785323uao.84.1610981255465;
 Mon, 18 Jan 2021 06:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15> <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
In-Reply-To: <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
From:   Mattias Nissler <mnissler@chromium.org>
Date:   Mon, 18 Jan 2021 15:47:23 +0100
Message-ID: <CAKUbbx+ZC9cLvcaJnrDYYsrUhfO3dOXJGoLswL30nRzChjwn-w@mail.gmail.com>
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode tracing
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Al Grant <al.grant@arm.com>,
        leo.yan@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 15, 2021 at 6:46 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hello Mathieu, Suzuki
>
> On 2020-10-15 21:32, Mathieu Poirier wrote:
> > On Thu, Oct 15, 2020 at 06:15:22PM +0530, Sai Prakash Ranjan wrote:
> >> On production systems with ETMs enabled, it is preferred to
> >> exclude kernel mode(NS EL1) tracing for security concerns and
> >> support only userspace(NS EL0) tracing. So provide an option
> >> via kconfig to exclude kernel mode tracing if it is required.
> >> This config is disabled by default and would not affect the
> >> current configuration which has both kernel and userspace
> >> tracing enabled by default.
> >>
> >
> > One requires root access (or be part of a special trace group) to be
> > able to use
> > the cs_etm PMU.  With this kind of elevated access restricting tracing
> > at EL1
> > provides little in terms of security.
> >
>
> Apart from the VM usecase discussed, I am told there are other
> security concerns here regarding need to exclude kernel mode tracing
> even for the privileged users/root. One such case being the ability
> to analyze cryptographic code execution since ETMs can record all
> branch instructions including timestamps in the kernel and there may
> be other cases as well which I may not be aware of and hence have
> added Denis and Mattias. Please let us know if you have any questions
> further regarding this not being a security concern.

Well, the idea that root privileges != full control over the kernel
isn't new and at the very least since lockdown became part of mainline
[1] no longer an esoteric edge case. Regarding the use case Sai hints
at (namely protection of secrets in the kernel), Matthew Garret
actually has some more thoughts about confidentiality mode for
lockdown for secret protection [2]. And thus, unless someone can make
a compelling case that instruction-level tracing will not leak secrets
held by the kernel, I think an option for the kernel to prevent itself
from being traced (even by root) is valuable.

Finally, to sketch a practical use case scenario: Consider a system
where disk contents are encrypted and the encryption key is set up by
the user when mounting the file system. From that point on the
encryption key resides in the kernel. It seems reasonable to expect
that the disk encryption key be protected from exfiltration even if
the system later suffers a root compromise (or even against insiders
that have root access), at least as long as the attacker doesn't
manage to compromise the kernel.

[1] https://lwn.net/Articles/796866/
[2] https://mjg59.dreamwidth.org/55105.html

>
> After this discussion, I would like to post a v2 based on Suzuki's
> feedback earlier. @Suzuki, I have a common config for ETM3 and ETM4
> but couldn't get much idea on how to implement it for Intel PTs, if
> you have any suggestions there, please do share or we can have this
> only for Coresight ETMs.
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
