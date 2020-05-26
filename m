Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E5A1DE4AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 12:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgEVKnU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 06:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728606AbgEVKnS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 06:43:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D02EC05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 03:43:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s8so9672239wrt.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VGoYWtdu5N5u5jqWgNJFmyeBLxTDklq5XGRfQf6qY4Q=;
        b=YdeY/dYKbHgnjF5Rfbcb+eEpYTqwDn5A1vVV0JJ5zhynRDstj4c9FpHWPMl+epaBKj
         4+oNruH5nf6kCafoeC8oqKNyZ/Po23OIUoBNbYN9r4/k0SejSAvyGC92UsY58XQLUfsa
         3JjDrFGsY19YdyfPsHQclmg1uXVg+LMh91ZPjSFXVChXGrVWjG0Ui7eJQGqklE6+5kay
         g5Uz20ffaV5DdoIjAToXKulBulbkNzxmwxh2KnSMRG7DYDLx1ioPSUF/Sq5icU69Spbb
         sYt6m5Pg2RyBF7ZlFDkiMCnoSB3EaxfTGXp6TNa8MZWvQOKRiLEeX0kDcZ6ep0ep66E5
         CPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VGoYWtdu5N5u5jqWgNJFmyeBLxTDklq5XGRfQf6qY4Q=;
        b=ATj62MhocLTxNdUyNx5GyuXITXEqvC9qT0siaoVywTL5EtR73XvLXvcuY07Engu7Hd
         Cz8+qdmoOIq/qHX4UoGwNR2eJpb/KacRKGumreTnOB/3tZWL1WZKCiMoxUi7XNUx0UIr
         nsdKhoFPVoq6ljrM6MWXGv7kjyewpDwi7bANH3PBGVbkLPwO6B2oRYtkF2r4jUdQDdlM
         /+gQie/ERHMXsVYfqtwWcLty2sdz5GcjOsj9FeJsvZ0OVJrzPV0TRxf/oksNAooibIPn
         41LCxr3rSZVR2rN36lJXe6culqyDzKSPYOfHTWagh0Ukyv2d51R/LGX8gXv9C+KOD87b
         s+0Q==
X-Gm-Message-State: AOAM530r70xk66TB1j0OyVc4OCcF/GszI8UotPka5hOjFlTCJj8axVaw
        ogvoEqf/yWvHqKAm7t5ZMB6iBg==
X-Google-Smtp-Source: ABdhPJybiYUfjcoyk6EZQDK4C+UEDo86CQQDAJc9f/khvU4Ce7Ww2hRO343VGYU3st9oV83jeHWEKA==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr2933510wrv.269.1590144196705;
        Fri, 22 May 2020 03:43:16 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id h1sm9702407wme.42.2020.05.22.03.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 03:43:16 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] Add support for devices in the Energy Model
To:     Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, rostedt@goodmis.org,
        qperret@google.com, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org, mka@chromium.org
References: <20200511111912.3001-1-lukasz.luba@arm.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
Date:   Fri, 22 May 2020 12:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511111912.3001-1-lukasz.luba@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Lukasz,

On 11/05/2020 13:18, Lukasz Luba wrote:
> Hi all,
> 
> This patch set introduces support for devices in the Energy Model (EM)
> framework. It will unify the power model for thermal subsystem. It will
> make simpler to add support for new devices willing to use more
> advanced features (like Intelligent Power Allocation). Now it should
> require less knowledge and effort for driver developer to add e.g.
> GPU driver with simple energy model. A more sophisticated energy model
> in the thermal framework is also possible, driver needs to provide
> a dedicated callback function. More information can be found in the
> updated documentation file.
> 
> First 7 patches are refactoring Energy Model framework to add support
> of other devices that CPUs. They change:
> - naming convention from 'capacity' to 'performance' state,
> - API arguments adding device pointer and not rely only on cpumask,
> - change naming when 'cpu' was used, now it's a 'device'
> - internal structure to maintain registered devices
> - update users to the new API
> Patch 8 updates OPP framework helper function to be more generic, not
> CPU specific.
> Patches 9-14 change devfreq cooling, dropping part of old power model and
> adding registration with Energy Model via exported GPL function.
> The last path is a simple change for Panfrost GPU driver.
> 
> The patch set is based on linux-next tag next-20200508.

Do you think it is possible to respin against linux-pm next ?

I wanted to try the series but I'm getting non trivial conflicts with
the devfreq_cooling changes


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
