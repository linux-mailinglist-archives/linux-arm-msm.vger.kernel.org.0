Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A9C2948D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 09:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440903AbgJUHYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 03:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440892AbgJUHYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 03:24:10 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B0CC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 00:24:09 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b26so964423pff.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 00:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hAIhzFswDyObHC/AccJ2pW9tYMVZUmTRll6IsakeHDI=;
        b=hcxqhkvAd7gaUVg+ADZjC/g5t7FunCEWj40dk9Jkh/xjioI52ZXAkwo5BMXN3dd6bK
         5yXuvLzPNM3xRKnqdyMdj4t+47mqUiHukE7zp03beKQSUIMlvPx4UIwK8I+FHjqcmJK+
         m/BFHJXQmFjXQ8bMAZqWLhKkQs9XMJMwLfK9KLRTPTTK0VqGNT1ILV7h8O1faqdo/jo4
         RnbVTYrqOhJJX40NnBh57Kvpk11HcrFZljb+h+jDOuMIAQLRZDKUntg+d0RwJGn2AWEH
         05nApZQVycKIsoa+R52Nh1RncFPKJRVeAHd/N+wiBZk7rXT5ryOvdRuVzz3Kc2MSGxVM
         o+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hAIhzFswDyObHC/AccJ2pW9tYMVZUmTRll6IsakeHDI=;
        b=hrk1eGNpfdIiSOK14RwctWqfqlK2jjrMlbXHzcnIYOSs2KUWY46DINNibV2K9QYH/d
         3+n0nV55dmmQcVVF6Ez5qONEnj0mxMVl9Wlu7Q8CKTvppSp7X/wY/f9ePaZxpXn3zN03
         upPxfOHrXovCX68onwGVZaotspfRIMeu3p5hmupUiDs1FOUMio/JK0DmK+0KscWqQx1F
         CuNwCgwK1zx4ByhacB4GXzoVpKaLcaQc4/A/IGVQ5IwV9RiBz8xdDhjyFMXp456TTkLy
         h042yu0PztZU6N9b/2RODbPIImq3/3P5CoRB2Pl7wG04vQfPyI9dYRvmN7jE/xbbVJWS
         ninA==
X-Gm-Message-State: AOAM531nE+D4kQooSH+0HvpVxGZb2eQlE5/QnvwcWOuwRH5qOp+ds5Dv
        VP5K600OZfVCJvfC3BFsHCJL8A==
X-Google-Smtp-Source: ABdhPJxdvf151N9thd6CsPj2u4ESktngUMo7t9TYxraGbFVI19jZ698HL0h3xJRccblV6DfAzwc+Ng==
X-Received: by 2002:aa7:84c6:0:b029:155:d56e:5191 with SMTP id x6-20020aa784c60000b0290155d56e5191mr2068267pfn.41.1603265047189;
        Wed, 21 Oct 2020 00:24:07 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id o2sm1377845pgg.3.2020.10.21.00.24.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 00:24:06 -0700 (PDT)
Date:   Wed, 21 Oct 2020 12:54:04 +0530
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
Message-ID: <20201021072404.y43tjzd2ehclrejp@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-10-20, 11:56, Viresh Kumar wrote:
> On 28-08-20, 11:37, Viresh Kumar wrote:
> > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > the device). And we can call dev_pm_opp_of_remove_table()
> > unconditionally here.
> > 
> > While at it, also create a label to put clkname.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Can someone please apply this and the other drm patch (2/8) ?

Rob/Rajendra, can someone please have a look at these patches ?

-- 
viresh
