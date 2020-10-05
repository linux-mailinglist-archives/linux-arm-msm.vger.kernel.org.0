Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015AC28305D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 08:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgJEG0h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 02:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgJEG0g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 02:26:36 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E44C0613A6
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2020 23:26:36 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id u3so4913743pjr.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2020 23:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SKaQ5+8uUmRtIWBKZSxd+2jDGXEKN5QdEKsAPMYJkgg=;
        b=hVUBIPjnHGOWjGUi1oUG2maCLkvuCE7pMNCmJn6gkaIVPZ8LdYKidM635ZHKQeHwr+
         l2knVD95lg4NSfyju+W6598JCldz5UwtjNiq5Jw8H8LWwbCeS4VjYFXgNY9WYCMElFUg
         2atFKK1Z5tvYk+DhYbjVwhkBzLDgUhCcKGzBzX8j4fumt3o5pOmUeq9QqIeXEm7BnOnZ
         a+C2Am6JbEg4Ha9fo3qOa+KC6LPN927a6o67oRVjFKDbmc9/uYW0fgX+Cks4uxcGs2HW
         NWZrgF1TEebG01jSrJh4i4AjHHuHT+bSBFJDRKzAlvEWgDfpYYZ6UGBMMucpf0+sffjM
         zsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SKaQ5+8uUmRtIWBKZSxd+2jDGXEKN5QdEKsAPMYJkgg=;
        b=i1Miy0UJIshbbwmuIKd0b5+EfAO4AXpDY8zX8p4gI+TfK6Nhi7X4F26hHmdnPycb+4
         gWEp5qnELY1WqmiesUNQkiaVsPUh8Q7I+FOBpogL+l6r1i4crZAnIgQcx7GlsE53sAd5
         4s2ZDrKgHfN8aYjrmgUJgWvI8ZBojZ1egZ4w6Yl70PWWl2xMmsNcJXVN1/KSz7yOWpER
         Z4KsD2HxnLBqbf/fHNm+igScrkQ0es4pihoz0ugjyszVMD7Zpv0Rm/w489kV1vXUITHN
         FY8HWoFVX4SArdkrvu/eG+OBCg0tBoVkdC24OVTFIsOTUX36ach7ioZvbyVyzdQKNqaZ
         RCwg==
X-Gm-Message-State: AOAM530obzOQJ33+63Qsdc7E+ovwsfCdMp5lX2+r2awCSjTdyYqQfgoe
        ZlyPCCQvnqDbi7D7Chz5CNGOYA==
X-Google-Smtp-Source: ABdhPJzMX/4YpxutBiiXM2fWXSSduuaC0HQCvEVYpnrcJsYem70ESjGjA5g+ApA82zM/o6oW1zh/YQ==
X-Received: by 2002:a17:90a:e282:: with SMTP id d2mr104042pjz.159.1601879196092;
        Sun, 04 Oct 2020 23:26:36 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id j6sm10860110pfi.129.2020.10.04.23.26.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 23:26:35 -0700 (PDT)
Date:   Mon, 5 Oct 2020 11:56:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rnayak@codeaurora.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-08-20, 11:37, Viresh Kumar wrote:
> dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> find the OPP table with error -ENODEV (i.e. OPP table not present for
> the device). And we can call dev_pm_opp_of_remove_table()
> unconditionally here.
> 
> While at it, also create a label to put clkname.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Can someone please apply this and the other drm patch (2/8) ?

-- 
viresh
