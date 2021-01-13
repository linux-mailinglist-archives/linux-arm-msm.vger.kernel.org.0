Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D88F2F5425
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 21:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbhAMUc1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 15:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbhAMUc1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 15:32:27 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC0AC061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 12:31:46 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id i7so2223614pgc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 12:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x3MPhiU2w3/M1LyIYX233yh3l63UHt26Df7c1l4yyS0=;
        b=lgOrF1vud4CIGB25b7osz+2oIguQZKHERI9D69dBcBVuYXheNY3pX5pbJYPwCckISM
         +PUkM6LOor5+Ci7YWZAaSLyzjIlqhc8mPtpDrSlVpuE/cNy2l28dog8L7Ttg2reyok5s
         AD6wE980ogNO2xg3XtyblOQu7cC1Cwm8H9SIvDx6AuQhTKM8dOBuVZX15fEcbL5IuaWt
         15BQt6H8G1Yj0jnP9f+nRsPX7TJi/lPYpUk0vJx4MW5HNANk+UrbucZTrQuJ3CkG39De
         NPJj3ROUB7xRlXAxLFVY+yowWEQA30PDa8Bl5C4mCxRGHtAWK0GzBepU4eixiPg3/Ai1
         PCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x3MPhiU2w3/M1LyIYX233yh3l63UHt26Df7c1l4yyS0=;
        b=rFnR9ygcuYxQH8SeIZA2ENsKdIVYuf3+jgNVG+dB8/Occ+gvMZveuXgwDx/S+Vaqwa
         LvL1GhXaARuNlJDCm/1IsIVHiIotPCBTh+UeK/HA3HWOHsoLuwxzZi7Rh7Me1xHB6r0k
         ASn2z6Qv6B6JfpBqwMIyaIceSeQ+u7y9wAK4xiCl0MM1dgmM67gisIpUMOF4eTQDv98f
         aXC7zd616A+UuQUuWmzoYFsG6yqflLOcHt3CLnzzfEH/WrXisc0e6zRohkXTMtHA6SYk
         9qaXBrnEf7ThGNmckxYlhFqLrgLPrIWCxoU210ZJIX7YZ+esMJUZjAnfwj7hunTdTU1g
         Bp/Q==
X-Gm-Message-State: AOAM530gPvg7OjqWJotnJJpGSWEbtXP4go444wOL/OtABbR9obWI7zRd
        I+f1+eUjsAxfsgh0yLPQ9GQdPQ==
X-Google-Smtp-Source: ABdhPJz3B8b/fHkcVhHNh/pEoU/jcb/7vLKk9kpdfzQ2KQQgMT3HCF2wn+oiQYR4k+z1aUBQIzJVXg==
X-Received: by 2002:a63:3714:: with SMTP id e20mr3792229pga.410.1610569906286;
        Wed, 13 Jan 2021 12:31:46 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id bx17sm3834222pjb.12.2021.01.13.12.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 12:31:45 -0800 (PST)
Date:   Wed, 13 Jan 2021 13:31:43 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 00/16] introduce generic IOCTL interface for RPMsg
 channels management
Message-ID: <20210113203143.GA229796@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnaud,

[...]

> 
> Arnaud Pouliquen (16):
>   rpmsg: introduce RPMsg control driver for channel creation
>   rpmsg: add RPMsg control API to register service
>   rpmsg: add override field in channel info
>   rpmsg: ctrl: implement the ioctl function to create device
>   rpmsg: ns: initialize channel info override field
>   rpmsg: add helper to register the rpmsg ctrl device
>   rpmsg: char: clean up rpmsg class
>   rpmsg: char: make char rpmsg a rpmsg device without the control part
>   rpmsg: char: register RPMsg raw service to the ioctl interface.
>   rpmsg: char: allow only one endpoint per device
>   rpmsg: char: check destination address is not null
>   rpmsg: virtio: use the driver_override in channel creation ops
>   rpmsg: virtio: probe the rpmsg_ctl device
>   rpmsg: glink: add create and release rpmsg channel ops
>   rpmsg: smd: add create and release rpmsg channel ops
>   rpmsg: replace rpmsg_chrdev_register_device use
> 
>  drivers/rpmsg/Kconfig             |   8 +
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |  96 +++++++--
>  drivers/rpmsg/qcom_smd.c          |  59 +++++-
>  drivers/rpmsg/rpmsg_char.c        | 246 ++++++-----------------
>  drivers/rpmsg/rpmsg_ctrl.c        | 320 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  14 --
>  drivers/rpmsg/rpmsg_ns.c          |   1 +
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  38 +++-
>  include/linux/rpmsg.h             |  40 ++++
>  include/uapi/linux/rpmsg.h        |  14 ++
>  11 files changed, 606 insertions(+), 231 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

I am finally coming around to review this set.  I see that you already had an
extensive conversation with Bjorn - did you want me to have a look as well or
should I wait for the next revision?

Thanks,
Mathieu

> 
> -- 
> 2.17.1
> 
