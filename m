Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144822A041E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 12:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgJ3L3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 07:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ3L3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 07:29:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222DBC0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 04:29:42 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x13so4994751pfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4HxPaBB/T+MWPxFKC66xXUgQz4AK1HDV8G0JyKuoUvg=;
        b=t7vRuGsiD6S8SDyDNJjlcW3D8hieb4F/x0gVxEUf+xkByh3UB9sW2pw96lzzu3r+Sc
         V+SrFY6wvz08PUUrq6THVAwF+cugG5vc8oomA26kUp17NY6M2ckqjULm3B3ZkGJnktkO
         SIMxL5zOIB5J87De1aG/WYEx0UOwzgz/lZ+JL09V4ibwDp+FKjA4hn/ylfabNvovQlWC
         eJuwEMYWUjgJtSKqSYdH2kNNfOPHbBtkMmOBTEkdqAAvKGu7FfzI/ujLEq9tQG2cMMBW
         BzHzVflFIBIa+S2SEGutzMb6ivLVH372Vwk41qbEWa56/vLDj0vJfm4tH/NsJnGO/xeM
         2wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4HxPaBB/T+MWPxFKC66xXUgQz4AK1HDV8G0JyKuoUvg=;
        b=oAvjXjOW9Fn+vfwrAwUKOa8YVGyhjEsQps/TqKHHA7TcsJmkaXt8vFm2YIN69vFwxB
         /g+HS9NfQgcT4Q8QAA9INT3HzW7KYC2B4pP1klrCb3qWa5cLGYoZ6sUaLaY5GAhhfhh8
         pRsUbq1xLl/dMuBi7UeuPPVJsrn4zwqSOzS6/QJQBNUlYqsILxSDrrFCVTmR0udBwBAm
         cA0Hs0aQF+ZHqC2kigQC2cP+4lI17fjBHuYfQBkf4uqwl3hTOoceeF2BoEnwXtpuxbtu
         cZmyr1YGZyFqqn5ibtbMnpufN+fS4xl/7S3QHncjTc3aa25IvDTXsZVAcRNa5jLuXSMS
         7hcw==
X-Gm-Message-State: AOAM531PpEZvRX9rv6V9yljwuJXuLNIHee6nBgJP1fuhQ7NnCW4NF5I0
        GF/KsYAaszNHMmkxJTkzpTQ+NQ==
X-Google-Smtp-Source: ABdhPJxY5sNazMK40l9kvzCEB3G/fXCnzLJIOMT7lDEBOFXgft5gwM3ZPlv3KogMw+kWQKDSe2XldQ==
X-Received: by 2002:a17:90b:3587:: with SMTP id mm7mr2453563pjb.234.1604057381701;
        Fri, 30 Oct 2020 04:29:41 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id 189sm5632707pfw.215.2020.10.30.04.29.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 04:29:40 -0700 (PDT)
Date:   Fri, 30 Oct 2020 16:59:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        rjw@rjwysocki.net, jcrouse@codeaurora.org, eric@anholt.net,
        tiny.windzz@gmail.com, kholk11@gmail.com,
        emil.velikov@collabora.com, gustavoars@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] Introduce devm_pm_opp_set_* API
Message-ID: <20201030112938.uyqjvyfuklwjnmvc@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201028060613.qva32sirae4dtj6x@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028060613.qva32sirae4dtj6x@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-10-20, 11:36, Viresh Kumar wrote:
> On 12-10-20, 21:55, Frank Lee wrote:
> > Hi, this patchset introduce devm_pm_opp_set_prop_name() and
> > devm_pm_opp_set_supported_hw().
> > 
> > Yangtao Li (3):
> >   opp: Add devres wrapper for dev_pm_opp_set_supported_hw
> >   opp: Add devres wrapper for dev_pm_opp_set_prop_name
> >   drm/msm: Convert to devm_pm_opp_set_supported_hw
> > 
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  2 +-
> >  drivers/opp/core.c                    | 80 +++++++++++++++++++++++++++
> >  include/linux/pm_opp.h                | 14 +++++
> >  3 files changed, 95 insertions(+), 1 deletion(-)
> 
> Applied. Thanks.

And I have dropped all of them based on the discussion we are having.
Thanks.

-- 
viresh
