Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F077A334002
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 15:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbhCJOMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 09:12:21 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56665 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232739AbhCJOME (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 09:12:04 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id ECB18197B;
        Wed, 10 Mar 2021 09:12:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 10 Mar 2021 09:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=L
        k2jjm9Fdqr7UhvXi78E9Usih3cXWYq14BC1Hb4xjwY=; b=VMzcJijd5A0BQkWwT
        cZcM34WPpz8lypjXNDKMNa/mOqzUledr/YPQ0wEjtyCty53TVheGvzNP9t8ajJB7
        jXK99JWUNdv7R/ObhVzwbL1+yw239Rb/OxC0wWokE94Djw/ajGFzFCCSfzI5HucH
        JP+jatH6G4UrmK7wHZy4qGgubpqnLBhHGtGuepxSM2ksvlt1PamTUhWNrwBGHzmz
        JFqt0bSR1+5TvJSqnP8ZptwjLzua2gD6bO58jOeRx+zjOACC3wLLjnNGAhCGpEEu
        TVeDlTUq5vJlnTfngDP/YAp3hKoBBGOwTI1JgzbJqfauuGsTFRGZmll8uATwmtCm
        zOyYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=Lk2jjm9Fdqr7UhvXi78E9Usih3cXWYq14BC1Hb4xj
        wY=; b=vL9D35bJwf760RG2oYN2/9ixzs+Tzq6ga6gSEA+5cRAC1c5ux2+5EmMQX
        n++qmltWho+6xOcrt4e2vYehir3O2oN/XURsS16gPPnQETB5TCCsL80m2d0bYitG
        zboQJZEMCyWo3MskjPlcsxUj2TWKkqRHvYZ5I060YwkQlN5e+zqpwo7WOvEyCS4I
        OYpQhOTjQSHQ6hL8n8gjVFBOxT+sWJpWcnU9LHUSiI2wbyZ1OxweCTixJ5pqk9aO
        Z8gldXv4Y4iE0yqjcKgfkQ1W6RbfkTisIJ6wawT3eVs8iwir5Jf6xTt9JEf3UP80
        fySzTNq3pTYHZ2dDzcz7Pd381Cpyg==
X-ME-Sender: <xms:sdNIYHbd7-vvpY6ieskRbekFcZd7_iUHy81WSgI-6ecS0Pe5B-gCRw>
    <xme:sdNIYGZr17qJyvoiUOkTZ5bw1d7vZ-oxg9AyHdNaofHze94Fn5uN9wRagToSiBdqz
    r2O3iiaATdPfuE5bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepteeugeekffeltdffleegveeigeeihfevhffhjeekgeetgeefvdeu
    vdduiedvjeehnecuffhomhgrihhnpehsphhinhhitghsrdhnvghtpdhkvghrnhgvlhdroh
    hrghenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdroh
    hrgh
X-ME-Proxy: <xmx:sdNIYJ-2noVAN7ERPCLm6k_5lI_eoc8XO_LzLEWp2EfWPltWCpTsJA>
    <xmx:sdNIYNoHHv4Qs-_VmGkCCxfKsttfQVekXDtMMDP97SQSj54g5v44RA>
    <xmx:sdNIYCr4ErMENlLWOoeqoKUMyYCUHqiJEUXnQwabn_YRP6ZHvrCyrA>
    <xmx:stNIYCKbKvzynf_Z_6NzAsrh2e18vuN0eXiv52kSK84MKgux5AfTnA>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id ED516240065;
        Wed, 10 Mar 2021 09:12:00 -0500 (EST)
Subject: Re: [PATCH RESEND 0/2] Common protected-clocks implementation
To:     Maxime Ripard <maxime@cerno.tech>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20200903040015.5627-1-samuel@sholland.org>
 <9363f63f-8584-2d84-71fd-baca13e16164@rasmusvillemoes.dk>
 <20210310085642.ugywtfct66x2bo5j@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <b804e134-b412-efad-1e94-2f34aa9d1d1e@sholland.org>
Date:   Wed, 10 Mar 2021 08:12:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210310085642.ugywtfct66x2bo5j@gilmour>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/10/21 2:56 AM, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Mar 09, 2021 at 09:03:14AM +0100, Rasmus Villemoes wrote:
>> On 03/09/2020 06.00, Samuel Holland wrote:
>>> Stephen, Maxime,
>>>
>>> You previously asked me to implement the protected-clocks property in a
>>> driver-independent way:
>>>
>>> https://www.spinics.net/lists/arm-kernel/msg753832.html
>>>
>>> I provided an implementation 6 months ago, which I am resending now:
>>>
>>> https://patchwork.kernel.org/patch/11398629/
>>>
>>> Do you have any comments on it?
>>
>> I'm also interested [1] in getting something like this supported in a
>> generic fashion - i.e., being able to mark a clock as
>> protected/critical/whatnot by just adding an appropriate property in the
>> clock provider's DT node, but without modifying the driver to opt-in to
>> handling it.
>>
>> Now, as to this implementation, the commit 48d7f160b1 which added the
>> common protected-clocks binding says
>>
>>   For example, on some Qualcomm firmwares reading or writing certain clk
>>   registers causes the entire system to reboot,
>>
>> so I'm not sure handling protected-clocks by translating it to
>> CLK_CRITICAL and thus calling prepare/enable on it is the right thing to
>> do - clks that behave like above are truly "hands off, kernel", so the
>> current driver-specific implementation of simply not registering those
>> clocks seems to be the right thing to do - or at least the clk framework
>> would need to be taught to not actually call any methods on such
>> protected clocks.
> 
> The idea to use CLK_CRITICAL was also there to allow any clock to be
> marked as protected, and not just the root ones. Indeed, by just
> ignoring that clock, the parent clock could end up in a situation where
> it doesn't have any (registered) child and thus would be disabled,
> disabling the ignored clock as well. Reparenting could cause the same
> issue.
> 
> Calling clk_prepare_enable just allows the kernel to track that it (and
> thus its parent) should never be disabled, ever.
> 
>> For my use case, either "hands off kernel" or "make sure this clock is
>> enabled" would work since the bootloader anyway enables the clock.
> 
> The current protected clocks semantics have been that the clock
> shouldn't be disabled by the kernel, but "hands off kernel" clocks imply
> a slightly different one. I would expect that the bootloader in this
> case wouldn't expect any parent or rate (or phase, or any other
> parameter really) change, while it might be ok for some other use cases
> (like the one Samuel was trying to address for example).

Right. In my scenario, the clock is needed for MMIO access to a low-speed
peripheral. I don't care what the clock rate is as long as it keeps running.

When writing the patch, I initially protected the rate as well, but that had the
unintended effect of protecting the rate of every ancestor clock. Maybe you need
rate protection for a "hands off, kernel" type of clock? If so, ignoring the
clock at probe time does not work, because the kernel does not know to protect
its parent rate.

So it sounds like the Qualcomm case is less about "don't touch the clock output"
as it is "don't touch the clock control registers".

> And even if we wanted the kernel to behave that way (making sure there's
> no way to change the rate, parents, phase, etc.), the kernel would have
> to have knowledge of it to also propagate that restriction to the whole
> chain of parents.

Yes, you can set additional flags in __clk_protect() to achieve that:
CLK_SET_RATE_GATE, CLK_SET_PARENT_GATE. This is a bit of a trick; it relies on
CLK_IS_CRITICAL preventing the clock from ever being gated.

Cheers,
Samuel
