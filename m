Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57ABC6A47B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 18:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjB0RPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 12:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjB0RPn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 12:15:43 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0767321944;
        Mon, 27 Feb 2023 09:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677518142; x=1709054142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HEz3CJUXlV/zWn0/lsDpYmBYVCX0qvkRTSXlFLe1sXs=;
  b=FJeIDYB+xKB91hgdt8cZ0bT1TrveNX1NzYSJn2i/k+BbXdq2eBoFDMOt
   oKB/lvMF9f5jOt+R1bCRhsn9bpvdCwPCUuKlgreJSrETxHY1z75kpLVl+
   zEdfw2ggUaQXCtGNbCZDcthupAguwGj4I40kH6bPtMHn84SqM9Jt/jOMs
   1po57dFVtHy5wbu0bq6GZsiX/4KH9wtSdK/v2tsaNDzBa994zp441KUex
   19Sxx2AnFp7B4EgVR+x+kWLRDAWFPQMTy6BBPWBqtWIGcdKTJqSa+lXtd
   KmbbWDKRMAzuL5j4xYWXN2YcRs/kmzzIkGdpGRuODOOSAJl+TOCkogn3g
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396469004"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="396469004"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 09:14:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="816748087"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="816748087"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 09:14:56 -0800
Date:   Mon, 27 Feb 2023 18:14:54 +0100
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, jacek.lawrynowicz@linux.intel.com,
        quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
        quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/8] accel/qaic: Add datapath
Message-ID: <20230227171454.GF3547587@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
 <20230224152546.GB3547587@linux.intel.com>
 <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 24, 2023 at 12:36:51PM -0700, Jeffrey Hugo wrote:
> > > +static int reserve_pages(unsigned long start_pfn, unsigned long nr_pages,
> > > +			 bool reserve)
> > > +{
> > > +	unsigned long pfn;
> > > +	unsigned long end_pfn = start_pfn + nr_pages;
> > > +	struct page *page;
> > > +
> > > +	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
> > > +		if (!pfn_valid(pfn))
> > > +			return -EINVAL;
> > > +		page =  pfn_to_page(pfn);
> > > +		if (reserve)
> > > +			SetPageReserved(page);
> > > +		else
> > > +			ClearPageReserved(page);
> > 
> > It is needed? Looks like taken from some legacy code.
> 
> Required for remap_pfn_range().

PG_reserved is not required any longer for remap_pfn_range(), here
is excerpt from comment from include/linux/page-flags.h :

 * Some PG_reserved pages will be excluded from the hibernation image.
 * PG_reserved does in general not hinder anybody from dumping or swapping
 * and is no longer required for remap_pfn_range(). ioremap might require it.
 * Consequently, PG_reserved for a page mapped into user space can indicate
 * the zero page, the vDSO, MMIO pages or device memory.

> > > +static int copy_sgt(struct qaic_device *qdev, struct sg_table **sgt_out,
> > > +		    struct sg_table *sgt_in, u64 size, u64 offset)
> > > +{
> > > +	int total_len, len, nents, offf = 0, offl = 0;
> > > +	struct scatterlist *sg, *sgn, *sgf, *sgl;
> > > +	struct sg_table *sgt;
> > > +	int ret, j;
> > > +
> > > +	/* find out number of relevant nents needed for this mem */
> > > +	total_len = 0;
> > > +	sgf = NULL;
> > > +	sgl = NULL;
> > > +	nents = 0;
> > > +
> > > +	size = size ? size : PAGE_SIZE;
> > > +	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
> > > +		len = sg_dma_len(sg);
> > > +
> > > +		if (!len)
> > > +			continue;
> > > +		if (offset >= total_len && offset < total_len + len) {
> > > +			sgf = sg;
> > > +			offf = offset - total_len;
> > > +		}
> > > +		if (sgf)
> > > +			nents++;
> > > +		if (offset + size >= total_len &&
> > > +		    offset + size <= total_len + len) {
> > > +			sgl = sg;
> > > +			offl = offset + size - total_len;
> > > +			break;
> > > +		}
> > > +		total_len += len;
> > > +	}
> > > +
> > > +	if (!sgf || !sgl) {
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +
> > > +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> > > +	if (!sgt) {
> > > +		ret = -ENOMEM;
> > > +		goto out;
> > > +	}
> > > +
> > > +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> > > +	if (ret)
> > > +		goto free_sgt;
> > > +
> > > +	/* copy relevant sg node and fix page and length */
> > > +	sgn = sgf;
> > > +	for_each_sgtable_sg(sgt, sg, j) {
> > > +		memcpy(sg, sgn, sizeof(*sg));
> > > +		if (sgn == sgf) {
> > > +			sg_dma_address(sg) += offf;

This looks a bit suspicious. Are you sure you can modify
sg->dma_address and still use it as valid value ?

> > > +			sg_dma_len(sg) -= offf;
> > > +			sg_set_page(sg, sg_page(sgn),
> > > +				    sg_dma_len(sg), offf);
> > > +		} else {
> > > +			offf = 0;
> > > +		}
> > > +		if (sgn == sgl) {
> > > +			sg_dma_len(sg) = offl - offf;
> > > +			sg_set_page(sg, sg_page(sgn),
> > > +				    offl - offf, offf);
> > > +			sg_mark_end(sg);
> > > +			break;
> > > +		}
> > > +		sgn = sg_next(sgn);
> > > +	}
> > 
> > Why not use sg_copy_table() ? Overall copy_sgt() seems to be something
> > that could be replaced by generic helper or at least simplify.
> 
> I don't see "sg_copy_table" defined in 6.2. 

Because there is no such function in any kernel source. It was only my
imagination, not sure right now how I came up with this function name :-/
Sorry about confusion.

There are only sg_copy_{to,from}_buffer(), but not really useful in
this case.

> Are you suggesting renaming
> this function?  I guess I'm not quite understanding your comment here. Can
> you elaborate?

Renaming would be nice. I was thinking by simplifying it, not sure
now if that's easy achievable, though.

Regards
Stanislaw


