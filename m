Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C8D2735AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 00:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbgIUWXf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 18:23:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:42542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726457AbgIUWXf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 18:23:35 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B21723A62;
        Mon, 21 Sep 2020 22:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600727015;
        bh=N9RzAc6C05t2rxlnw7lSRzYBzP947+Ts1bAKMsLmjEU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CluYU3j+OZ6XbzXp4elhUn92tatuqzSObk4WseHK3gulRNfFdoM3XXQ7GgS+G4xvK
         kvbtvWJXZAgYM3RJzYV8SaGS1CNoGPsNIvg1Xs/mnOCkm/yQVAzQJYYmJEmvpr+nPl
         7Rqin2VNlKQqbOYisp71I5TxrLYGu6uPZozrpNj8=
Date:   Mon, 21 Sep 2020 23:23:30 +0100
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv4 1/6] iommu/io-pgtable-arm: Add support to use system
 cache
Message-ID: <20200921222329.GA4409@willie-the-truck>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <3b1beb6cf6a34a44b0ecff9ec5a2105b5ff91bd4.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <20200921180318.GG3141@willie-the-truck>
 <9646dd4f-f1e6-992d-b8a0-0f2c14fa9fe8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9646dd4f-f1e6-992d-b8a0-0f2c14fa9fe8@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 11:03:49PM +0100, Robin Murphy wrote:
> On 2020-09-21 19:03, Will Deacon wrote:
> > On Fri, Sep 11, 2020 at 07:57:18PM +0530, Sai Prakash Ranjan wrote:
> > > Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
> > > attributes set in TCR for the page table walker when
> > > using system cache.
> > 
> > I wonder if the panfrost folks can reuse this for the issue discussed
> > over at:
> > 
> > https://lore.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com
> 
> Isn't this all hinged around the outer cacheability attribute, rather than
> shareability (since these are nominally NC mappings and thus already
> properly Osh)? The Panfrost issue is just about shareability domains being a
> bit wonky; the cacheability attributes there are actually reasonably normal
> (other than not having a non-cacheable type at all, only a choice of
> allocation policies...)

Hmm, yes, this quirk _also_ changes the cacheability settings which isn't
what we need. It's a bit grotty having two different ways to configure these
TCR bits (i.e. a quirk and a format), but at least the mali format rejects
all of the quirks so I suppose it's not the end of the world.

Will
