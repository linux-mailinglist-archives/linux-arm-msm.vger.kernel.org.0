Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06AB0F4230
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 09:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbfKHIey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 03:34:54 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33333 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfKHIex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 03:34:53 -0500
Received: by mail-wm1-f65.google.com with SMTP id a17so5996030wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 00:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GNBx6vzN5n9iZ0DowN8UoHdT8V/yV/ZlTTgj8SuNHxw=;
        b=ArZJRK5l4lbX7IXd9hkNrsVI0q35U8SROjjCaKLhN4RHO1SZE+KqNwIbps8Se7IEKt
         col9v8Xc+AXID/lCJz/bWDehorG5CHS9shNIX8CwjctBjoCiNNktbD9suQHfZur6Kj7g
         w5W6Izq40Selz214kUaevG2IoapbIb/Nn5P4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=GNBx6vzN5n9iZ0DowN8UoHdT8V/yV/ZlTTgj8SuNHxw=;
        b=hGkuM4Xf0FfJQ5yc3w/9LOvicMa7rwLhCJZ0bclR2do7VCkzf5sTwsEjUvuRsVr386
         vFw3MLQvoKAAg7lPu2Bb7de6IyDsAQZ0Ukafq8MY0iLRpfuJN1nXMbaZKtD9WarIUvX/
         wgyRpuxw5T8bsvTJPlGBrmTAd5yqH2lghlEE6NLKFp7pFQ2V4Euu/a0W3HQ742WVY5s9
         gQhtjdTpv/4eLzrqOWdIwWVO3hILoEnBzu1NalAdWdOE6Fg9wvd/QryFMzQH1l2A33sU
         dtWK+/IEsKF1y3FZQet5PdPBsGMcJPPnfEw+wvD+DsPh4SuBEc9elVA1lP71n0D6kDIc
         dWPA==
X-Gm-Message-State: APjAAAXUnKL/qXxl276wBemUnuPwLHLC0C3eBZE1WFGupQ7w5oKoB6ot
        cH8ozEjecSxgfWa9hYAqCGtVnGv4McI=
X-Google-Smtp-Source: APXvYqyHKHX0v/WKP8FWHehNB24+E1bGaM6s4cXKYojPO1xiyu2qSI95yblhRj7a1eR06RxC+l1ZzQ==
X-Received: by 2002:a05:600c:2105:: with SMTP id u5mr6797527wml.47.1573202091526;
        Fri, 08 Nov 2019 00:34:51 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id n65sm1382891wmf.28.2019.11.08.00.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 00:34:50 -0800 (PST)
Date:   Fri, 8 Nov 2019 09:34:48 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Steve Cohen <cohens@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, adelva@google.com,
        pdhaval@codeaurora.org, seanpaul@chromium.org
Subject: Re: [PATCH 0/3] allow DRM drivers to limit creation of blobs
Message-ID: <20191108083448.GU23790@phenom.ffwll.local>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 07, 2019 at 02:39:11PM -0500, Steve Cohen wrote:
> Fuzzers used in Android compliance testing repeatedly call the
> create blob IOCTL which eventually exhausts the system memory.
> This series adds a hook which allows drivers to impose their own
> limitations on the size and/or number of blobs created.

Pretty sure this isn't just a problem for msm/dpu alone, why this very
limited approach?

Also, why are your fuzzers not also allocating enormous amounts of gem
buffers, which will also exhaust memory eventually?
-Daniel

> 
> Steve Cohen (3):
>   drm: add driver hook for create blob limitations
>   drm/msm: add support for createblob_check driver hook
>   drm/msm/dpu: check blob limitations during create blob ioctl
> 
>  drivers/gpu/drm/drm_property.c          |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c           | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_kms.h           |  1 +
>  include/drm/drm_drv.h                   |  9 +++++++++
>  5 files changed, 56 insertions(+)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
