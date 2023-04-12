Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC166DED1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 10:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjDLIAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 04:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjDLIAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 04:00:00 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D16E4EE8
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 00:59:59 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f0769b0699so458805e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681286398;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFlRIIUh3fBa8yw0wSF2rOl9C95JD+4ynAFq7zW8TwE=;
        b=OpxTU0fGJxKU+CrXRczin0Q+PgR+zvxqLE/pQiaMqy5DnqEmRva70ckUZJizotmC9r
         5Mb4nw44HoJ/d2rmHg9DAYKmp/CPnLykUGaEeb5husVOGxS6++jnJRHpZsOOry7I+T6P
         CZej2GVVlh7bWYVYH2suqmZVAUMIK6xfwZ+HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681286398;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFlRIIUh3fBa8yw0wSF2rOl9C95JD+4ynAFq7zW8TwE=;
        b=2pVJbewNqHjOJ+zcjfmrfL6LWoAytAAT6Y4l1A81vLgr99uQH1zf+YkFiQhEWztU7I
         V6QGT7iniUw7khtGE9CD7gPt0Huaa6WLTw26EnPQ6UC2FMrkW2Gvp0nDPOOR4BBkLRil
         JMni82zZ0ZSLq916dlzRJR15Q0bEJcqv6VzJ4tKYx+TgzPvr6t+qQWKJ7EEfs0ltqD+e
         cMzrFndGphrjUG0RLOBUuRUKveDlkK9HL/UvWrBkoY8hn0bfaVOsDaWl50anYy+d7g/W
         pq8/E1ZW+Lv2PgP5tMs48hJTkxFS/5IHrtYBl8BF3E3ByAixY002T/QfO7oOeYDV0hvV
         Qa+A==
X-Gm-Message-State: AAQBX9dw4KtFDEt8dDZWi85JA2CkhM18NkVPlx7q/brkrPgfqxOCiAhR
        SuTCS2/GX5qRfkKBHlq7rUzaSA==
X-Google-Smtp-Source: AKy350ZHiR9c7VWZmADxLh2om5p/3nqBGUH/HLC8Y+BXO7bBWAfjGJFy8BkJOsZcgsiemAe1kirxWA==
X-Received: by 2002:a05:600c:4f08:b0:3ed:793d:9dd6 with SMTP id l8-20020a05600c4f0800b003ed793d9dd6mr1199398wmq.1.1681286397728;
        Wed, 12 Apr 2023 00:59:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id m10-20020a05600c3b0a00b003ef5e5f93f5sm1466970wms.19.2023.04.12.00.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 00:59:57 -0700 (PDT)
Date:   Wed, 12 Apr 2023 09:59:55 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" 
        <etnaviv@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/7] drm/etnaviv: Switch to fdinfo helper
Message-ID: <ZDZk+8uWouvMtWle@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>,
        "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" <etnaviv@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411225725.2032862-6-robdclark@gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 11, 2023 at 03:56:10PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

You're on an old tree, this got reverted. But I'm kinda wondering whether
another patch on top shouldn't just includ the drm_show_fdinfo in
DRM_GEM_FOPS macro ... There's really no good reasons for drivers to not
have this I think?
-Daniel

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 44ca803237a5..170000d6af94 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -476,9 +476,8 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>  	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>  };
>  
> -static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +static void etnaviv_fop_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  {
> -	struct drm_file *file = f->private_data;
>  	struct drm_device *dev = file->minor->dev;
>  	struct etnaviv_drm_private *priv = dev->dev_private;
>  	struct etnaviv_file_private *ctx = file->driver_priv;
> @@ -487,8 +486,6 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
>  	 * For a description of the text output format used here, see
>  	 * Documentation/gpu/drm-usage-stats.rst.
>  	 */
> -	seq_printf(m, "drm-driver:\t%s\n", dev->driver->name);
> -	seq_printf(m, "drm-client-id:\t%u\n", ctx->id);
>  
>  	for (int i = 0; i < ETNA_MAX_PIPES; i++) {
>  		struct etnaviv_gpu *gpu = priv->gpu[i];
> @@ -507,7 +504,7 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
>  			cur = snprintf(engine + cur, sizeof(engine) - cur,
>  				       "%sNN", cur ? "/" : "");
>  
> -		seq_printf(m, "drm-engine-%s:\t%llu ns\n", engine,
> +		drm_printf(p, "drm-engine-%s:\t%llu ns\n", engine,
>  			   ctx->sched_entity[i].elapsed_ns);
>  	}
>  }
> @@ -515,7 +512,7 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
>  static const struct file_operations fops = {
>  	.owner = THIS_MODULE,
>  	DRM_GEM_FOPS,
> -	.show_fdinfo = etnaviv_fop_show_fdinfo,
> +	.show_fdinfo = drm_fop_show_fdinfo,
>  };
>  
>  static const struct drm_driver etnaviv_drm_driver = {
> @@ -529,6 +526,7 @@ static const struct drm_driver etnaviv_drm_driver = {
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init       = etnaviv_debugfs_init,
>  #endif
> +	.show_fdinfo        = etnaviv_fop_show_fdinfo,
>  	.ioctls             = etnaviv_ioctls,
>  	.num_ioctls         = DRM_ETNAVIV_NUM_IOCTLS,
>  	.fops               = &fops,
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
