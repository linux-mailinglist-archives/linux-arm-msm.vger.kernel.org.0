Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA13FC31F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 13:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbfJALEG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Tue, 1 Oct 2019 07:04:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:5667 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfJALEG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 07:04:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 04:04:05 -0700
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; 
   d="scan'208";a="195612547"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 04:03:58 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Eric Engestrom <eric@engestrom.ch>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        nouveau@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francisco Jerez <currojerez@riseup.net>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        etnaviv@lists.freedesktop.org
Subject: Re: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
In-Reply-To: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
Date:   Tue, 01 Oct 2019 14:03:55 +0300
Message-ID: <875zl8d8x0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 Sep 2019, Eric Engestrom <eric@engestrom.ch> wrote:
> On Tuesday, 2019-09-24 15:58:56 +0300, Jani Nikula wrote:
>> Hi all, v2 of [1], a little refactoring around drm_debug access to
>> abstract it better. There shouldn't be any functional changes.
>> 
>> I'd appreciate acks for merging the lot via drm-misc. If there are any
>> objections to that, we'll need to postpone the last patch until
>> everything has been merged and converted in drm-next.
>> 
>> BR,
>> Jani.
>> 
>> Cc: Eric Engestrom <eric.engestrom@intel.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: David (ChunMing) Zhou <David1.Zhou@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: Ben Skeggs <bskeggs@redhat.com>
>> Cc: nouveau@lists.freedesktop.org
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: Francisco Jerez <currojerez@riseup.net>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>> Cc: etnaviv@lists.freedesktop.org
>> 
>> 
>> [1] http://mid.mail-archive.com/cover.1568375189.git.jani.nikula@intel.com
>> 
>> Jani Nikula (9):
>>   drm/print: move drm_debug variable to drm_print.[ch]
>>   drm/print: add drm_debug_enabled()
>>   drm/i915: use drm_debug_enabled() to check for debug categories
>>   drm/print: rename drm_debug to __drm_debug to discourage use
>
> The above four patches are:
> Reviewed-by: Eric Engestrom <eric@engestrom.ch>
>
> Did you check to make sure the `unlikely()` is propagated correctly
> outside the `drm_debug_enabled()` call?

I did now.

Having drm_debug_enabled() as a macro vs. as an inline function does not
seem to make a difference, so I think the inline is clearly preferrable.

However, for example

	unlikely(foo && drm_debug & DRM_UT_DP)

does produce code different from

	(foo && drm_debug_enabled(DRM_UT_DP))

indicating that the unlikely() within drm_debug_enabled() does not
propagate to the whole condition. It's possible to retain the same
assembly output with

	(unlikely(foo) && drm_debug_enabled(DRM_UT_DP))

but it's unclear to me whether this is really worth it, either
readability or performance wise.

Thoughts?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
