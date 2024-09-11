Return-Path: <linux-arm-msm+bounces-31481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0A974FA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5BD4287C9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AAC2EB10;
	Wed, 11 Sep 2024 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7AuUFhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220291802DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726050214; cv=none; b=VT7z25atfc9hShReQ12Ns1xLNEiy70mK1ZkZjTukeP30PFdmUUFpXW9J5qKK42tAfQS5SgW+s0hxkcOMM28N1bB8mKk0BsS+Gdx3JDdY6kA58fq9KxTfclymEMNlutnaGdCtDQi3P4zHhTZhvwffnT3Hi90FilT73gcAj47ewL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726050214; c=relaxed/simple;
	bh=5K4tAcFBHvPTFN8Wakkvp/Wjtxx7ZDotyHbB7iJQI5E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TJAFurhAU45G5Gm4wVjdcXWkDEmUdj9RccPrqtALUVpc1mkEUlBi8RQqxK4lUMypq+IviCqtiyi3R+jqFhdM0yV7Ewg2xurMbkbo50pk1if/Rn2CdvJHSZKDRy0Eabtv3ESUWRp8x+VJDnBvZxXBBIrTpKjRXUPOXmYhqxKaceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7AuUFhw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726050213; x=1757586213;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=5K4tAcFBHvPTFN8Wakkvp/Wjtxx7ZDotyHbB7iJQI5E=;
  b=S7AuUFhwjO6QM8RU2bzxbO8gTXya8oJneThi1jqMZoSKMR4ADOB7vMR2
   qqcnrq7ugA8aiiddT/60xyPREDcmlSOnGHF9+tdNu/Ku6VtCnatFPurR+
   MiwrW9v2E7POvkQ+rP9snU7eC7I25MT0gKlY46/FaXQiL/l+Kiog7nxja
   73WTxQsj/jWtGc4G58Mb6HjIPbwYP52hwcobKDTAzs3eCy1GMaPIuN2e+
   7gSeEuBPFMHICfEm3WWEbeGTY5wYKpJCsm+FyceEfGyJSX/fZgnGSKpeb
   p0b7YQAAA1jCoQjelRMlmb1dpOySoJ0AAL7yn3RbZQOcbu6Uuwzavi2vu
   A==;
X-CSE-ConnectionGUID: PDxjiEgPRVW9VZR94/jGbw==
X-CSE-MsgGUID: EbdTV4MhTvaxI8+TQF/e2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24986955"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24986955"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:23:32 -0700
X-CSE-ConnectionGUID: CK2HXmxAT3KuAAFMtdSU6w==
X-CSE-MsgGUID: 2zqkdFhVQKGTCdjHtZvtsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="104781745"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:23:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Arnaud Vrac <avrac@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, Rob
 Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
In-Reply-To: <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
Date: Wed, 11 Sep 2024 13:23:23 +0300
Message-ID: <878qvyjxpg.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 10 Sep 2024, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>
>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>
>>> Building with clang and and W=1 leads to warning about unused
>>> pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.
>>>
>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>> inline functions for W=1 build").
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> I think this function can be dropped. Marc, your call, as an author of
>> the patch?
>
> ( Why is the patch prefixed "drm/msmi", is "msmi" a typo? )

Whoops, a typo.

>
> -> For the record, Arnaud is the driver's author.
>
> pll_cmp_to_fdata() was used in hdmi_8998_pll_recalc_rate()
> in a commented code block which was later removed.
>
> Thus, yes, it is safe to completely delete the unused function.
> I'm surprised gcc didn't catch that...

Thanks, I'll change this to drop the function.

GCC doesn't catch unused static inlines, while Clang does.

BR,
Jani.


>
> Regards
>
>
>>> ---
>>>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>>> index 0e3a2b16a2ce..c0bf1f35539e 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>>> @@ -153,7 +153,7 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>>>  	return dividend - 1;
>>>  }
>>>  
>>> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>>> +static inline __maybe_unused u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>>>  {
>>>  	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
>>>  
>>> -- 
>>> 2.39.2
>
>

-- 
Jani Nikula, Intel

