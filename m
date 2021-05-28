Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEED394317
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 14:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235340AbhE1NBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 09:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbhE1NBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 09:01:08 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4262C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 05:59:32 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id 124so3927493qkh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 05:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QkS67PNWJLrMlG0Eh1DFrl12I+MHfh0CuXPqyN2o9Jk=;
        b=RoE5+ne+IEtUIwJTmkaKAmIW8xmlFFiZyFu+RXc8Xtk3xP3WS2cnNmBkmt0rGcwaq/
         qb2PuixGE3rnUfQLjmTJ60OtadS6WqwIMVT+H21njXbcac9gUxl4ua+OaRnV6dmBPQGk
         cCjgQ0xixLesraJ7oA4Tw1q7d1IW86tp8+qcQKQmnLrhSW2W5PPT0vIu/dA7120u6STL
         lP8WtyfVW1q00VzSS8n+0giUcaceB12ncIClUcgKgzU6JWAGYtnVT6Fs+IJQA/a+kbEy
         bbqVyqPOW610wOc+b5AIAlA2tuOsdLLB6pV2bXvQM/3xs04eGLgpqeh/VYCtDPtFmGeu
         NfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QkS67PNWJLrMlG0Eh1DFrl12I+MHfh0CuXPqyN2o9Jk=;
        b=kH4FPpyUbkbS34QHgsqHQP40f3zjeo9k2/rLT+aOL9nrTNdh/pSaVgVh2qc5o4Q+qR
         ap09adE505ltf6JwKsT9mXlRaYksbjY+R0GEffr/hXtiXL2Nedfp5prgpbuVjhbOTfJm
         nczOlm8nFUZhxT7KH1JHQjLqi+sEHnjIWcSjSbsAZb2GUrpMxf/NguTZvrpeTiCyDqM1
         /oGsLXhRO21Cy5Gcf0E/dyDXjQiCK7WSbNsUWM1abE9Y+eENTs3qJvzIyN5eFftjl2au
         z31yx7FucNh0wOMRc8pEzuPAVveAri7OfAydvBssmWRw4z5SuTBKhwUANfenO4iu9DMa
         1EKw==
X-Gm-Message-State: AOAM533XvSGqgFE+q6oqd9Zy5ji+E5VJWnPItWQ3U3dzkh83nCWuYY4u
        D0nnU2dNjA5dd27j7GaiYD0vAg==
X-Google-Smtp-Source: ABdhPJzrZ6/fmuomvi1UY7oEviJSluEuJL6Gjb+/l1q88tzyHFRCD8yK7EweolQnqF3+MS3DPRFyUQ==
X-Received: by 2002:a05:620a:745:: with SMTP id i5mr3821434qki.324.1622206771962;
        Fri, 28 May 2021 05:59:31 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id d6sm3525975qkf.109.2021.05.28.05.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 05:59:31 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm/dsi: add
 qcom, dsi-phy-cphy-mode option
To:     Rob Herring <robh@kernel.org>
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
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
Date:   Fri, 28 May 2021 08:57:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210503171139.GA2011901@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/3/21 1:11 PM, Rob Herring wrote:
> On Fri, Apr 23, 2021 at 01:24:40PM -0400, Jonathan Marek wrote:
>> Document qcom,dsi-phy-cphy-mode option, which can be used to control
>> whether DSI will operate in D-PHY (default) or C-PHY mode.
> 
> Given this is a standard MIPI thing, I think this needs to be a common
> property. We already have phy bindings that use the phy cells to set the
> phy type which I think you should use here. See
> include/dt-bindings/phy/phy.h.
> 

Is it OK to simply change the option to something like "phy-mode = 
<PHY_TYPE_DSI_CPHY>;"?

(using phy-cells would be annoying to implement, with no benefit IMO)
