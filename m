Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527FAE610B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2019 06:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfJ0Fzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Oct 2019 01:55:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:51206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbfJ0Fzb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Oct 2019 01:55:31 -0400
Received: from localhost (mobile-166-176-122-39.mycingular.net [166.176.122.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 145872070B;
        Sun, 27 Oct 2019 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572155730;
        bh=jtBjayTTb5ZpeqPXv+78jPZ2NRE4DZyshLqrtUTXw6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qli9x4PUhclzEsZxZRV3YpBo1LT67a+K6My4btjyn4ZpDsyzafbW7SPcGpF93DWXc
         VRp/Ere+1aWRDln+T3pGKOg6M6eZK9GVsB8LA2A3tL1yzmhwF51XkAsXzkJDTdbb1x
         z34qUacypGwLiReOHTtwogPB6UkGxNN6nbDvpqlU=
Date:   Sun, 27 Oct 2019 00:55:28 -0500
From:   Andy Gross <agross@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        jslaby@suse.com, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix flow control
Message-ID: <20191027055528.GJ5514@hector.lan>
Mail-Followup-To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        jslaby@suse.com, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191021154616.25457-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021154616.25457-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 08:46:16AM -0700, Jeffrey Hugo wrote:
> hci_qca interfaces to the wcn3990 via a uart_dm on the msm8998 mtp and
> Lenovo Miix 630 laptop.  As part of initializing the wcn3990, hci_qca
> disables flow, configures the uart baudrate, and then reenables flow - at
> which point an event is expected to be received over the uart from the
> wcn3990.  It is observed that this event comes after the baudrate change
> but before hci_qca re-enables flow. This is unexpected, and is a result of
> msm_reset() being broken.
> 
> According to the uart_dm hardware documentation, it is recommended that
> automatic hardware flow control be enabled by setting RX_RDY_CTL.  Auto
> hw flow control will manage RFR based on the configured watermark.  When
> there is space to receive data, the hw will assert RFR.  When the watermark
> is hit, the hw will de-assert RFR.
> 
> The hardware documentation indicates that RFR can me manually managed via
> CR when RX_RDY_CTL is not set.  SET_RFR asserts RFR, and RESET_RFR
> de-asserts RFR.
> 
> msm_reset() is broken because after resetting the hardware, it
> unconditionally asserts RFR via SET_RFR.  This enables flow regardless of
> the current configuration, and would undo a previous flow disable
> operation.  It should instead de-assert RFR via RESET_RFR to block flow
> until the hardware is reconfigured.  msm_serial should rely on the client
> to specify that flow should be enabled, either via mctrl() or the termios
> structure, and only assert RFR in response to those triggers.
> 
> Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Reviewed-by: Andy Gross <agross@kernel.org>

Greg, can you pick this one up?

Thanks,
Andy
