Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50243F961C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 10:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244492AbhH0I36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 04:29:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232048AbhH0I36 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 04:29:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D255E60F92;
        Fri, 27 Aug 2021 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630052949;
        bh=BU9TRzkMG53KIKBgnqTa/wiySOBfMjCnl6DVJZAWeR8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AkxzV2bWozX+avMROB8UwIqZy81fYWziObSlO5YoQPeCWrvnzwnTkH9hZoql89feF
         OQZ+indgwfTFbxp6FK7hde02GgkG/34BwW47EzC1Wt3i9pWpdX0pgQpcW4WIFvO4uZ
         eL7yE5pzmJQNXzFdEcumG9p0BgwRatKXIdJ8IGa8=
Date:   Fri, 27 Aug 2021 10:29:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ferry Toth <ftoth@exalondelft.nl>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Re: [PATCH v2 1/3] Revert "usb: gadget: u_audio: add real feedback
 implementation"
Message-ID: <YSiiTrW/ZF2PyGWd@kroah.com>
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
 <20210826185739.3868-2-ftoth@exalondelft.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826185739.3868-2-ftoth@exalondelft.nl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 26, 2021 at 08:57:37PM +0200, Ferry Toth wrote:
> This reverts commit e89bb4288378b85c82212b60dc98ecda6b3d3a70.
> 
> The commit is part of a series with commit
> 24f779dac8f3efb9629adc0e486914d93dc45517 causing a BUG on dwc3
> hardware, at least on Intel Merrifield platform when configured
> through configfs:
> BUG: kernel NULL pointer dereference, address: 0000000000000008
> ...
> RIP: 0010:dwc3_gadget_del_and_unmap_request+0x19/0xe0
> ...
> Call Trace:
>  dwc3_remove_requests.constprop.0+0x12f/0x170
>  __dwc3_gadget_ep_disable+0x7a/0x160
>  dwc3_gadget_ep_disable+0x3d/0xd0
>  usb_ep_disable+0x1c/0x70
>  u_audio_stop_capture+0x79/0x120 [u_audio]
>  afunc_set_alt+0x73/0x80 [usb_f_uac2]
>  composite_setup+0x224/0x1b90 [libcomposite]
> 
> Pavel's suggestion to add
> `echo "adaptive" > functions/uac2.usb0/c_sync` to the configfs script
> resolves the issue.
> Thinh suggests "the crash is probably because of f_uac2 prematurely
> freeing feedback request before its completion. usb_ep_dequeue() is
> asynchronous. dwc2() may treat it as a synchronous call so you didn't
> get a crash."
> 
> Revert as this is a regression and the kernel shouldn't crash depending
> on configuration parameters.

Are these normal configuration options in the wild, or is this just
something that you "can do"?

> Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>

I need an ack from the original authors to revert all this...

thanks,

greg k-h
