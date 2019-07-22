Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013647046A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 17:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbfGVPsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 11:48:06 -0400
Received: from 8bytes.org ([81.169.241.247]:44866 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbfGVPsG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 11:48:06 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 8B0901F2; Mon, 22 Jul 2019 17:48:04 +0200 (CEST)
Date:   Mon, 22 Jul 2019 17:48:03 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu: add support for drivers that manage iommu
 explicitly
Message-ID: <20190722154803.GG12009@8bytes.org>
References: <20190702202631.32148-2-robdclark@gmail.com>
 <20190710182844.25032-1-robdclark@gmail.com>
 <20190722142833.GB12009@8bytes.org>
 <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 22, 2019 at 08:41:34AM -0700, Rob Clark wrote:
> It is set by the driver:
> 
> https://patchwork.freedesktop.org/patch/315291/
> 
> (This doesn't really belong in devicetree, since it isn't a
> description of the hardware, so the driver is really the only place to
> set this.. which is fine because it is about a detail of how the
> driver works.)

It is more a detail about how the firmware works. IIUC the problem is
that the firmware initializes the context mappings for the GPU and the
OS doesn't know anything about that and just overwrites them, causing
the firmware GPU driver to fail badly.

So I think it is the task of the firmware to tell the OS not to touch
the devices mappings until the OS device driver takes over. On x86 there
is something similar with the RMRR/unity-map tables from the firmware.

Regards,

	Joerg
