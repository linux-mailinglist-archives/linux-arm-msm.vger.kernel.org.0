Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C172F2EB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 13:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732528AbhALMJz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 07:09:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:42206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732067AbhALMJz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 07:09:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 109EC22EBE;
        Tue, 12 Jan 2021 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610453354;
        bh=BjPws1i1weYzP92AP8zwRfwAds6wuNY30VQS9MCx2Sg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SFiozoZly4P1DLQ20Kg5/Yo8rJohFinrFI8e2GqVhtlcq7MG1JmbQ/dPPzza0S09O
         L1L7W6/u4Cgag7CZX/leu14RPULl+LGQQ4k73kGAPNSD9kK0+kPekAXFE0GlcyDNLs
         zupW9oRwhlslFzZw43VJe3sMq5QXU++81mJin6fU=
Date:   Tue, 12 Jan 2021 13:10:23 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pintu Agarwal <pintu.ping@gmail.com>
Cc:     open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, landy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        indranilghsh428@gmail.com
Subject: Re: [BUG]: Kernel 4.9: Kernel crash at fs/sysfs/file.c :
 sysfs_kf_seq_show
Message-ID: <X/2Rr5LDNbxGz456@kroah.com>
References: <CAOuPNLiUBhJdsgw9bjQxxhkeBHQFoE_vN_Na6kw3ksr89r+HOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOuPNLiUBhJdsgw9bjQxxhkeBHQFoE_vN_Na6kw3ksr89r+HOg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 12, 2021 at 05:31:54PM +0530, Pintu Agarwal wrote:
> Hi,
> 
> I am using Kernel: 4.9.217 for one of the ARM32 boards for Qualcomm SOC.
> https://github.com/android-linux-stable/msm-4.9
> 
> But I think this is a general bug applicable to :Kernel 4.9 under
> fs/sysfs/file.c
> So, I wanted to quickly check here if others are familiar with this
> issue and if it is fixed already.
> Note, this issue does not occur in 4.14 Kernel.
> 
> When I execute below command, the Kernel is crashing.
> I tried to add few debug prints to find more details. I see that the
> ops->show pointer is not valid (seems corrupted).
> So I wanted to understand how this can happen only for this particular node.
> Other sysfs entries are working fine.
> 
> # cat /sys/power/rpmh_stats/master_stats

Also note that this file is not in the upstream kernel tree, so there's
not much we can do about this either...

good luck!

greg k-h
