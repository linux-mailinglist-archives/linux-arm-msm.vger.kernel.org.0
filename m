Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3F5234237
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 11:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732032AbgGaJRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 05:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731981AbgGaJRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 05:17:52 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723CDC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 02:17:52 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id p14so7980925wmg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zap5mCPdXGfCBoAglpFSUI584futiyKZR3trwr0wzD8=;
        b=hrXPg9RLOgJQDEhP1zScUI2NKWRyxq+SOMDtubqqTm9OhE3LSXNrEngEmNAZLOTL0H
         fBRH5ArtO84NfTCYG8xBTJddOZMVD63HOKJ+1I9ZLDreM4zYgFi9cYauzula4Crybhif
         4yKDC5LtUynoFNpru4vkUKuO2Vq2Dnh4f8Z6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zap5mCPdXGfCBoAglpFSUI584futiyKZR3trwr0wzD8=;
        b=ERvLOnlAp8OYYsW5bGkxXnZEzVUN7BdIGppymE7dQhkJydYH3CuuoixW5xnJzkZaf1
         aNuYVSWg5oEmONbT+WJYE0cNkp08eyCxPLG5J/Au0hiT+gcHQUqj/VElJHyxfqdvsSAv
         mIp6HYT6dLqR5uR6oz7tBv4zd9cdsDyTdQlI3Ms8M49snfDA9IJitf8rRtRAaCCDSopD
         74E5m1luJIHLD5bjYShjcFkxLMXIOdp58KJ/5sBA6KZcj5zdA39eaq0lJZVQzLmXO3gD
         1oxjqZ8Sor21AhhZ5fPvlI4vl6af3N9x96zKOWVGRx0WS26Vv4n9fy8ujrO0reru4dDq
         GilQ==
X-Gm-Message-State: AOAM530Du9lu7EdrSMeT4Oym+WJj/1vakrm9Bz/0ZlI1SMOeOyJHScWO
        aMa3ePkWl2LgxAsPss1VbpHlPw==
X-Google-Smtp-Source: ABdhPJzcg+Saw+jf9MpEs60W0A+5dDIrQXLHf8yAkzEyQPQJ2WoiIqn+/xFeKy/ou89Ul0fBMASB5w==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr3024941wmd.10.1596187071227;
        Fri, 31 Jul 2020 02:17:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w14sm12443489wrt.55.2020.07.31.02.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 02:17:50 -0700 (PDT)
Date:   Fri, 31 Jul 2020 11:17:48 +0200
From:   daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, sam@ravnborg.org, daniel@ffwll.ch,
        pdhaval@codeaurora.org, jsanka@codeaurora.org, adelva@google.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH] drm: re-add deleted doc for drm_gem_open_ioctl
Message-ID: <20200731091748.GU6419@phenom.ffwll.local>
References: <1596000952-27621-1-git-send-email-cohens@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596000952-27621-1-git-send-email-cohens@codeaurora.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 29, 2020 at 01:35:52AM -0400, Steve Cohen wrote:
> Add back the removed documentation for drm_gem_open_ioctl.
> This patch is submitted in response to [1].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20200728085244.GY6419@phenom.ffwll.local/
> 
> Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_gem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ee2058a..fe94122 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -871,6 +871,9 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>   * @file_priv: drm file-private structure
>   *
>   * Open an object using the global name, returning a handle and the size.
> + *
> + * This handle (of course) holds a reference to the object, so the object
> + * will not go away until the handle is deleted.

Applied, thanks.
-Daniel

>   */
>  int
>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
