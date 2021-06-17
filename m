Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726343AB204
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 13:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhFQLMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 07:12:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:52864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232383AbhFQLMr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 07:12:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A82F61209;
        Thu, 17 Jun 2021 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623928239;
        bh=PMeB3LBuRoII/I325D9/2s+Ps577P3b6ic97qivvTT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDgL3tlGpx/x9+gxDv0Jn8OZV88HjcrOL2xyZ/KdkSP1bGLYWhYt7wua3oXvEMUs5
         eSSkwTYhAI6kjGG3ScJ+IkbkU+q3rrld+95QGvyUhts6U18PF1bPiB1Ic0TaHQJPvW
         L94tt8hesFhQeMUBN/tTuA3SnaKD5/eM5x98kEbk=
Date:   Thu, 17 Jun 2021 13:10:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
Subject: Re: [PATCH v10 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <YMstrL1aQYGe7NB0@kroah.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-4-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623923899-16759-4-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 17, 2021 at 02:58:16AM -0700, Wesley Cheng wrote:
> +static int dwc3_gadget_check_config(struct usb_gadget *g, unsigned long ep_map)
> +{
> +	struct dwc3 *dwc = gadget_to_dwc(g);
> +	unsigned long in_ep_map;
> +	int fifo_size = 0;
> +	int ram1_depth;
> +	int ep_num;
> +
> +	if (!dwc->do_fifo_resize)
> +		return 0;
> +
> +	/* Only interested in the IN endpoints */
> +	in_ep_map = ep_map >> 16;

Wait, this "map" is split up into 16/16 somehow?  So it's only 32bits
big?

Where did you document this map structure?  Why is it needed at all, you
have the gadget, don't you have access to the full list of endpoints
here as well?

confused,

greg k-h
