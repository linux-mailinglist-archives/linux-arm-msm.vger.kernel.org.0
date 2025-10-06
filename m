Return-Path: <linux-arm-msm+bounces-76003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12CBBD2D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 09:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C0204E7E2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 07:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81611ACED5;
	Mon,  6 Oct 2025 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WI/xZhqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E513208;
	Mon,  6 Oct 2025 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759734168; cv=none; b=X9U3MJRzLv22S2ol+3QO4NkRqzqC6ESN1z0QYwoOX8VQCOQ5MBPJf6MqhEjj//kMxzFgkxe2Hac89+MIfZKsLeTDaTjlW5eoZQBOucmsVUSezXPceGrm7y5ZeY+AswMmw6Bx4WLtoqWFrSowgP4Mi0qmHL9/cSBp0UYkjybumYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759734168; c=relaxed/simple;
	bh=PXJ6MRuzR6aMbdgG6mYjkWRtJiUQB3/rHCe+G2vrpVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TmJu1OIqGqE+xy4rCePbSxYH+avPoQs0zciUySt+d3nmjJCqKK9kVIOMsmuU7kqzBHHRhltzKOcYRWanYixS9t1QabYJCAarmIoJbb1/+qboiK3HrC03F8+he+ZtA9soFBWKvxBnrtNI9F7zXXSunbdCm9gLCxknBZ/Ih2DTbyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WI/xZhqE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759734167; x=1791270167;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=PXJ6MRuzR6aMbdgG6mYjkWRtJiUQB3/rHCe+G2vrpVk=;
  b=WI/xZhqEusHTiBVLmqPiXHdp6pPZ/h54VTG73rioOmbOTT1SHtMKzIv9
   yp9sAxOUf4xJVGdOyfAVUt4uEsVOD8AFxlBp8MHJOjp3wkr/Ishkrd3dD
   MjnYoxk/sqsL6P7Na8qaJkTb+JWBAEeI9y26SyY6iUWNsbvw4mAHd+uP6
   +I085RSG+LTpoTqTnbgl/WvCAMF8ncWtbWYMWVByNysEW7yt2yQCZlcEU
   ibcpQxR4rJ5wfyADQwjtt6CtrZIQ+pB/cMEy+gtcaikLXOil+vc7J7eTC
   WAAiC3NRZCDkG668sJg/+AFQ+PuwuUFtAofkwT4Hs+MhkgJbjRkSSP5pr
   A==;
X-CSE-ConnectionGUID: fmye0HfATwiZ0dUxfa3CrQ==
X-CSE-MsgGUID: /CYajIETRWC8+LYRRWzQWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73005297"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; 
   d="scan'208";a="73005297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2025 00:02:46 -0700
X-CSE-ConnectionGUID: iyLLkEz/SOGMrqj15F92Fg==
X-CSE-MsgGUID: u1fNJsPGSsy+WvwcoZPP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; 
   d="scan'208";a="184096523"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.162])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2025 00:02:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
In-Reply-To: <v37d36nd7ues6fp53ncrqdzvmikzjn4pf427wztzatc3pvqhvn@kpg5jrkqbfc4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
 <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
 <v37d36nd7ues6fp53ncrqdzvmikzjn4pf427wztzatc3pvqhvn@kpg5jrkqbfc4>
Date: Mon, 06 Oct 2025 10:02:40 +0300
Message-ID: <b3aec4bd094bb5f4a531907f295721438fe5f2d1@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 03 Oct 2025, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Fri, Oct 03, 2025 at 11:01:56AM +0200, Neil Armstrong wrote:
>> On 10/3/25 03:17, Dmitry Baryshkov wrote:
>> > On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
>> > > My current email will stop working soon. Update my email address to
>> > > jesszhan0024@gmail.com
>> > > 
>> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> > > ---
>> > >   MAINTAINERS | 4 ++--
>> > >   1 file changed, 2 insertions(+), 2 deletions(-)
>> > > 
>> > 
>> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> > 
>> > 
>> 
>> So dim complains you didn't review with the right address...
>> 
>> dim: ERROR: 261785a47e0b ("MAINTAINERS: Update Jessica Zhang's email address"): Mandatory Maintainer Acked-by missing., aborting
>> 
>> I guess it expects Dmitry Baryshkov <lumag@kernel.org>
>
> No. It is a known limitation of dim, it expects a maintainers's review,
> but there aer no maintainers for MAINTAINERS file. 

Yeah, maybe MAINTAINERS deserves an explicit exception in dim.


-- 
Jani Nikula, Intel

