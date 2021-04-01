Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD3D35125B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 11:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbhDAJeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 05:34:23 -0400
Received: from verein.lst.de ([213.95.11.211]:39010 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233496AbhDAJeO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 05:34:14 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6995C68B05; Thu,  1 Apr 2021 11:34:08 +0200 (CEST)
Date:   Thu, 1 Apr 2021 11:34:08 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Will Deacon <will@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
        Li Yang <leoyang.li@nxp.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH 08/18] iommu/fsl_pamu: merge pamu_set_liodn and
 map_liodn
Message-ID: <20210401093408.GD2934@lst.de>
References: <20210316153825.135976-1-hch@lst.de> <20210316153825.135976-9-hch@lst.de> <20210330124651.GH5908@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330124651.GH5908@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 30, 2021 at 01:46:51PM +0100, Will Deacon wrote:
> > +	ret = pamu_config_ppaace(liodn, geom->aperture_start,
> > +				 geom->aperture_end - 1, ~(u32)0,
> > +				 0, dma_domain->snoop_id, dma_domain->stash_id,
> > +				 PAACE_AP_PERMS_QUERY | PAACE_AP_PERMS_UPDATE);
> 
> There's more '+1' / '-1' confusion here with aperture_end which I'm not
> managing to follow. What am I missing?

You did not missing anything, I messed this up.   Fixed.
