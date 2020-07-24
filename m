Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6578C22C102
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 10:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgGXImQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 04:42:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726676AbgGXImQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 04:42:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D54D20674;
        Fri, 24 Jul 2020 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595580134;
        bh=rAqdZE/fKAL7VqoalwAdqZ/lSHZ2jW3nfb1jX6yqrlk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=flen0IBnd3TWe2yeuevlI+qVN0U7Z5okT+2QsMkzrTlaX8BKkjQh3LRLNmBt+WrEL
         MFn+FMLxunQ6nTjbFoHKcRjjHEnadXiRN3t5YkTOJQ90VuSn+kV6egKJkWD77G20an
         CQ6vCUSLLj9u8Bbhkpq0SAF7agX0TnEEki4VV7I4=
Date:   Fri, 24 Jul 2020 10:42:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 3/3] tty: serial: qcom_geni_serial: Fix the UART
 wakeup issue
Message-ID: <20200724084216.GC3977020@kroah.com>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595563082-2353-4-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 24, 2020 at 09:28:02AM +0530, satya priya wrote:
> As a part of system suspend we call uart_port_suspend from the
> Serial driver, which calls set_mctrl passing mctrl as NULL. This
> makes RFR high(NOT_READY) during suspend.
> 
> Due to this BT SoC is not able to send wakeup bytes to UART during
> suspend. Included if check for non-suspend case to keep RFR low
> during suspend.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
