Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9024BAA622
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 16:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388941AbfIEOmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 10:42:20 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42769 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfIEOmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 10:42:19 -0400
Received: by mail-io1-f67.google.com with SMTP id n197so5378463iod.9;
        Thu, 05 Sep 2019 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bdAudQZ0HCJ8TRBm9ijNYepraRe/QpJqgeTn8uQsQX8=;
        b=BIontiK2DTv/qpkcw8bqo+nSW7AR/xoHc7DGBgv5kPqhit+aqYI4uEyMy/Ss6RSaK5
         hmWpjMQ9lfx7I0535vhSC3ozL00wKYYG5TSEaDh5y1MS7n/m0GkpcsbpLw+EjYfGS6rW
         +nHaGhOCacxctPQGekqTXVouPBMX5i4VlYb++4o/GQSyiogo2erqjE7dYL7ho0IOYQhe
         +1Bosh4NY01j5tPmU+lrHJkAyw2dMmGuI6RmMLaMrnc0UJMA5g4oCZ1xVHG4f1O1cG3N
         h5Kq7PuHfOedJ/uZYlRHf+nxz1eyncsLhwmH5eGZ7wO60AXazvUiqrC4F+QNc35/SPSu
         w3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bdAudQZ0HCJ8TRBm9ijNYepraRe/QpJqgeTn8uQsQX8=;
        b=fCB7YinBVO9uzr56IJMESH2PA8nMXzXHApVFy5DPTPpkj6mwIUZZEG8PuI6oQQxZv5
         zpVoz03L1vGgla7tygbzBhiQfDBoFnyrR6PXl4IEDJi7joerh56F6z0F2010M6Yzi7vf
         Gpwfi56Czg5clD0qetLTguQxVkbkQa+OaDJ8/owYMQiebvE7TOaEBNvN5wbTamdt/GpM
         3a1xzyhbOYRpKpbEGpsUfgQstJTxvMY1YqzRQosHk32YirvRj0rwzGjFUpfiYxVTvgW6
         VM5cx65z912MnaZMGWDi3xvPii2wRFyYWlMSQOfPDVb94VtXT1aRul9EvYpqqBNpsrat
         4ZzA==
X-Gm-Message-State: APjAAAXNegE5ULNr9wMafUs3qnpT1XO53fXo0yd8xlSCGFokx3/AG+UL
        eUPhiO8zaebOMAx4UoV9kHHxNHZUbvQUbRsPOBQ=
X-Google-Smtp-Source: APXvYqyX2pWhcTrhvray5HVD4t5UgZhCevIB50IwYtht6X5wox9aszGhaDh07sqZYAAepAbIq9CCwMnECTOlso4Ws3A=
X-Received: by 2002:a02:a90a:: with SMTP id n10mr4223757jam.140.1567694539038;
 Thu, 05 Sep 2019 07:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com> <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 5 Sep 2019 08:42:08 -0600
Message-ID: <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] rpmsg: core: add API to get message length
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>, Suman Anna <s-anna@ti.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 5, 2019 at 8:35 AM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>
> Return the rpmsg buffer size for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  include/linux/rpmsg.h            | 10 ++++++++++
>  4 files changed, 43 insertions(+)
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e330ec4dfc33..a6ef54c4779a 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>
> +/**
> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
> + * @ept: the rpmsg endpoint
> + *
> + * This function returns maximum buffer size available for a single message.
> + *
> + * Return: the maximum transmission size on success and an appropriate error
> + * value on failure.
> + */

What is the intent of this?

The term "mtu" is "maximum transfer unit" - ie the largest payload of
data that could possibly be sent, however at any one point in time,
that might not be able to be accommodated.

I don't think this is implemented correctly.  In GLINK and SMD, you've
not implemented MTU, you've implemented "how much can I send at this
point in time".  To me, this is not mtu.

In the case of SMD, you could get the fifo size and return that as the
mtu, but since you seem to be wanting to use this from the TTY layer
to determine how much can be sent at a particular point in time, I
don't think you actually want mtu.

For GLINK, I don't actually think you can get a mtu based on the
design, but I'm trying to remember from 5-6 years ago when we designed
it.  It would be possible that a larger intent would be made available
later.

I think you need to first determine if you are actually looking for
mtu, or "how much data can I send right now", because right now, it
isn't clear.
