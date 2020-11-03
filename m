Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437952A3C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 06:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgKCFrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 00:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgKCFrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 00:47:20 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EA4C0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 21:47:20 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id t6so8035404plq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 21:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wKHMeBJ7HB8kaIi/ChT9IdtHhkbmgmqmq8Ca+RXUM4Q=;
        b=VZXDHtEGHjAf7Yak4JNPB3TB6267NMXR+146A1bnK7feF1c8NNuDtcIOxiM8KgfJzT
         xUvCerLXHlXMloGzQsvccrQfo9/6cFgJA4EUGlSLDMoIxWkDTrAAlK8O30Fpmmlns5q6
         Vk14A9lFw3r4oHjvbJol59T8JlMPk2yGcOMxSZCqLKwqDy/ehXtMkPVF0X3fV7qWNyNh
         KWy+NBjZfxru3Ewddb74DtuiVi0KTyXlIbTfEQEmFEuePWiqP9C+/H6lbhK0hC2Sk+a8
         VoiVlHftgmOzumnygzFU1w+N1gwbmMDIS/Mqg0HHoz37fTkGTrzMPPFYkY2MD1+dW36q
         LLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wKHMeBJ7HB8kaIi/ChT9IdtHhkbmgmqmq8Ca+RXUM4Q=;
        b=hJ3l5bLNHXGSjHyXt5s7rDJs4oqvcFFrLoORhH2gZCykHEOdf1haZgepDLncWRbo3s
         oYQ4Nye42VjTg2jPBavE3/M9dwlgnr+ooJragS/G7Ko2Pgwd+uvkQFYBgI3+yDxectAp
         liqNTU+oU+eBgk9TjxTmp5BY2TLSy0obL+m0+muWr9KzSgNg4a3hO5hjAmt9oMG6tQGF
         R7uiDFMuEeTCavJtfHNSl7ybUONCMOsWCYUZ6/WzaBUDwsjnLy8xKAcM7crlThW4/jkr
         rkpJl74GnG8qM+HwePwrqE9hL9iybYLA71T5D/ghxW81+zbZk1+KCSfQgAMrPkevSDTZ
         7/SA==
X-Gm-Message-State: AOAM531EiQoQ0O8p8r05OZXs6/1MUbxQJSrq7lwOc6SqZGX5MCvNCJkY
        cV12Asi1+s2B18sEs9Cys1GMQA==
X-Google-Smtp-Source: ABdhPJwsNqhX2FzrkX0gNclVTETovDS95JPRUA8wffUnhM4f7cA1FnDx4jSTzq6/A2hFCWSnnSc4aQ==
X-Received: by 2002:a17:902:8490:b029:d6:d165:fde with SMTP id c16-20020a1709028490b02900d6d1650fdemr6435454plo.73.1604382439293;
        Mon, 02 Nov 2020 21:47:19 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id mt2sm1455427pjb.7.2020.11.02.21.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2020 21:47:17 -0800 (PST)
