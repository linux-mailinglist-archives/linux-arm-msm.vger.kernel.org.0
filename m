Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91D02573A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 08:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgHaGXZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 02:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgHaGXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 02:23:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB69C061755
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2020 23:23:22 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 67so57867pgd.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2020 23:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sJ3ExN1YxmSdx9B7tVLJI57jrIcdEL//wrxOl/kRJWM=;
        b=NdFQqz3k5Iy9JJFE9r18DQJpRVzxdYliPIP9i2pEQlEeomBtcfsSHhloWxe7mrQVeo
         lutWaOfriaHAwoEmV67pzgXONF6kGJ8yC5lh+weCG/HFRUBc2AAO6/Sb5cANAMqyj4AX
         Nvf7VkwI7ebBEtT4OoybeA8ao0SfvzGbOKWk78h2s9gK+gKpLc/erWBvbIvarsi1t19h
         epj4IdDkCuPcDo2IZmGtY0j46noVF1nHP05UpbRHaXpESJLyBBKP0tjqyzcAzEzv5EV0
         UZgNc8gDx7cXvzkFnvYV1KmLmi0t+PP/7cNNQcnSyGy2Q+cu0VPBJ3lLAYN35XyCY4hz
         NUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sJ3ExN1YxmSdx9B7tVLJI57jrIcdEL//wrxOl/kRJWM=;
        b=mGf7+lUp8OwA79cXc86918Cm+LpYDG6Ax1onZWBGj3E+y35Y7C0dRg6HDuabHnCmCz
         ek0aKrfMyu2GtZ4CwWpbCqDgPzpasXLbpodyFNM5jmFmhWhrCDwVCKa/QjQQYCBBjw1k
         DO5vXm9E6rmdkI2NsONTMfhuet3munzRevoANZBjJ5gW1wSdc3WNIVEXjyVQChFl0tIH
         M+d0SZ40CHFe52b7kTRuiD52JigH9N2ZSyo3q7QfmBrw9CECgJZIHjmCJEkD3a90poFy
         x9IGfkfLyvCPOta3BH7WoXfAIdBCdA4sMaub7nz9vfKxCbpV/t8uiQs5z0slaWA7UkYB
         8yLA==
X-Gm-Message-State: AOAM530vtRyxINIlUgDd0AMSbRhFwHztxt5Ad6wZHknKKS2V0eLmWnEt
        7BKXKAQrXVpNkDSRGZUiUtyoeg==
X-Google-Smtp-Source: ABdhPJx0AUeqO6ezJIrG1OgWb9NbCxwBOlpdZyGvrt5hn2Kk0+xHZDXZDamEYsx5aa4MzqvruGcKHw==
X-Received: by 2002:a05:6a00:16c2:: with SMTP id l2mr118487pfc.112.1598855002263;
        Sun, 30 Aug 2020 23:23:22 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id t15sm6617073pfl.175.2020.08.30.23.23.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2020 23:23:21 -0700 (PDT)
Date:   Mon, 31 Aug 2020 11:53:19 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 4/8] mmc: sdhci-msm: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20200831062319.fibgrzes4nmlwcx5@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <1d7c97524b9e1fbc60271d9c246c5461ca8a106c.1598594714.git.viresh.kumar@linaro.org>
 <CAPDyKFpdZhzXQv3hpTzf3UkJDhFqBhgMXCqVfAfE6PejLCxvfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpdZhzXQv3hpTzf3UkJDhFqBhgMXCqVfAfE6PejLCxvfg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-08-20, 10:43, Ulf Hansson wrote:
> On Fri, 28 Aug 2020 at 08:08, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > the device). And we can call dev_pm_opp_of_remove_table()
> > unconditionally here.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Replaced v1 with v2 on my next branch, thanks!
> 
> Just to be sure, this patch doesn't depend on any changes for the opp
> core that are queued for v5.10?

No it doesn't.

-- 
viresh
