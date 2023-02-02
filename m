Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 394D968733C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 03:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjBBCG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 21:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjBBCG4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 21:06:56 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2BC568AD
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 18:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1675303615; x=1706839615;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zP6cZeQbRqQo0oBq/eg3pij2npt8bVl1qApyNAD2kSo=;
  b=rFDL0ZJE9VIjC2B/7AfSygUHloEKxuFoNWb70jStrH02tGLUlwEeGvsK
   9/Iu5fDMLH+foW0/+zFGN8ZUHjUxQk+QYg6DTz+2t7Xak+J3Bu2sAh25v
   G5QRkv2DTTKBgvB1G01E9hHjGU40a09ezhiT41DMD8iyMPtq2PfLY/bSc
   A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Feb 2023 18:06:55 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 18:06:54 -0800
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 1 Feb 2023
 18:06:54 -0800
Message-ID: <5376994b-99f6-0f48-139f-6e622a8b0778@quicinc.com>
Date:   Wed, 1 Feb 2023 18:06:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
To:     Pekka Paalanen <ppaalanen@gmail.com>,
        Simon Ser <contact@emersion.fr>
CC:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <daniel.vetter@ffwll.ch>,
        <laurent.pinchart@ideasonboard.com>, <sebastian.wick@redhat.com>,
        <wayland-devel@lists.freedesktop.org>,
        <ville.syrjala@linux.intel.com>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
 <20230131112527.32ab8ba5@eldfell>
 <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
 <20230131131326.75b43152@eldfell>
 <x3f8jyn_QDj34hYn9rgumw2uhFTpWzOw2E-715WYVOfwNOpthv26sefM6ePtwqbuHH54ATupqQzzz9qIWqAbDvMpb06bhdiU5BJlMjsaCdo=@emersion.fr>
 <20230131144913.5ff840dd@eldfell>
Content-Language: en-US
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230131144913.5ff840dd@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/31/2023 4:49 AM, Pekka Paalanen wrote:
> On Tue, 31 Jan 2023 11:21:18 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
>> On Tuesday, January 31st, 2023 at 12:13, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>>> On Tue, 31 Jan 2023 10:06:39 +0000
>>> Simon Ser <contact@emersion.fr> wrote:
>>>    
>>>> On Tuesday, January 31st, 2023 at 10:25, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>    
>>>>> indeed, what about simply using a 1x1 framebuffer for real? Why was that
>>>>> approach rejected?
>>>>
>>>> Ideally we don't want to allocate any GPU memory for the solid-fill
>>>> stuff. And if we special-case 1x1 FB creation to not be backed by real
>>>> GPU memory then we hit several situations where user-space expects a
>>>> real FB but there isn't: for instance, GETFB2 converts from FB object
>>>> ID to GEM handles. Even if we make GETFB2 fail and accept that this
>>>> breaks user-space, then there is no way for user-space to recover the
>>>> FB color for flicker-free transitions and such.
>>>>
>>>> This is all purely from a uAPI PoV, completely ignoring the potential
>>>> issues with the internal kernel abstractions which might not be suitable
>>>> for this either.
>>>
>>> I mean a real 1x1 buffer: a dumb buffer.
>>>
>>> It would be absolutely compatible with anything existing, because it is
>>> a real FB. As a dumb buffer it would be trivial to write into and read
>>> out. As 1x1 it would be tiny (one page?). Even if something needs to
>>> raw-access uncached memory over 33 MHz PCI bus or whatever the worst
>>> case is, it's just one pixel, so it's fast enough, right? And it only
>>> needs to be read once when set, like USB display drivers do. The driver
>>> does not need to manually apply any color operations, because none are
>>> supported in this special case.
>>>
>>> One can put all these limitations and even pixel format in the plane
>>> property that tells userspace that a 1x1 FB works here.
>>>
>>> To recap, the other alternatives under discussion I see right now are:
>>>
>>> - this proposal of dedicated fill color property
>>> - stuffing something new into FB_ID property
>>>
>>> There is also the question of other kinds of plane content sources like
>>> live camera feeds where userspace won't be shovelling each frame
>>> individually like we do now.
>>>
>>> 1x1 dumb buffer is not as small and lean as a dedicated fill color
>>> property, but the UAPI design questions seem to be much less. What's
>>> the best trade-off and for whom?
>>
>> By "real memory" yes I mean the 1 page.
>>
>> Using a real buffer also brings back other discussions, e.g. the one about
>> which pixel formats to accept.
> 
> Yeah, which is why I wrote: "One can put all these limitations and even
> pixel format in the plane property". It doesn't even need to be a
> variable in the UAPI, it can be hardcoded in the UAPI doc.
> 
> Please, do not understand this as me strongly advocating for the real FB
> approach! I just don't want that option to be misunderstood.
> 
> I don't really care which design is chosen, but I do care about
> documenting why other designs were rejected. If the rejection reasons
> were false, they should be revised, even if the decision does not
> change.

Hi Pekka/Daniel,

Looks like the general sentiment is to keep solid fill as a separate 
property, so I will stick with that implementation for v4.

I can document the reason why we chose this approach over 1x1 FB in the 
cover letter, but to summarize here:

Allocating an FB for solid_fill brings in unnecessary overhead (ex. 
having to allocate memory for the FB). In addition, since memory fetch 
is disabled when solid fill is enabled, having a separate property that 
doesn't do any memory allocation for solid fill better reflects the 
behavior of this feature within driver.

We also wanted to avoid having FB_ID accept a property blob as it would 
involve loosening some drm_property checks, which could cause issues 
with other property ioctls.



Also, re: other plane sources -- FWIW, I have tried implementing a 
source enum as Ville suggested, but ultimately dropped the change as it 
would require userspace to set properties in a specific order (i.e. to 
enable solid_fill, userspace would have to first set FB_ID to NULL then 
set SOLID_FILL).

I'm not sure how much of a can of worms that would be for userspace, but 
if you're fine with having that as a requirement the I can re-add the code.

Thanks,

Jessica Zhang

> 
> 
> Thanks,
> pq
