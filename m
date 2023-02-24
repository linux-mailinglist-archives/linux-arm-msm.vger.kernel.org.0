Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B2E6A1E80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 16:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjBXPZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 10:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjBXPZv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 10:25:51 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C57D59E4A;
        Fri, 24 Feb 2023 07:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677252351; x=1708788351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B1rko9fih8YgNn8TepqzPls+UuWXwaza22aUx0qcL00=;
  b=ej+a3jVSiPH6KtI/xzzy4sQd5y50oWShXTp4AV6o3sE+cXnSlGs6K0CS
   JY1PhQM4I7unfKIXOKcHCLgxkqChWxjmqldFfVum0tTmR17qDyEG0LIYb
   vakrfyQ80QkoW8ldykBHjWJS/2EqjVcUXII13gIiwCj39fln8FykNEUMm
   +xnbvT62aRro1YmaemSB8SUMMaxx6i4JKdlTU5aEmcTht7nfFdg3Ah0Nz
   r/L5YhLiBMDCOlgar4WhiWc3OP8gfH4liDBsMJ0d0ir//Q4b7Qocc9w0/
   Q0uKyTJa00HztWPsZZt+i1lsIK1GqYIPKWh6Bsfr3ONroVPaR7vIKz8tJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="419731462"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="419731462"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 07:25:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="736824545"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="736824545"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 07:25:48 -0800
Date:   Fri, 24 Feb 2023 16:25:46 +0100
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, jacek.lawrynowicz@linux.intel.com,
        quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
        quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/8] accel/qaic: Add datapath
Message-ID: <20230224152546.GB3547587@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 06, 2023 at 08:41:42AM -0700, Jeffrey Hugo wrote:
> +#define SEM_VAL_MASK	GENMASK_ULL(11, 0)
> +#define SEM_INDEX_MASK	GENMASK_ULL(4, 0)
> +#define BULK_XFER	BIT(3)
> +#define GEN_COMPLETION	BIT(4)
> +#define INBOUND_XFER	1
> +#define OUTBOUND_XFER	2
> +#define REQHP_OFF	0x0 /* we read this */
> +#define REQTP_OFF	0x4 /* we write this */
> +#define RSPHP_OFF	0x8 /* we write this */
> +#define RSPTP_OFF	0xc /* we read this */
> +
> +#define ENCODE_SEM(val, index, sync, cmd, flags)			\
> +			((val) |					\
> +			(index) << 16 |					\
> +			(sync) << 22 |					\
> +			(cmd) << 24 |					\
> +			((cmd) ? BIT(31) : 0) |				\
> +			(((flags) & SEM_INSYNCFENCE) ? BIT(30) : 0) |	\
> +			(((flags) & SEM_OUTSYNCFENCE) ? BIT(29) : 0))

This could be probably better coded using FIELD_PREP()
with integrated checks of passed values not exceed
field width.

> +struct dbc_req { /* everything must be little endian encoded */

This comment does not provide much value IMHO ...

> +inline int get_dbc_req_elem_size(void)
> +{
> +	return sizeof(struct dbc_req);
> +}
> +
> +inline int get_dbc_rsp_elem_size(void)
> +{
> +	return sizeof(struct dbc_rsp);
> +}

.. as those those inliners, instead of using sizeof() directly.
Up to you to change.

> +static int reserve_pages(unsigned long start_pfn, unsigned long nr_pages,
> +			 bool reserve)
> +{
> +	unsigned long pfn;
> +	unsigned long end_pfn = start_pfn + nr_pages;
> +	struct page *page;
> +
> +	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
> +		if (!pfn_valid(pfn))
> +			return -EINVAL;
> +		page =  pfn_to_page(pfn);
> +		if (reserve)
> +			SetPageReserved(page);
> +		else
> +			ClearPageReserved(page);

It is needed? Looks like taken from some legacy code.

> +static int copy_sgt(struct qaic_device *qdev, struct sg_table **sgt_out,
> +		    struct sg_table *sgt_in, u64 size, u64 offset)
> +{
> +	int total_len, len, nents, offf = 0, offl = 0;
> +	struct scatterlist *sg, *sgn, *sgf, *sgl;
> +	struct sg_table *sgt;
> +	int ret, j;
> +
> +	/* find out number of relevant nents needed for this mem */
> +	total_len = 0;
> +	sgf = NULL;
> +	sgl = NULL;
> +	nents = 0;
> +
> +	size = size ? size : PAGE_SIZE;
> +	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
> +		len = sg_dma_len(sg);
> +
> +		if (!len)
> +			continue;
> +		if (offset >= total_len && offset < total_len + len) {
> +			sgf = sg;
> +			offf = offset - total_len;
> +		}
> +		if (sgf)
> +			nents++;
> +		if (offset + size >= total_len &&
> +		    offset + size <= total_len + len) {
> +			sgl = sg;
> +			offl = offset + size - total_len;
> +			break;
> +		}
> +		total_len += len;
> +	}
> +
> +	if (!sgf || !sgl) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> +	if (ret)
> +		goto free_sgt;
> +
> +	/* copy relevant sg node and fix page and length */
> +	sgn = sgf;
> +	for_each_sgtable_sg(sgt, sg, j) {
> +		memcpy(sg, sgn, sizeof(*sg));
> +		if (sgn == sgf) {
> +			sg_dma_address(sg) += offf;
> +			sg_dma_len(sg) -= offf;
> +			sg_set_page(sg, sg_page(sgn),
> +				    sg_dma_len(sg), offf);
> +		} else {
> +			offf = 0;
> +		}
> +		if (sgn == sgl) {
> +			sg_dma_len(sg) = offl - offf;
> +			sg_set_page(sg, sg_page(sgn),
> +				    offl - offf, offf);
> +			sg_mark_end(sg);
> +			break;
> +		}
> +		sgn = sg_next(sgn);
> +	}

Why not use sg_copy_table() ? Overall copy_sgt() seems to be something
that could be replaced by generic helper or at least simplify.

Regards
Stanislaw

