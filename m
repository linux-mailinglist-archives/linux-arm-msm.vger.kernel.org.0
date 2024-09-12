Return-Path: <linux-arm-msm+bounces-31606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF36976A13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 15:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21D8BB21D6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 13:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633621AB6F2;
	Thu, 12 Sep 2024 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQt46+R0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3092210FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726146628; cv=none; b=iiXXhPvfw+0VkDI+r5h17xIfH789nFx0Rp9FzJvPRk8O3lvVXmZH2CNKpqJHEMCVIKbfnLePc/8S7M2VJ1xVwA/R6O5zcBzFFLwX+5oheIEZF4xg3ISBUqhjOWXo7gK9dmLuFSiCtvPzBvb0ueMXbSY5qauA3VF14fYWbJZIsAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726146628; c=relaxed/simple;
	bh=TVLhA7LnlVkRoXqIpAQ+mwwoaQA3+1+rsJdLWPQ4yR4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tFGcBx/Y89PYNBzZ9EP1kx+OGVkTsv1EaGpbnuNOJsT3Jvv5GfVea/r4FzhBDHyj3buHcTOR/LimINo0lmYiidJTKk4MeNMxcJ0LBdPQAGxEajOcqyiwwCeE/u4ba9ssH207W/Iq6rylsnv9qoCAV4oUIveFsvE9IiOmzA3Ub2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQt46+R0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726146627; x=1757682627;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=TVLhA7LnlVkRoXqIpAQ+mwwoaQA3+1+rsJdLWPQ4yR4=;
  b=jQt46+R0gTc1/a+Cm4SIm90agKQu5dR0zZ8j0bBVIcJfKQwx3nrU2u9u
   naRgl75jHVRgpzyYllDs32O8Kk0zb5hn32KYk+5Oa2XVrlaa0T2RvqOf+
   Vfo7hXFGPdY42TU2A2HgUiNrwX9LCz8s9/pBXAv0MV25vl//WDN61R2zX
   Mf/A05VqVRBDNwARrPFsdKT8DX9j/vlO1ajIM7z3gkHk8vpu3btI67YDb
   REGNayueHOp5zegJQcB7Ta7+6nWu2dCGTvlFfkx2Qwm7QAaSRrBoS2iKg
   yKYCRri0ZbMhbey0KXtLGJBIunb4y4UI7oIO1xmjsvNbwzZyo701KsuY3
   A==;
X-CSE-ConnectionGUID: D6DRFqDLTWOwMZYqcP37PA==
X-CSE-MsgGUID: 3Zsc9woMTveZimacxar/xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27910902"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="27910902"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 06:10:25 -0700
X-CSE-ConnectionGUID: 1kCC6Z9dSk6N+vcnN/q3pA==
X-CSE-MsgGUID: aY32VBo9R/axqf7vITOzsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="72288265"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 06:10:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marc Gonzalez
 <mgonzalez@freebox.fr>
Cc: Arnaud Vrac <avrac@freebox.fr>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
In-Reply-To: <ki27iun7ar6nmwpkzykwjvkrn5jpadirbz6fy2c25akh2sbgpj@etbg4uo3hixr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
 <87ed5pgm2i.fsf@intel.com>
 <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
 <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
 <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
 <ki27iun7ar6nmwpkzykwjvkrn5jpadirbz6fy2c25akh2sbgpj@etbg4uo3hixr>
Date: Thu, 12 Sep 2024 16:10:20 +0300
Message-ID: <87plp9f26b.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 12 Sep 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Thu, Sep 12, 2024 at 02:50:04PM GMT, Marc Gonzalez wrote:
>> On 12/09/2024 14:28, Dmitry Baryshkov wrote:
>> > On Thu, Sep 12, 2024 at 02:14:10PM GMT, Marc Gonzalez wrote:
>> >> On 12/09/2024 13:15, Jani Nikula wrote:
>> >>> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
>> >>>> On 11/09/2024 12:23, Jani Nikula wrote:
>> >>>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
>> >>>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>> >>>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>> >>>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> >>>>>>>> inline functions for W=1 build").
>> >>>
>> >>> [snip]
>> >>>
>> >>>>> GCC doesn't catch unused static inlines, while Clang does.
>> >>>>
>> >>>> It makes no sense to me that adding "inline" would prevent
>> >>>> GCC from diagnosing the issue... GCC should simply ignore
>> >>>> the "inline" keyword when definition is not in a header file
>> >>>> (maybe they don't store "origin").
>> >>>
>> >>> Please just read the commit message for the commit I reference above for
>> >>> details. There's not much more I could say about it.
>> >>
>> >> OK, I read 6863f5643dd7.
>> >>
>> >> My remark still stands.
>> >>
>> >> GCC's decision to not warn for unused static inline functions
>> >> in source files (not headers) is questionable at best.
>> > 
>> > What's the difference between source file and a header after the CPP
>> > run?
>> 
>> That question is moot, since the source file / header file
>> convention exists only _before_ the preprocessor runs.
>> 
>> If you meant to ask
>> "How is the implementation supposed to track the origin",
>> then I would hand wave and say "internal annotations".
>
> No, I asked what I meant. #include doesn't have any semantics. You can
> #include "source.c" in the same way. So asking the compiler to make a
> difference between source file and the header isn't going to work (Note,
> gcc has some notion of system header files and I think a pragma that
> changes the behaviour a bit, but we are not talking about such cases,
> are we?).

Just saying, this sub-thread might be more fruitful on some GCC bug or
list.

BR,
Jani.

-- 
Jani Nikula, Intel

