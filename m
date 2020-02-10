Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE27158498
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 22:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgBJVOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 16:14:00 -0500
Received: from mail.serbinski.com ([162.218.126.2]:47700 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgBJVOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 16:14:00 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 61398D006F9;
        Mon, 10 Feb 2020 21:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Zu_DfRZFKs-n; Mon, 10 Feb 2020 16:13:52 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 9949FD00693;
        Mon, 10 Feb 2020 16:13:52 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 9949FD00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581369232;
        bh=I3EkcQkTwwd2J+O4KVzA9fWCbXcpR3MPvY39AeBuXPc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WOvn/ALSo44nlC/+0cDovkez1JTNslVLaIIbhuvoM+/3oa4nBGa1pnceTS0UoWX6c
         08w+kT2ztltcs1aFhDmLxRRrQlebR647uWLrm5h5kITpI1/Gl9QgmcVGSIoIFTvokp
         NeLvnj41zH+LetieRTbae51hBYAK18UL2QF9t+xE=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 10 Feb 2020 16:13:52 -0500
From:   Adam Serbinski <adam@serbinski.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols to set PCM rate
In-Reply-To: <20200210200839.GG14166@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
 <20200210182609.GA14166@sirena.org.uk>
 <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
 <20200210200839.GG14166@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <7c57801d8f671c40d4c6094e5ce89681@serbinski.com>
X-Sender: adam@serbinski.com
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-10 15:08, Mark Brown wrote:
> On Mon, Feb 10, 2020 at 03:00:55PM -0500, Adam Serbinski wrote:
>> On 2020-02-10 13:26, Mark Brown wrote:
> 
>> > To repeat my comment on another patch in the series there should still
>> > be some representation of the DAI for this device in the kernel.
> 
>> Respectfully, I'm not sure I understand what it is that you are 
>> suggesting.
> 
>> Is it your intention to suggest that instead of adding controls to the
>> machine driver, I should instead write a codec driver to contain those
>> controls?
> 
> I have already separately said that you should write a CODEC driver for
> this CODEC.  I'm saying that this seems like the sort of thing that
> might fit in that CODEC driver.

I see. My initial thought with respect to the codec driver would be just 
to use bt-sco.c, which is a dummy codec. I can certainly implement a new 
codec driver.

>> Or is it your intention to suggest that something within the kernel is
>> already aware of the rate to be set, and it is that which should set 
>> the
>> rate rather than a control?
> 
> That would be one example of how such a CODEC driver could be
> configured, and is how other baseband/BT devices have ended up going
> (see cx20442.c for example).

I am not aware of how this could be done for bluetooth, since the value 
still has to originate from userspace. The driver you referred to 
supports only a single sample rate, whereas for bluetooth, 2 sample 
rates are required, and nothing in the kernel is aware of the 
appropriate rate, at least in the case of the qca6174a I'm working with 
right now, or for that matter, TI Wilink 8, which I've also worked with.

My concern with implementing this in a new codec driver, is that this 
codec driver will be bound to qdsp6, since its purpose is to work around 
a characteristic of this DSP. Under simple-card, for instance, it would 
be redundant, since in that case, the parameters userspace uses to open 
the pcm will be propagated to the port. But under qdsp6, userspace could 
open the pcm at 44.1 kHz, yet the backend port is still set to 8 or 16 
kHz, and the DSP resamples between them, so the sole purpose of this 
change is to allow userspace to deliver the required sample rate to the 
back end of qdsp6.
