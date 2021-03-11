Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39F2338193
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 00:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhCKXiF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 18:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhCKXiE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 18:38:04 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D03EC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:38:04 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id d16so15718370oic.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y7PZLngnSiOO6tUFoYHe7nczWb/djDzvqn8CynT2y7o=;
        b=b2rJ6NYdtpvRsYrTydu07Hbmx4KuucnrL02ilCVLMbWyGoSCM5JuPNA0SIk20Buxrw
         Oh7oUZvjjjC0iQHpcwiYsGwSmlZp3cPbWR34ABrpQwzFL/BM3NX+sV+8FPYzCPOw+ofi
         VzULisEMofG367pN45L/GSPzAd+IR9TP6WzLklrASPitwJGBnwKsB41AUiiYv8Af4Oag
         soqwhhbg7skLH9mj/+yzDctmKgkUlK/mjPc53IbweQF4YwS39hFqhrrVqT4JQC8twf9n
         tzySqGOhOX9aVvGEGiQM9cPpOxzOmfyLIsxdAoV+ujtciMM/eNpufnB5In28l9oJdP0X
         QWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y7PZLngnSiOO6tUFoYHe7nczWb/djDzvqn8CynT2y7o=;
        b=d6stqbt6PssWhgzHIIfQeZ7g5o0smULPj/wv5hVAS1xUgwIFe8e0j6RPeSvjBkK9Gj
         14ymLz3Fx1pctWJR+2S3qBVKtlWpRpTZDvBYCRMuvfXfLr3k8RzfMAFDdZgn2/w8Z3U7
         zQaxsedopKpaJFpRIlDqSpeOf7L9yDhPwaeG9yfAO+QwJSQZJ9PtLdZS0q5ZDpcPL3zA
         1ulYCqGMNOQIwOeLgfonzko+ApqaoZVDWPBmjuNbsx8+m2Tx2aId06tOMyqhPv2yw6Rt
         TVIXIY+XZiEC7m6l3Mp9KpZquNwJt80P7hhtTM2Z7iec71iJ8+Cn3JYdpoVTUUiHlzYZ
         tfgw==
X-Gm-Message-State: AOAM533EPycOfA7wfg6Ftxl99T4Wy7AMLtthOclPibCkNuHRZAQq7MqC
        KUg00Pm3Ta9RInqN6c4eI7oR4g==
X-Google-Smtp-Source: ABdhPJy3trbQfPJf8Jw30MXwWRENujdAMmMOYHCnCoFk8D7mpra/ivKmRip+qDmcJtYBYf2nNtZqnw==
X-Received: by 2002:a05:6808:140e:: with SMTP id w14mr8230991oiv.176.1615505883760;
        Thu, 11 Mar 2021 15:38:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z8sm987590otp.14.2021.03.11.15.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:38:03 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:38:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] rpmsg: enable the use of the rpmsg_char device for
 the Virtio backend
Message-ID: <YEqp2US8OykaUAa/@builder.lan>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 08:04 CST 2021, Arnaud Pouliquen wrote:

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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
> 
> -- 
> 2.17.1
> 
