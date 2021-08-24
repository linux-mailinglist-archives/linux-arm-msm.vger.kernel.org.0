Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825083F562A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 04:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234599AbhHXC71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 22:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234557AbhHXC7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 22:59:21 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8938C0613A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 19:58:37 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mq3so13249580pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 19:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cR4LFc7S07bWHTemhgUSaM7+YiJk/gSHobFlY19oG8U=;
        b=HzQlA7kVyZcfnvGLEDf69hx8YOKNKekkd58wq0xVJYZxGmMAM2QV52kvKCq2R5sPl9
         DYXXTCSn68pbKs01tWF+IKDCWVzwu/w9ha8RwV+yBLf1qedcNX8EBdEecvijJ+qss7EM
         8W53CiP9kAjMdgxO3XJk6nLmteK+wtfOpIwoikFpXEy3SqugiijTWBQuyjkmWc8R47/Q
         GcvdhdthXKHfa2RUBWU9uZIT38ZrUDOdKDuz7L9MzXMVdoMAROVcOMXSZ72OBpyxVvCc
         EqHc4J38QWTtun/HByXOhvlTWevwka42InpoxdEUhg63S9FmVaCiquRiRr/66m/u+Fkk
         1fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cR4LFc7S07bWHTemhgUSaM7+YiJk/gSHobFlY19oG8U=;
        b=foAclDgoI3Ih6q+8RxhYAd4jEyf0lKzuYO4dBxXfHoG3/A/c82Gz+k0Qtt84kCZpUt
         wP7wZzbu+CpPUN0BqtOmqTPcAcyYmXySP28cMg+esjhOrU1qnBvRXoKwmSvgGVGQzng0
         SU3gosapyNn0E/ap3DaLm+pVg50Nw5ScKV+8ksooZZLciYCsjFfbRU6/JYpkXjbKE6sf
         J4WWbh1uaempO3gknNMY8senJjqE67zEbOgvrEoG5ttWi4yaDcEvcEwM0ANs8PehbE2B
         TQsnkZNQAkYn2/EtAXw2WBOU+HNnzTqrOI1FTVokTO/Bo6KYAUGu2YuVOPFo7gs8fJn1
         bgDQ==
X-Gm-Message-State: AOAM5320yFJqw0R6+/9CrQOaY8AQjHpTQEIxAhZHamZ8EGG1wZXnB8AL
        Jj4YV1dMeLh0lp4dfdoyFBrp1g==
X-Google-Smtp-Source: ABdhPJyHLbIOrGSNtbbJc1v7CQb/74OAs+mRskKm2Dp5/tbVuu04vcTkktt8Ab1BiXjzk218qBJi1w==
X-Received: by 2002:a17:90a:4812:: with SMTP id a18mr1917135pjh.40.1629773917317;
        Mon, 23 Aug 2021 19:58:37 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o14sm19982112pgl.85.2021.08.23.19.58.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 19:58:37 -0700 (PDT)
Date:   Tue, 24 Aug 2021 10:58:31 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Sony Tulip Truly NT35521 driver
Message-ID: <20210824025831.GB22595@dragon>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
 <20210809051008.6172-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809051008.6172-3-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 09, 2021 at 01:10:08PM +0800, Shawn Guo wrote:
> It adds a DRM panel driver for Sony Tulip Truly NT35521 5.24" 1280x720
> DSI panel, which can be found on Sony Xperia M4 Aqua phone.  The panel
> backlight is managed through DSI link.
> 
> The driver is built using linux-mdss-dsi-panel-driver-generator[1], and
> additionally modeling the 5V control GPIOs with regulators and adding
> Backlight GPIO support.
> 
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Sam, Stephan,

Thank you for the review comments on v1!  How does v2 look to you?

Shawn
