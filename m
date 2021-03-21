Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47F8343297
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Mar 2021 13:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhCUMoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Mar 2021 08:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhCUMoG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Mar 2021 08:44:06 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D71C061762
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Mar 2021 05:44:06 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id v8so5151951plz.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Mar 2021 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oYh42NVmprfmi6tokkVG4Y+HhObAPKALxbHzNEVJ2Gs=;
        b=uzjWYn3XdJl5n7W+G1ELkbYiYFavm62OKGn2YfOnhiNaO0dKAN2f6hwe54r0PkXgQP
         a6qdbt654yG1qoo7FBlFeMTzYBb3c6Htm3u8dOn7SOxC+05utbHN4HMJ1mbL8Pq7OiBy
         fjA8B+7gmtyMOzr4MjlJP830wZpnwJaNtcRGJsha8TdXYnRN1ylLYtgzHNVNa8fw/P8X
         h/ja6hqyL5jaN6NPK3t+ssQMoQCg3GMiSzY88KU15c57E2mmwTxyGcLuxQh2ycBCoY/Y
         cPwF7Q2uqx6LLFnPYUXE62tn2Dudu5FW/ES9tCGw094xB7gtAV/+fQLkFHVSAWeq9Kfv
         mXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oYh42NVmprfmi6tokkVG4Y+HhObAPKALxbHzNEVJ2Gs=;
        b=d+YCZ9QwZVizOKPTdyAD+oR46WGy7UylfbDKhXcXmraG7Lt82/3S9cJeM/LNXgCXJO
         74bbwxEoVMzuQsnqvwugPrsuODJ2ftCakgxcoBuzQgDtpXnRBIJOhTmaRiiECU75uNnI
         RcWrMeCgKegp2Q0z5Ru5vZpTMN6ean+iyG9hEwuZQvgIbnVWDNsFsfv81uWj1xKK0ZBs
         Wu2oxTHoWS0VLcYU5Sx6MHCOiKtqGkk6fqq5g9TTE15BAYbSwYsoLs69UnZgf3nLxiEk
         O9lsx4V4GLK6gtjwXtC5Ru6845xWwsjguV/0PEqXK0JimwN9y2LxkI8E3KwcgVr7ekzD
         8YYg==
X-Gm-Message-State: AOAM532YDpwVffC3wyieLtRqx37RzKc81rmaNEceS+tzWoVmHyCJihRU
        nUoCcLNNvPcp139fpF5QMHkIsw==
X-Google-Smtp-Source: ABdhPJwQ7Iy0N2drugvLFKCBR81+m5DM/sT7wdJv7MyQOMU1WE6jf0iEjozzNqa8jsCBsF79jxv6Xw==
X-Received: by 2002:a17:90a:5910:: with SMTP id k16mr8413808pji.207.1616330645735;
        Sun, 21 Mar 2021 05:44:05 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (144.34.177.189.16clouds.com. [144.34.177.189])
        by smtp.gmail.com with ESMTPSA id u66sm10349141pfu.186.2021.03.21.05.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 05:44:05 -0700 (PDT)
Date:   Sun, 21 Mar 2021 20:44:00 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: msm8916: Enable CoreSight STM component
Message-ID: <20210321124400.GA4329@leoy-ThinkPad-X240s>
References: <20210321121105.678515-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210321121105.678515-1-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 21, 2021 at 08:11:05PM +0800, Leo Yan wrote:
> Add DT binding for CoreSight System Trace Macrocell (STM) on msm8916,
> which can benefit the CoreSight development on DB410c.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

When I rebased this patch, I didn't know why the patch auther's name was
changed unexpectly.  So have sent patch v3 to correct it.

Sorry for spamming.
Leo
