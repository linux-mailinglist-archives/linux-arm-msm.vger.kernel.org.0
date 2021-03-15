Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D832333C176
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhCOQQf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhCOQQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:16:16 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AB3C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:16:16 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t18so9056233pjs.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=muAL2upUuz6v+2+0TJDwoZfgIjX6ldF6IKNapq38wEk=;
        b=AQiZLgWUAY60+K+ZxhA1mnXiByxNoarM0/Zqpic9tWpuVqVTo8mLtzcbRuQ/QkQ8VG
         aE4CgwtevCbSnt/xvv617+Ngq/RQNw41tgEJ8k7zHviMmuFP8/+2DaRlgFktmBCBjxFp
         O6fEVxSPhqHPPT1hMXVCE9gnflfbddcsdar4E6m6wkvFv/8ZDYgKdCfQ7hlc4ED+WgJg
         bgcQbJMc2z6oj9J5I5DUFjZO1grMjXPu9L1Mx2ugbyhLRdvAwFldXci9aH9+0m8rSkSp
         kynmdTEql5qUbxOfL22hZTGx9kcFHkbM8Ztf4g2wPaIDnheMEp2qS51BQgfQ8JlSy4V9
         VUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=muAL2upUuz6v+2+0TJDwoZfgIjX6ldF6IKNapq38wEk=;
        b=NMemjShcPlV8frRl2zqgz8BYau8UT+kothakgVT4L+ZsZ7Fmmr1AyzfYk/Jmxm8Get
         dRVh84XEOrSRseAQI8hHi278XjUrciE0rF6w+eXbPRmLeY/wM0eP8Pw7XjO4PEjZqr0m
         5/XBs0wk8+xujBSMKpeKtiJYfMtriW6Z3wJr6FICyK4boim+uwgRbscnTNtF2fQ01vs8
         SQE/2UrQa6uKbQoxAo7J7r57dA8fw9C9w1mGDg/QzjJ/JurJc9F3Km/6Z3a5BFILXmIv
         5TaQc/6r41zOdSPRZQAEnBpixvsTnrJ+QISQl7LsdllaS9+inAIz7hwO8s48szu83liS
         Frvg==
X-Gm-Message-State: AOAM533GdrM3bP+tbA0KPDTlDGvM41u8XGw6dJ7cay7kWzB/VQXFjzsq
        ErQrNwKhCSLtHXN+rxKQYtL8Hg==
X-Google-Smtp-Source: ABdhPJwciyvgdwqvi9kuav2QG9KCDQrRQ18/UjTYDRbC4IM3R8GE3Q4RrqkuFPjEAWC/RCgZd5nYwA==
X-Received: by 2002:a17:902:b589:b029:e6:2875:aa4c with SMTP id a9-20020a170902b589b02900e62875aa4cmr12349277pls.71.1615824975948;
        Mon, 15 Mar 2021 09:16:15 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j22sm116013pjz.3.2021.03.15.09.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:16:15 -0700 (PDT)
Date:   Mon, 15 Mar 2021 10:16:13 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] rpmsg: enable the use of the rpmsg_char device for
 the Virtio backend
Message-ID: <20210315161613.GA1339147@xps15>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 11, 2021 at 03:04:07PM +0100, Arnaud Pouliquen wrote:
> This series is the first step in the division of the series: 
> "Introduce a generic IOCTL interface for RPMsg channels management"[1]
> 
> The main goal here is to enable the RPMsg char interface for
> the virtio RPMsg backend. 
> 
> In addition some patches have been includes in order to document the
> interface and rename the rpmsg_char_init function.
> 
> It also includes Mathieu Poirier's comments made on [1]
> 
> Patchsets that should be the next steps:
>  - Extract the control part of the char dev and create the rpmsg_ctrl.c
>    file
>  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices
> 
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
> 
> Arnaud Pouliquen (6):
>   rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
>   rpmsg: Move RPMSG_ADDR_ANY in user API
>   rpmsg: Add short description of the IOCTL defined in UAPI.
>   rpmsg: char: Use rpmsg_sendto to specify the message destination
>     address
>   rpmsg: virtio: Register the rpmsg_char device
>   rpmsg: char: Return an error if device already open
> 
>  drivers/rpmsg/qcom_glink_native.c | 16 ++++++++
>  drivers/rpmsg/qcom_smd.c          | 16 ++++++++
>  drivers/rpmsg/rpmsg_char.c        | 11 ++++--
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 62 ++++++++++++++++++++++++++++---
>  include/linux/rpmsg.h             |  3 +-
>  include/uapi/linux/rpmsg.h        | 13 ++++++-
>  6 files changed, 108 insertions(+), 13 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> -- 
> 2.17.1
> 
