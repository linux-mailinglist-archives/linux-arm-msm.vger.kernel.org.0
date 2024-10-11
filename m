Return-Path: <linux-arm-msm+bounces-34049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7837999DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 629ACB20F98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0A9209F52;
	Fri, 11 Oct 2024 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9kVfBdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B8209F54
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631514; cv=none; b=DndqIut6L9nUZbhqCOaVmBOkI/TccmLU2S7GLF21CkeBWg7FycpHlRiAVqNuqHkyF0LP96LYIqkq9cMT5LISq96TFkI/nAWunQbprTXbMQBGAaugGPv1I/qD0a5LmAl0/GqIE5oEMnvGR1N8wHCKAvla9+fRhzM08+VFewOIqmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631514; c=relaxed/simple;
	bh=ga19TDWAVXLp74B4e+M5voJ3hGpSU1u6zny4p1lqEbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GT4wz1Sj8MlUfhu5/T/E4dv80YyEcf9UA3XYmdwphdGOdTrE26evHzOy+RTr51osMl+bEIIca1xWMOs3QqW5ADbxZELDuCGfB7RrHlHHXZgnVsZBEgdJdLgQgOwPjh4GkvoidUKeE8S4rFT1g3y3SOTA9QiK4BVwPO+/fgLQ7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9kVfBdK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728631513; x=1760167513;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ga19TDWAVXLp74B4e+M5voJ3hGpSU1u6zny4p1lqEbQ=;
  b=R9kVfBdKkIPcU7z2QmU+Yw2Qf9HIH63Ir/yXmmmYKacwrFoMM3n+WSZf
   a7qUgNnPfkDS/bs8+S5KVPWUUetjGQdIywtq6ZOtc7c70BuqqBQSWPD9h
   vyq3sZlAbk9SX2sjMmi/STi0DYWwp3KqG/qDHxxbZYKKxakSFf/MURTsK
   4MQnkfIzJfspkik+K4Dco9wjj4ROuh5THWqv9CGafnKY4O3WyD9fThSuc
   dRh5r1QVY5SjQ9zapB0FrR4DevPGKyQ5L0XjbfL5z1vKvzp1k4Eo+1oFQ
   JQGHhjVk2GuCj8P8qXcqzvDGCISRWe+7dr54TCgBTrNwFfhL8lKLiFILH
   Q==;
X-CSE-ConnectionGUID: k/9Zv+VQSAity2AwTuFnDA==
X-CSE-MsgGUID: 2bOC+e7iRSCsw/P/3cBLcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28114253"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="28114253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:25:12 -0700
X-CSE-ConnectionGUID: hIERh4JjQZeMd+2vbR2Rvg==
X-CSE-MsgGUID: qw4eVT0rR76EohZifz4RvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77306120"
Received: from jwbates1-mobl.amr.corp.intel.com (HELO [10.245.100.202]) ([10.245.100.202])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:25:11 -0700
Message-ID: <0587cd70-af62-41c9-acca-bbbab5b56659@linux.intel.com>
Date: Fri, 11 Oct 2024 09:25:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix the for loop used to walk SG table
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20241004193252.3888544-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241004193252.3888544-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 10/4/2024 9:32 PM, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Only for_each_sgtable_dma_sg() should be used to walk through a SG table
> to grab correct bus address and length pair after calling DMA MAP API on
> a SG table as DMA MAP APIs updates the SG table and for_each_sgtable_sg()
> walks through the original SG table.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_control.c | 2 +-
>  drivers/accel/qaic/qaic_data.c    | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 9e8a8cbadf6b..d8bdab69f800 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -496,7 +496,7 @@ static int encode_addr_size_pairs(struct dma_xfer *xfer, struct wrapper_list *wr
>  	nents = sgt->nents;
>  	nents_dma = nents;
>  	*size = QAIC_MANAGE_EXT_MSG_LENGTH - msg_hdr_len - sizeof(**out_trans);
> -	for_each_sgtable_sg(sgt, sg, i) {
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
>  		*size -= sizeof(*asp);
>  		/* Save 1K for possible follow-up transactions. */
>  		if (*size < SZ_1K) {
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index e86e71c1cdd8..c20eb63750f5 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -184,7 +184,7 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
>  	nents = 0;
>  
>  	size = size ? size : PAGE_SIZE;
> -	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
> +	for_each_sgtable_dma_sg(sgt_in, sg, j) {
>  		len = sg_dma_len(sg);
>  
>  		if (!len)
> @@ -221,7 +221,7 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
>  
>  	/* copy relevant sg node and fix page and length */
>  	sgn = sgf;
> -	for_each_sgtable_sg(sgt, sg, j) {
> +	for_each_sgtable_dma_sg(sgt, sg, j) {
>  		memcpy(sg, sgn, sizeof(*sg));
>  		if (sgn == sgf) {
>  			sg_dma_address(sg) += offf;
> @@ -301,7 +301,7 @@ static int encode_reqs(struct qaic_device *qdev, struct bo_slice *slice,
>  	 * fence.
>  	 */
>  	dev_addr = req->dev_addr;
> -	for_each_sgtable_sg(slice->sgt, sg, i) {
> +	for_each_sgtable_dma_sg(slice->sgt, sg, i) {
>  		slice->reqs[i].cmd = cmd;
>  		slice->reqs[i].src_addr = cpu_to_le64(slice->dir == DMA_TO_DEVICE ?
>  						      sg_dma_address(sg) : dev_addr);


