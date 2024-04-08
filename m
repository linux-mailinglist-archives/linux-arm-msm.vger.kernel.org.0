Return-Path: <linux-arm-msm+bounces-16789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A489BC6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 11:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1A35B20CD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F64524A2;
	Mon,  8 Apr 2024 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9Me7u5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879214D110
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712570256; cv=none; b=obFeJoIE9Eq75RBip3aeP2F/YCz+edEIhJzt9WFXuFe+oeQL7kBgWD4x6unRunMDqfF0VxcwXKjYXZX93QSlqN9vgD7Lb8HPvOYcxgdGRuHPppdOznG7VCdesvpBcLbNkq3gzEEqULzJR8g8qMhdtHeP5SrEl7I9FbbKE0rEwgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712570256; c=relaxed/simple;
	bh=i7vJDeBtWo/Ou+kqa0iug9VmU2LgfFDgiKXdOwEporA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g1N5o1/AmhGJvMBbJ4Kmc+xCnfP4EU6N6jljzepMBxx8gD1CwXW6yY7MnYqTq3IsfqAe/9f1BAqtdgPRqJFPCINUtCeTkgMoDH6pFGzbU7JKpBw3vmeOaK9tscMLQZH4xhlLPtzAodsQ2trIK7SkdwBfbdPqo74XHqAkVKSc+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9Me7u5w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712570255; x=1744106255;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=i7vJDeBtWo/Ou+kqa0iug9VmU2LgfFDgiKXdOwEporA=;
  b=b9Me7u5w3v2ijSNSThlXr7oKq70dq+STUZXAzBj2tFLQWcvLG4qsux+S
   qtIxwwnMw0WKyUZTNGMnSpWZF2cfoySXtlzu+dl0Cm/wzF+K5Ws03w/U+
   3247pdasuwZYQcLh5Sx5dADomgqhS31/PMxk+l5HLq75JZwh7NWgYnVEF
   NvLZjb1jilQNwkVtzyK9HXzUewAbf789zqq6j+BIRhuRveLnUJYaJwfcw
   rM3K8609yy7oImjR8wSYFh+ehoHtC8DXQaUT2BA8exoBqZ71H88951Y4c
   ZjOuSKJSe3ka3DPkIP3GVLc5Vnb49WT172ARzGV6PCya+/gb3nMNmJzWf
   Q==;
X-CSE-ConnectionGUID: PLInt75JTReYMV60bpUJGA==
X-CSE-MsgGUID: ypuSy0uhQfO8Jih06c5sMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7705075"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7705075"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 02:57:34 -0700
X-CSE-ConnectionGUID: aW2IKeTQR2GbuJmLvGRk+A==
X-CSE-MsgGUID: E8meANszRvmsKTmThmpvHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="19960303"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.42.71])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 02:57:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Aishwarya TCV
 <aishwarya.tcv@arm.com>
Subject: Re: [PATCH] drm/msm: convert all pixel format logging to use %p4cc
In-Reply-To: <CAA8EJpr9cEv6Yi1q+8u-+mU2V3yp=C9rtpnCu+pyouozukYQ=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240405092907.2334007-1-jani.nikula@intel.com>
 <eondf5x3wz3nccxpnqxtb7gtvf3k5u3bz4qwhn3gbcy5pj73ku@fue4tej3xgnq>
 <87frvwb7i5.fsf@intel.com>
 <CAA8EJpr9cEv6Yi1q+8u-+mU2V3yp=C9rtpnCu+pyouozukYQ=g@mail.gmail.com>
Date: Mon, 08 Apr 2024 12:57:27 +0300
Message-ID: <87sezw9ny0.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 08 Apr 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Mon, 8 Apr 2024 at 11:09, Jani Nikula <jani.nikula@intel.com> wrote:
>> Thanks! Do you take this via the msm tree?
>
> Yes, I will

Forgot to mention, there's a Tested-by at [1].

Tested-by: Aishwarya TCV <aishwarya.tcv@arm.com>

[1] https://lore.kernel.org/r/157e69d4-850f-40d2-84ff-d25dd2c122b4@arm.com

-- 
Jani Nikula, Intel

