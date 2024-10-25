Return-Path: <linux-arm-msm+bounces-35836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB7A9AFF25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 11:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D05E1C211F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 09:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F731CBA1D;
	Fri, 25 Oct 2024 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqGnQgZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD61BCA0C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850285; cv=none; b=XPofymOXVYGRkqfMFrdmZh89MZQxQw4JpPnQBvf0yZsnK2Sfi+qQ3DBShk8z4W6GbDVOcIVh8SQPTJwRS09CL7wgTq6fgT+r32SOBkCqGT+UtItR6DQljla8wpXsJxOcr3ezAocfLwjgyPL1y5Ourvjk2vKL8LR0N5pUvrQklrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850285; c=relaxed/simple;
	bh=zpKRQ3vGohJhUHbr/KzlU5mjq19zC6KvGARyh2o6agI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=INwNZoI+klHhQAL+mePqRwaIo8stzVxiX4tkHJ0yZhDDT6DqwoYqkUeaeMqDbbsazpwRHshPdbqkeib5YaMq2V8GtZNn0oCSP1KU+mgpYkW1hrKeq0QEyaYBhMfloa8RT3whaZ/cAK447F7lZH0Gl5nv7zXqBF2cy+XEYzA+zaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqGnQgZC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729850283; x=1761386283;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=zpKRQ3vGohJhUHbr/KzlU5mjq19zC6KvGARyh2o6agI=;
  b=OqGnQgZClzVcyPZmYJlOHbtgHUHS+6NKIvIo6AydDonEqadsS11wNuKZ
   ItiM2GB4e5X3Nr7k4rKULFXjgxP6hXam3y8HvmtUqmalnILLTUlMXdPYR
   UEruN84hRr3DDMNS3Em8B34oQSI6fGXKyNGGOlHXXI0nZbniYEq9ngFyh
   DlECaI9vUbcI+ZZSebqvKCfcb4fX1GGlv7a4EDFmmTVLTeWtyg0jmFSgn
   /2Avpr0uCBi2H5Av+pkEpc7M45qfxOlIDAIsrmwwhxQyJFKJzM7+jP7Wa
   KJ4XNn9ns3tQDuxUIY3w/o4+Mdw8ialYw6jTFKfCHLRqxZ0VjedApa+Xt
   A==;
X-CSE-ConnectionGUID: uJ3dj/9GTeK4Ht2aJxqgQg==
X-CSE-MsgGUID: 3T7IlJrLSyqKrMU3UfxQbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54917391"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="54917391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:58:02 -0700
X-CSE-ConnectionGUID: 5/UyuiKmTBmV1H1/5icJVQ==
X-CSE-MsgGUID: Qlq7vZLvRImf8/1iE8TIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85663344"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:57:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm: Move plane->{fb,old_fb,crtc} to legacy
 sub-structure
In-Reply-To: <Zv58AalhFaMgh7c5@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-2-ville.syrjala@linux.intel.com>
 <Zv58AalhFaMgh7c5@intel.com>
Date: Fri, 25 Oct 2024 12:57:50 +0300
Message-ID: <875xpgqzc1.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Oct 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Oct 02, 2024 at 09:21:59PM +0300, Ville Syrjala wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>=20
>> Hide the plane->fb/etc. footguns better by stashing them inside
>> a "legacy" sub struct.
>>=20
>> Eventually maybe we could turn 'legacy' into a pointer
>> that only exists on legacy drivers to completely prevent
>> any abuse by atomic drivers...
>
> Hmm. I should probably make it a pointer from the start,
> to avoid having to go through the same churn yet again.

[snip]

>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index dd718c62ac31..a2d91ee4b40c 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -663,31 +663,33 @@ struct drm_plane {
>>  	/** @modifier_count: Size of the array pointed at by @modifier_count. =
*/
>>  	unsigned int modifier_count;
>>=20=20
>> -	/**
>> -	 * @crtc:
>> -	 *
>> -	 * Currently bound CRTC, only meaningful for non-atomic drivers. For
>> -	 * atomic drivers this is forced to be NULL, atomic drivers should
>> -	 * instead check &drm_plane_state.crtc.
>> -	 */
>> -	struct drm_crtc *crtc;
>> -
>> -	/**
>> -	 * @fb:
>> -	 *
>> -	 * Currently bound framebuffer, only meaningful for non-atomic drivers.
>> -	 * For atomic drivers this is forced to be NULL, atomic drivers should
>> -	 * instead check &drm_plane_state.fb.
>> -	 */
>> -	struct drm_framebuffer *fb;
>> -
>> -	/**
>> -	 * @old_fb:
>> -	 *
>> -	 * Temporary tracking of the old fb while a modeset is ongoing. Only
>> -	 * used by non-atomic drivers, forced to be NULL for atomic drivers.
>> -	 */
>> -	struct drm_framebuffer *old_fb;
>> +	struct {

Do you mean something along the lines of:

	struct __plane_legacy_or_something {

>> +		/**
>> +		 * @crtc:
>> +		 *
>> +		 * Currently bound CRTC, only meaningful for non-atomic drivers. For
>> +		 * atomic drivers this is forced to be NULL, atomic drivers should
>> +		 * instead check &drm_plane_state.crtc.
>> +		 */
>> +		struct drm_crtc *crtc;
>> +
>> +		/**
>> +		 * @fb:
>> +		 *
>> +		 * Currently bound framebuffer, only meaningful for non-atomic driver=
s.
>> +		 * For atomic drivers this is forced to be NULL, atomic drivers should
>> +		 * instead check &drm_plane_state.fb.
>> +		 */
>> +		struct drm_framebuffer *fb;
>> +
>> +		/**
>> +		 * @old_fb:
>> +		 *
>> +		 * Temporary tracking of the old fb while a modeset is ongoing. Only
>> +		 * used by non-atomic drivers, forced to be NULL for atomic drivers.
>> +		 */
>> +		struct drm_framebuffer *old_fb;
>> +	} legacy;

and

	} __legacy;

	struct __plane_legacy_or_something *legacy;

and initially unconditionally:

       	p->legacy =3D &p->__legacy;

but later, once atomic drivers have been fixed:

	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ATOMIC))
		p->legacy =3D &p->__legacy;

It would make the last update really simple.

BR,
Jani.


>>=20=20
>>  	/** @funcs: plane control functions */
>>  	const struct drm_plane_funcs *funcs;
>> --=20
>> 2.45.2

--=20
Jani Nikula, Intel

