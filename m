Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A69619DC86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 19:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404164AbgDCRSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 13:18:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43321 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403824AbgDCRSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 13:18:22 -0400
Received: by mail-pl1-f194.google.com with SMTP id v23so2941296ply.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rNydFgIXCSgJ49gDNlW+t8MZPAxnkdmyTdnJc8LVEbc=;
        b=OrR7ulO7CQcgKwh4Z0ptkVpD+g4IWz0YSQouVgIJkq8zylNmdM9VjUkYCI+zVEXHq1
         lrjk0v+SzzklSA+3mXp5BODy0jlzOmVXnhkQZrA5LosYzEJPjTc+DVjL3q19L6W2p/2Y
         GSb8p2z3ej4vxJWgTaITIQwIo7RZ5qCAjuCHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rNydFgIXCSgJ49gDNlW+t8MZPAxnkdmyTdnJc8LVEbc=;
        b=VmloNtECRPtK7rVkCbS0+2lK9BbOS6Eb/aBnA2GFQXBtupc1gIZZ07LVeJNIORDk20
         NxJ1kOKNAGQePCwnu+hrzjgztg4KebsYFdblXuxt1P39wZj5fSiiDOQptrI5TRxUxIjl
         c9ajheR1CoV4ImGo7l5dxHhteiRlVwhzUEKQzTE+xbjwf+b1g7peIUf5PcpDV1NsqHI2
         VGbBmT26446u03+ifzg4NiaW7gHcBfIGXzu7qXe2/iK4sx2aJUI2M78WRI4Ww7COnzPB
         VHyOV+vaLYSK5iJvmu/yF215K0EZUkYgwRP5vFTBsrNqTRO8+diJ98oIrIgb69OGwe+q
         nLuw==
X-Gm-Message-State: AGi0PuYWyFd4570so7p+lk0x9E7YwOV44qNZQ/3K2ncbtIzIW4GjRsmS
        jF2yXQxjeQJtQmq2VAw2PNBGUQjAnSA=
X-Google-Smtp-Source: APiQypKQpzA+XTDciIpGBBtkz7UQo2nLfVOgWlxENb8GSyeAvVRwH6+mhz6UsIGNuBo3cdO/izbarA==
X-Received: by 2002:a17:90a:20ad:: with SMTP id f42mr10684986pjg.135.1585934301262;
        Fri, 03 Apr 2020 10:18:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 13sm6219335pfn.131.2020.04.03.10.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 10:18:20 -0700 (PDT)
Date:   Fri, 3 Apr 2020 10:18:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com,
        Dietmar.Eggemann@arm.com, javi.merino@arm.com,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com, rjw@rjwysocki.net,
        sudeep.holla@arm.com, viresh.kumar@linaro.org, nm@ti.com,
        sboyd@kernel.org, rui.zhang@intel.com, amit.kucheria@verdurent.com,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, rostedt@goodmis.org,
        qperret@google.com, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org
Subject: Re: [PATCH v5 3/5] thermal: devfreq_cooling: Use PM QoS to set
 frequency limits
Message-ID: <20200403171818.GO199755@google.com>
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-4-lukasz.luba@arm.com>
 <d73ce772-8d0a-e5f4-097a-d89e01ff7578@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d73ce772-8d0a-e5f4-097a-d89e01ff7578@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Daniel,

On Fri, Apr 03, 2020 at 06:43:20PM +0200, Daniel Lezcano wrote:
> On 18/03/2020 12:45, Lukasz Luba wrote:
> > From: Matthias Kaehlcke <mka@chromium.org>
> > 
> > Now that devfreq supports limiting the frequency range of a device
> > through PM QoS make use of it instead of disabling OPPs that should
> > not be used.
> > 
> > The switch from disabling OPPs to PM QoS introduces a subtle behavioral
> > change in case of conflicting requests (min > max): PM QoS gives
> > precedence to the MIN_FREQUENCY request, while higher OPPs disabled
> > with dev_pm_opp_disable() would override MIN_FREQUENCY.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> > Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> This patch is standalone, right? If yes, I will apply it.

Yes, it is standalone, please apply

Thanks

Matthias
