Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAF21C4D6B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 06:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgEEEuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 00:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725320AbgEEEuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 00:50:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B1AC061A41
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 21:50:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id h12so714152pjz.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 21:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qkTyRP9++ayfjZYQMfdoArBfF2pI6IvEWiERS/Grl6w=;
        b=A9AcnKK4K7fEn7hjBjS813qdWQFYS97uuMCLfZH0Dl2iHZdSMdYGSfJnrSWfuyuF9a
         u0XBCa5p3PFiNzKEpTxGTGUSdqT/C7kAGF69isRjUnGyYqoFvdxOq8pdCPLn1DpZtIQ+
         CsKDSD6FkGwjQcybqXwVIzgWsJLk/16ug3jIOu3siBnucodAdoAwuuDiyVan0DP4FLGZ
         pnq6BpyTIjyGikLFt9E6OqS2win15OOxLxfBrjAmLGmcN+Al2bSurFSY4GSV5hzE7+UD
         7IWMVO8R/btXpRm3TPuMfZ+22cTugAjcWpsK+XBuwjvj61YxYGxQp5mwuOqMrdTAZCSg
         qchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qkTyRP9++ayfjZYQMfdoArBfF2pI6IvEWiERS/Grl6w=;
        b=KjhIrJyS1J506feTpHUKaVcMA0gL+FqC33B8AZHoHOK8k4icwz1QgUJI5SS9FoIhq8
         hx/hzlBAxegWCCATPuE1eA4v+mCwEsgeKb1w7TzWiSBU0UVK/FD8aw1JwmsuMXxhka4t
         V6sJ0p9+4ReV7WKJgpL4+2BKsGd/JWBrN3uYlYFmA9iFeHv40C1I5wk++eEFARV1VR/6
         bYLXJXE9t07rtnVa71j5uD3F3NNlGu09SAZCXxarLEZxuNuBQKC53K2GDplyKxTXNXJ0
         ff7t3TPGNqDVCRj+bKX0AoDlVl33ysodskhjQe8geBMrIbGCaUjqfleeUXviZmdgdIqr
         oPJQ==
X-Gm-Message-State: AGi0PuaZfMVGUoO4Rk40M/IEn2Ubh8fvUqSxnRLP4y1MgoaPOykdRjM7
        XVcCj1t9tL9tvxhdmcA1t6kvoA==
X-Google-Smtp-Source: APiQypJNB+DyBBi5MOQHteql+Lah2HGYUGGbgurJ8eDGQV1dBGqHQVuS6LJ+VOxQsh5bJZAsUHGAaQ==
X-Received: by 2002:a17:90a:2606:: with SMTP id l6mr598821pje.188.1588654214717;
        Mon, 04 May 2020 21:50:14 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id x132sm707930pfc.57.2020.05.04.21.50.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 21:50:14 -0700 (PDT)
Date:   Tue, 5 May 2020 10:20:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     sboyd@kernel.org, georgi.djakov@linaro.org,
        bjorn.andersson@linaro.org, saravanak@google.com, mka@chromium.org,
        nm@ti.com, agross@kernel.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dianders@chromium.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, ulf.hansson@linaro.org,
        lukasz.luba@arm.com, sudeep.holla@arm.com
Subject: Re: [PATCH v4 06/12] cpufreq: qcom: Update the bandwidth levels on
 frequency change
Message-ID: <20200505045012.zfx2e6chqo5f3e4n@vireshk-i7>
References: <20200504202243.5476-1-sibis@codeaurora.org>
 <20200504202243.5476-7-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504202243.5476-7-sibis@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-05-20, 01:52, Sibi Sankar wrote:
> Add support to parse optional OPP table attached to the cpu node when
> the OPP bandwidth values are populated. This allows for scaling of
> DDR/L3 bandwidth levels with frequency change.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

What about using opp_set_rate instead ?

-- 
viresh
