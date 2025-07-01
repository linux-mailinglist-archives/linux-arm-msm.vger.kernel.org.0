Return-Path: <linux-arm-msm+bounces-63246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9AAEFF32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD9CC3A9ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE431A0BF3;
	Tue,  1 Jul 2025 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WO00Ou/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6EF1946AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386429; cv=none; b=q4eUK2O8nwX7nINDsHJ2toChw/JfD5X7Hofa7dOx//JHrze/Qno/MzGCcCubDykwgIA1MVZ5OQVzHiVnIU5x00LjrAwQlct82kenaQCrqBE/aHJH4P971nr0g4fIj6U0DvI4cqfp4TKm8YRhLb8cMbjnHDj/kxud4aymK1dVYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386429; c=relaxed/simple;
	bh=Ql9YFKLwUW1m8954J+Lj2amGMgMdpfIo5vfZCFfrGfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cm7ZNeVR4yjN4oWudICEr+7vwcaacweIQdvFSE+nfzsS5QSAxrsiwEepk6PbZiFVx+/++UYoJ7ABWktKVJOapGGf3CNY34+0g6yxaYwz38RLtDc8PaE+MpNNO/AdPYlDt/x4kuYZFdYyDmg153aw1WFJtmbCv7HSwH7ucYacv1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WO00Ou/M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751386428; x=1782922428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ql9YFKLwUW1m8954J+Lj2amGMgMdpfIo5vfZCFfrGfU=;
  b=WO00Ou/MPGM7MqB+Sx/8zWaPJnaylEkZkTzJzYZs58g3Wv+pVPrFppwa
   +Q0cwZNckAIMZPV6Yzw3zMMmNgyTZCZflmN2aAY2c0LSVnmR927oSUwpG
   j1LeY8wBt5901VNcPvf+sqJGYO6GY3erI5SahWKKyBtil0ONtyyK1xi5q
   zkDAWz4QMEaoYevxL6OPkuy5pIK6am05SURisk36Ck7CADzRPEDRoyMEn
   BXku9vc4OERX92bBj5ouOmS8vSnVKBNxhRB44+afLPrr45n4ip96t/WTa
   GSdJCSX1CMIyLiGZneqbQKeNNEI77FZ1o8F4/3H2QD06Pte99TQ+lQQq/
   Q==;
X-CSE-ConnectionGUID: sNbSeSCUS+ivHS1qSnn4lQ==
X-CSE-MsgGUID: H3TfJxkYTMik/0WTM7TdpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="63908698"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="63908698"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:13:48 -0700
X-CSE-ConnectionGUID: n9iVTbd6Qxq/8z2GoVm3Vg==
X-CSE-MsgGUID: qjvNP4yESBGiWa0vnaZBwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153898469"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:13:45 -0700
Date: Tue, 1 Jul 2025 18:13:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 4/9] msm/mapping: Handle BO names with spaces
Message-ID: <20250701161342.vy4t57rqx4k5u7e7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-5-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-5-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:08:58 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>
> 
> Instead of trimming at the first space, scan from the end of the string
> until we reach the first non-space char.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index f536db82aba2..5afbcd081fc7 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -101,13 +101,14 @@ endswith(const char *str, const char *end)
>  
>  	/* Trim trailing whitespace: */
>  	if (p) {
> -		char *c = p;
> -		while (c) {
> +		char *c = p + strlen(p) - 1;

Add empty line here.

> +		while (c > p ) {

Remove space after 'p':

		while (c > p) {

Regards,
Kamil

>  			if (isspace(*c)) {
>  				*c = '\0';
> +			} else {
>  				break;
>  			}
> -			c++;
> +			c--;
>  		}
>  	}
>  
> -- 
> 2.50.0
> 

