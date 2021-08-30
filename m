Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33E53FB083
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 06:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhH3Er7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 00:47:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230506AbhH3Er6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 00:47:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EDF5604D7;
        Mon, 30 Aug 2021 04:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630298825;
        bh=EzNbbLzp89C4vwZ1VHzMWl9Ex04tosDHheiya+MiwzU=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=Bp7P8EHL35CXk34jRCKx/CRQ+4YsNxY0iG8ADCTlMfC/4eM7SjwV6gZo6rGy7rGgC
         kUzsx/F19Xdxq2bcLUExWEp5YZW/bo4+6LL02XP61rJusoKLQHLF7Pl1idiWMyCKyh
         B8H1lRlkJSPJYgnvc7R9udnCTKbwOwgBqx5LrN07MJlhTotLmmYH/QddQ9Znm8Bsln
         6IAoYEH4NdhNEpPmuInGKme7m3dob+OIIRArrfISMjZsRl04kksdfXbsZqrKU+5y5S
         lUxLHFxgY1VH3RqRW+0CPPxcgh3K11tzY3PIq8UPfYMjCAmxOZ5/cfJp/O6BKoF2Gc
         jc970nR9qCeFg==
References: <e34c8e16-6521-c6e4-f3ed-9d8520d4ece2@codeaurora.org>
 <87bl63yqq8.fsf@kernel.org>
 <eb975a76-1482-f502-4dc1-7993cc3f30d0@codeaurora.org>
 <87eeaga39m.fsf@kernel.org>
 <7a6bf94b-91cd-15d5-dd9c-798e7a927727@codeaurora.org>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: Regarding usb dwc3 core shutdown callback
Date:   Mon, 30 Aug 2021 07:45:57 +0300
In-reply-to: <7a6bf94b-91cd-15d5-dd9c-798e7a927727@codeaurora.org>
Message-ID: <87r1ebczei.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Sandeep Maheswaram <sanm@codeaurora.org> writes:

> Hi,
>
> On 8/26/2021 4:13 PM, Felipe Balbi wrote:
>> Hi,
>>
>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>> (why isn't this email plain/text? Content Type was set to multipart
>>>> alternative, please configure your email client correctly :-)
>>>>
>>>> While at that, also make sure to break lines at 80-columns)
>>>>
>>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>>> Hi,
>>>>>
>>>>> Earlier I have posted the patch for usb dwc3 core shutdown callback
>>>>>
>>>>> https://lore.kernel.org/linux-arm-msm/1618380209-20114-1-git-send-ema=
il-sanm@codeaurora.org/
>>>>>
>>>>> and it was reverted due to issues.
>>>> Right, as should be expected when we find regressions
>>>>
>>>>> https://lore.kernel.org/linux-usb/20210603151742.298243-1-alexandru.e=
lisei@arm.com/
>>>>>
>>>>> As we already have shutdown callback in xhci plat driver where we halt
>>>>> the controller, so there will be no transactions with usb devices.
>>>>>
>>>>> https://lore.kernel.org/linux-usb/20200306092328.41253-1-ran.wang_1@n=
xp.com/
>>>>>
>>>>> So I think dwc3 core shutdown may not be required at least when we are
>>>>> using host mode. Let me know your opinion about this.
>>>> If that's the case, then sure. Please validate the condition, though,
>>>> and kindly report back on your findings
>>> I have enabled couple of logs in shutdown path and see no URBs
>>> enqueued after xhci shut down.
>>>
>>> Hope this is enough for validation . Please suggest if anything more I
>>> could do.
>> how about writing a little script to kexec into another kernel for a few
>> hundred iterations and make sure things still work after all that?
>
> Currently kexec is not supported on qcom devices.=C2=A0 Anything we can do
> apart from kexec?

Sure about that? I've been using kexec with 8150 for quite a while.

--=20
balbi
