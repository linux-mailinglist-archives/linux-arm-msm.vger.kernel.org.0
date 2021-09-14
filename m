Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9DF40B65F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 19:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbhINSAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 14:00:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:34118 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230092AbhINSAz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 14:00:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="221755385"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="221755385"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 10:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="544216080"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost) ([10.251.216.6])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 10:59:31 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list\:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/16] drm/edid: Allow the querying/working with the panel ID from the EDID
In-Reply-To: <CAD=FV=X-d8XH5bmcAhDGnbs-DHgQ7D6G9g3gRsjo7RN1xQ1kNA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210901201934.1084250-1-dianders@chromium.org> <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid> <87h7ey81e9.fsf@intel.com> <CAD=FV=X-d8XH5bmcAhDGnbs-DHgQ7D6G9g3gRsjo7RN1xQ1kNA@mail.gmail.com>
Date:   Tue, 14 Sep 2021 20:59:27 +0300
Message-ID: <87h7en11j4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 08 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Mon, Sep 6, 2021 at 3:05 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> > +{
>> > +     struct edid *edid;
>> > +     u32 val;
>> > +
>> > +     edid = drm_do_get_edid_blk0(drm_do_probe_ddc_edid, adapter, NULL, NULL);
>> > +
>> > +     /*
>> > +      * There are no manufacturer IDs of 0, so if there is a problem reading
>> > +      * the EDID then we'll just return 0.
>> > +      */
>> > +     if (IS_ERR_OR_NULL(edid))
>> > +             return 0;
>> > +
>> > +     /*
>> > +      * In theory we could try to de-obfuscate this like edid_get_quirks()
>> > +      * does, but it's easier to just deal with a 32-bit number.
>>
>> Hmm, but is it, really? AFAICT this is just an internal representation
>> for a table, where it could just as well be stored in a struct that
>> could be just as compact now, but extensible later. You populate the
>> table via an encoding macro, then decode the id using a function - while
>> it could be in a format that's directly usable without the decode. If
>> suitably chosen, the struct could perhaps be reused between the quirks
>> code and your code.
>
> I'm not 100% sure, but I think you're suggesting having this function
> return a `struct edid_panel_id` or something like that. Is that right?
> Maybe that would look something like this?
>
> struct edid_panel_id {
>   char vendor[4];
>   u16 product_id;
> }
>
> ...or perhaps this (untested, but I think it works):
>
> struct edid_panel_id {
>   u16 vend_c1:5;
>   u16 vend_c2:5;
>   u16 vend_c3:5;
>   u16 product_id;
> }
>
> ...and then change `struct edid_quirk` to something like this:
>
> static const struct edid_quirk {
>   struct edid_panel_id panel_id;
>   u32 quirks;
> } ...
>
> Is that correct? There are a few downsides that I can see:
>
> a) I think the biggest downside is the inability compare with "==". I
> don't believe it's legal to compare structs with "==" in C. Yeah, we
> can use memcmp() but that feels more awkward to me.
>
> b) Unless you use the bitfield approach, it takes up more space. I
> know it's not a huge deal, but the format in the EDID is pretty much
> _forced_ to fit in 32-bits. The bitfield approach seems like it'd be
> more awkward than my encoding macros.

Sorry for the delayed response. Fair enough, let's go with the u32 for
now. It's not like we can't change this later.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
