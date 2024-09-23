Return-Path: <linux-arm-msm+bounces-32179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061097E61D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 08:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE4821F21251
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 06:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBFDEAF6;
	Mon, 23 Sep 2024 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4PIGv6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A801FDA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 06:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727073532; cv=none; b=lH2hyn1TTR6SDHQ+svLUg/0DeGkvE80p/aNNtnDfjRZi/rI4QFCbOGFQJ8y6hA4LnNTFRszWFAJJD4xGP2xK3LHnUzFJcQ4+HdBiwgu2BM75ydzgfKPq0l2tgFaCY0zPMJ0qU1aIQ2+zI9+BKtWupXCbuAJZ310BCKemOCYbRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727073532; c=relaxed/simple;
	bh=kjHIinl4HqurhMpgWJRROF+5WBw8ydeWCDSQcXpsJIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tj1wjUiT8Strmfsk92x5+w6rJxJY+vxTbN51+BCyUKd7dmw+IE9/21E/SJPS8aTUgW3BfeRV94PGCInlU8HXTUzFBiW1ekJ4kESwEWOu79M/j9ND8ccOxsXBvRQ/jMM+Cb7HHr3s2fiRP243DmuYY8y4K5evMpIheJ0YWBjlWbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4PIGv6S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727073531; x=1758609531;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=kjHIinl4HqurhMpgWJRROF+5WBw8ydeWCDSQcXpsJIg=;
  b=k4PIGv6SwcGhuPAwGsoJPUHJzTozaLRV3A1qYEGDaZfSzRxwzYYseRY1
   ubgm44Mp+Ee1tn+YycTSemXI5l5C5Q5UQt3ev3L6TR/4G63/lZJwXo5ah
   svl4xAbK5H1YCPXfhFPSJQYwNKbUlppdVTtqBLH7U1V6WA3zdYlgGF9qh
   YDm+IiY7SQs+nh8citARRgXjF8hOHLIVvMpgJhkxCapcSlqmZNQrUFJJq
   wsFn8pOxsDd9zvU+hUQi/X65+ICXrglowQuKildqcA/rCo86okox/nQag
   vm1UfxUbJRdLUfBwEyslprp3WIORFKL83qEaJ9KPLrTTjWNScfV1qkJuK
   A==;
X-CSE-ConnectionGUID: ZjyUfTo3SOWThj4RJyVceA==
X-CSE-MsgGUID: 1zHNgy+NTBGeLBiYw/lfEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36590264"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="36590264"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 23:38:50 -0700
X-CSE-ConnectionGUID: cvlIPSonTompqD9DMu4dpw==
X-CSE-MsgGUID: Xhq3ahHKSp++y3A07Vp1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71277023"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.65])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 23:38:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, Rob
 Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
In-Reply-To: <n3w7pq364l5ugsnmenece73ke4f3msqmaqoxfrpnqssdo3znyc@psa4cbbmmbix>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <n3w7pq364l5ugsnmenece73ke4f3msqmaqoxfrpnqssdo3znyc@psa4cbbmmbix>
Date: Mon, 23 Sep 2024 09:38:43 +0300
Message-ID: <871q1a98ng.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 22 Sep 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Wed, Sep 11, 2024 at 01:23:23PM GMT, Jani Nikula wrote:
>> Thanks, I'll change this to drop the function.
>
> Seeing no updated revisions here, I've posted a patch that drops the
> offending function. If I missed an update, please exuse me.

Thanks, I just didn't get around to it yet.

BR,
Jani.


-- 
Jani Nikula, Intel

