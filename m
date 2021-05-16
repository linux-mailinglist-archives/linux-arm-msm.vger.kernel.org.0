Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63792381D09
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 07:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhEPFmy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 01:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhEPFmx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 01:42:53 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92023C061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 22:41:39 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso2903867ote.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 22:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ex/qpXJf4AhFRi91vcRafWmhcSGoGou40KL895JaIFA=;
        b=Lpeq7GP++jU56TbCN+YIb0aFf9gf7pk9eUrF3cgT2MgWpZ4i6NIKrCMLfLQMjaPg1R
         SM5QrK6Y6vSWxkH85PKtUhxKnylSVgFBJELq8iiAfXHTwaT3Pc6CmjskoJfr/vT5juiM
         98BLVD+miCPeSEpoLyvaOLE/3wgULB3aY0/BQFjZ9l/Fr4aiR++meP2/EbDredqlbKkb
         5taHndGJyCv3r6suq3xot5c1GN959wl0VUJpVyRrKB7W/pZIew8qXF4mUiM+olnEEROF
         8aWrqkcZEd0k8ecjv75eFHrPibxZw35MR5B0JV82YusDz+ZhMzLMGZcPrs2TmTL1yI23
         jOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ex/qpXJf4AhFRi91vcRafWmhcSGoGou40KL895JaIFA=;
        b=X+baZbNfc9FNpOXLKgGsF/ljXL61AlZR8RiFlYgg2/GYu0bKK95oPmuNQ9aYCKhROu
         FQDzSNoR+APuJE8yrpZhk7oReFU0F4dzh79QtgQZKTjiZYG9rR/ZMfSNDKGXRreYVCtN
         rJzUcQ2T2o4Gl4Mm2jAh9jr8n0CXLWSUX7zUFNnnaMwMS5LZuDm6cHjxn9cBJuWG25R3
         PO+2AKeZPE7DfLgYxERhYjERzmIfECHKQN+VGgqrxJw603liAEAK+90kJ847uY8bObG5
         BffgwUh1pb92a5X2wYN1sq9MO75XkqVX182E6I2vBnx+lgk8//he56boyG4ao8aWfGel
         FEbg==
X-Gm-Message-State: AOAM533XDTk+D/i4PVKicI78WycyG5R9cJrrpnD2g9K2iKVFtx0bY6Cy
        iVSPkVl7H1xfgQc9hd5A8Pb1wQ==
X-Google-Smtp-Source: ABdhPJw2Nj3cZgCAEoMIPuJs7ABiw4A32f1vC0+6nHTjwhuOBhfB3PQYTMmaTOASmE7ffsQpwZVgWw==
X-Received: by 2002:a05:6830:22cc:: with SMTP id q12mr25483616otc.145.1621143699019;
        Sat, 15 May 2021 22:41:39 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y14sm2083342otq.4.2021.05.15.22.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 22:41:38 -0700 (PDT)
Date:   Sun, 16 May 2021 00:41:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dp: remove most of usbpd-related remains
Message-ID: <20210516054136.GR2484@yoga>
References: <20210515195612.1901147-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515195612.1901147-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 15 May 14:56 CDT 2021, Dmitry Baryshkov wrote:

> Remove most of remains of downstream usbpd code. Mainline kernel uses
> different approach for managing Type-C / USB-PD, so this remains unused.
> Do not touch usbpd callbacks for now, since they look usefull enough as
> an example of how to handle connect/disconnect (to be rewritten into .
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/Makefile        |  1 -
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>  drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +--
>  drivers/gpu/drm/msm/dp/dp_debug.h   |  4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 36 ++-------------
>  drivers/gpu/drm/msm/dp/dp_hpd.c     | 69 -----------------------------
>  drivers/gpu/drm/msm/dp/dp_hpd.h     | 51 ---------------------
>  drivers/gpu/drm/msm/dp/dp_power.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_power.h   |  3 +-
>  10 files changed, 11 insertions(+), 168 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
> 
[..]
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c

It seems to me that this would be a reasonable place to plug in the
typec_mux stuff. And as we're starting that exercise we should perhaps
hold off on applying until we've figured out how that would look?

Regards,
Bjorn
