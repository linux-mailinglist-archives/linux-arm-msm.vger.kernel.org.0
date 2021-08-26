Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36A63F85D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 12:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241692AbhHZKvV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 06:51:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:51640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234327AbhHZKvV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 06:51:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E19E6606A5;
        Thu, 26 Aug 2021 10:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629975034;
        bh=09c1tjsSoixex+O8jJiLxYsaqmIjwNXlEeH57q+wSKc=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=emO/LkNmsXwHX5hq2482q5F0m3lzEBYK0pcn/gIzx9OBMS85D6rNFOLCyuOUEtRjj
         drl6KaTXQBWVwcJwZ1WErXWbJYazv/h4zATFt2q/7p1/Mf7vN9hVAhr4B2hIi4FnIh
         P7K9b9e+XpsdxD9ci7LGQa/+v4wpIP4x4YRjnNgAlROUekKaAcNFruUa8adV3YLqzQ
         d2r/WE9t9NhoHoqnTmGmJdsgps4K9k7jthRX5psJIP+2v/4sEw8wMUPvlVInQGPR2C
         XZWTUh4KwJqzaC/yU+sKErvZ2Nm9hywqFi4GcCczEKMEZZNn0GxwAVXpMzJ9oQ7T4I
         HrfSAEPm/Ud/g==
References: <e34c8e16-6521-c6e4-f3ed-9d8520d4ece2@codeaurora.org>
 <87bl63yqq8.fsf@kernel.org>
 <eb975a76-1482-f502-4dc1-7993cc3f30d0@codeaurora.org>
User-agent: mu4e 1.6.4; emacs 27.2
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
Date:   Thu, 26 Aug 2021 13:43:11 +0300
In-reply-to: <eb975a76-1482-f502-4dc1-7993cc3f30d0@codeaurora.org>
Message-ID: <87eeaga39m.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Sandeep Maheswaram <sanm@codeaurora.org> writes:
>> (why isn't this email plain/text? Content Type was set to multipart
>> alternative, please configure your email client correctly :-)
>>
>> While at that, also make sure to break lines at 80-columns)
>>
>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>> Hi,
>>>
>>> Earlier I have posted the patch for usb dwc3 core shutdown callback
>>>
>>> https://lore.kernel.org/linux-arm-msm/1618380209-20114-1-git-send-email-sanm@codeaurora.org/
>>>
>>> and it was reverted due to issues.
>> Right, as should be expected when we find regressions
>>
>>> https://lore.kernel.org/linux-usb/20210603151742.298243-1-alexandru.elisei@arm.com/
>>>
>>> As we already have shutdown callback in xhci plat driver where we halt
>>> the controller, so there will be no transactions with usb devices.
>>>
>>> https://lore.kernel.org/linux-usb/20200306092328.41253-1-ran.wang_1@nxp.com/
>>>
>>> So I think dwc3 core shutdown may not be required at least when we are
>>> using host mode. Let me know your opinion about this.
>> If that's the case, then sure. Please validate the condition, though,
>> and kindly report back on your findings
>
> I have enabled couple of logs in shutdown path and see no URBs
> enqueued after xhci shut down.
>
> Hope this is enough for validation . Please suggest if anything more I
> could do.

how about writing a little script to kexec into another kernel for a few
hundred iterations and make sure things still work after all that?

-- 
balbi
