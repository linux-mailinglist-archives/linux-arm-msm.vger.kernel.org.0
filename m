Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C776338117
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 00:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCKXKE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 18:10:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhCKXJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 18:09:35 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A59DC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:09:34 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so10122613pjv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uQWJpfJtIddzaqX9QW0VdnvokHu7RPmdOUmSRw+k0p4=;
        b=jhT/y077tz9cy1Zc8+E28y572v+co/Fp9ovAABLGtX1OuuhyIOw8kdu+Rk0vZA214H
         8IX7aneBFooX2TmBaqJvb+EtUvrD17zsFfPBqW1t4qdA6CQ5WimrY8iEknCLgTr86kxk
         0jcKwuoFMyMxRw0fc2IQ8FqS2j9DogCxBOEQQPpR0VVHrm1SGGKrsqCiwRkbf12hapWo
         pqQndIgK26HOAKeoSWUnmJVrzGIegX5IMjAlREi6dNTOaiDsXhUzhj0T7BmzlTsgQMUh
         Ha7hYo7h0opNRUGlumYkVtu3tC2yNhX+gOha/cRdxUsJMF7CnvzmUfA9RyWSRWrwlXea
         xr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uQWJpfJtIddzaqX9QW0VdnvokHu7RPmdOUmSRw+k0p4=;
        b=MjjQm1NKNDcIP4IHu+8BwW5SEYI8hojGW1JhHXdca4bSsWa+wOhQRycsM1MQKsXpXm
         45zSU9NwdbDP+oFVnNf2BX5m9ZsR1lWp0fJz3DyYP9jKMpJtCQiP04sP6jHWkvoboTpG
         17MUGf1JqdXO+ldHJNKpPjPvyVnhucDmZLImqZgEf5CF+yv1LUwIzc2u1Sd2xiHCGuVW
         KiwBImV+N3SA5hU8UZ+0z3YUrlvzFJJOsBdBwEYvmCqYTxVioecEzmD/HO/xv+8wgSuO
         F9I1zp9QVpvlMrhL+fGfAN2yvh72sRgVXz6Q4/sqZGXLhyCfjUSTeKo/HpwWvVUc3EJY
         S27w==
X-Gm-Message-State: AOAM530zWsOKh+Wy0JA3TGxQETzgXq5fTkLU9iYADMWrcKzgvZZOOf5E
        v5YJe2PF4Xgir/ghnEEWtp4oPYvFVRDpTg==
X-Google-Smtp-Source: ABdhPJzWr/DAOZxDzbXiQBy4uQv34cKIRwZ3nFBmEs8yJgvorJPUO2ZXBctlGKWrzm17qN2CI5aWvg==
X-Received: by 2002:a17:90a:20c:: with SMTP id c12mr10974812pjc.224.1615504174078;
        Thu, 11 Mar 2021 15:09:34 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id v2sm146779pjg.34.2021.03.11.15.09.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 15:09:33 -0800 (PST)
Date:   Fri, 12 Mar 2021 07:09:28 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in
 'gpio-ranges'
Message-ID: <20210311230924.GX17424@dragon>
References: <20210303033106.549-1-shawn.guo@linaro.org>
 <20210303033106.549-2-shawn.guo@linaro.org>
 <YEKl7GbxBhui4eoT@builder.lan>
 <20210306012829.GL17424@dragon>
 <YELhMmDndOTSSJJO@builder.lan>
 <20210306080049.GM17424@dragon>
 <YEkOaK+UiLy8kSDu@builder.lan>
 <20210311011951.GT17424@dragon>
 <YEpLHSRKt651B6FP@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEpLHSRKt651B6FP@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 11, 2021 at 10:53:49AM -0600, Bjorn Andersson wrote:
> On Wed 10 Mar 19:19 CST 2021, Shawn Guo wrote:
> > Yes, DT stops working because of the mismatch between
> > msm_pinctrl_soc_data.ngpio and gpio-ranges.
> > 
> 
> So what you're saying is that when Linus merged the .set_config patch
> yesterday he broke storage on every single Qualcomm device?

Better than that.  Only the ones that have mismatching between
msm_pinctrl_soc_data.ngpio and gpio-ranges.  More specifically, the ones
that the series are fixing.

I didn't realize this break when I was working on the .set_config change
for ACPI.  It was a surprise when I tested DT later.  You can ask Linus
to drop .set_config patch, if you do not like this break.  But I think
the mismatch issue still needs to be resolved in some way.

Shawn
