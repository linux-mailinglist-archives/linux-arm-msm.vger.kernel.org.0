Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42DDD39679C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 20:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbhEaSME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 14:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbhEaSMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 14:12:03 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59549C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 11:10:22 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s25so15966129ljo.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RqDyoSo09lPZO7GbOVPgOTHVdV/YSSWYh+JNDnVcsAM=;
        b=vy0uLjUP4b9/AdZSWCBIJkGYi4KqsFzlAguK9G1kq10RuG2QJ9SaCin/z40CAuN9N1
         Ny/vrCiMNiRFhNLvJpQsZYZINHFf3EaQct9tsqIhk5tAUsuxyy09Jt+MFTo1pb2DxMnI
         1mhuGM8ZMFNvXLG2phlK9NzBPLb3Sc3JtSvvZKZm+MyP/a9uTs2m53y9gSdGz1FPy9Zp
         irfZkJPLzEw5eyrLgj7PQlgSEwbb6I7tSu/8WspO4dXuoX2ho+xANIhvHef5g176dFCi
         3lou3RZZLIaFfJeZfbA0ikQgl/ZH1MLhSjVh8yTZE2in8m24BXFIdgP66V1SntHfTsA6
         U1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RqDyoSo09lPZO7GbOVPgOTHVdV/YSSWYh+JNDnVcsAM=;
        b=q+H87UnmLnMlfht5UlmHinMloAuOtJ3bm/jnMca1jLufNjLky2ut0DL4dCpKfVjCmD
         oCqFLllDy2Oe6+yOzwk6SogJn4YUGySM24Qu8s7Z8vBKLP0qRgPe32TlxNscXpDi3iZm
         x1AeT46O7UoalCpyx+JWR5w1bvAAirfTyGEglnTMc413TevnwMyIuoiZmqu50rGzjCKc
         eKSVxsf5t7BFIFVEYZaMKW/jqb/y9otiewdY8BVfa0doRAyPD99ZoyVFd9ta0Hb/9xba
         Ogkaf6Jcpv87zR/sBGBmefZ1AmJAjx8V2UjtIejwru5M61cmEW+3rVlHEled2TpnWGic
         1gDw==
X-Gm-Message-State: AOAM533xjG1YpsTJMyVz3QgEw3JBbwfk6wEFLw7ZvVEHXed9Xd15gEYA
        rO1BtJ3qnITKcZytQugCkaTKwg==
X-Google-Smtp-Source: ABdhPJx3O6rn5NqZMzkPeijKZJM/6wPEQfnrs07M3tXIRXQouQa/sGsKJEEBs84ooxP684SBQE0Vag==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr17459713ljr.311.1622484620655;
        Mon, 31 May 2021 11:10:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y1sm1331962lfl.68.2021.05.31.11.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 11:10:20 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm/dsi: add
 qcom, dsi-phy-cphy-mode option
To:     Jonathan Marek <jonathan@marek.ca>, Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
References: <20210423172450.4885-1-jonathan@marek.ca>
 <20210423172450.4885-3-jonathan@marek.ca>
 <20210503171139.GA2011901@robh.at.kernel.org>
 <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4e623554-bbe4-4d4a-7b14-0ca4f684c7fb@linaro.org>
Date:   Mon, 31 May 2021 21:10:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/05/2021 15:57, Jonathan Marek wrote:
> On 5/3/21 1:11 PM, Rob Herring wrote:
>> On Fri, Apr 23, 2021 at 01:24:40PM -0400, Jonathan Marek wrote:
>>> Document qcom,dsi-phy-cphy-mode option, which can be used to control
>>> whether DSI will operate in D-PHY (default) or C-PHY mode.
>>
>> Given this is a standard MIPI thing, I think this needs to be a common
>> property. We already have phy bindings that use the phy cells to set the
>> phy type which I think you should use here. See
>> include/dt-bindings/phy/phy.h.
>>
> 
> Is it OK to simply change the option to something like "phy-mode = 
> <PHY_TYPE_DSI_CPHY>;"?
> 
> (using phy-cells would be annoying to implement, with no benefit IMO)


To add another feather to the balance scales:

- `phys = <&dsi0_phy PHY_TYPE_DSI_CPHY>;` would bring knowledge about 
PHY mode to the DSI host (which does not really care about PHY mode)

- `phy-mode = <PHY_TYPE_DSI_CPHY>;` would stay in the PHY node, where 
this information belongs.

-- 
With best wishes
Dmitry
