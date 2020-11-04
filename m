Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE152A5CDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 04:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbgKDDEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 22:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729078AbgKDDEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 22:04:00 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55269C0401C1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 19:04:00 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id i7so13381635pgh.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 19:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M+7yANrvElG7vvXiOwG93dIUVBVs3AW4QD34DhOvCCI=;
        b=btFJkwgN45cTDxVtmE+Vf/+i4KTd+QJ7t7NUxCyZTE8m1tbcZbzqjNbBGYprvd57iN
         UShejiWVREUTlyzMsd8UIEC1n3FLdTx5oKihlzv2zQeOYrsmRCZgIbcc6awaLDRftLtE
         zXyerpEX+lcba+6EjdtoMaErPXzcXtWX9M4Y9iH8f2tOBVl07bUpcttN9jtz5woiWfKs
         E+NHYqOnfFZuFluN5f3wZdCPeP0xl5bojj8vXL3BjMJXkdIgBBDDevUeORWDZDPkDzVZ
         H2onAvXjL0GO/VwttnAAAPMr+4GLy0YLVKE1PsLXoA6a+UqtctBYVCJ+sIAt5sIl2M7Z
         d8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M+7yANrvElG7vvXiOwG93dIUVBVs3AW4QD34DhOvCCI=;
        b=ZByVSOWFukzOQLmHjIYTl5LstwoBqkBnqwYudAdcUE39dOh5J8qU3x2iS/pF/rk3ix
         dfwdaVPXfyAzzHQdbPDdlaRSDOEttQj1O9oDysdW0idumnskUihGE3lJ3qR0Z0AZ29uK
         d4fWG7dmfoMX6fJJ+qBag5m3u/Qi6PHXUGC0O6zzqSZpZuZFmV9C4JafLHZQiKaXArV0
         Q3XyI7cx+X+kR4cDDWld5cr2DtPfbA7PpAWtvUYTpaBLs5EGweifZ9zT0yZR1094ZYlV
         KiZhCDocNY0H36qnMxQ7KS/n1jB19LQ3+tXMZI8U0ctKbVrTNWJX3tByjuHaSQPjYIbp
         y7bg==
X-Gm-Message-State: AOAM531bItcoQKIXh4mP9ag9tFzbnkQEgcW1mYlfO3Z4FWXK3EYT8Nk/
        A8ek0B0iic82VVKmImCEoExviw==
X-Google-Smtp-Source: ABdhPJye/niTkH7khNS36zvZ3Ubb6lzZ6FDeMgMpWSwwwaQ4FeRK9FDZcZ/yYMErd1iByJeq4uoX+A==
X-Received: by 2002:a17:90a:5882:: with SMTP id j2mr2156165pji.177.1604459039793;
        Tue, 03 Nov 2020 19:03:59 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id n64sm491754pfn.134.2020.11.03.19.03.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2020 19:03:58 -0800 (PST)
Date:   Wed, 4 Nov 2020 08:33:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Menon, Nishanth" <nm@ti.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
References: <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-11-20, 08:50, Rob Clark wrote:
> sorry, it didn't apply cleanly (which I guess is due to some other
> dependencies that need to be picked back to v5.4 product kernel), and
> due to some other things I'm in middle of debugging I didn't have time
> yet to switch to v5.10-rc or look at what else needs to
> cherry-picked..
> 
> If you could, pushing a branch with this patch somewhere would be a
> bit easier to work with (ie. fetch && cherry-pick is easier to deal
> with than picking things from list)

It has been in linux-next for a few days. Here is the HEAD to pick
from. There are few patches there since rc1.

commit 203e29749cc0 ("opp: Allocate the OPP table outside of opp_table_lock")

-- 
viresh
