Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB0533169F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 19:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhCHSv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 13:51:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:59114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229818AbhCHSvB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 13:51:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 767376526C;
        Mon,  8 Mar 2021 18:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615229460;
        bh=sX7go1TDttXiDAgZKl+QZgOwxMjDoliZw8M95pcFQ1Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=llKh4OYOYqZ0k+/EaGHwnr2t76487h2WCN/V2npx8zE1gPxiNJUwYVud/CQjHKU2v
         8U5RFbJ1RP3jWuLCCLtFkYqxb6LsoK7YChDg6QHrn3aKCYA1HW3m9vpo+oeSzfmkkG
         z1gUAYUtywt3lQfdqn8hhjrlhj5q4L43tqmicIEr3I/EoOyAfpGms/hJFfzxrNaLkr
         sQmFXmeJqPWnxZ4uEMOSKo+8mhZ7nrLvBUXax4Vdvi0fLEOH6PXjUcaTHDNiJ9cpmH
         RuAqhSNkv/ekCvJURXZoHp5k99o5krADC9clnwzNFBIHhYdwMJOnDDKyR8nb84vFWA
         aju1ayqh4e0rw==
Date:   Mon, 8 Mar 2021 10:50:59 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     gregkh@linuxfoundation.org, manivannan.sadhasivam@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        aleksander@aleksander.es, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Add Qcom WWAN control driver
Message-ID: <20210308105059.22f6f038@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1615228851-17783-1-git-send-email-loic.poulain@linaro.org>
References: <1615228851-17783-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  8 Mar 2021 19:40:51 +0100 Loic Poulain wrote:
> The MHI WWWAN control driver allows MHI Qcom based modems to expose
> different modem control protocols to userspace, so that userspace
> modem tools or daemon (e.g. ModemManager) can control WWAN config
> and state (APN config, SMS, provider selection...). A Qcom based
> modem can expose one or several of the following protocols:
> - AT: Well known AT commands interactive protocol (microcom, minicom...)
> - MBIM: Mobile Broadband Interface Model (libmbim, mbimcli)
> - QMI: Qcom MSM/Modem Interface (libqmi, qmicli)
> - QCDM: Qcom Modem diagnostic interface (libqcdm)
> - FIREHOSE: XML-based protocol for Modem firmware management
> 	    (qmi-firmware-update)
> 
> The different interfaces are exposed as character devices, in the same
> way as for USB modem variants.
> 
> Note that this patch is mostly a rework of the earlier MHI UCI
> tentative that was a generic interface for accessing MHI bus from
> userspace. As suggested, this new version is WWAN specific and is
> dedicated to only expose channels used for controlling a modem, and
> for which related opensource user support exist. Other MHI channels
> not fitting the requirements will request either to be plugged to
> the right Linux subsystem (when available) or to be discussed as a
> new MHI driver (e.g AI accelerator, WiFi debug channels, etc...).
> 
> Co-developed-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

You need to CC netdev.

>  drivers/bus/mhi/Kconfig     |  12 +
>  drivers/bus/mhi/Makefile    |   3 +
>  drivers/bus/mhi/wwan_ctrl.c | 559 ++++++++++++++++++++++++++++++++++++++++++++

Linux kernel tree is not organized by bus. This belongs somewhere under
drivers/net.
