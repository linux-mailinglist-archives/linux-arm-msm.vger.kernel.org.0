Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B6F184D64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 18:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgCMRQo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 13:16:44 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55802 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgCMRQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 13:16:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id 6so10826244wmi.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Eqg2D57NGypJeQM7MhiMjBD9eTQ+XWnQ6tOgh9VYzPg=;
        b=GfpGJJf8jdD5hvEZ9qPjhmJSoxo3e4jgo5CXvygHAM+2QJPUnQGxgH3uES2Kynkpd4
         T6ATW927TaBZFCRVrNO170pUUV2oW1VQbb+Pexs0ZoOzJkDFAd5UyC6AZMYRUVFm095y
         IkcVD4f+FvTY8CtYEgV2DY2o1mbRUANwOHxkBIP37vtgNzFrkkQDbvXS+mWOsrsn5DGP
         gEO8LlEKRjsHdzu32a8Zv2sKCjnNA9JMK1m96aENNsalwtpPCqB7Vq/otY1b4E8n+Q21
         glAgkPcq3G2Hd8vv/mEHOpfMtESQYAYkl9W6BYLtnfQ1hAid0M6CcWidFLKlq36v9zAc
         LL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Eqg2D57NGypJeQM7MhiMjBD9eTQ+XWnQ6tOgh9VYzPg=;
        b=W/mWuUkHy1U6bvRlnj0wz0RoAENAAHBrg6xD4UQCggq4ZOjEhP2qbpvXRpwdA5mHuD
         6DmCyeg6Zv1b7xKmVmc7SEgeWPO34PdSIyXbESNn4L8gxS6bKFERRUIa1uoKL3Ykger2
         RFgN+PaWBrwjXKzbrWtmfaO8JrJ1P7OsJCViDXyYHtIKAKVL2vCvs83o+GlKN6puwvWt
         w6O5i7qWaVYmjvfgFkRO3ZY8vv2TiPZFi7mhB42eYKh5tAL/QLJBXzn/rwlnkbK2Po9K
         Sierjqt+ojWvkak2l3PDHUU6VCwyIu6fW604eV6D2kodU9s00cJ3ZUkhw2hSsoE+jrq+
         cg5g==
X-Gm-Message-State: ANhLgQ33sGYlYzR12WI5fMMm3mabNQJbEDQc1yBE0NbmU1pN5MJJVrnF
        +QyxWWMn2X5TmtSJyTfHVjwkyw==
X-Google-Smtp-Source: ADFU+vumzHSTSx0NnmOYLAmGcl4NJn5zSn0aH51pn2PnfTIecwwRlYBGAj9fxcb0ea7+lXVvBBbhJA==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr11581854wmc.84.1584119802734;
        Fri, 13 Mar 2020 10:16:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id b187sm14223421wmb.42.2020.03.13.10.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 10:16:42 -0700 (PDT)
Date:   Fri, 13 Mar 2020 17:16:38 +0000
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com,
        Dietmar.Eggemann@arm.com, javi.merino@arm.com,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com, rjw@rjwysocki.net,
        sudeep.holla@arm.com, viresh.kumar@linaro.org, nm@ti.com,
        sboyd@kernel.org, rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org
Subject: Re: [PATCH v4 2/4] OPP: change parameter to device pointer in
 dev_pm_opp_of_register_em()
Message-ID: <20200313171638.GB236432@google.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-3-lukasz.luba@arm.com>
 <20200313101524.GA150397@google.com>
 <3ac8ebf8-9db0-d168-8b80-f7f5ba345f86@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ac8ebf8-9db0-d168-8b80-f7f5ba345f86@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Friday 13 Mar 2020 at 17:11:45 (+0000), Lukasz Luba wrote:
> --------------------------------->8----------------
> dev_pm_opp_of_register_em
> ...
> 	nr_opp = dev_pm_opp_get_opp_count(dev);
> 	if (nr_opp <= 0) {
> 		ret = -EINVAL;
> 		goto fail;
> 	}
> 
> ...
> 	ret = em_register_perf_domain()
> 	if (ret)
> 		goto fail;
> 
> 	return 0;
> 
> fail:
> 	dev_dbg(cpu_dev, "Couldn't register Energy Model %d\n", ret);
> 	return ret
> ------------------------8<-----------------

That works for me.

Thanks,
Quentin
