Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2C026CD79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 22:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbgIPU7z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 16:59:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:45064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgIPQae (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 12:30:34 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E717F2223C;
        Wed, 16 Sep 2020 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600259122;
        bh=fvCW/yn//rNf2DCvUhVeerd0f2FRK4KmVGnAWhv8i0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pwgwgbhXSsRbXfNwqjzRbJvnPlbl+v1XgK3uZnPf9g60wTxWOk8hPxcR0XF5e3qyx
         DyPw5mbuZmriU2G6BtTRt4Xa14Yw3I5csDnxNvG2uHsBKcJLZSqpxap0IapeHAGmoS
         ovcO6Z2FVgTo2A88nuLPMaRZswR2W+DnKMoAKMEE=
Date:   Wed, 16 Sep 2020 14:25:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     satya priya <skakit@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org
Subject: Re: [PATCH V5 4/4] tty: serial: qcom_geni_serial: Fix the UART
 wakeup issue
Message-ID: <20200916122557.GA2790503@kroah.com>
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-5-git-send-email-skakit@codeaurora.org>
 <20200910230639.GB472@uller>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910230639.GB472@uller>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 10, 2020 at 11:06:39PM +0000, Bjorn Andersson wrote:
> On Thu 10 Sep 12:53 UTC 2020, satya priya wrote:
> 
> > As a part of system suspend uart_port_suspend is called from the
> > Serial driver, which calls set_mctrl passing mctrl as 0. This
> > makes RFR high(NOT_READY) during suspend.
> > 
> > Due to this BT SoC is not able to send wakeup bytes to UART during
> > suspend. Include if check for non-suspend case to keep RFR low
> > during suspend.
> > 
> 
> Seems reasonable.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> > Signed-off-by: satya priya <skakit@codeaurora.org>
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Greg, I don't see this depending on anything else, will you pick this
> patch through your tree? I will take the dts patches through the qcom
> tree.

Sure, will pick it up now, thanks.

greg k-h
