Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81F03F0127
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 12:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhHRKCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 06:02:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:39250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232918AbhHRKCI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 06:02:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70B266108F;
        Wed, 18 Aug 2021 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629280893;
        bh=oQMoWQKsPLRFy5ol6QwXhl5CVUB3KvroKJooUJmMJRA=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=PrsCkjXgRAtvtzF/5dqvIXqpTnKxnAi5YO8CWkU91eJY0rt0VQTE6YNvxR2YWhGY/
         uIt3M9h7wBEpfOBk/Jz1oNuHJXy7nZ6KARIEURwFIfbyuPcbV9chX2jUP6L+y1yR4k
         BqzSUkwOJjcxnj7Uj9SA1HjIVU3uaM61lawJ0dcWthCqedqJkt6D8PwOxr7F/2qwCV
         T1eoFDLUTWe6K4nWl8yc6GQifiW+r/XE3Ww9jL4oiVjevcvykzH20rDiEre6b+agfl
         73vqkZYa0HPnLwFSbmNZzPPTzOTkgo5Va1PM3D+LVG7gb7dn2sYJnjPzJiFo1ogJIF
         SZA4MzaTNvr2A==
References: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
 <1624882097-23265-7-git-send-email-sanm@codeaurora.org>
 <YNo97HQXmYjUNz/C@google.com> <87fswjzx52.fsf@kernel.org>
 <5ecee092-dba9-071c-940b-55e16f4d7a90@codeaurora.org>
User-agent: mu4e 1.6.3; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Subject: Re: [PATCH v8 6/6] usb: dwc3: qcom: Keep power domain on to support
 wakeup
Date:   Wed, 18 Aug 2021 12:56:56 +0300
In-reply-to: <5ecee092-dba9-071c-940b-55e16f4d7a90@codeaurora.org>
Message-ID: <87sfz7f4w6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Sandeep Maheswaram <sanm@codeaurora.org> writes:
>> This means that in order for glue_suspend() to run, dwc3 has to suspend
>> first and xhci has to suspend before dwc3.
>>
>> For example, in the suspend call above, qcom (the glue) is directly
>> accessing dwc3 core data, which is incorrect. It looks like we want to
>> know if the PHY is not powered off and if it isn't, then we want to
>> change the power domain ACTIVE_WAKEUP flag. Now, phy_power_off is false
>> whenever any of xHCI's children enable USB wakeup.
>>
>> It seems like we need to way to generically propagate that knowledge up
>> the parent tree. I.e., a parent needs to know if its child is wakeup
>> capable, then dwc3 could, in its suspend routine:
>>
>> static int dwc3_suspend(struct device *dev)
>> {
>> 	/* ... */
>>
>> 	if (device_children_wakeup_capable(dev))
>>          	device_enable_wakeup(dev);
>>
>> 	/* ... */
>> }
>
> Can we use like=C2=A0 this device_may_wakeup(&dwc->xhci->dev) to check if
> children is wakeup capable like below ?

that really doesn't sound like a good idea, IMHO. We're still passing
through layers of abstraction without anyone's knowledge :-)

It looks to me like we're missing some infrastructure in the wakeup code
so parents can make decisions based on the state of their children.

>> and similarly for qcom glue:
>>
>> static int dwc3_qcom_suspend(struct device *dev)
>> {
>> 	/* ... */
>>
>>
>> 	if (device_children_wakeup_capable(dev)) {
>>          	device_enable_wakeup(dev);
>> 		genpd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
>>          }
>>
>> 	/* ... */
>> }
>>
>> It also seems plausible that this could be done at driver core and
>> completely hidden away from drivers.
>
> And in qcom glue like this
>
> static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
> {
>
> /* ... */
>
> =C2=A0=C2=A0=C2=A0 struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);

you see, here there's an assumption that the platform data is still
valid and not some bogus dangling pointer. There's also an assumption
that the type is struct dwc3 (which is unlikely to change, but still).

--=20
balbi
