Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B517B345AD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 10:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhCWJbO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 05:31:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:34070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhCWJao (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 05:30:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18D4A6146D;
        Tue, 23 Mar 2021 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616491844;
        bh=tatBD0/rOuHfE/VB2VQjxxpbUS79yZbSYR7+r2/V5J8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SFVwCQW+NwUN+jcsQ9cV+6YjU4X2mPLomftpSnDK6j2of9RnX+5e5P9tSYuDrLsxK
         gzjQYZleCN2scJKUUFGQbwQPLdn0aaYzdC18MGsYEM+bD99fcAUAXycFhy+DM5OOeF
         wI/OM+76xqz8TaKJtZdS382q2h0mXP6gCdx/LXmw=
Date:   Tue, 23 Mar 2021 10:30:42 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mka@chromium.org,
        robh+dt@kernel.org, linux-serial@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 1/2] soc: qcom-geni-se: Cleanup the code to remove
 proxy votes
Message-ID: <YFm1Qvo3SuwJOino@kroah.com>
References: <20210322110429.14950-1-rojay@codeaurora.org>
 <20210322110429.14950-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322110429.14950-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 22, 2021 at 04:34:28PM +0530, Roja Rani Yarubandi wrote:
> This reverts commit 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect
> support to fix earlycon crash")
> 
> ICC core and platforms drivers supports sync_state feature with
> commit 7d3b0b0d8184 ("interconnect: qcom: Use icc_sync_state") which
> ensures that the default ICC BW votes from the bootloader is not
> removed until all it's consumers are probes.
> 
> The proxy votes were needed in case other QUP child drivers
> I2C, SPI probes before UART, they can turn off the QUP-CORE clock
> which is shared resources for all QUP driver, this causes unclocked
> access to HW from earlycon.
> 
> Given above support from ICC there is no longer need to maintain
> proxy votes on QUP-CORE ICC node from QUP wrapper driver for early
> console usecase, the default votes won't be removed until real
> console is probed.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Should this have a "Fixes:" tag, and also be cc: stable@vger.kernel.org
so that it will be properly backported?

If so, please add and resend.

thanks,

greg k-h
