Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A903EA197
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 11:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235600AbhHLJJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 05:09:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236105AbhHLJJc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 05:09:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44D6260E97;
        Thu, 12 Aug 2021 09:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628759347;
        bh=4B2v1XdtK/Af8IXQV0QioCotL0DZazMwjviys8POlhY=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=MwnlcLD4TKhl7N13do1qf+IYhJ9ceVMyokcuBMZ9VZ/2W3FSJ32BCjrHdmMjwBkBm
         vt9xtOVMK+i+pnJZvgOo6rZBBrYevi+BEM1AJ/0OG8h1MQqx4FpXhLjB7oocaN04l6
         svPXyfZTWKPkUixw5wfWuQKprW7SWzIef2iHsjXmJy6jurYSfnVPfBo0T0ndyqMlmH
         DYNla9C3hMEUNE2ROdhAtbrzwFqMJYeWZoaVQuei4cn0npsjlty4eZu6/m/pplkZS9
         /kSFX28vr/6AJrzU3jp08IJoUTaUmEMvWqOAZE5Y3ObnRnyWA7680XWSAq4KmIE94g
         +vFCJx2cOrY4w==
References: <e34c8e16-6521-c6e4-f3ed-9d8520d4ece2@codeaurora.org>
User-agent: mu4e 1.6.2; emacs 27.2
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
Date:   Thu, 12 Aug 2021 12:07:08 +0300
In-reply-to: <e34c8e16-6521-c6e4-f3ed-9d8520d4ece2@codeaurora.org>
Message-ID: <87bl63yqq8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

(why isn't this email plain/text? Content Type was set to multipart
alternative, please configure your email client correctly :-)

While at that, also make sure to break lines at 80-columns)

Sandeep Maheswaram <sanm@codeaurora.org> writes:
> Hi,
>
> Earlier I have posted the patch for usb dwc3 core shutdown callback
>
> https://lore.kernel.org/linux-arm-msm/1618380209-20114-1-git-send-email-sanm@codeaurora.org/
>
> and it was reverted due to issues.

Right, as should be expected when we find regressions

> https://lore.kernel.org/linux-usb/20210603151742.298243-1-alexandru.elisei@arm.com/
>
> As we already have shutdown callback in xhci plat driver where we halt
> the controller, so there will be no transactions with usb devices.
>
> https://lore.kernel.org/linux-usb/20200306092328.41253-1-ran.wang_1@nxp.com/
>
> So I think dwc3 core shutdown may not be required at least when we are
> using host mode. Let me know your opinion about this.

If that's the case, then sure. Please validate the condition, though,
and kindly report back on your findings

-- 
balbi
