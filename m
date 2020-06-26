Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07C520B104
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 13:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgFZLzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 07:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgFZLzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 07:55:21 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6D0C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 04:55:21 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g75so8561579wme.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZYdt4gQWBtJQecWrxgjcZRySxIabHfJby6/MGUebw0s=;
        b=jpX/3wozpDBWzQux0qF3QyqBy9feIYajR5bJ9ymLYvhvBkJK/kkJFDKN0U56fvoJ3q
         uzP4tu0DLCCJYhanx1Z78MpLM5frZV5bolYKICUkEhwG/qVeVMlQ7LT3OrRAL+Dl0mUU
         1GIIt8JKAKszLjvLvqLvN/F+8uHMNkHhwWDj7DaZwpAMdQc7JvWKxsuYXUBPInIXJm0c
         TXwF4RzrJhCYGf26tAmrLfT0kKfHwJqZ+JMZPMP44sSO5eISXmy1XvmYXJE9n3MxbNG3
         GIy2+qSW7jGpPDvlwnfwxXmfkAJMOZHsESJ1TFoOpXgX21dla4ZDIFytL8eYnachGhfm
         GmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZYdt4gQWBtJQecWrxgjcZRySxIabHfJby6/MGUebw0s=;
        b=Dj9ue5SH+OBG+Hmx3UNi5tGCojHseXHDuvCvumwJjGIugbPLx3crCgFmnLtTKBuGgj
         XjM5thegMvinHeHb1PW02Qy8Ge0Xmiyf4UeyhXKxVPF+YO16YjjK6VXa75+kGrS7Kote
         Ie02NAngKbrms77Djjgkl4BCvZlKx1GQ7wODHrKcU1CPkiihrH9mib9YG+/fK9cRZODN
         7eniMyDEXWyzpNs7XfwHZdTzuyCoYbBxVR9CBcjg+zODsnOsfpACF32Jl/25TSjcYlp7
         zmCc2tCfOZD3cX91QoT8O0q9/FbhxaQ3fD/rU09LWz8sFFS0Wx5C5sfz2wAe8F5lHHOm
         AM+Q==
X-Gm-Message-State: AOAM533sfRV6qLFwx2ITfqQ8VR5v9NqTovyThT0xlu+Ongnz2e+y5kw8
        OKyDZlzbEIpRIfuBsz6wjqGOZA==
X-Google-Smtp-Source: ABdhPJy1xHuHs5H4vkG7tlNhlbwO4oRZmm6noYx2GQkUfK+F+v00YALGwgVJs1tFnCo/RWCXv2wU/Q==
X-Received: by 2002:a1c:1dc7:: with SMTP id d190mr3010814wmd.36.1593172519840;
        Fri, 26 Jun 2020 04:55:19 -0700 (PDT)
Received: from [10.1.3.173] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t16sm15557658wru.9.2020.06.26.04.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 04:55:18 -0700 (PDT)
Subject: Re: [v3] drm/bridge: ti-sn65dsi86: ensure bridge suspend happens
 during PM sleep
To:     Doug Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20200609120455.20458-1-harigovi@codeaurora.org>
 <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <0d408a69-b5ef-d082-aaef-e6d0a9541d08@baylibre.com>
Date:   Fri, 26 Jun 2020 13:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 19/06/2020 00:09, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jun 9, 2020 at 5:05 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>>
>> ti-sn65dsi86 bridge is enumerated as a runtime device. When
>> suspend is triggered, PM core adds a refcount on all the
>> devices and calls device suspend, since usage count is
>> already incremented, runtime suspend will not be called
>> and it kept the bridge regulators and gpios ON which resulted
>> in platform not entering into XO shutdown.
>>
>> Add changes to force suspend on the runtime device during pm sleep.
>>
>> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
>> ---
>>
>> Changes in v2:
>>         - Include bridge name in the commit message and
>>         remove dependent patchwork link from the commit
>>         text as bridge is independent of OEM(Stephen Boyd)
>>
>> Changes in v3:
>>         - Updating changelog to explain the need for patch
>>
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> I think this patch is good to go now (has both Stephen's and my
> reviews).  I noticed that Neil landed my other patches to this driver
> recently (thanks!) and wondered why he didn't land this one.  Then, I
> realized that you didn't send it to him or the other bridge
> maintainer.  :(  Have you tried running get_maintainer?
> 
> $ ./scripts/get_maintainer.pl -f drivers/gpu/drm/bridge/ti-sn65dsi86.c
> Andrzej Hajda <a.hajda@samsung.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> Neil Armstrong <narmstrong@baylibre.com> (maintainer:DRM DRIVERS FOR
> BRIDGE CHIPS)
> Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM
> DRIVERS FOR BRIDGE CHIPS)
> Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
> Jernej Skrabec <jernej.skrabec@siol.net> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
> David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
> Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> linux-kernel@vger.kernel.org (open list)
> 
> In any case, unless someone has extra feedback on this patch I think
> it's ready to land.
> 
> Neil: If you're willing to land this patch too, can you let
> Harigovindan know if it needs to be re-sent with you in the "To:" list
> or if you can find it on the dri-devel list?

Sorry missed this one,

Applying to drm-misc-next

Neil

> 
> Thanks!
> 
> -Doug
> 

