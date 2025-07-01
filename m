Return-Path: <linux-arm-msm+bounces-63244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AFEAEFF2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1071F165268
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7109A27A47F;
	Tue,  1 Jul 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUw47Nnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7845274B3D
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386293; cv=none; b=e3O/9qRVNShmbikmEu2VU3/BJQMPwQES57CbmTFXyMTdZZ0kQcF4PpMMaG32dLWJ7uHvW8UiVXBEA+v7IVzE2k3DGJw1xl5ufmUxHx0vGUNN6IRU7OcAs7DIwVVO1VqKq1XaLDgSm+0N8oeSs/b7IzESIMSHctfL87lz1qgFmiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386293; c=relaxed/simple;
	bh=q0H9zmqmuXj/T9wKOHfxhT/WrX40qxbeH+08XH1zvus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgYQgVWFnv//F7IN9xixC1oweakSfvopLl37dUmpk6WOOSNSzOK7GSPQK90i/8z9A46Y3XCrjfyHHVmp/Z84Fgz1X1RgCd9Y6ytCwZLi6rsKynt2q1H6Qo/b/0459t0WqO9p7QaIg8Udwq7CUwe6IIQlOzeeHkAmDYdgKIsAxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUw47Nnj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751386292; x=1782922292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q0H9zmqmuXj/T9wKOHfxhT/WrX40qxbeH+08XH1zvus=;
  b=RUw47NnjOFQSSFBJ95tgdActGcJo84+4LhmkxGnlR3cd1E5gL0Ff6bhF
   PvIKdYuZpM7YGJIDZhYOQtklDF8yqjEGRBVaqyvZi+nZgxBeoH0XlRol9
   ccCUg82d6NhxkZ7P/vsdvWSfLFkmSIFjcr8YRzwuUhemcWkcrhs5poKU4
   NX5zwNftGpusB20vj6T6c8Xd97PFQAtxXGd6JmAfrxDcQU6oOb6vGVpgK
   BWmGuWF9ZBFRWlVe96TUiEjQ42V1I/Szkv76I1uSx2v5Xg1OolbFERSRF
   bXRcZwcw3s/o3afKCHyyJx2YB9ocy34VEVY+LpcwRT9uiWHQZb8M1M8oS
   g==;
X-CSE-ConnectionGUID: z6PnIcptQwG3lCzff/s4XQ==
X-CSE-MsgGUID: 0UaI3WWSSHmdaR08BNnLDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53781686"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53781686"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:11:31 -0700
X-CSE-ConnectionGUID: Cr0lDKtzSRaUHyqSBXmJmg==
X-CSE-MsgGUID: ln6emMxwQ5u82lV24lOUYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184861543"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:11:30 -0700
Date: Tue, 1 Jul 2025 18:11:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 3/9] msm/mapping: update for sparse
Message-ID: <20250701161127.yolrc5myqkwjdpvx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-4-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-4-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:08:57 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>

Fix 'From: ' e-mail address to match s-o-b.
Also add 'tests/' prefix:

[PATCH igt 3/9] tests/msm/msm_mapping: update for sparse

> 
> The debugfs format changes a bit.  Update the igt test to handle both
> cases.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index ac20ca91d613..f536db82aba2 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -148,6 +148,10 @@ get_bo_addr(int drm_fd, const char *name)
>  
>  			ret = sscanf(line, "      vmas: [gpu: aspace=%"PRIx64", %"PRIx64",mapped,inuse=1]",
>  					&dummy, &addr);
> +			if (ret != 2) {
> +				ret = sscanf(line, "      vmas: [gpu: vm=%"PRIx64", %"PRIx64", mapped]",
> +						&dummy, &addr);

Align to 'line'.

Regards,
Kamil

> +			}
>  			igt_fail_on(ret != 2);
>  
>  			return addr;
> -- 
> 2.50.0
> 

