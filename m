Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E79D1F29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 06:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbfJJEAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 00:00:14 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44496 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfJJEAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 00:00:13 -0400
Received: by mail-pg1-f194.google.com with SMTP id u12so2757275pgb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 21:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A9so9NzeHO42VwWr5hvpwtUD9ohInwQ0WN2EfuSCaYQ=;
        b=s4W0J/XFJ7RamPtActqgeS4CLDn8XfPdVYh0M1LVeYXO9BPvLAFSv83QwINQYNhoPR
         gtMN5d1eJFZuU2/E7j42QEeL5oOUuOlRmv5mJ8xO0gKZRlqiwCxJSbmwlISC7IORvVCw
         qQ3upCAthSxLtiGZfhyYeaT8i3hT9qXa/QfYVkKrITAPKXZyDREy0BdKKsrsMY4LuDaW
         DWrdEHCKhZo9xVDDQKWxsMDtwJbmO8/QkrpnnseUYlMZgA5za6ghnVVEYSK+qWw4mabD
         ZYUEZ58tRZxuvChDkxXbsLCqvKUy+ABN39s9bQncQh2OIGcapstEcSKwW/jZ3fCK6J5H
         FanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A9so9NzeHO42VwWr5hvpwtUD9ohInwQ0WN2EfuSCaYQ=;
        b=e/EJebDl858HCjZDejI1VeOO1Ze0LvmEyKgZ+iuEyzlHFInNoa7E/HDCf9k4zX0xHJ
         mzx/9HOnbYSNsfz0aA7HZiR8DOYQIf+v6BEFuRVXHmXy230elegvs6lv58GeTQbJGoM3
         wK/B3r8jX4+kEXt5toTJafpqid6eay09pjuBTNPOQhpuIq6iRIssx8uDxtBAhZdqHzGu
         xaMiV9I+RUSvCSX89L6KjJRt+QID3q0BPtx+1X4zeawfqPMtI0rMbw9t4TzPAnYTljPl
         q6XfoYmPGoP10F+a8usirnoaf/MKJHhnZOjRNgG5/SBRIkkQF8CH13r3oX5nxdO+weKz
         Pidg==
X-Gm-Message-State: APjAAAUdXKeUsszyfJtffE9W/fS7cvvS+Aw1NVdpbAUVDnAgNUT3fxbo
        OeQiLoYDyv3FdcO+0KKP6ulS3g==
X-Google-Smtp-Source: APXvYqyMCqNfgvu9rSzgpLBith2VQ2EjFXAb8ru9qakTkbGzpJFfAzqmKezZYqlKdqVa6ckEkHpirA==
X-Received: by 2002:a17:90a:718a:: with SMTP id i10mr8374336pjk.54.1570680011597;
        Wed, 09 Oct 2019 21:00:11 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o185sm4296079pfg.136.2019.10.09.21.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 21:00:10 -0700 (PDT)
Date:   Wed, 9 Oct 2019 21:00:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp5: Remove set but not used variable 'hw_cfg'
 in modeset_init
Message-ID: <20191010040008.GP6390@tuxbook-pro>
References: <1570630403-92371-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570630403-92371-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 09 Oct 07:13 PDT 2019, zhengbin wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c: In function modeset_init:
> drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:458:28: warning: variable hw_cfg set but not used [-Wunused-but-set-variable]
> 
> It is not used since commit 36d1364abbed ("drm/msm/mdp5:
> Clean up interface assignment")
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index f8bd0bf..5476892 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -461,14 +461,11 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
>  {
>  	struct drm_device *dev = mdp5_kms->dev;
>  	struct msm_drm_private *priv = dev->dev_private;
> -	const struct mdp5_cfg_hw *hw_cfg;
>  	unsigned int num_crtcs;
>  	int i, ret, pi = 0, ci = 0;
>  	struct drm_plane *primary[MAX_BASES] = { NULL };
>  	struct drm_plane *cursor[MAX_BASES] = { NULL };
> 
> -	hw_cfg = mdp5_cfg_get_hw_config(mdp5_kms->cfg);
> -
>  	/*
>  	 * Construct encoders and modeset initialize connector devices
>  	 * for each external display interface.
> --
> 2.7.4
> 
