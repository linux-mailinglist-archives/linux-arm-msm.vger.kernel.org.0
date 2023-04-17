Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B8E6E4618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 13:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbjDQLMv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 07:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjDQLMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 07:12:50 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8E4135;
        Mon, 17 Apr 2023 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681729909; x=1713265909;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=iRmXXXS91Y7uC4yhoOdURFhhO7AKPLHUqfPEQ2lSuxA=;
  b=SJ3+9SoKU9JvUCm1K4+CZFDSqPAmD6gzCH+uyhp3DGhIE0AU3pfLGK2e
   wtnH7g6OkNy3U+AvkORFdSw8XDuNyPl0CHTSXADjuAWorydz7HU83+Jsr
   85BX1WjnLCmWAUaQHJnt+e+aeKeC5H0ajRdGkBcDJQv7XRRNi8TDJ3l45
   S+IImAMIgJOCJ36WZK4nhEjCfGXGygMHGXlLeBhDjfNmEAKkKjek1tZfE
   v2N6VbVGKHTj8WsNHh42mMwZhdp5wRfOme4dHZphv+xos1CtiJobsI7M3
   HdCf0XIoKop1YThmqgQCqnnQARMEbjkRotTDxBDEygWF8IpuY6tCvE1xs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="333658990"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="333658990"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 04:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="864965154"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="864965154"
Received: from gtohallo-mobl.ger.corp.intel.com (HELO [10.213.232.210]) ([10.213.232.210])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 04:10:11 -0700
Message-ID: <09c8d794-bb64-f7ba-f854-f14ac30600a6@linux.intel.com>
Date:   Mon, 17 Apr 2023 12:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arm-msm@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Christopher Healy <healych@amazon.com>,
        dri-devel@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        freedreno@lists.freedesktop.org
References: <CAF6AEGsZsMx+Vy+4UQSx3X7w_QNvvjLqWxx=PnCLAOC9f-X2CQ@mail.gmail.com>
 <ZDb1phnddSne79iN@phenom.ffwll.local>
 <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
 <ZDcEGoSPGr/oRLas@phenom.ffwll.local>
 <c82fd8fa-9f4b-f62f-83be-25853f9ecf5e@linux.intel.com>
 <ZDgDQ1PqtXwu8zqA@phenom.ffwll.local>
 <ad8f2793-c1b3-a505-e93f-6cc52fded86d@linux.intel.com>
 <ZDhgcqiOtJi6//TS@phenom.ffwll.local>
 <8893ad56-8807-eb69-2185-b338725f0b18@linux.intel.com>
 <CAF6AEGtaiKMWsGxTSUHM7_s_Wqiw3=ta+g=arUxknJ0dxbYvFQ@mail.gmail.com>
 <ZDuoWC7TlvNa1OOm@phenom.ffwll.local>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZDuoWC7TlvNa1OOm@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 16/04/2023 08:48, Daniel Vetter wrote:
