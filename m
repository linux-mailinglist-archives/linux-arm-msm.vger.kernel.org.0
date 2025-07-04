Return-Path: <linux-arm-msm+bounces-63724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3575AF979F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED5BC7B17D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD03326A7D;
	Fri,  4 Jul 2025 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KN2iD85N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5A327190
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645465; cv=none; b=mlE8jkntyZIlBMluSt23gZClxKQKfQnRWI57+vsnOHEyAPsz4TY36sWIJc0c8MYgaKmjWQK62MHxYKviKu+03lHbCfACocU4NENb53vR0MXavQsxKLIYeDqwB1nI083GKUR6XRVedYMmUSCsBWXpw1Xjmp6hfvWkLYhEXAYk9K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645465; c=relaxed/simple;
	bh=DgP70vcJeAJPMXAq9cVZVldZeoHrKQO543SnryhrNSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adCKwqe2LtyN327LPc/zfcSY4oVpATAKqZVEMq8Fgrfl3AgC/IrRb8SZX2wmqMMx9vIZOip5t7mC7TzXI90euZqYob+w0s7CZLVrkJdUlrG4ni4QaxMVRPJ3usCTTwOhXbe45aywpLODi2PJAzplExL5iB36vILLhMsfv015EBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KN2iD85N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751645464; x=1783181464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DgP70vcJeAJPMXAq9cVZVldZeoHrKQO543SnryhrNSc=;
  b=KN2iD85N4cwRRNPLxdkD/XAOzArwF44/pRi6np+gmJXcHmFoFhgoZZE7
   llYJbCzb+qaTpYYeKZsqH2wqCeXIMTO1nK+3H7LOngqypSwrOki+JIA9t
   0dwS5+sZ9sGKWXPthPRWnW2MCt6wPqg+wx84sjlOPCmP1rW5deidDoRaZ
   5wyzPA+E7HknmIupCOqU2gtcSvbYMrwJh7cEfsfxBSdG6oR3/GIJzOzrk
   Luir0x3TolIl9jsC2dV5mCsBH8EDfCsKKiBVoN5HFD5HOnsyKCqYqKA3e
   lpam7iGwty3ajUyZPFixz5+D2Jcu0+upZcuN91VMS2SC54nnt0w7DpDMZ
   A==;
X-CSE-ConnectionGUID: ouMbBTMsQ8K+8ok/SRsWKw==
X-CSE-MsgGUID: 0ZkWDwbZQI6cqXp9nLdH9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53701938"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="53701938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:11:03 -0700
X-CSE-ConnectionGUID: RaslA7riSISPN/r2ep5UbQ==
X-CSE-MsgGUID: /6+Clr9rR/mRBJAPRUhABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154420060"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:11:03 -0700
Date: Fri, 4 Jul 2025 18:11:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH i-g-t v2 0/9] msm: recovery and mapping updates
Message-ID: <20250704161100.k27itcxbiprtr3a4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>

Hi Rob,
On 2025-07-02 at 12:02:40 -0700, Rob Clark wrote:
> Mostly updates to address flakes, and updates related to newer kernels.
> Plus a few additional sub-tests.

Thank you, I merged it.

Regards,
Kamil

> 
> Rob Clark (9):
>   tests/msm/msm_mapping: Fix memory leak
>   tests/msm/msm_recovery: Wait for devcore
>   tests/msm/msm_recovery: add iova-fault-stress test
>   tests/msm/msm_mapping: update for sparse
>   tests/msm/msm_mapping: Handle BO names with spaces
>   tests/msm/msm_mapping: Add additional subtests
>   tests/msm/msm_mapping: Wait for devcore
>   tests/msm/msm_mapping: Handle larger gmem file size
>   tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm
> 
>  tests/msm/msm_mapping.c  | 93 +++++++++++++++++++++++++++++++++++-----
>  tests/msm/msm_recovery.c | 38 +++++++++++-----
>  2 files changed, 110 insertions(+), 21 deletions(-)
> 
> -- 
> 2.50.0
> 

