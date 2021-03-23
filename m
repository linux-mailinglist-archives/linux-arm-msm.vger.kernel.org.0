Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BD5345DD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 13:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbhCWMLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 08:11:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230366AbhCWMLV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 08:11:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6330F61974;
        Tue, 23 Mar 2021 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616501481;
        bh=oour22Z+wIbNehRGLY89F0U6fhWM/uCfvMu0NydSvc0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JRnfnX56wI6J9ja9USqlXcONSFcGOANr3OS8Tg+js5u88IehRa5QDiJeDhS3ibm+I
         6LIOMgwA2SI7RgbH/jfysh9HDG9BUQw6JCCOeQMTkBySJgRTIllOO4C1TMKMIKD5lg
         Lbznmlm70C12JsGNKN97Zop86onxFnfcCmHHt/OQ=
Date:   Tue, 23 Mar 2021 13:11:18 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 3/4] usb: dwc3: qcom: Configure wakeup interrupts and
 set genpd active wakeup flag
Message-ID: <YFna5mxrJAzR2s0g@kroah.com>
References: <1616434280-32635-1-git-send-email-sanm@codeaurora.org>
 <1616434280-32635-4-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616434280-32635-4-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 22, 2021 at 11:01:19PM +0530, Sandeep Maheswaram wrote:
> Configure interrupts based on hs_phy_mode to avoid triggering of
> interrupts during system suspend and suspends successfully.
> Set genpd active wakeup flag for usb gdsc if wakeup capable devices
> are connected so that wake up happens without reenumeration.
> Add helper functions to enable,disable wake irqs.

That feels like a lot of different things all in one patch.

What are you trying to fix here?  I can't figure it out at all...

Please work on your changelog text for these patches when you resend
them.

thanks,

greg k-h
