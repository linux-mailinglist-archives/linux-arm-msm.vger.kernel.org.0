Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253DC29DA91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390394AbgJ1X0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390353AbgJ1X0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:26:03 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6165C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:26:03 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t14so811826pgg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9EPUQ9ajfJzWj+hnvbYTUCoABm2jCaPKDMKTD4VLJ+o=;
        b=FXluIHWspusLqK/Kg/uNQGa3Bqh2HOqioMgW1IjaXnh/FVi2SHaED4wWlJqfymNCjv
         RCWtKoRJo73Ynh6NZ9t3K4I8FQPZpNfwelkrIsVMCGwuqw6GNB3hBI1+bqZB6jEcvlci
         0HQawnOCc1YGigoQk/GhqbQOqZxZ92Ktw9J7Cy55LUugsDre4quH3JYisIqgPn2iOL1E
         bjckKD+vobH+WAuFwQrfBYjXE/cVNAdPKcgxiR+EM2T4ROMHT7SXbmfqQmn2bMQ1/jrR
         oqhMtpoaH6wzA3odYkft7wgHgGBOlQNjbCkdKVz+0aa6JCZ0GmMyXiC/Khl65EWIPbpU
         CPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9EPUQ9ajfJzWj+hnvbYTUCoABm2jCaPKDMKTD4VLJ+o=;
        b=sSqRJK7FeiLgxnHGqVfRYXcz9vP6xirbrGnPyWR9BJAQBbqRxJJoDQUjvO8qFfUe8h
         BEGNBnv+Ivn2h78XrAw2e+QcrEjzcJXKtBGYPW/1iDhUzff46J8RyV2rEMjdtNhsKQ+O
         EPwgzE/W5gx5xDx3j1tefACg9/1L6DMpWyeKcT6T7/oT7wfbsNEVAxkMgdJviPMYk9po
         EOcR6o8geGVqdN4vx8rVLQGxbGXiO4UVEEFuEFNkFhk6pOb1fedDUAxVCf3jwx9cFJmP
         DGohv3sw956V6PDlR0BfXEn435qe9o5CMWHJPXexD3wfHv6vFt3CLFW6ACRfXYPY7sqq
         8DRQ==
X-Gm-Message-State: AOAM533Sn+SleFVUuOtMAwIjdr0x36YLy0dfCRSQNhHQKiTGjLNSZJSL
        EF6hPSD3plfRXQ1CB1A0lv++kbmd9Fki7A==
X-Google-Smtp-Source: ABdhPJyab+BLUolrAaQS6Z5bkxxLTZ0qmvvT/57deuMD2GISr2XjIBTS9myTIcIcl7KRpP8uHevBhA==
X-Received: by 2002:a63:c851:: with SMTP id l17mr4887683pgi.31.1603865176097;
        Tue, 27 Oct 2020 23:06:16 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id 23sm3988680pgr.53.2020.10.27.23.06.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 23:06:15 -0700 (PDT)
Date:   Wed, 28 Oct 2020 11:36:13 +0530
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
Message-ID: <20201028060613.qva32sirae4dtj6x@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012135517.19468-1-frank@allwinnertech.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-10-20, 21:55, Frank Lee wrote:
> Hi, this patchset introduce devm_pm_opp_set_prop_name() and
> devm_pm_opp_set_supported_hw().
> 
> Yangtao Li (3):
>   opp: Add devres wrapper for dev_pm_opp_set_supported_hw
>   opp: Add devres wrapper for dev_pm_opp_set_prop_name
>   drm/msm: Convert to devm_pm_opp_set_supported_hw
> 
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  2 +-
>  drivers/opp/core.c                    | 80 +++++++++++++++++++++++++++
>  include/linux/pm_opp.h                | 14 +++++
>  3 files changed, 95 insertions(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
