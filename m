Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7632B215A57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 17:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgGFPKr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 11:10:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:33138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729140AbgGFPKq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 11:10:46 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 50663206CD;
        Mon,  6 Jul 2020 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594048246;
        bh=8C2qAl9kUOeQT9wyLID3MuIDXLXIVzJK6cSedO1jKb8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LNfkzaw+URH7MQyQbhwZp1IRzmusnXAj7S/Ee4WGl5r/jQz2TdZJZq0Fm+yvBin8o
         vyUw9Rcoqimquebx5PzcsRj5xYNcTAGGN7IcZOkTGfxc7xc1fjW//XfZd7Aw+uRfhH
         Ox3mUxPuyLlGFUIVJzI/pNRHdDZA9LplQARFNxR8=
Date:   Mon, 6 Jul 2020 20:40:41 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-serial@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ldewangan@nvidia.com, Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>,
        lkft-triage@lists.linaro.org
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
Message-ID: <20200706151041.GL633187@vkoul-mobl>
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
 <8c50799e-d0ba-626a-5627-5ff4e5825f6a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c50799e-d0ba-626a-5627-5ff4e5825f6a@intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06-07-20, 07:33, Dave Jiang wrote:

> > I don't see anything suspicious in dmaengine drivers, but there is a
> > recent series
> > from Dave Jiang that might explain it. Could you try reverting  commit
> > deb9541f5052 ("dmaengine: check device and channel list for empty")?
> > 
> > I think the broken change is this one:
> > 
> > @@ -819,6 +850,11 @@ struct dma_chan *dma_request_chan(struct device
> > *dev, const char *name)
> > 
> >          /* Try to find the channel via the DMA filter map(s) */
> >          mutex_lock(&dma_list_mutex);
> > +       if (list_empty(&dma_device_list)) {
> > +               mutex_unlock(&dma_list_mutex);
> > +               return NULL;
> > +       }
> > +
> >          list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {
> >                  dma_cap_mask_t mask;
> >                  const struct dma_slave_map *map = dma_filter_match(d,
> > name, dev);
> > 
> > which needs to return an error code like -ENODEV instead of NULL. There
> > may be other changes in the same patch that introduce the same bug
> > elsewhere.
> > 
> >       Arnd
> > 
> 
> Vinod,
> Do you want a diff fix or a revision of the patch for the fix?

Diff fix please

-- 
~Vinod