Date:   Tue, 3 Nov 2020 11:17:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Menon, Nishanth" <nm@ti.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
References: <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-10-20, 17:05, Viresh Kumar wrote:
> It isn't that straight forward unfortunately, we need to make sure the
> table doesn't get allocated for the same device twice, so
> find+allocate needs to happen within a locked region.
> 
> I have taken, not so straight forward, approach to fixing this issue,
> lets see if this fixes it or not.
> 
> -------------------------8<-------------------------
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 4ac4e7ce6b8b..6f4a73a6391f 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -29,6 +29,8 @@
>  LIST_HEAD(opp_tables);
>  /* Lock to allow exclusive modification to the device and opp lists */
>  DEFINE_MUTEX(opp_table_lock);
> +/* Flag indicating that opp_tables list is being updated at the moment */
> +static bool opp_tables_busy;
>  
>  static struct opp_device *_find_opp_dev(const struct device *dev,
>  					struct opp_table *opp_table)
> @@ -1036,8 +1038,8 @@ static void _remove_opp_dev(struct opp_device *opp_dev,
>  	kfree(opp_dev);
>  }
>  
> -static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
> -						struct opp_table *opp_table)
> +struct opp_device *_add_opp_dev(const struct device *dev,
> +				struct opp_table *opp_table)
>  {
>  	struct opp_device *opp_dev;
>  
> @@ -1048,7 +1050,9 @@ static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
>  	/* Initialize opp-dev */
>  	opp_dev->dev = dev;
>  
> +	mutex_lock(&opp_table->lock);
>  	list_add(&opp_dev->node, &opp_table->dev_list);
> +	mutex_unlock(&opp_table->lock);
>  
>  	/* Create debugfs entries for the opp_table */
>  	opp_debug_register(opp_dev, opp_table);
> @@ -1056,18 +1060,6 @@ static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
>  	return opp_dev;
>  }
>  
> -struct opp_device *_add_opp_dev(const struct device *dev,
> -				struct opp_table *opp_table)
> -{
> -	struct opp_device *opp_dev;
> -
> -	mutex_lock(&opp_table->lock);
> -	opp_dev = _add_opp_dev_unlocked(dev, opp_table);
> -	mutex_unlock(&opp_table->lock);
> -
> -	return opp_dev;
> -}
> -
>  static struct opp_table *_allocate_opp_table(struct device *dev, int index)
>  {
>  	struct opp_table *opp_table;
> @@ -1121,8 +1113,6 @@ static struct opp_table *_allocate_opp_table(struct device *dev, int index)
>  	INIT_LIST_HEAD(&opp_table->opp_list);
>  	kref_init(&opp_table->kref);
>  
> -	/* Secure the device table modification */
> -	list_add(&opp_table->node, &opp_tables);
>  	return opp_table;
>  
>  err:
> @@ -1135,27 +1125,64 @@ void _get_opp_table_kref(struct opp_table *opp_table)
>  	kref_get(&opp_table->kref);
>  }
>  
> +/*
> + * We need to make sure that the OPP table for a device doesn't get added twice,
> + * if this routine gets called in parallel with the same device pointer.
> + *
> + * The simplest way to enforce that is to perform everything (find existing
> + * table and if not found, create a new one) under the opp_table_lock, so only
> + * one creator gets access to the same. But that expands the critical section
> + * under the lock and may end up causing circular dependencies with frameworks
> + * like debugfs, interconnect or clock framework as they may be direct or
> + * indirect users of OPP core.
> + *
> + * And for that reason we have to go for a bit tricky implementation here, which
> + * uses the opp_tables_busy flag to indicate if another creator is in the middle
> + * of adding an OPP table and others should wait for it to finish.
> + */
>  static struct opp_table *_opp_get_opp_table(struct device *dev, int index)
>  {
>  	struct opp_table *opp_table;
>  
> -	/* Hold our table modification lock here */
> +again:
>  	mutex_lock(&opp_table_lock);
>  
>  	opp_table = _find_opp_table_unlocked(dev);
>  	if (!IS_ERR(opp_table))
>  		goto unlock;
>  
> +	/*
> +	 * The opp_tables list or an OPP table's dev_list is getting updated by
> +	 * another user, wait for it to finish.
> +	 */
> +	if (unlikely(opp_tables_busy)) {
> +		mutex_unlock(&opp_table_lock);
> +		cpu_relax();
> +		goto again;
> +	}
> +
> +	opp_tables_busy = true;
>  	opp_table = _managed_opp(dev, index);
> +
> +	/* Drop the lock to reduce the size of critical section */
> +	mutex_unlock(&opp_table_lock);
> +
>  	if (opp_table) {
> -		if (!_add_opp_dev_unlocked(dev, opp_table)) {
> +		if (!_add_opp_dev(dev, opp_table)) {
>  			dev_pm_opp_put_opp_table(opp_table);
>  			opp_table = ERR_PTR(-ENOMEM);
>  		}
> -		goto unlock;
> +
> +		mutex_lock(&opp_table_lock);
> +	} else {
> +		opp_table = _allocate_opp_table(dev, index);
> +
> +		mutex_lock(&opp_table_lock);
> +		if (!IS_ERR(opp_table))
> +			list_add(&opp_table->node, &opp_tables);
>  	}
>  
> -	opp_table = _allocate_opp_table(dev, index);
> +	opp_tables_busy = false;
>  
>  unlock:
>  	mutex_unlock(&opp_table_lock);
> @@ -1181,6 +1208,10 @@ static void _opp_table_kref_release(struct kref *kref)
>  	struct opp_device *opp_dev, *temp;
>  	int i;
>  
> +	/* Drop the lock as soon as we can */
> +	list_del(&opp_table->node);
> +	mutex_unlock(&opp_table_lock);
> +
>  	_of_clear_opp_table(opp_table);
>  
>  	/* Release clk */
> @@ -1208,10 +1239,7 @@ static void _opp_table_kref_release(struct kref *kref)
>  
>  	mutex_destroy(&opp_table->genpd_virt_dev_lock);
>  	mutex_destroy(&opp_table->lock);
> -	list_del(&opp_table->node);
>  	kfree(opp_table);
> -
> -	mutex_unlock(&opp_table_lock);
>  }
>  
>  void dev_pm_opp_put_opp_table(struct opp_table *opp_table)

Rob, Ping.

-- 
viresh
