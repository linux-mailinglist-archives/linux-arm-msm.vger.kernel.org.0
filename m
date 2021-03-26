Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B36834A837
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 14:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhCZNhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 09:37:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:36510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229995AbhCZNhF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 09:37:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA12F61879;
        Fri, 26 Mar 2021 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616765825;
        bh=Lki35no18rL9WHDL876lOo6SZAtkdqS9eteHVC5XH04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YGpdPrA09pgx2+feOOKJZ4j8abd/tYjdjoEGVgzMMCKp79gjJhRefAv/+eqGFKAkZ
         UrJcv9TNJ8x7YqhS/rFDQx//Da0o+GfHTpTzsGg9ifONWITwwlG2FYfXd9zHU7phux
         aCuSxCBgQBuaQrX6L/55en8+IaXJNcor+oqujSqw=
Date:   Fri, 26 Mar 2021 14:37:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
Message-ID: <YF3jfshT3OSolcws@kroah.com>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 24, 2021 at 12:57:32AM +0530, Sandeep Maheswaram wrote:
> This patch adds a shutdown callback to USB DWC core driver to ensure that
> it is properly shutdown in reboot/shutdown path. This is required
> where SMMU address translation is enabled like on SC7180
> SoC and few others. If the hardware is still accessing memory after
> SMMU translation is disabled as part of SMMU shutdown callback in
> system reboot or shutdown path, then IOVAs(I/O virtual address)
> which it was using will go on the bus as the physical addresses which
> might result in unknown crashes (NoC/interconnect errors).
> 
> Previously this was added in dwc3 qcom glue driver.
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
> But observed kernel panic as glue driver shutdown getting called after
> iommu shutdown. As we are adding iommu nodes in dwc core node
> in device tree adding shutdown callback in core driver seems correct.

So shouldn't you also remove this from the qcom glue driver at the same
time?  Please submit both as a patch series.

thanks,

greg k-h
