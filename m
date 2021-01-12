Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181EB2F2EAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 13:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732310AbhALMI3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 07:08:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:41640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732304AbhALMI2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 07:08:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9536C23107;
        Tue, 12 Jan 2021 12:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610453268;
        bh=1aWrOOyg0JxWPnnqIi9uvg2WDcbjP/AP9FtMiiGQS9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sG71MVQ9OvPrJxV60dDgds2ed1/vImX2EVNze96ndwtiNKNLI20fQ7+kC5u1wb5My
         y81oQ09OD3/WiXV1jIAKRjl01iN8cLgItDQ5s7gI6a1TdXFcJT2WWiZl7bJTY0e9rY
         wYjA9BZfzEoCYr4o6XnS1l5+pxQYVgr+xAwxZ9js=
Date:   Tue, 12 Jan 2021 13:08:57 +0100
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
Message-ID: <X/2RWUWvteqlGxiS@kroah.com>
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

As you are using a _HEAVILY_ modified 4.9 kernel release, you are going
to have to get support from the vendor that provided you with this
kernel, as they are the only ones that really know what is in there,
_AND_ you are already paying them for that support.  So take advantage
of it :)

good luck!

greg k-h
