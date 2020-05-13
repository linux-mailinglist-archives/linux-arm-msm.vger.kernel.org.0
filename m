Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CA31D19BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 17:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbgEMPpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 11:45:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:63735 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgEMPpf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 11:45:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589384734; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5BGt2SG+SlPBIoe9j8b16CCwBiaChEc3LMrTSY3Ot9A=;
 b=VaSEuWDYY+KZ1mDj1jm8n9P4y0dW6VGJKKOtWazAXmnj3wK8O/zHmCXEtpB+v0hfTCnpvjcR
 fIU8+hmfK1lsen/Docowdzj8iw0BQ2WzS0uy4/IrEqYQtl14s0n8PtAuG59bJhJoXfmI68CO
 t1yKRGPnoVwcWsSivbeUWR46AtU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebc161d.7f1e29c93880-smtp-out-n04;
 Wed, 13 May 2020 15:45:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BACACC43637; Wed, 13 May 2020 15:45:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F05F6C433D2;
        Wed, 13 May 2020 15:45:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 May 2020 21:15:32 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
In-Reply-To: <158933457051.215346.13515171569230202840@swboyd.mtv.corp.google.com>
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org>
 <eee1b9a90266eed9a9c75401f0679777@codeaurora.org>
 <CAJ9a7Vjd0XG+rAvHptAAjGtE6xRhYsPaOSC_Bf9B-w-FZFu_Qw@mail.gmail.com>
 <47f6d51bfad0a0bf1553e101e6a2c8c9@codeaurora.org>
 <37b3749e-2363-0877-c318-9c334a5d1881@arm.com>
 <d47271ee6a2a6f0f30da7e140b6f196c@codeaurora.org>
 <CAJ9a7Vg95tcgMXgQKLAZc=TpV6FnPZ7wdF=Kwbuy7d2kRCjYQw@mail.gmail.com>
 <364049a30dc9d242ec611bf27a16a6c9@codeaurora.org>
 <CAJ9a7VjAoUmMG9pLEzE_rMSpOjwVOi-ZCinF87n9H0JgfMDsiQ@mail.gmail.com>
 <158933457051.215346.13515171569230202840@swboyd.mtv.corp.google.com>
Message-ID: <861f8ab0174d036cb1e49e34e4f81a92@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-13 07:19, Stephen Boyd wrote:
> Quoting Mike Leach (2020-05-12 14:52:33)
>> HI Sai,
>> 
>> On Tue, 12 May 2020 at 18:46, Sai Prakash Ranjan
>> <saiprakash.ranjan@codeaurora.org> wrote:
>> >
>> > Hi Mike,
>> >
>> > On 2020-05-12 17:19, Mike Leach wrote:
>> > [...]
>> >
>> > >> >>
>> > >> >> Sorry for hurrying up and sending the patch -
>> > >> >> https://lore.kernel.org/patchwork/patch/1239923/.
>> > >> >> I will send v2 based on further feedbacks here or there.
>> > >> >>
>> > >> >>>
>> > >> >>> 1) does this replicator part have a unique ID that differs from the
>> > >> >>> standard ARM designed replicators?
>> > >> >>> If so perhaps link the modification into this. (even if the part no
>> > >> >>> in
>> > >> >>> PIDR0/1 is the same the UCI should be different for a different
>> > >> >>> implementation)
>> > >> >>>
>> > > I have reviewed the replicator driver, and compared to all the other CS
>> > > drivers.
>> > > This driver appears to be the only one that sets hardware values in
>> > > probe() and expects them to remain in place on enable, and uses that
>> > > state for programming decisions later, despite telling the PM
>> > > infrastructure that it is clear to suspend the device.
>> > >
>> > > Now we have a system where the replicator hardware is behaving
>> > > differently under the driver, but is it behaving unreasonably?
>> >
>> > Thanks for taking your time to review this. For new replicator behaving
>> > unreasonably, I think the assumption that the context is not lost on
>> > disabling clock is flawed since its implementation defined. Is such
>> > assumption documented in any TRM?
>> >
>> 
>> Looking at the AMBA driver there is a comment there that AMBA does not
>> lose state when clocks are removed. This is consistent with the AMBA
>> protocol spec which states that AMBA slaves can only be accessed /
>> read / write on various strobe signals,  or state reset on PRESET
>> signal, all timed by the rising edge of the bus clock. state changes
>> are not permitted on clock events alone. Given this static nature of
>> AMBA slaves then removing the clock should not have any effect.
> 
> I believe the "clock" that is being used here is actually a software
> message to the power manager hardware that the debug subsystem isn't
> being used anymore. When nothing is requesting that it be enabled the
> power manager turns off the power to the debug subsystem and then the
> register context is lost. It shouldn't be a clock in the clk subsystem.
> It should be a power domain and be attached to the amba devices in the
> usual ways. Then the normal runtime PM semantics would follow. If amba
> devices require a clk then we'll have to provide a dummy one that
> doesn't do anything on this platform.
> 

Note that there are 2 dynamic replicators and the behaviour is different 
only on
one of the replicators(swao_replicator) which is in AOSS domain. I don't 
see
how runtime PM would help us differentiate between them and handle PM 
differently
for different replicators.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
