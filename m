Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26A164ED29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 18:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfFUQaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 12:30:24 -0400
Received: from foss.arm.com ([217.140.110.172]:35818 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfFUQaY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 12:30:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C8E9344;
        Fri, 21 Jun 2019 09:30:23 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50DAD3F575;
        Fri, 21 Jun 2019 09:30:22 -0700 (PDT)
Date:   Fri, 21 Jun 2019 17:30:12 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>, stephan@gerhold.net
Cc:     mathieu.poirier@linaro.org, david.brown@linaro.org,
        saiprakash.ranjan@codeaurora.org, agross@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: Coresight causes synchronous external abort on msm8916
Message-ID: <20190621163012.GA32249@e107155-lin>
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <CANLsYkxaX2=Bp_BWWUFimC-UmP3L5g=CU7tqjd+xoFVcWG38tA@mail.gmail.com>
 <20190621160631.GA34922@gerhold.net>
 <14bd9196-538f-f641-59e1-0c04960890aa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14bd9196-538f-f641-59e1-0c04960890aa@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 21, 2019 at 05:16:28PM +0100, Suzuki K Poulose wrote:
> Hi Stephan
>
> On 21/06/2019 17:06, Stephan Gerhold wrote:
> >
> >   (b) Preventing the crash:
> >       Is there some way to:
> >
> >        (1) Add a check in the AMBA bus code to verify if the power
> >            domain is actually turned on?
>
> No, there isn't, unless the DT tells you that device is disabled, just like
> your patch does.
>

Suzuki has already covered most of the points. Just wanted to add the
reason why kernel behaves the way it does. Kernel needs to deal with
absence of power domain info in DT by assuming the device is ready to
use. IIRC, even disabling few PM configuration, it behaves the same.

So yes, you need to explicitly disable in DT. Sorry if I misled you
earlier. I assumed the firmware and platform was tested to work, but
just missing configuration was causing the reported issue. If the
firmware doesn't enable PD by default and has no mechanism to enable
it, then disabling the device in DT is best way.

> >       or
> >        (2) Recover from the "synchronous external abort" and continue
> >            booting after printing an error/warning?
> >            (At the moment, userspace seems to continue for a while,
> >             but stops working at some point after the error...)
>
> Unfortunately, no. There is no way to do that from the kernel.
>
> >
> >       Otherwise, there is still the option to prevent the AMBA bus code
> >       from running by disabling the affected device tree nodes.
> >       That's what the debug@850000 { status = "disabled"; }; ... snippet
> >       from my first mail [3] does, and it is the only way to make the
> >       kernel boot successfully at the moment.
>
> For your board, I would say, this is the best option and the reasonable
> solution.
>
> >
> >       It wouldn't affect any other device if placed in the DTS for my
> >       device (i.e. *not* in the shared msm8916.dtsi).
>
> Ultimately, the device tree is based on the assumption that you are running with
> a firmware that supports the power domain and thus is fine for upstream. If
> someone is using a firmware that doesn't support this, it is better to disable
> the nodes, just like you did.
>
> Personally I would leave the upstream DTS as it is and expect the user to
> fixup his DTS for the firmware.
>
If there are known versions of firmware to work/not and they can be
discovered in bootloader or so, then affected platform can patch DT
to mark the device "disabled"(In case you can't disable it in upstream
without affecting other platforms)

--
Regards,
Sudeep
