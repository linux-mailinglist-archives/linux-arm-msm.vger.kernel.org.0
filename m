Return-Path: <linux-arm-msm+bounces-63714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DD9AF962F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B791A7AEB1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA491A2C25;
	Fri,  4 Jul 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDnSCMJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA2228CB5
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641387; cv=none; b=IAWSYGJniNYmuDpoY+JpFswhELbdFyjcQLXYPiXVQkJklX6vh1jRZd9ggDweKPRcX+lUhSsddmrbSOZ50STSIxhDPzXMa7B4syAxu8uWv8LanPFHjurQ27seKG3Rt+xI6HYADDbg+j6jJauBgsOlN0eS+TMVmPH+fuMqUqyqSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641387; c=relaxed/simple;
	bh=0ktyOx/bslUE4vNSOJazhHNQxHV7lXR7SKrOEQqOjWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJ7/DVelWEJCF7DVXcacNdBo7J0b8NvFx2McLEF1v/thXmP8lscav0miY+rkeYWuoZFvTqYSr5zjdAdTAyDSVWNBZ1cxO9rbdW2COzt7xr2zm00ZmjA9zqnrLgW57mSO1HDs/+JlVt8Y6gwhyAfztx+NHeQ0repKtn+JmcnbH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDnSCMJC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751641386; x=1783177386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0ktyOx/bslUE4vNSOJazhHNQxHV7lXR7SKrOEQqOjWI=;
  b=GDnSCMJCeVeb22L+jolN7E7tx42GFhFY/RhD+Ww62TfjpYRDzVNjVufN
   jSQdIr74V1lxyZvyOPDVsR3rnK9m0p2rVVE/Ht2NsPE5cejNY091t66tG
   NzjD9hnlQLBKJukr65G6IcpG9x9arBX9V9bRETtTZQDpsNFb27NmB6Wta
   y+H8lA+uHDf9VkgV6dwmgOTEt1QlEel3mwso8g/sQz+C61cg3ut0tuzb+
   oUsCiTe3zh68LN4mllwjpBQ3YCemeB/PBSFOQXD59BQUEwGYjJLztJpqn
   ombLHgTxW+VkEEVTFJQ28rg/+fBzhbTgWpzkQW/vQZ4ngf4dsWAQgCuys
   A==;
X-CSE-ConnectionGUID: 1sOaBr+iReqh9CzVyMlD5A==
X-CSE-MsgGUID: AoN/e7S0TJyfh/CkMoYw4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64225395"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="64225395"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 08:03:06 -0700
X-CSE-ConnectionGUID: COlesd7ZS2uq3kxMxRZY4g==
X-CSE-MsgGUID: UJHmNRV/RyqpCoOR8mvMyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="155237523"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 08:03:04 -0700
Date: Fri, 4 Jul 2025 17:02:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH i-g-t v2 1/9] tests/msm/msm_mapping: Fix memory leak
Message-ID: <20250704150248.w4ni6gjhqcs7cjhd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
 <20250702190249.376313-2-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702190249.376313-2-rob.clark@oss.qualcomm.com>

Hi Rob,
On 2025-07-02 at 12:02:41 -0700, Rob Clark wrote:
> We shouldn't leak the devcore.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>

For whole series this is
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/msm/msm_mapping.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index ac20ca91d613..1749a670e70d 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -215,6 +215,8 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
>  	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
>  	igt_fail_on(ret != 1);
>  	igt_fail_on(addr != fault_addr);
> +
> +	free(devcore);
>  }
>  
>  /*
> -- 
> 2.50.0
> 

