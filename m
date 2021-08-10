Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B913E8382
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 21:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbhHJTSh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 15:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbhHJTSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 15:18:37 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304DAC0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 12:18:15 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so320333otl.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 12:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=k1IK/wArPuofh/93ioTZO6H7LyceMDQimCWY2mD2ezU=;
        b=aMODdZG5LqB7gNRAGk32Ef4rqadfXiaWqqB5wNgIvVygGukSPXzPIl+aBksSNVcB4l
         72iehfYbtVacuS9r1/kMDqfr5k5oV3eo2H5QIlXmHNg+TYXMYdSFMMDikvuoz69lwBmj
         TjslM7UhSLrZC7F9E0cdlJeetb59gZRoG73Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=k1IK/wArPuofh/93ioTZO6H7LyceMDQimCWY2mD2ezU=;
        b=UB12VJCEOcsrdWeBGTnLaT9oldsqTUdD5vPJ8WakGfoIpTBloM4qZxYeGt8aZtfXzR
         RL7DdS9tfTzmJe7W0nhzfua019/4QKBPNhi3zGh3QGDD3dqiyPPwu1o71HP/KfdGysU1
         cbrak8Z2SfPn7IBaQ4m9i9+SieRXgcENNOvTsRWiLVFrRGmLRtnW6I4+xtjfnzM2TcOV
         x0tVPghQqjk9GiI16fTmnLfIsG2tAQvDFK22KEhZG1UnwnC7wCp3gYxMunaHXNH3EJiN
         eYRtQ3+JE3My8PScXSoiSGVNh8GiTCv7kje5my2JB6qJ8hOdt15LIcGRxrNy9elAK/cn
         /kAA==
X-Gm-Message-State: AOAM532PEDmuW3KJQmxIK6nwvUgOz6mvS1em30afDtupZguGRjF8sl17
        5gdq20IQjNTtiKi+z/RJ4nag+l2fUTru7U0BdWWJEw==
X-Google-Smtp-Source: ABdhPJyzZrxGALW9iwqei94wy7msgQgsAVIXnt+gxLetD1fNF2MnvVjum7qa8FZVoHBkeTc7UJtw7P9qjZXZ4yRP4kk=
X-Received: by 2002:a05:6830:44a7:: with SMTP id r39mr22153068otv.25.1628623094548;
 Tue, 10 Aug 2021 12:18:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 12:18:14 -0700
MIME-Version: 1.0
In-Reply-To: <8009f5a1458468dbf0b7b20dd166911c@codeaurora.org>
References: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n5203g4CkF5WP1fQYU57fntXbdyVBsMsTKU_xPkgvbt+7Q@mail.gmail.com>
 <bf2b00c5-0826-00d2-ca95-b4ae6a030211@codeaurora.org> <CAE-0n53ojhs+RMpsYtVjsrYbb_PRdkJOvxFhiTtJPMUDuoP_eA@mail.gmail.com>
 <8009f5a1458468dbf0b7b20dd166911c@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 12:18:13 -0700
Message-ID: <CAE-0n53TCo1UTVi3e18N5hF3+Y_bLiqgH1o5PEua7F9-bog_gQ@mail.gmail.com>
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-08-10 10:24:32)
> On 2021-08-09 23:28, Stephen Boyd wrote:
> > Quoting Deepak Kumar Singh (2021-08-09 04:05:08)
> >>
> >> On 8/6/2021 1:10 AM, Stephen Boyd wrote:
> >> > Quoting Deepak Kumar Singh (2021-08-05 09:17:33)
> >> >> Some use cases require SMP2P interrupts to wake up the host
> >> >> from suspend.
> >> > Please elaborate on this point so we understand what sort of scenarios
> >> > want to wakeup from suspend.
> >>
> >> Once such scenario is where WiFi/modem crashes and notifies crash to
> >> local host through smp2p
> >>
> >> if local host is in suspend it should wake up to handle the crash and
> >> reboot the WiFi/modem.
> >
> > Does anything go wrong if the firmware crashes during suspend and the
> > local host doesn't handle it until it wakes for some other reason? I'd
> > like to understand if the crash handling can be delayed/combined with
> > another wakeup.
>
> If the modem firmware crashes
> during suspend, the system comes
> out of xo-shutdown and AFAIK stays
> there until we handle the interrupt.
>

So you're saying we waste power if we don't wakeup the AP and leave the
SoC in a shallow low power state? That would be good to have indicated
in the code via a comment and in the commit text so we know that we want
to handle the wakeup by default.