> On Fri, Apr 14, 2023 at 06:40:27AM -0700, Rob Clark wrote:
>> On Fri, Apr 14, 2023 at 1:57 AM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>>
>>> On 13/04/2023 21:05, Daniel Vetter wrote:
>>>> On Thu, Apr 13, 2023 at 05:40:21PM +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 13/04/2023 14:27, Daniel Vetter wrote:
>>>>>> On Thu, Apr 13, 2023 at 01:58:34PM +0100, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 12/04/2023 20:18, Daniel Vetter wrote:
>>>>>>>> On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
>>>>>>>>> On Wed, Apr 12, 2023 at 11:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>>>>>
>>>>>>>>>> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
>>>>>>>>>>> On Wed, Apr 12, 2023 at 7:42 AM Tvrtko Ursulin
>>>>>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 11/04/2023 23:56, Rob Clark wrote:
>>>>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Add support to dump GEM stats to fdinfo.
>>>>>>>>>>>>>
>>>>>>>>>>>>> v2: Fix typos, change size units to match docs, use div_u64
>>>>>>>>>>>>> v3: Do it in core
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>>>>>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>       Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
>>>>>>>>>>>>>       drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
>>>>>>>>>>>>>       include/drm/drm_file.h                |  1 +
>>>>>>>>>>>>>       include/drm/drm_gem.h                 | 19 +++++++
>>>>>>>>>>>>>       4 files changed, 117 insertions(+)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>>>>>>>>>>>> index b46327356e80..b5e7802532ed 100644
>>>>>>>>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>>>>>>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>>>>>>>>>>> @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
>>>>>>>>>>>>>       Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>>>>>>>>>>>>>       indicating kibi- or mebi-bytes.
>>>>>>>>>>>>>
>>>>>>>>>>>>> +- drm-shared-memory: <uint> [KiB|MiB]
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +The total size of buffers that are shared with another file (ie. have more
>>>>>>>>>>>>> +than a single handle).
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +- drm-private-memory: <uint> [KiB|MiB]
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +The total size of buffers that are not shared with another file.
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +- drm-resident-memory: <uint> [KiB|MiB]
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +The total size of buffers that are resident in system memory.
>>>>>>>>>>>>
>>>>>>>>>>>> I think this naming maybe does not work best with the existing
>>>>>>>>>>>> drm-memory-<region> keys.
>>>>>>>>>>>
>>>>>>>>>>> Actually, it was very deliberate not to conflict with the existing
>>>>>>>>>>> drm-memory-<region> keys ;-)
>>>>>>>>>>>
>>>>>>>>>>> I wouldn't have preferred drm-memory-{active,resident,...} but it
>>>>>>>>>>> could be mis-parsed by existing userspace so my hands were a bit tied.
>>>>>>>>>>>
>>>>>>>>>>>> How about introduce the concept of a memory region from the start and
>>>>>>>>>>>> use naming similar like we do for engines?
>>>>>>>>>>>>
>>>>>>>>>>>> drm-memory-$CATEGORY-$REGION: ...
>>>>>>>>>>>>
>>>>>>>>>>>> Then we document a bunch of categories and their semantics, for instance:
>>>>>>>>>>>>
>>>>>>>>>>>> 'size' - All reachable objects
>>>>>>>>>>>> 'shared' - Subset of 'size' with handle_count > 1
>>>>>>>>>>>> 'resident' - Objects with backing store
>>>>>>>>>>>> 'active' - Objects in use, subset of resident
>>>>>>>>>>>> 'purgeable' - Or inactive? Subset of resident.
>>>>>>>>>>>>
>>>>>>>>>>>> We keep the same semantics as with process memory accounting (if I got
>>>>>>>>>>>> it right) which could be desirable for a simplified mental model.
>>>>>>>>>>>>
>>>>>>>>>>>> (AMD needs to remind me of their 'drm-memory-...' keys semantics. If we
>>>>>>>>>>>> correctly captured this in the first round it should be equivalent to
>>>>>>>>>>>> 'resident' above. In any case we can document no category is equal to
>>>>>>>>>>>> which category, and at most one of the two must be output.)
>>>>>>>>>>>>
>>>>>>>>>>>> Region names we at most partially standardize. Like we could say
>>>>>>>>>>>> 'system' is to be used where backing store is system RAM and others are
>>>>>>>>>>>> driver defined.
>>>>>>>>>>>>
>>>>>>>>>>>> Then discrete GPUs could emit N sets of key-values, one for each memory
>>>>>>>>>>>> region they support.
>>>>>>>>>>>>
>>>>>>>>>>>> I think this all also works for objects which can be migrated between
>>>>>>>>>>>> memory regions. 'Size' accounts them against all regions while for
>>>>>>>>>>>> 'resident' they only appear in the region of their current placement, etc.
>>>>>>>>>>>
>>>>>>>>>>> I'm not too sure how to rectify different memory regions with this,
>>>>>>>>>>> since drm core doesn't really know about the driver's memory regions.
>>>>>>>>>>> Perhaps we can go back to this being a helper and drivers with vram
>>>>>>>>>>> just don't use the helper?  Or??
>>>>>>>>>>
>>>>>>>>>> I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then it
>>>>>>>>>> all works out reasonably consistently?
>>>>>>>>>
>>>>>>>>> That is basically what we have now.  I could append -system to each to
>>>>>>>>> make things easier to add vram/etc (from a uabi standpoint)..
>>>>>>>>
>>>>>>>> What you have isn't really -system, but everything. So doesn't really make
>>>>>>>> sense to me to mark this -system, it's only really true for integrated (if
>>>>>>>> they don't have stolen or something like that).
>>>>>>>>
>>>>>>>> Also my comment was more in reply to Tvrtko's suggestion.
>>>>>>>
>>>>>>> Right so my proposal was drm-memory-$CATEGORY-$REGION which I think aligns
>>>>>>> with the current drm-memory-$REGION by extending, rather than creating
>>>>>>> confusion with different order of key name components.
>>>>>>
>>>>>> Oh my comment was pretty much just bikeshed, in case someone creates a
>>>>>> $REGION that other drivers use for $CATEGORY. Kinda Rob's parsing point.
>>>>>> So $CATEGORY before the -memory.
>>>>>>
>>>>>> Otoh I don't think that'll happen, so I guess we can go with whatever more
>>>>>> folks like :-) I don't really care much personally.
>>>>>
>>>>> Okay I missed the parsing problem.
>>>>>
>>>>>>> AMD currently has (among others) drm-memory-vram, which we could define in
>>>>>>> the spec maps to category X, if category component is not present.
>>>>>>>
>>>>>>> Some examples:
>>>>>>>
>>>>>>> drm-memory-resident-system:
>>>>>>> drm-memory-size-lmem0:
>>>>>>> drm-memory-active-vram:
>>>>>>>
>>>>>>> Etc.. I think it creates a consistent story.
>>>>>>>
>>>>>>> Other than this, my two I think significant opens which haven't been
>>>>>>> addressed yet are:
>>>>>>>
>>>>>>> 1)
>>>>>>>
>>>>>>> Why do we want totals (not per region) when userspace can trivially
>>>>>>> aggregate if they want. What is the use case?
>>>>>>>
>>>>>>> 2)
>>>>>>>
>>>>>>> Current proposal limits the value to whole objects and fixates that by
>>>>>>> having it in the common code. If/when some driver is able to support sub-BO
>>>>>>> granularity they will need to opt out of the common printer at which point
>>>>>>> it may be less churn to start with a helper rather than mid-layer. Or maybe
>>>>>>> some drivers already support this, I don't know. Given how important VM BIND
>>>>>>> is I wouldn't be surprised.
>>>>>>
>>>>>> I feel like for drivers using ttm we want a ttm helper which takes care of
>>>>>> the region printing in hopefully a standard way. And that could then also
>>>>>> take care of all kinds of of partial binding and funny rules (like maybe
>>>>>> we want a standard vram region that addds up all the lmem regions on
>>>>>> intel, so that all dgpu have a common vram bucket that generic tools
>>>>>> understand?).
>>>>>
>>>>> First part yes, but for the second I would think we want to avoid any
>>>>> aggregation in the kernel which can be done in userspace just as well. Such
>>>>> total vram bucket would be pretty useless on Intel even since userspace
>>>>> needs to be region aware to make use of all resources. It could even be
>>>>> counter productive I think - "why am I getting out of memory when half of my
>>>>> vram is unused!?".
>>>>
>>>> This is not for intel-aware userspace. This is for fairly generic "gputop"
>>>> style userspace, which might simply have no clue or interest in what lmemX
>>>> means, but would understand vram.
>>>>
>>>> Aggregating makes sense.
>>>
>>> Lmem vs vram is now an argument not about aggregation but about
>>> standardizing regions names.
>>>
>>> One detail also is a change in philosophy compared to engine stats where
>>> engine names are not centrally prescribed and it was expected userspace
>>> will have to handle things generically and with some vendor specific
>>> knowledge.
>>>
>>> Like in my gputop patches. It doesn't need to understand what is what,
>>> it just finds what's there and presents it to the user.
>>>
>>> Come some accel driver with local memory it wouldn't be vram any more.
>>> Or even a headless data center GPU. So I really don't think it is good
>>> to hardcode 'vram' in the spec, or midlayer, or helpers.
>>>
>>> And for aggregation.. again, userspace can do it just as well. If we do
>>> it in kernel then immediately we have multiple sets of keys to output
>>> for any driver which wants to show the region view. IMO it is just
>>> pointless work in the kernel and more code in the kernel, when userspace
>>> can do it.
>>>
>>> Proposal A (one a discrete gpu, one category only):
>>>
>>> drm-resident-memory: x KiB
>>> drm-resident-memory-system: x KiB
>>> drm-resident-memory-vram: x KiB
>>>
>>> Two loops in the kernel, more parsing in userspace.
>>
>> why would it be more than one loop, ie.
>>
>>      mem.resident += size;
>>      mem.category[cat].resident += size;
>>
>> At the end of the day, there is limited real-estate to show a million
>> different columns of information.  Even the gputop patches I posted
>> don't show everything of what is currently there.  And nvtop only
>> shows toplevel resident stat.  So I think the "everything" stat is
>> going to be what most tools use.
> 
> Yeah with enough finesse the double-loop isn't needed, it's just the
> simplest possible approach.
> 
> Also this is fdinfo, I _really_ want perf data showing that it's a
> real-world problem when we conjecture about algorithmic complexity.
> procutils have been algorithmically garbage since decades after all :-)

Just run it. :)

Algorithmic complexity is quite obvious and not a conjecture - to find 
DRM clients you have to walk _all_ pids and _all_ fds under them. So 
amount of work can scale very quickly and even _not_ with the number of 
DRM clients.

It's not too bad on my desktop setup but it is significantly more CPU 
intensive than top(1).

It would be possible to optimise the current code some more by not 
parsing full fdinfo (may become more important as number of keys grow), 
but that's only relevant when number of drm fds is large. It doesn't 
solve the basic pids * open fds search for which we'd need a way to walk 
the list of pids with drm fds directly.

Regards,

Tvrtko
