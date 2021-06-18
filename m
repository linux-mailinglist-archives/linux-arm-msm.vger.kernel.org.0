Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A0E3AC2E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 07:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhFRFrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 01:47:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:56562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229671AbhFRFrD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 01:47:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38A706054E;
        Fri, 18 Jun 2021 05:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623995094;
        bh=dbWGvEAfiOwyJFvGKuRzF0wsAwrqGBZuvn9lAIDW3UY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qvFw7ZQqWkKlwKOz7Ia1Pd+jC2Bb4oQNjNHRqkIqoN+LC5IaYr7JqiAW1Hk49czfv
         DuFmxP5vupK1SPyDLBXYt8+NfjerCSxPPNwhmlRN/oyFloXS28jvPIOHOyDlJH6I+c
         5K0OQAT9kS2XqxKEaZi4VbpKSkSd1Zg3oBtUfY1icDvkLBzjTKK9irtwk1Il0vsxGJ
         VKHjG1SRSFV2HU589ZSMPi5AzZtIL8tHrW4K7q0X6Z71MlP7kpdwO+i1lJVQj/AW9C
         GBk2Ovx/ncjnsJgZhx1LbwrSLHC5Hz+p0m3h7bG3tOBJMItcqkGka6Z0TfQbxrkxM3
         M5lYxcK4zCzqw==
Date:   Fri, 18 Jun 2021 11:14:48 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Paul Davey <paul.davey@alliedtelesis.co.nz>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] bus: mhi: Fix MHI on big endian architectures
Message-ID: <20210618054448.GI3682@workstation>
References: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 18, 2021 at 03:31:30PM +1200, Paul Davey wrote:
> I encountered some problems getting the MHI driver to work on an Octeon
> 3 platform these seem to all be related to endianness issues.  The modem
> interface appears to require the DMA structures to be in little endian,
> however the MHI core driver was assembling them in native endianness.
> 

So glad to see MHI being used on big endian architectures :)

Thanks,
Mani

> Using little endian explicitly allows the interface to function as
> expected.
> 
> Paul Davey (2):
>   bus: mhi: Fix pm_state conversion to string
>   bus: mhi: Fix MHI DMA structure endianness
> 
>  drivers/bus/mhi/core/debugfs.c  |  26 +++----
>  drivers/bus/mhi/core/init.c     |  39 +++++-----
>  drivers/bus/mhi/core/internal.h | 129 ++++++++++++++++----------------
>  drivers/bus/mhi/core/main.c     |  36 ++++-----
>  drivers/bus/mhi/core/pm.c       |   8 +-
>  5 files changed, 121 insertions(+), 117 deletions(-)
> 
> -- 
> 2.32.0
> 
