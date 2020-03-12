Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7A4182C10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 10:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgCLJKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 05:10:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:43902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgCLJKo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 05:10:44 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2151420691;
        Thu, 12 Mar 2020 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584004243;
        bh=dXlAM34otGLh0bt/r1jHM5ycBkeV5HW9/Jm9hSsl5xc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iuZBEx5kLLQ+ycmXDIAW2ZsGCr4hlGMgCVSHkDtdZ0TfAPJXruYYC95r6/4eLACXH
         e273Y1kTz1cqly9f12wlKPuw+R1Plf14oN2cReLvzvUH0xPXiqtN25fOBuGusOT8nC
         BxfxXfAC4/Yy1SjO2R65Ed5lXrTE0UEkcjhMzY30=
Date:   Thu, 12 Mar 2020 10:10:41 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 2/2] tty: serial: qcom_geni_serial: Fix RX cancel
 command failure
Message-ID: <20200312091041.GA198954@kroah.com>
References: <1583477228-32231-1-git-send-email-skakit@codeaurora.org>
 <1583477228-32231-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583477228-32231-3-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 06, 2020 at 12:17:08PM +0530, satya priya wrote:
> RX cancel command fails when BT is switched on and off multiple times.
> 
> To handle this, poll for the cancel bit in SE_GENI_S_IRQ_STATUS register
> instead of SE_GENI_S_CMD_CTRL_REG.
> 
> As per the HPG update, handle the RX last bit after cancel command
> and flush out the RX FIFO buffer.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

This patch didn't apply :(
